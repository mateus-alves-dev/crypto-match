import { Module } from "@nestjs/common";
import { NotificationController } from "./notification.controller";
import { SaveFcmTokenUseCase } from "@/core/use-cases/notification/save-fcm-token.use-case";
import { DeviceTokenRepository } from "@/core/domain/repositories/device-token.repository";
import { PrismaDeviceTokenRepository } from "@/infra/persistence/prisma/repositories/prisma-device-token.repository";
import { AuthModule } from "../auth/auth.module";

@Module({
  imports: [AuthModule],
  controllers: [NotificationController],
  providers: [
    SaveFcmTokenUseCase,
    { provide: DeviceTokenRepository, useClass: PrismaDeviceTokenRepository },
  ],
})
export class NotificationModule {}
