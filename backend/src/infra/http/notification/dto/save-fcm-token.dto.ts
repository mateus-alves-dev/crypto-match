import { IsString, IsIn } from "class-validator";

export class SaveFcmTokenDto {
  @IsString()
  token!: string;

  @IsIn(["ios", "android"])
  platform!: "ios" | "android";
}
