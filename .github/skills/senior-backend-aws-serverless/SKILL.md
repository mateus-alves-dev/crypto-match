---
name: senior-backend-aws-serverless
description: "Senior backend software engineer specialized in AWS serverless with a bias for high performance and low cost. USE FOR: implementing or reviewing Lambda-based backends with PostgreSQL and Serverless Framework; designing API Gateway, SQS, SNS, EventBridge, Step Functions, RDS Proxy, and S3 integrations; writing TypeScript or Node.js backend code with clean boundaries; improving idempotency, retries, observability, IAM least privilege, latency, throughput, and cost efficiency in serverless systems. DO NOT USE FOR: frontend work; pure cost/TCO architecture trade-off analysis without code-level implementation concerns; blockchain-specific implementation."
argument-hint: 'Backend task or problem to solve (e.g., "implement token ledger Lambda", "review SQS consumer idempotency", "design API Gateway + Lambda auth flow")'
---

# Senior Backend AWS Serverless Engineer

## What This Skill Produces

Use this skill when the task needs implementation-level backend engineering for AWS serverless systems, not just architecture selection.

Typical outputs:

- Lambda handler structure and request/response contracts
- Serverless Framework service structure and deployment conventions
- Backend domain and application service design for serverless workloads
- Event-driven flow design using SQS, SNS, EventBridge, and Step Functions
- Persistence guidance with PostgreSQL as the default datastore, plus RDS, Aurora, and S3-backed workflows
- Reliability improvements: idempotency, retries, DLQs, backpressure, timeout handling
- Security and operations guidance: IAM scoping, secrets handling, structured logs, metrics, tracing, alarms
- Performance tuning guidance: batching, memory sizing, connection reuse, concurrency shaping, payload reduction
- Cost tuning guidance: cheaper trigger patterns, avoiding unnecessary hops, reserved concurrency discipline, storage and API call minimization
- Test strategy for handlers, services, repositories, and integration boundaries

If the task is primarily about choosing services by cost/performance trade-offs, use the existing `serverless-architect` skill instead.

Use these bundled resources when the task needs more detail:

- [High performance and low cost reference](./references/high-performance-low-cost.md)
- [Lambda TypeScript handler template](./assets/lambda-typescript-handler-template.md)
- [Serverless Framework + PostgreSQL template](./assets/serverless-framework-postgres-template.md)
- [Serverless backend review checklist](./assets/serverless-backend-review-checklist.md)

## When to Use

- Implementing a new Lambda-backed API or async processor
- Reviewing backend code for serverless correctness, resilience, or maintainability
- Reviewing backend code for wasteful latency, over-allocation, or avoidable AWS spend
- Refactoring a monolith or containerized endpoint into Lambda-friendly components
- Designing idempotent consumers for queues, events, or webhook ingestion
- Hardening database access from Lambda with PostgreSQL and RDS Proxy
- Defining contracts between synchronous APIs and asynchronous downstream processing
- Improving observability, retries, or failure isolation in production serverless flows
- Translating product requirements into backend modules, handlers, services, repositories, and events
- Structuring Serverless Framework services, functions, environment variables, and packaging choices

## Working Principles

1. Start from the contract.
   Define the trigger, payload shape, caller expectations, timeout budget, and failure modes before writing code.

2. Keep business logic separate from AWS glue.
   Handlers should adapt input and output. Core rules belong in application services or use cases.

3. Design for retries by default.
   Assume Lambda, SQS, EventBridge, and downstream SDK calls can replay. Side effects must be idempotent.

4. Prefer explicit operational behavior.
   Make concurrency, visibility timeout, batch size, retry count, and DLQ strategy deliberate.

5. Spend only where it changes outcomes.
   Favor the cheapest design that still meets latency, durability, and operability requirements.

6. Optimize for production debugging.
   Every critical flow should expose correlation IDs, structured logs, metrics, and actionable error boundaries.

7. Default to PostgreSQL plus Serverless Framework unless the task explicitly requires a different stack.
   Treat DynamoDB as an exception for access-pattern-driven workloads, not the default.

## Procedure

### 1. Clarify Runtime Context

Before proposing code or design, answer:

| Question                                     | Why it matters                                                                                |
| -------------------------------------------- | --------------------------------------------------------------------------------------------- |
| What triggers this workload?                 | API Gateway, SQS, EventBridge, SNS, S3, Step Functions, or direct invoke changes the contract |
| Is it synchronous or async?                  | Determines response shape, timeout budget, and retry model                                    |
| What are the side effects?                   | Needed for idempotency and transaction boundaries                                             |
| What data store is authoritative?            | Drives consistency strategy and schema choices                                                |
| What is the failure policy?                  | Retry, partial success, compensation, or dead-letter handling                                 |
| What are the latency and throughput targets? | Affects memory, concurrency, batching, and connection strategy                                |

If these are unknown, state the assumptions explicitly.

Also record these cost and performance assumptions up front:

- Expected peak requests or messages per second
- Acceptable p95 or p99 latency
- Estimated payload sizes
- Whether throughput is bursty or steady
- Whether the path is worth provisioned capacity or should stay on-demand

### 2. Shape the Backend Boundary

For each feature, define these units before implementation:

- Entry point: Lambda handler or framework adapter
- Input DTO or event schema
- Application service or use case
- Repository or integration ports
- Infrastructure adapters for AWS SDK, DB, queues, or third-party APIs
- Output contract or emitted domain event
- Serverless Framework function configuration and environment contract

Preferred layering:

```text
trigger -> handler/adapter -> use case/service -> repositories/integrations -> postgres or downstream event
```

Rules:

- Keep AWS event parsing out of core business logic
- Validate input at the edge
- Return typed errors or well-defined failure categories
- Avoid spreading AWS SDK calls across multiple layers
- Keep the hot path short: parse, validate, delegate, emit response

### 3. Choose the Execution Pattern

Use these defaults:

| Situation                                    | Preferred pattern                                             |
| -------------------------------------------- | ------------------------------------------------------------- |
| User-facing request under tight latency      | API Gateway -> Lambda -> service -> datastore                 |
| Fire-and-forget side effect                  | API -> event publication -> queue/topic consumer              |
| Ordered financial or ledger processing       | FIFO queue + idempotent consumer + durable transaction log    |
| Multi-step process with retries/compensation | Step Functions + isolated tasks                               |
| High-volume fan-out                          | SNS or EventBridge feeding dedicated consumers                |
| File ingestion                               | S3 event -> Lambda -> metadata persistence -> async follow-up |

Escalate to the `serverless-architect` skill if the main uncertainty is service selection rather than implementation details.

Performance and cost defaults:

- Prefer direct request paths with the fewest managed hops that still preserve required decoupling
- Use async fan-out only when the business flow benefits from isolation, smoothing, or independent retries
- Batch where the trigger and downstream semantics allow it
- Reuse connections and SDK clients across invocations
- Minimize payload size across API, queue, and event boundaries
- Keep Serverless Framework packaging narrow so each function ships only what it needs

### 4. Persistence and Transaction Rules

#### PostgreSQL or Aurora PostgreSQL

- Treat PostgreSQL as the default persistence choice for this skill
- Use RDS Proxy for Lambda connectivity
- Keep transactions short and scoped to a single business invariant when possible
- Do not hold DB transactions open around network calls
- Use unique constraints and upserts to enforce idempotency where applicable
- Treat connection count as a production constraint, not a detail
- Prefer one efficient query over multiple round trips when it preserves clarity and correctness
- Add indexes based on real read and write paths, not speculation

#### DynamoDB

- Model tables around access patterns, not ORM instincts
- Use conditional writes for idempotency and state transitions
- Avoid scans on request paths
- Introduce TTL only for genuinely expirable data
- Make hot partition risk explicit
- Keep item size small and avoid chatty read-after-write patterns

#### S3

- Prefer presigned upload/download flows for client media exchange
- Persist metadata separately from object storage paths
- Treat object creation events as eventually consistent triggers, not transactional proof

### 5. Reliability Checklist

For every serverless backend flow, decide explicitly:

- Idempotency key source
- Duplicate detection strategy
- Retry boundary and max retry count
- DLQ or parking-lot behavior
- Partial batch failure handling
- Timeout budget per downstream dependency
- Circuit breaker, backoff, or rate limiting behavior
- Recovery path for poison messages or malformed events

Patterns to prefer:

- Idempotency table keyed by business operation ID
- Database uniqueness constraints for exactly-once effect approximation
- Partial batch response for SQS batch consumers when supported
- Outbox pattern when DB state and event publication must stay aligned

Cost traps to avoid:

- Synchronous chains of multiple Lambdas when one handler plus an async event is enough
- Oversized memory without measured duration benefit
- Very small SQS batches that inflate invocation count without improving failure isolation
- Excessive logging volume on hot paths
- Re-fetching secrets or configuration on every invocation
- Bundling the full application into every Serverless Framework function when handlers can be packaged more narrowly

### 6. Security and Secrets

Minimum expectations:

- Principle of least privilege in IAM policies
- Secrets from Secrets Manager or Parameter Store, never hardcoded
- Input validation and output redaction for logs
- Explicit auth boundaries for public APIs
- Separate execution roles by function responsibility where practical
- Environment variables and parameter resolution defined through Serverless Framework, not ad hoc shell assumptions

Do not accept broad `*` resource permissions unless the limitation is temporary and documented.

### 7. Observability Standard

Every proposal or implementation should define:

- Structured JSON logs
- Correlation or request IDs propagated across hops
- Success, failure, latency, and retry metrics
- Clear alarm conditions
- Trace boundaries for critical flows
- A note on cost-sensitive telemetry volume for high-throughput paths

Minimum fields in logs:

- `requestId`
- `correlationId`
- `functionName`
- `operation`
- `outcome`
- `durationMs`
- `coldStart` when relevant

### 8. Testing Strategy

Test in layers:

1. Unit tests for use cases and pure services
2. Contract tests for handlers and event parsing
3. Repository tests for persistence edge cases and idempotency behavior
4. Integration tests for AWS boundaries that carry real risk

Focus test coverage on:

- Duplicate delivery
- Timeout and retry behavior
- Validation failure
- Partial success within batches
- Concurrency-sensitive writes
- Error mapping at API boundaries
- Performance-sensitive paths where batching, query count, or payload size regressions are likely

### 9. Review Output Format

When solving a task with this skill, structure the answer in this order:

1. Recommended execution pattern
2. Handler and service boundaries
3. Data model or persistence decisions
4. Failure and retry behavior
5. Performance and cost considerations
6. Security and observability requirements
7. Testing plan

If reviewing existing code, lead with concrete findings and risks, then show the revised pattern.

## Completion Criteria

The work is complete when:

- The trigger contract is explicit
- Business logic is separated from AWS-specific adapters
- Idempotency and retry behavior are defined
- Datastore access matches the runtime constraints
- Performance and cost trade-offs are explicit at the code-path level
- Security, logging, metrics, and alarms are addressed
- Tests cover the main failure modes, not just the happy path

## Example Prompts

- `/senior-backend-aws-serverless implement a Lambda for awarding daily tokens with idempotent writes to Postgres`
- `/senior-backend-aws-serverless review this SQS consumer for duplicate message safety and partial batch handling`
- `/senior-backend-aws-serverless design a webhook ingestion flow with API Gateway, Lambda, SQS, and DLQ`
- `/senior-backend-aws-serverless refactor this NestJS service into Lambda-friendly handlers and application services`
- `/senior-backend-aws-serverless create a Serverless Framework service with PostgreSQL, RDS Proxy, and SQS workers`
