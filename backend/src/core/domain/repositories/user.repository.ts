export interface User {
  id: string;
  email: string;
  name: string;
  /** Hashed password – never expose in API responses. Null for Google-only accounts */
  password?: string;
  googleUid?: string;
  createdAt: Date;
  updatedAt: Date;
  avatarUrl?: string;
  referralCode?: string;
}

export interface CreateUserInput {
  name: string;
  email: string;
  /** Plain-text password – hashed by the use case. Omit for Google-only accounts */
  password?: string;
  googleUid?: string;
  referralCode?: string;
}

export abstract class UserRepository {
  abstract findById(id: string): Promise<User | null>;
  abstract findByEmail(email: string): Promise<User | null>;
  abstract findByGoogleUid(googleUid: string): Promise<User | null>;
  abstract create(input: CreateUserInput): Promise<User>;
  abstract linkGoogleUid(userId: string, googleUid: string): Promise<void>;
  abstract updatePassword(
    userId: string,
    hashedPassword: string,
  ): Promise<void>;
  abstract updateAvatarUrl(userId: string, avatarUrl: string): Promise<void>;
  abstract delete(userId: string): Promise<void>;
}
