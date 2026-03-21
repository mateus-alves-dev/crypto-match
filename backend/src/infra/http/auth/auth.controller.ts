import {
  Controller,
  Post,
  Get,
  Delete,
  Body,
  UseGuards,
  HttpCode,
  HttpStatus,
  ForbiddenException,
} from "@nestjs/common";
import { RegisterDto } from "./dto/register.dto";
import { LoginDto } from "./dto/login.dto";
import { GoogleLoginDto } from "./dto/google-login.dto";
import { RegisterUserUseCase } from "@/core/use-cases/auth/register-user.use-case";
import { LoginUserUseCase } from "@/core/use-cases/auth/login-user.use-case";
import { LoginWithGoogleUseCase } from "@/core/use-cases/auth/login-with-google.use-case";
import { GetMeUseCase } from "@/core/use-cases/auth/get-me.use-case";
import { DeleteAccountUseCase } from "@/core/use-cases/settings/delete-account.use-case";
import { FeatureFlagsService } from "@/infra/config/feature-flags.service";
import { JwtAuthGuard } from "@/infra/auth/jwt-auth.guard";
import { CurrentUser } from "@/infra/auth/current-user.decorator";
import type { AuthenticatedUser } from "@/infra/auth/jwt.strategy";

@Controller()
export class AuthController {
  constructor(
    private readonly registerUser: RegisterUserUseCase,
    private readonly loginUser: LoginUserUseCase,
    private readonly loginWithGoogle: LoginWithGoogleUseCase,
    private readonly getMe: GetMeUseCase,
    private readonly deleteAccount: DeleteAccountUseCase,
    private readonly featureFlags: FeatureFlagsService,
  ) {}

  /**
   * POST /auth/register
   * Body: { name, email, password }
   * Response 201: { accessToken, user: { id, email, name, createdAt, avatarUrl? } }
   */
  @Post("auth/register")
  @HttpCode(HttpStatus.CREATED)
  register(@Body() dto: RegisterDto) {
    if (!this.featureFlags.isEmailLoginEnabled()) {
      throw new ForbiddenException("Email registration is currently disabled.");
    }
    return this.registerUser.execute({
      name: dto.name,
      email: dto.email,
      password: dto.password,
    });
  }

  /**
   * POST /auth/login
   * Body: { email, password }
   * Response 200: { accessToken, user: { id, email, name, createdAt, avatarUrl? } }
   */
  @Post("auth/login")
  @HttpCode(HttpStatus.OK)
  login(@Body() dto: LoginDto) {
    if (!this.featureFlags.isEmailLoginEnabled()) {
      throw new ForbiddenException("Email login is currently disabled.");
    }
    return this.loginUser.execute({ email: dto.email, password: dto.password });
  }

  /**
   * POST /auth/google
   * Body: { idToken } – Firebase ID token from mobile Google Sign-In
   * Response 200: { accessToken, user: { id, email, name, createdAt, avatarUrl? } }
   */
  @Post("auth/google")
  @HttpCode(HttpStatus.OK)
  loginGoogle(@Body() dto: GoogleLoginDto) {
    if (!this.featureFlags.isGoogleLoginEnabled()) {
      throw new ForbiddenException("Google login is currently disabled.");
    }
    return this.loginWithGoogle.execute({ idToken: dto.idToken });
  }

  /**
   * GET /me  (requires JWT)
   * Response 200: { id, email, name, createdAt, avatarUrl? }
   */
  @Get("me")
  @UseGuards(JwtAuthGuard)
  me(@CurrentUser() user: AuthenticatedUser) {
    return this.getMe.execute(user.userId);
  }

  /**
   * DELETE /user  (requires JWT)
   * Permanently deletes the authenticated user's account (cascade via FK)
   * Response 204: empty
   */
  @Delete("user")
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.NO_CONTENT)
  deleteUser(@CurrentUser() user: AuthenticatedUser) {
    return this.deleteAccount.execute(user.userId);
  }
}
