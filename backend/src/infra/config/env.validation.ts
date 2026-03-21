import * as Joi from "joi";

export const envValidationSchema = Joi.object({
  NODE_ENV: Joi.string()
    .valid("development", "production", "test")
    .default("development"),
  DATABASE_URL: Joi.string().required(),
  JWT_SECRET: Joi.string().min(32).required(),
  JWT_EXPIRES_IN: Joi.string().default("7d"),
  BCRYPT_ROUNDS: Joi.number().integer().min(10).max(14).default(12),
  // Firebase Admin
  FIREBASE_SERVICE_ACCOUNT_JSON: Joi.string().required(),
  // Feature flags
  ENABLE_EMAIL_LOGIN: Joi.string().valid("true", "false").default("true"),
  ENABLE_GOOGLE_LOGIN: Joi.string().valid("true", "false").default("true"),
});
