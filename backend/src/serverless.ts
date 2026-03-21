import { NestFactory } from "@nestjs/core";
import { ValidationPipe } from "@nestjs/common";
import { ExpressAdapter } from "@nestjs/platform-express";
import serverlessHttp from "serverless-http";
import express from "express";
import { AppModule } from "./app.module";
import { DomainExceptionFilter } from "./infra/http/common/filters/domain-exception.filter";
import { LoggerInterceptor } from "./infra/http/common/interceptors/logger.interceptor";
import type { Handler } from "aws-lambda";

const server = express();

let cachedHandler: Handler;

async function bootstrapLambda(): Promise<Handler> {
  const app = await NestFactory.create(AppModule, new ExpressAdapter(server), {
    logger: ["error", "warn", "log"],
  });

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  app.useGlobalFilters(new DomainExceptionFilter());
  app.useGlobalInterceptors(new LoggerInterceptor());

  await app.init();
  return serverlessHttp(server) as Handler;
}

export async function handler(
  event: unknown,
  context: unknown,
): Promise<unknown> {
  if (!cachedHandler) {
    cachedHandler = await bootstrapLambda();
  }
  return cachedHandler(event as never, context as never, () => undefined);
}
