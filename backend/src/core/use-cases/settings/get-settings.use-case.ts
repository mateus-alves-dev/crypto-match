import { Injectable } from "@nestjs/common";
import {
  SettingsRepository,
  UserSettings,
} from "../../domain/repositories/settings.repository";

@Injectable()
export class GetSettingsUseCase {
  constructor(private readonly settingsRepo: SettingsRepository) {}

  async execute(userId: string): Promise<UserSettings> {
    return this.settingsRepo.findByUserId(userId);
  }
}
