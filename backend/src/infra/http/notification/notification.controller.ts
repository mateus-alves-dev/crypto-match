import {
  Controller,
  Post,
  Body,
  UseGuards,
  HttpCode,
  HttpStatus,
} from "@nestjs/common";
import { SaveFcmTokenDto } from "./dto/save-fcm-token.dto";
import { SaveFcmTokenUseCase } from "@/core/use-cases/notification/save-fcm-token.use-case";
import { JwtAuthGuard } from "@/infra/auth/jwt-auth.guard";
import { CurrentUser } from "@/infra/auth/current-user.decorator";
import type { AuthenticatedUser } from "@/infra/auth/jwt.strategy";

@Controller("devices")
@UseGuards(JwtAuthGuard)
export class NotificationController {
  constructor(private readonly saveFcmToken: SaveFcmTokenUseCase) {}

  /**
   * POST /devices/fcm-token
   * Body: { token: string, platform: 'ios' | 'android' }
   * Response 200: DeviceToken
   *
   * Called by the mobile as soon as the user authenticates.
   * Idempotent – safe to call multiple times with the same token.
   */
  @Post("fcm-token")
  @HttpCode(HttpStatus.OK)
  saveToken(
    @CurrentUser() user: AuthenticatedUser,
    @Body() dto: SaveFcmTokenDto,
  ) {
    return this.saveFcmToken.execute({
      userId: user.userId,
      token: dto.token,
      platform: dto.platform,
    });
  }
}
