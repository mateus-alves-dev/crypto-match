import { Injectable } from "@nestjs/common";
import {
  SettingsRepository,
  MatchPreferences,
  UserSettings,
} from "../../domain/repositories/settings.repository";

@Injectable()
export class UpdateMatchPreferencesUseCase {
  constructor(private readonly settingsRepo: SettingsRepository) {}

  async execute(
    userId: string,
    prefs: MatchPreferences,
  ): Promise<UserSettings> {
    return this.settingsRepo.updateMatchPreferences(userId, prefs);
  }
}
