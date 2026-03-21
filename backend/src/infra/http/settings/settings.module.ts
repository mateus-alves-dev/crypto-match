import { Module } from "@nestjs/common";
import { SettingsController } from "./settings.controller";
import { GetSettingsUseCase } from "@/core/use-cases/settings/get-settings.use-case";
import { UpdateMatchPreferencesUseCase } from "@/core/use-cases/settings/update-match-preferences.use-case";
import { UpdateNotificationSettingsUseCase } from "@/core/use-cases/settings/update-notification-settings.use-case";
import { UpdatePrivacySettingsUseCase } from "@/core/use-cases/settings/update-privacy-settings.use-case";
import { SettingsRepository } from "@/core/domain/repositories/settings.repository";
import { PrismaSettingsRepository } from "@/infra/persistence/prisma/repositories/prisma-settings.repository";
import { AuthModule } from "../auth/auth.module";

@Module({
  imports: [AuthModule],
  controllers: [SettingsController],
  providers: [
    GetSettingsUseCase,
    UpdateMatchPreferencesUseCase,
    UpdateNotificationSettingsUseCase,
    UpdatePrivacySettingsUseCase,
    { provide: SettingsRepository, useClass: PrismaSettingsRepository },
  ],
})
export class SettingsModule {}
