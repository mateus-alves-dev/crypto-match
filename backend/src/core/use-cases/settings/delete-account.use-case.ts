import { Injectable } from "@nestjs/common";
import { UserRepository } from "../../domain/repositories/user.repository";
import { ProfileRepository } from "../../domain/repositories/profile.repository";
import { NotFoundError } from "../../domain/errors/domain.errors";

@Injectable()
export class DeleteAccountUseCase {
  constructor(
    private readonly userRepo: UserRepository,
    private readonly profileRepo: ProfileRepository,
  ) {}

  async execute(userId: string): Promise<void> {
    const user = await this.userRepo.findById(userId);
    if (!user) {
      throw new NotFoundError("Usuário não encontrado.");
    }

    // Profile and related rows are cascade-deleted via FK in Prisma schema
    await this.userRepo.delete(userId);
  }
}
