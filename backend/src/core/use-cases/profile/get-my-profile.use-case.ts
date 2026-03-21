import { Injectable } from "@nestjs/common";
import { ProfileRepository } from "../../domain/repositories/profile.repository";
import { NotFoundError } from "../../domain/errors/domain.errors";
import type { Profile } from "../../domain/repositories/profile.repository";

@Injectable()
export class GetMyProfileUseCase {
  constructor(private readonly profileRepo: ProfileRepository) {}

  async execute(userId: string): Promise<Profile> {
    const profile = await this.profileRepo.findByUserId(userId);
    if (!profile) {
      throw new NotFoundError("Perfil não encontrado.");
    }
    return profile;
  }
}
