import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";

@Injectable()
export class FeatureFlagsService {
  constructor(private readonly config: ConfigService) {}

  isEmailLoginEnabled(): boolean {
    return this.config.get<string>("ENABLE_EMAIL_LOGIN", "true") !== "false";
  }

  isGoogleLoginEnabled(): boolean {
    return this.config.get<string>("ENABLE_GOOGLE_LOGIN", "false") === "true";
  }
}
