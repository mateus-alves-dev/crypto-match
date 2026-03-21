import { Injectable } from "@nestjs/common";
import { UserRepository } from "../../domain/repositories/user.repository";
import { NotFoundError } from "../../domain/errors/domain.errors";

export interface GetMeOutput {
  id: string;
  email: string;
  name: string;
  createdAt: Date;
  avatarUrl?: string;
}

@Injectable()
export class GetMeUseCase {
  constructor(private readonly userRepo: UserRepository) {}

  async execute(userId: string): Promise<GetMeOutput> {
    const user = await this.userRepo.findById(userId);
    if (!user) {
      throw new NotFoundError("Usuário não encontrado.");
    }

    return {
      id: user.id,
      email: user.email,
      name: user.name,
      createdAt: user.createdAt,
      avatarUrl: user.avatarUrl,
    };
  }
}
