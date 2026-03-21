export interface DeviceToken {
  id: string;
  userId: string;
  token: string;
  platform: "ios" | "android";
  lastSeenAt: Date;
  createdAt: Date;
}

export abstract class DeviceTokenRepository {
  /**
   * Upserts the FCM token for a user.
   * If the token already exists (different user or same user), it is re-assigned to this userId.
   * lastSeenAt is always refreshed.
   */
  abstract upsert(
    userId: string,
    token: string,
    platform: "ios" | "android",
  ): Promise<DeviceToken>;
  abstract findAllByUserId(userId: string): Promise<DeviceToken[]>;
  abstract deleteByToken(token: string): Promise<void>;
}
