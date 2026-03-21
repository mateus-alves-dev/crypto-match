import { Injectable } from "@nestjs/common";
import {
  SettingsRepository,
  PrivacySettings,
  UserSettings,
} from "../../domain/repositories/settings.repository";

@Injectable()
export class UpdatePrivacySettingsUseCase {
  constructor(private readonly settingsRepo: SettingsRepository) {}

  async execute(
    userId: string,
    privacy: PrivacySettings,
  ): Promise<UserSettings> {
    return this.settingsRepo.updatePrivacySettings(userId, privacy);
  }
}
