import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
  Logger,
} from "@nestjs/common";
import type { Response } from "express";
import {
  ConflictError,
  NotFoundError,
  UnauthorizedError,
  BusinessRuleError,
  RateLimitError,
  DomainError,
} from "@/core/domain/errors/domain.errors";

@Catch()
export class DomainExceptionFilter implements ExceptionFilter {
  private readonly logger = new Logger(DomainExceptionFilter.name);

  catch(exception: unknown, host: ArgumentsHost): void {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();

    const { status, message } = this.resolve(exception);

    if (status >= 500) {
      this.logger.error(
        exception instanceof Error ? exception.stack : String(exception),
      );
    }

    response.status(status).json({
      statusCode: status,
      message,
      timestamp: new Date().toISOString(),
    });
  }

  private resolve(exception: unknown): { status: number; message: string } {
    if (exception instanceof ConflictError) {
      return { status: HttpStatus.CONFLICT, message: exception.message };
    }
    if (exception instanceof NotFoundError) {
      return { status: HttpStatus.NOT_FOUND, message: exception.message };
    }
    if (exception instanceof UnauthorizedError) {
      return { status: HttpStatus.UNAUTHORIZED, message: exception.message };
    }
    if (exception instanceof BusinessRuleError) {
      return {
        status: HttpStatus.UNPROCESSABLE_ENTITY,
        message: exception.message,
      };
    }
    if (exception instanceof RateLimitError) {
      return {
        status: HttpStatus.TOO_MANY_REQUESTS,
        message: exception.message,
      };
    }
    if (exception instanceof DomainError) {
      return { status: HttpStatus.BAD_REQUEST, message: exception.message };
    }
    if (exception instanceof HttpException) {
      return {
        status: exception.getStatus(),
        message: this.extractMessage(exception.getResponse()),
      };
    }

    return {
      status: HttpStatus.INTERNAL_SERVER_ERROR,
      message: "Erro interno do servidor.",
    };
  }

  private extractMessage(response: string | object): string {
    if (typeof response === "string") return response;
    if (typeof response === "object" && "message" in response) {
      const msg = (response as { message: string | string[] }).message;
      return Array.isArray(msg) ? msg.join("; ") : msg;
    }
    return "Erro inesperado.";
  }
}
