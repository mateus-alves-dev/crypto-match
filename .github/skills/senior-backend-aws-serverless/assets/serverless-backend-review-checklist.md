# Serverless Backend Review Checklist

Use this checklist when reviewing an implementation or preparing a design.

## Contract

- Trigger type is explicit
- Input schema is defined and validated at the edge
- Response or emitted event contract is documented

## Boundaries

- AWS-specific event parsing stays in the handler or adapter
- Business logic lives in services or use cases
- Repositories and downstream integrations are abstracted behind narrow interfaces

## Reliability

- Idempotency key is defined
- Retry behavior is intentional
- DLQ or equivalent failure sink exists where needed
- Batch consumers handle partial failures correctly

## Performance

- Critical path has no unnecessary network hops
- Query count is deliberate
- Connections and SDK clients are reused
- Payload sizes are constrained
- Batch settings match throughput goals

## Cost

- Invocation count is not inflated by avoidable fan-out or tiny batches
- Logging volume is proportionate to traffic level
- Memory and concurrency choices are justified
- Storage and index usage are aligned with real access patterns

## Security

- IAM scope follows least privilege
- Secrets are not hardcoded
- Sensitive data is redacted from logs
- Public endpoints have explicit auth behavior

## Operations

- Structured logs include request or correlation identifiers
- Metrics cover success, failure, latency, and retries
- Alarm conditions are defined for production failure modes
- Timeouts are smaller than upstream hard limits where appropriate

## Testing

- Happy path tests exist
- Duplicate delivery is tested
- Validation failures are tested
- Retry or timeout behavior is tested
- Persistence edge cases are tested