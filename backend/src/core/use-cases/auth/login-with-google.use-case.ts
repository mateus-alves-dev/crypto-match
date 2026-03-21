import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { UserRepository } from "../../domain/repositories/user.repository";
import { ProfileRepository } from "../../domain/repositories/profile.repository";
import { SettingsRepository } from "../../domain/repositories/settings.repository";
import { FirebaseAdminService } from "@/infra/firebase/firebase-admin.service";

export interface LoginWithGoogleInput {
  /** Firebase ID token obtained from the mobile client */
  idToken: string;
}

export interface LoginWithGoogleOutput {
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
export class LoginWithGoogleUseCase {
  constructor(
    private readonly userRepo: UserRepository,
    private readonly profileRepo: ProfileRepository,
    private readonly settingsRepo: SettingsRepository,
    private readonly firebaseAdmin: FirebaseAdminService,
    private readonly jwtService: JwtService,
  ) {}

  async execute(input: LoginWithGoogleInput): Promise<LoginWithGoogleOutput> {
    const decoded = await this.firebaseAdmin.verifyIdToken(input.idToken);

    const googleUid = decoded.uid;
    const email = decoded.email ?? `${googleUid}@google.noemail`;
    const name = decoded.name ?? decoded.email?.split("@")[0] ?? "User";

    // 1. Look up by Google UID (returning user with linked account)
    let user = await this.userRepo.findByGoogleUid(googleUid);

    if (!user) {
      // 2. Look up by email (existing email/password account → auto-link)
      const existingByEmail = await this.userRepo.findByEmail(email);

      if (existingByEmail) {
        await this.userRepo.linkGoogleUid(existingByEmail.id, googleUid);
        user = { ...existingByEmail, googleUid };
      } else {
        // 3. New user – create account + bootstrap profile & settings
        user = await this.userRepo.create({ name, email, googleUid });

        await Promise.all([
          this.profileRepo.upsert(user.id, {
            displayName: name,
            avatarUrl: decoded.picture,
          }),
          this.settingsRepo.findByUserId(user.id),
        ]);
      }
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
