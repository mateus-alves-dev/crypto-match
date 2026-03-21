# High Performance and Low Cost Reference

Use this reference when a backend task needs concrete implementation defaults that improve latency and reduce AWS spend.

## Core Heuristic

For each request or message path, ask:

1. Can I remove a network hop?
2. Can I reduce invocation count?
3. Can I shrink payload size?
4. Can I shorten the critical section?
5. Can I preserve correctness with batching or async boundaries?

If the answer is yes, prefer that change before adding more infrastructure.

## Lambda Defaults

- Reuse AWS SDK clients, DB pools, and config objects across invocations
- Start with moderate memory and measure duration before increasing it further
- Keep packages small to reduce cold start and deployment friction
- Avoid unnecessary middleware on hot paths
- Fail fast on validation before touching databases or downstream APIs

## API Paths

Prefer:
- One Lambda per API capability with a clear handler-to-service boundary
- Thin request mapping and response mapping
- Fast auth checks and explicit timeout budgets

Avoid:
- Chaining multiple synchronous Lambdas for one user request
- Logging entire request or response bodies by default
- Returning large nested payloads when the client needs summaries only

## Queue and Event Consumers

Prefer:
- Batch sizes large enough to reduce invocation cost but small enough to isolate failures
- Partial batch failure responses where supported
- Idempotency keys derived from business operations, not transport IDs alone
- FIFO only when ordering is a real requirement

Avoid:
- Batch size `1` by default
- Strict ordering on workloads that do not need it
- Publishing multiple overlapping events for the same outcome

## PostgreSQL from Lambda

Prefer:
- RDS Proxy
- Upserts and unique constraints for duplicate suppression
- Short transactions and predictable query counts
- Indexes aligned to real access paths

Avoid:
- Opening fresh DB connections inside each invocation path without reuse
- Transactions spanning remote service calls
- N+1 query patterns hidden behind repository abstractions

## DynamoDB

Prefer:
- Access-pattern-driven keys
- Conditional writes for state transitions and idempotency
- Sparse secondary indexes only when justified by reads

Avoid:
- Scans on critical paths
- Large generic items that force extra read capacity usage
- Over-indexing before access patterns are stable

## Observability Without Waste

Prefer:
- Structured logs with compact, queryable fields
- Metrics on outcomes and latency, not verbose event dumps
- Sampling for traces on high-throughput paths

Avoid:
- Debug-level logs in steady-state production traffic
- Per-record logs inside large batches unless in failure mode
- Multiple metrics that measure the same thing

## Quick Review Questions

- Is this path paying for unnecessary invocations?
- Is data fetched more than once?
- Are batch settings aligned with the workload?
- Does logging cost scale linearly with throughput?
- Does this design keep the latency-sensitive path minimal?