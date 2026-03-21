import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma.service";
import {
  UserRepository,
  CreateUserInput,
  User,
} from "@/core/domain/repositories/user.repository";

@Injectable()
export class PrismaUserRepository implements UserRepository {
  constructor(private readonly prisma: PrismaService) {}

  private toUser(row: {
    id: string;
    email: string;
    name: string;
    password: string | null;
    googleUid: string | null;
    createdAt: Date;
    updatedAt: Date;
    referralCode: string | null;
  }): User {
    return {
      id: row.id,
      email: row.email,
      name: row.name,
      password: row.password ?? undefined,
      googleUid: row.googleUid ?? undefined,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      referralCode: row.referralCode ?? undefined,
    };
  }

  async findById(id: string): Promise<User | null> {
    const row = await this.prisma.user.findUnique({ where: { id } });
    return row ? this.toUser(row) : null;
  }

  async findByEmail(email: string): Promise<User | null> {
    const row = await this.prisma.user.findUnique({ where: { email } });
    return row ? this.toUser(row) : null;
  }

  async findByGoogleUid(googleUid: string): Promise<User | null> {
    const row = await this.prisma.user.findUnique({ where: { googleUid } });
    return row ? this.toUser(row) : null;
  }

  async create(input: CreateUserInput): Promise<User> {
    const referralCode = this.generateReferralCode();
    const row = await this.prisma.user.create({
      data: {
        name: input.name,
        email: input.email,
        password: input.password ?? null,
        googleUid: input.googleUid ?? null,
        referralCode,
      },
    });
    return this.toUser(row);
  }

  async linkGoogleUid(userId: string, googleUid: string): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: { googleUid },
    });
  }

  async updatePassword(userId: string, hashedPassword: string): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: { password: hashedPassword },
    });
  }

  async updateAvatarUrl(userId: string, avatarUrl: string): Promise<void> {
    await this.prisma.profile.update({
      where: { userId },
      data: { avatarUrl },
    });
  }

  async delete(userId: string): Promise<void> {
    await this.prisma.user.delete({ where: { id: userId } });
  }

  private generateReferralCode(): string {
    return Math.random().toString(36).substring(2, 8).toUpperCase();
  }
}
