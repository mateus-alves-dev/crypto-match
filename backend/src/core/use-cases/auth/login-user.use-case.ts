import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import * as bcrypt from "bcryptjs";
import { UserRepository } from "../../domain/repositories/user.repository";
import { UnauthorizedError } from "../../domain/errors/domain.errors";

export interface LoginInput {
  email: string;
  password: string;
}

export interface LoginOutput {
  accessToken: string;
  user: {
    id: string;
    email: string;
    name: string;
    createdAt: Date;
    avatarUrl?: string;
  };
}

@Injectable()
export class LoginUserUseCase {
  constructor(
    private readonly userRepo: UserRepository,
    private readonly jwtService: JwtService,
  ) {}

  async execute(input: LoginInput): Promise<LoginOutput> {
    const user = await this.userRepo.findByEmail(input.email);

    // Use constant-time comparison even for missing users to prevent timing attacks
    const passwordToCompare =
      user?.password ?? "$2b$12$invalidhashfortimingattackprevention";
    const isValid = await bcrypt.compare(input.password, passwordToCompare);

    if (!user || !isValid) {
      throw new UnauthorizedError("E-mail ou senha incorretos.");
    }

    const accessToken = this.jwtService.sign({
      sub: user.id,
      email: user.email,
    });

    return {
      accessToken,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        createdAt: user.createdAt,
        avatarUrl: user.avatarUrl,
      },
    };
  }
}
