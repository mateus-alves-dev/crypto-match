import { Controller, Get, Put, Body, UseGuards } from "@nestjs/common";
import { UpdateProfileDto } from "./dto/update-profile.dto";
import { GetMyProfileUseCase } from "@/core/use-cases/profile/get-my-profile.use-case";
import { UpdateMyProfileUseCase } from "@/core/use-cases/profile/update-my-profile.use-case";
import { JwtAuthGuard } from "@/infra/auth/jwt-auth.guard";
import { CurrentUser } from "@/infra/auth/current-user.decorator";
import type { AuthenticatedUser } from "@/infra/auth/jwt.strategy";

@Controller("profiles")
@UseGuards(JwtAuthGuard)
export class ProfileController {
  constructor(
    private readonly getMyProfile: GetMyProfileUseCase,
    private readonly updateMyProfile: UpdateMyProfileUseCase,
  ) {}

  /**
   * GET /profiles/me
   * Response 200: Profile
   */
  @Get("me")
  get(@CurrentUser() user: AuthenticatedUser) {
    return this.getMyProfile.execute(user.userId);
  }

  /**
   * PUT /profiles/me
   * Body: UpdateProfileDto (all fields optional)
   * Response 200: Profile
   */
  @Put("me")
  update(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: UpdateProfileDto,
  ) {
    return this.updateMyProfile.execute(user.userId, {
      displayName: dto.displayName,
      bio: dto.bio,
      avatarUrl: dto.avatarUrl,
      cryptoInterests: dto.cryptoInterests,
      personaTags: dto.personaTags,
      age: dto.age,
      location: dto.location,
    });
  }
}
