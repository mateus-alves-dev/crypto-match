import { Controller, Get, Put, Body, UseGuards } from "@nestjs/common";
import {
  UpdateMatchPreferencesDto,
  UpdateNotificationSettingsDto,
  UpdatePrivacySettingsDto,
} from "./dto/update-settings.dto";
import { GetSettingsUseCase } from "@/core/use-cases/settings/get-settings.use-case";
import { UpdateMatchPreferencesUseCase } from "@/core/use-cases/settings/update-match-preferences.use-case";
import { UpdateNotificationSettingsUseCase } from "@/core/use-cases/settings/update-notification-settings.use-case";
import { UpdatePrivacySettingsUseCase } from "@/core/use-cases/settings/update-privacy-settings.use-case";
import { JwtAuthGuard } from "@/infra/auth/jwt-auth.guard";
import { CurrentUser } from "@/infra/auth/current-user.decorator";
import type { AuthenticatedUser } from "@/infra/auth/jwt.strategy";

@Controller("settings")
@UseGuards(JwtAuthGuard)
export class SettingsController {
  constructor(
    private readonly getSettings: GetSettingsUseCase,
    private readonly updateMatchPref: UpdateMatchPreferencesUseCase,
    private readonly updateNotifSettings: UpdateNotificationSettingsUseCase,
    private readonly updatePrivacy: UpdatePrivacySettingsUseCase,
  ) {}

  /**
   * GET /settings
   * Response 200: UserSettings
   */
  @Get()
  get(@CurrentUser() user: AuthenticatedUser) {
    return this.getSettings.execute(user.userId);
  }

  /**
   * PUT /settings/match-preferences
   * Body: UpdateMatchPreferencesDto
   * Response 200: UserSettings
   */
  @Put("match-preferences")
  updateMatch(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdateMatchPreferencesDto,
  ) {
    return this.updateMatchPref.execute(user.userId, {
      maxDistanceKm: dto.maxDistanceKm,
      minAge: dto.minAge,
      maxAge: dto.maxAge,
      filterByCryptoInterests: dto.filterByCryptoInterests,
    });
  }

  /**
   * PUT /settings/notifications
   * Body: UpdateNotificationSettingsDto
   * Response 200: UserSettings
   */
  @Put("notifications")
  updateNotifications(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdateNotificationSettingsDto,
  ) {
    return this.updateNotifSettings.execute(user.userId, {
      newMatches: dto.newMatches,
      newMessages: dto.newMessages,
      tokenRewards: dto.tokenRewards,
      appUpdates: dto.appUpdates,
      dailyStreak: dto.dailyStreak,
    });
  }

  /**
   * PUT /settings/privacy
   * Body: UpdatePrivacySettingsDto
   * Response 200: UserSettings
   */
  @Put("privacy")
  updatePrivacySettings(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdatePrivacySettingsDto,
  ) {
    return this.updatePrivacy.execute(user.userId, {
      showOnlineStatus: dto.showOnlineStatus,
      showDistance: dto.showDistance,
    });
  }
}
