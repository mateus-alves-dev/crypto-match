/**
 * Base class for all business-rule violations that originate in the domain.
 * The global DomainExceptionFilter maps each subclass to the appropriate HTTP status.
 */
export class DomainError extends Error {
  constructor(
    readonly code: string,
    message: string,
  ) {
    super(message);
    this.name = this.constructor.name;
    Object.setPrototypeOf(this, new.target.prototype);
  }
}

/** 409 – resource already exists */
export class ConflictError extends DomainError {
  constructor(message: string) {
    super("CONFLICT", message);
  }
}

/** 404 – resource not found */
export class NotFoundError extends DomainError {
  constructor(message: string) {
    super("NOT_FOUND", message);
  }
}

/** 401 – invalid credentials or expired token */
export class UnauthorizedError extends DomainError {
  constructor(message = "Não autorizado") {
    super("UNAUTHORIZED", message);
  }
}

/**
 * 422 – business rule violated (e.g. insufficient balance,
 * action already claimed, same-day duplicate).
 */
export class BusinessRuleError extends DomainError {
  constructor(message: string) {
    super("BUSINESS_RULE", message);
  }
}

/** 429 – caller exceeded an operation rate limit */
export class RateLimitError extends DomainError {
  constructor(message = "Muitas requisições. Tente novamente em breve.") {
    super("RATE_LIMIT", message);
  }
}
