import { Module } from "@nestjs/common";
import { JwtModule } from "@nestjs/jwt";
import { PassportModule } from "@nestjs/passport";
import { ConfigService } from "@nestjs/config";
import { AuthController } from "./auth.controller";
import { JwtStrategy } from "@/infra/auth/jwt.strategy";
import { RegisterUserUseCase } from "@/core/use-cases/auth/register-user.use-case";
import { LoginUserUseCase } from "@/core/use-cases/auth/login-user.use-case";
import { LoginWithGoogleUseCase } from "@/core/use-cases/auth/login-with-google.use-case";
import { GetMeUseCase } from "@/core/use-cases/auth/get-me.use-case";
import { DeleteAccountUseCase } from "@/core/use-cases/settings/delete-account.use-case";
import { FeatureFlagsService } from "@/infra/config/feature-flags.service";
import { FirebaseModule } from "@/infra/firebase/firebase.module";
import { UserRepository } from "@/core/domain/repositories/user.repository";
import { ProfileRepository } from "@/core/domain/repositories/profile.repository";
import { SettingsRepository } from "@/core/domain/repositories/settings.repository";
import { PrismaUserRepository } from "@/infra/persistence/prisma/repositories/prisma-user.repository";
import { PrismaProfileRepository } from "@/infra/persistence/prisma/repositories/prisma-profile.repository";
import { PrismaSettingsRepository } from "@/infra/persistence/prisma/repositories/prisma-settings.repository";

@Module({
  imports: [
    PassportModule,
    FirebaseModule,
    JwtModule.registerAsync({
      inject: [ConfigService],
      useFactory: (config: ConfigService) => ({
        secret: config.getOrThrow<string>("JWT_SECRET"),
        signOptions: { expiresIn: config.get("JWT_EXPIRES_IN", "7d") },
      }),
    }),
  ],
  controllers: [AuthController],
  providers: [
    JwtStrategy,
    RegisterUserUseCase,
    LoginUserUseCase,
    LoginWithGoogleUseCase,
    GetMeUseCase,
    DeleteAccountUseCase,
    FeatureFlagsService,
    { provide: UserRepository, useClass: PrismaUserRepository },
    { provide: ProfileRepository, useClass: PrismaProfileRepository },
    { provide: SettingsRepository, useClass: PrismaSettingsRepository },
  ],
  exports: [JwtModule, PassportModule],
})
export class AuthModule {}
