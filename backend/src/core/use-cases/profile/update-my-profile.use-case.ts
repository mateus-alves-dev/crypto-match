import { Injectable } from "@nestjs/common";
import {
  ProfileRepository,
  UpdateProfileInput,
} from "../../domain/repositories/profile.repository";
import type { Profile } from "../../domain/repositories/profile.repository";

@Injectable()
export class UpdateMyProfileUseCase {
  constructor(private readonly profileRepo: ProfileRepository) {}

  async execute(userId: string, input: UpdateProfileInput): Promise<Profile> {
    // No required fields on update – the caller may patch any subset
    return this.profileRepo.upsert(userId, input);
  }
}
