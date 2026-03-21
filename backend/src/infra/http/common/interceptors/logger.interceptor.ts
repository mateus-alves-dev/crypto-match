import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
  Logger,
} from "@nestjs/common";
import { Observable } from "rxjs";
import { tap } from "rxjs/operators";
import type { Request } from "express";

@Injectable()
export class LoggerInterceptor implements NestInterceptor {
  private readonly logger = new Logger("HTTP");

  intercept(context: ExecutionContext, next: CallHandler): Observable<unknown> {
    const request = context.switchToHttp().getRequest<Request>();
    const { method, url } = request;
    const requestId =
      (request.headers["x-request-id"] as string | undefined) ??
      crypto.randomUUID();
    const start = Date.now();

    return next.handle().pipe(
      tap({
        next: () => {
          const status = context
            .switchToHttp()
            .getResponse<{ statusCode: number }>().statusCode;
          this.logger.log(
            JSON.stringify({
              requestId,
              method,
              url,
              statusCode: status,
              durationMs: Date.now() - start,
            }),
          );
        },
        error: (err: unknown) => {
          this.logger.warn(
            JSON.stringify({
              requestId,
              method,
              url,
              error: err instanceof Error ? err.message : String(err),
              durationMs: Date.now() - start,
            }),
          );
        },
      }),
    );
  }
}
