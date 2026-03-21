export interface Profile {
  id: string;
  userId: string;
  displayName: string;
  bio?: string;
  avatarUrl?: string;
  cryptoInterests: string[];
  personaTags: string[];
  age?: number;
  location?: string;
  profileVisible: boolean;
  badges: string[];
  updatedAt: Date;
}

export interface UpdateProfileInput {
  displayName?: string;
  bio?: string;
  avatarUrl?: string;
  cryptoInterests?: string[];
  personaTags?: string[];
  age?: number;
  location?: string;
}

export abstract class ProfileRepository {
  abstract findByUserId(userId: string): Promise<Profile | null>;
  /**
   * Upsert – creates a profile if it doesn't exist, updates if it does.
   * Used during onboarding and subsequent edits.
   */
  abstract upsert(userId: string, input: UpdateProfileInput): Promise<Profile>;
  abstract delete(userId: string): Promise<void>;
}
