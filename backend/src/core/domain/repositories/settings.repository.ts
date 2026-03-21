export interface MatchPreferences {
  maxDistanceKm: number;
  minAge: number;
  maxAge: number;
  filterByCryptoInterests: boolean;
}

export interface NotificationPreferences {
  newMatches: boolean;
  newMessages: boolean;
  tokenRewards: boolean;
  appUpdates: boolean;
  dailyStreak: boolean;
}

export interface PrivacySettings {
  showOnlineStatus: boolean;
  showDistance: boolean;
}

export interface UserSettings {
  matchPreferences: MatchPreferences;
  notificationPreferences: NotificationPreferences;
  privacySettings: PrivacySettings;
}

export abstract class SettingsRepository {
  /**
   * Returns default settings if the user has no persisted preferences yet.
   */
  abstract findByUserId(userId: string): Promise<UserSettings>;
  abstract updateMatchPreferences(
    userId: string,
    prefs: MatchPreferences,
  ): Promise<UserSettings>;
  abstract updateNotificationPreferences(
    userId: string,
    prefs: NotificationPreferences,
  ): Promise<UserSettings>;
  abstract updatePrivacySettings(
    userId: string,
    privacy: PrivacySettings,
  ): Promise<UserSettings>;
}
