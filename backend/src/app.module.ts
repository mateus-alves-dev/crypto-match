import { Module } from "@nestjs/common";
import { AppConfigModule } from "./infra/config/config.module";
import { PrismaModule } from "./infra/persistence/prisma/prisma.module";
import { AuthModule } from "./infra/http/auth/auth.module";
import { ProfileModule } from "./infra/http/profile/profile.module";
import { SettingsModule } from "./infra/http/settings/settings.module";
import { NotificationModule } from "./infra/http/notification/notification.module";

// Phase 2+ modules – uncomment when the corresponding phase begins
// import { MatchModule } from './infra/http/match/match.module';
// import { TokenModule } from './infra/http/token/token.module';
// import { ConversationModule } from './infra/http/conversation/conversation.module';

@Module({
  imports: [
    AppConfigModule,
    PrismaModule,

    // Phase 0 + 1
    AuthModule,
    ProfileModule,
    SettingsModule,
    NotificationModule,
  ],
})
export class AppModule {}
