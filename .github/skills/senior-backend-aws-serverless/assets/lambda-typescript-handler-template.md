# Lambda TypeScript Handler Template

Use this template when implementing a Lambda with clean separation between transport, application logic, and infrastructure concerns.

```ts
type Input = {
  userId: string;
  operationId: string;
};

type Output = {
  status: 'ok';
  processedAt: string;
};

interface UseCase<I, O> {
  execute(input: I): Promise<O>;
}

interface Logger {
  info(fields: Record<string, unknown>, message: string): void;
  error(fields: Record<string, unknown>, message: string): void;
}

class ProcessOperationUseCase implements UseCase<Input, Output> {
  public async execute(input: Input): Promise<Output> {
    return {
      status: 'ok',
      processedAt: new Date().toISOString(),
    };
  }
}

const logger: Logger = console;
const useCase = new ProcessOperationUseCase();

function parseInput(event: unknown): Input {
  const candidate = event as { body?: string };

  if (typeof candidate.body !== 'string') {
    throw new Error('Missing body');
  }

  const parsed = JSON.parse(candidate.body) as Partial<Input>;

  if (!parsed.userId || !parsed.operationId) {
    throw new Error('Invalid payload');
  }

  return {
    userId: parsed.userId,
    operationId: parsed.operationId,
  };
}

export async function handler(event: unknown): Promise<{ statusCode: number; body: string }> {
  const startedAt = Date.now();

  try {
    const input = parseInput(event);
    const result = await useCase.execute(input);

    logger.info(
      {
        operation: 'process-operation',
        outcome: 'success',
        durationMs: Date.now() - startedAt,
      },
      'Operation processed',
    );

    return {
      statusCode: 200,
      body: JSON.stringify(result),
    };
  } catch (error) {
    logger.error(
      {
        operation: 'process-operation',
        outcome: 'failure',
        durationMs: Date.now() - startedAt,
        error,
      },
      'Operation failed',
    );

    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'Bad request' }),
    };
  }
}
```

## Adaptation Notes

- Replace `parseInput` with transport-specific parsing for API Gateway, SQS, EventBridge, or S3
- Keep validation and mapping in the handler layer
- Move business rules into the use case class
- Inject repositories and clients instead of constructing them inside the handler
- Add idempotency checks before irreversible side effects
- Reuse clients across invocations for lower latency and cost