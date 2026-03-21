import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma.service";
import {
  DeviceTokenRepository,
  DeviceToken,
} from "@/core/domain/repositories/device-token.repository";

@Injectable()
export class PrismaDeviceTokenRepository implements DeviceTokenRepository {
  constructor(private readonly prisma: PrismaService) {}

  async upsert(
    userId: string,
    token: string,
    platform: "ios" | "android",
  ): Promise<DeviceToken> {
    const row = await this.prisma.deviceToken.upsert({
      where: { token },
      create: {
        userId,
        token,
        platform: platform === "ios" ? "ios" : "android",
        lastSeenAt: new Date(),
      },
      update: {
        userId, // re-assign if device switched accounts
        platform: platform === "ios" ? "ios" : "android",
        lastSeenAt: new Date(),
      },
    });
    return {
      id: row.id,
      userId: row.userId,
      token: row.token,
      platform: row.platform as "ios" | "android",
      lastSeenAt: row.lastSeenAt,
      createdAt: row.createdAt,
    };
  }

  async findAllByUserId(userId: string): Promise<DeviceToken[]> {
    const rows = await this.prisma.deviceToken.findMany({ where: { userId } });
    return rows.map((row) => ({
      id: row.id,
      userId: row.userId,
      token: row.token,
      platform: row.platform as "ios" | "android",
      lastSeenAt: row.lastSeenAt,
      createdAt: row.createdAt,
    }));
  }

  async deleteByToken(token: string): Promise<void> {
    await this.prisma.deviceToken.delete({ where: { token } });
  }
}
