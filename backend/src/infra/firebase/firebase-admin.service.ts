import { Injectable, Logger, OnModuleInit } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import * as admin from "firebase-admin";
import type { DecodedIdToken } from "firebase-admin/auth";

@Injectable()
export class FirebaseAdminService implements OnModuleInit {
  private readonly logger = new Logger(FirebaseAdminService.name);

  constructor(private readonly config: ConfigService) {}

  onModuleInit(): void {
    if (admin.apps.length > 0) return;

    const base64 = this.config.getOrThrow<string>(
      "FIREBASE_SERVICE_ACCOUNT_JSON",
    );
    const serviceAccount = JSON.parse(
      Buffer.from(base64, "base64").toString("utf-8"),
    ) as admin.ServiceAccount;

    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
    });

    this.logger.log("Firebase Admin SDK initialized");
  }

  async verifyIdToken(idToken: string): Promise<DecodedIdToken> {
    return admin.auth().verifyIdToken(idToken);
  }
}
