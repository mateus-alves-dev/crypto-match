import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import * as bcrypt from "bcryptjs";
import { UserRepository } from "../../domain/repositories/user.repository";
import { ProfileRepository } from "../../domain/repositories/profile.repository";
import { SettingsRepository } from "../../domain/repositories/settings.repository";
import { ConflictError } from "../../domain/errors/domain.errors";

export interface RegisterInput {
  name: string;
  email: string;
  password: string;
}

export interface RegisterOutput {
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
export class RegisterUserUseCase {
  constructor(
    private readonly userRepo: UserRepository,
    private readonly profileRepo: ProfileRepository,
    private readonly settingsRepo: SettingsRepository,
    private readonly jwtService: JwtService,
  ) {}

  async execute(input: RegisterInput): Promise<RegisterOutput> {
    const existing = await this.userRepo.findByEmail(input.email);
    if (existing) {
      throw new ConflictError("Este e-mail já está cadastrado.");
    }

    const rounds = Number(process.env.BCRYPT_ROUNDS ?? 12);
    const hashedPassword = await bcrypt.hash(input.password, rounds);

    const user = await this.userRepo.create({
      name: input.name,
      email: input.email,
      password: hashedPassword,
    });

    // Bootstrap profile and settings rows so they always exist post-registration
    await Promise.all([
      this.profileRepo.upsert(user.id, { displayName: input.name }),
      this.settingsRepo.findByUserId(user.id), // triggers upsert with defaults in impl
    ]);

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
