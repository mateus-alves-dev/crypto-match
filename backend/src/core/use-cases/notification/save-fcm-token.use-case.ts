import { Injectable } from "@nestjs/common";
import { DeviceTokenRepository } from "../../domain/repositories/device-token.repository";
import type { DeviceToken } from "../../domain/repositories/device-token.repository";

export interface SaveFcmTokenInput {
  userId: string;
  token: string;
  platform: "ios" | "android";
}

@Injectable()
export class SaveFcmTokenUseCase {
  constructor(private readonly deviceTokenRepo: DeviceTokenRepository) {}

  async execute(input: SaveFcmTokenInput): Promise<DeviceToken> {
    return this.deviceTokenRepo.upsert(
      input.userId,
      input.token,
      input.platform,
    );
  }
}
