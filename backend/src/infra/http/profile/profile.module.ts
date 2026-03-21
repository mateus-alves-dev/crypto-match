import { Module } from "@nestjs/common";
import { ProfileController } from "./profile.controller";
import { GetMyProfileUseCase } from "@/core/use-cases/profile/get-my-profile.use-case";
import { UpdateMyProfileUseCase } from "@/core/use-cases/profile/update-my-profile.use-case";
import { ProfileRepository } from "@/core/domain/repositories/profile.repository";
import { PrismaProfileRepository } from "@/infra/persistence/prisma/repositories/prisma-profile.repository";
import { AuthModule } from "../auth/auth.module";

@Module({
  imports: [AuthModule],
  controllers: [ProfileController],
  providers: [
    GetMyProfileUseCase,
    UpdateMyProfileUseCase,
    { provide: ProfileRepository, useClass: PrismaProfileRepository },
  ],
})
export class ProfileModule {}
