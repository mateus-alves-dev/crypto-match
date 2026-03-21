import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma.service";
import {
  SettingsRepository,
  UserSettings,
  MatchPreferences,
  NotificationPreferences,
  PrivacySettings,
} from "@/core/domain/repositories/settings.repository";

const DEFAULTS: UserSettings = {
  matchPreferences: {
    maxDistanceKm: 50,
    minAge: 18,
    maxAge: 50,
    filterByCryptoInterests: false,
  },
  notificationPreferences: {
    newMatches: true,
    newMessages: true,
    tokenRewards: true,
    appUpdates: false,
    dailyStreak: true,
  },
  privacySettings: {
    showOnlineStatus: true,
    showDistance: true,
  },
};

@Injectable()
export class PrismaSettingsRepository implements SettingsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByUserId(userId: string): Promise<UserSettings> {
    const row = await this.prisma.userSettings.upsert({
      where: { userId },
      create: { userId, ...this.flattenDefaults() },
      update: {},
    });
    return this.toSettings(row);
  }

  async updateMatchPreferences(
    userId: string,
    prefs: MatchPreferences,
  ): Promise<UserSettings> {
    const row = await this.prisma.userSettings.upsert({
      where: { userId },
      create: {
        userId,
        ...this.flattenDefaults(),
        maxDistanceKm: prefs.maxDistanceKm,
        minAge: prefs.minAge,
        maxAge: prefs.maxAge,
        filterByCryptoInterests: prefs.filterByCryptoInterests,
      },
      update: {
        maxDistanceKm: prefs.maxDistanceKm,
        minAge: prefs.minAge,
        maxAge: prefs.maxAge,
        filterByCryptoInterests: prefs.filterByCryptoInterests,
      },
    });
    return this.toSettings(row);
  }

  async updateNotificationPreferences(
    userId: string,
    prefs: NotificationPreferences,
  ): Promise<UserSettings> {
    const row = await this.prisma.userSettings.upsert({
      where: { userId },
      create: {
        userId,
        ...this.flattenDefaults(),
        notifyNewMatches: prefs.newMatches,
        notifyNewMessages: prefs.newMessages,
        notifyTokenRewards: prefs.tokenRewards,
        notifyAppUpdates: prefs.appUpdates,
        notifyDailyStreak: prefs.dailyStreak,
      },
      update: {
        notifyNewMatches: prefs.newMatches,
        notifyNewMessages: prefs.newMessages,
        notifyTokenRewards: prefs.tokenRewards,
        notifyAppUpdates: prefs.appUpdates,
        notifyDailyStreak: prefs.dailyStreak,
      },
    });
    return this.toSettings(row);
  }

  async updatePrivacySettings(
    userId: string,
    privacy: PrivacySettings,
  ): Promise<UserSettings> {
    const row = await this.prisma.userSettings.upsert({
      where: { userId },
      create: {
        userId,
        ...this.flattenDefaults(),
        showOnlineStatus: privacy.showOnlineStatus,
        showDistance: privacy.showDistance,
      },
      update: {
        showOnlineStatus: privacy.showOnlineStatus,
        showDistance: privacy.showDistance,
      },
    });
    return this.toSettings(row);
  }

  private flattenDefaults() {
    const d = DEFAULTS;
    return {
      maxDistanceKm: d.matchPreferences.maxDistanceKm,
      minAge: d.matchPreferences.minAge,
      maxAge: d.matchPreferences.maxAge,
      filterByCryptoInterests: d.matchPreferences.filterByCryptoInterests,
      notifyNewMatches: d.notificationPreferences.newMatches,
      notifyNewMessages: d.notificationPreferences.newMessages,
      notifyTokenRewards: d.notificationPreferences.tokenRewards,
      notifyAppUpdates: d.notificationPreferences.appUpdates,
      notifyDailyStreak: d.notificationPreferences.dailyStreak,
      showOnlineStatus: d.privacySettings.showOnlineStatus,
      showDistance: d.privacySettings.showDistance,
    };
  }

  private toSettings(row: {
    maxDistanceKm: number;
    minAge: number;
    maxAge: number;
    filterByCryptoInterests: boolean;
    notifyNewMatches: boolean;
    notifyNewMessages: boolean;
    notifyTokenRewards: boolean;
    notifyAppUpdates: boolean;
    notifyDailyStreak: boolean;
    showOnlineStatus: boolean;
    showDistance: boolean;
  }): UserSettings {
    return {
      matchPreferences: {
        maxDistanceKm: row.maxDistanceKm,
        minAge: row.minAge,
        maxAge: row.maxAge,
        filterByCryptoInterests: row.filterByCryptoInterests,
      },
      notificationPreferences: {
        newMatches: row.notifyNewMatches,
        newMessages: row.notifyNewMessages,
        tokenRewards: row.notifyTokenRewards,
        appUpdates: row.notifyAppUpdates,
        dailyStreak: row.notifyDailyStreak,
      },
      privacySettings: {
        showOnlineStatus: row.showOnlineStatus,
        showDistance: row.showDistance,
      },
    };
  }
}
