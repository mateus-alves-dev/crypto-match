import { Injectable } from "@nestjs/common";
import {
  SettingsRepository,
  NotificationPreferences,
  UserSettings,
} from "../../domain/repositories/settings.repository";

@Injectable()
export class UpdateNotificationSettingsUseCase {
  constructor(private readonly settingsRepo: SettingsRepository) {}

  async execute(
    userId: string,
    prefs: NotificationPreferences,
  ): Promise<UserSettings> {
    return this.settingsRepo.updateNotificationPreferences(userId, prefs);
  }
}
