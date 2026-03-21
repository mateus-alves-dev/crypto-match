import { IsBoolean, IsInt, IsOptional, Min, Max } from "class-validator";

export class UpdateMatchPreferencesDto {
  @IsInt()
  @Min(5)
  @Max(500)
  maxDistanceKm!: number;

  @IsInt()
  @Min(18)
  @Max(100)
  minAge!: number;

  @IsInt()
  @Min(18)
  @Max(100)
  maxAge!: number;

  @IsBoolean()
  filterByCryptoInterests!: boolean;
}

export class UpdateNotificationSettingsDto {
  @IsBoolean()
  newMatches!: boolean;

  @IsBoolean()
  newMessages!: boolean;

  @IsBoolean()
  tokenRewards!: boolean;

  @IsBoolean()
  appUpdates!: boolean;

  @IsBoolean()
  dailyStreak!: boolean;
}

export class UpdatePrivacySettingsDto {
  @IsBoolean()
  showOnlineStatus!: boolean;

  @IsBoolean()
  showDistance!: boolean;
}
