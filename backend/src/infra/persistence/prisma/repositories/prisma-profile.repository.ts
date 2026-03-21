import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma.service";
import {
  ProfileRepository,
  Profile,
  UpdateProfileInput,
} from "@/core/domain/repositories/profile.repository";

@Injectable()
export class PrismaProfileRepository implements ProfileRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByUserId(userId: string): Promise<Profile | null> {
    const row = await this.prisma.profile.findUnique({ where: { userId } });
    if (!row) return null;
    return this.toProfile(row);
  }

  async upsert(userId: string, input: UpdateProfileInput): Promise<Profile> {
    const row = await this.prisma.profile.upsert({
      where: { userId },
      create: {
        userId,
        displayName: input.displayName ?? "",
        bio: input.bio,
        avatarUrl: input.avatarUrl,
        cryptoInterests: input.cryptoInterests ?? [],
        personaTags: input.personaTags ?? [],
        age: input.age,
        location: input.location,
      },
      update: {
        ...(input.displayName !== undefined && {
          displayName: input.displayName,
        }),
        ...(input.bio !== undefined && { bio: input.bio }),
        ...(input.avatarUrl !== undefined && { avatarUrl: input.avatarUrl }),
        ...(input.cryptoInterests !== undefined && {
          cryptoInterests: input.cryptoInterests,
        }),
        ...(input.personaTags !== undefined && {
          personaTags: input.personaTags,
        }),
        ...(input.age !== undefined && { age: input.age }),
        ...(input.location !== undefined && { location: input.location }),
      },
    });
    return this.toProfile(row);
  }

  async delete(userId: string): Promise<void> {
    await this.prisma.profile.delete({ where: { userId } });
  }

  private toProfile(row: {
    id: string;
    userId: string;
    displayName: string;
    bio: string | null;
    avatarUrl: string | null;
    cryptoInterests: string[];
    personaTags: string[];
    age: number | null;
    location: string | null;
    profileVisible: boolean;
    badges: string[];
    updatedAt: Date;
  }): Profile {
    return {
      id: row.id,
      userId: row.userId,
      displayName: row.displayName,
      bio: row.bio ?? undefined,
      avatarUrl: row.avatarUrl ?? undefined,
      cryptoInterests: row.cryptoInterests,
      personaTags: row.personaTags,
      age: row.age ?? undefined,
      location: row.location ?? undefined,
      profileVisible: row.profileVisible,
      badges: row.badges,
      updatedAt: row.updatedAt,
    };
  }
}
