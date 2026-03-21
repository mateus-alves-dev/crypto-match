# Serverless Framework + PostgreSQL Template

Use this template when the backend should be deployed with Serverless Framework and persist data in PostgreSQL through RDS Proxy.

## Default Structure

```text
src/
  handlers/
    create-token-credit.handler.ts
    process-ledger-event.handler.ts
  application/
    use-cases/
    services/
  domain/
    entities/
    ports/
  infra/
    persistence/
    messaging/
    config/
serverless.yml
```

## serverless.yml Skeleton

```yaml
service: backend-service

frameworkVersion: '3'

provider:
  name: aws
  runtime: nodejs20.x
  architecture: arm64
  region: ${opt:region, 'us-east-1'}
  stage: ${opt:stage, 'dev'}
  timeout: 10
  memorySize: 512
  logRetentionInDays: 14
  environment:
    STAGE: ${self:provider.stage}
    DATABASE_HOST: ${ssm:/backend/${self:provider.stage}/database/host}
    DATABASE_PORT: ${ssm:/backend/${self:provider.stage}/database/port}
    DATABASE_NAME: ${ssm:/backend/${self:provider.stage}/database/name}
    DATABASE_USER: ${ssm:/backend/${self:provider.stage}/database/user}
    DATABASE_PASSWORD: ${ssm:/backend/${self:provider.stage}/database/password}
    DATABASE_PROXY_ENDPOINT: ${ssm:/backend/${self:provider.stage}/database/proxy-endpoint}
  iam:
    role:
      statements:
        - Effect: Allow
          Action:
            - sqs:SendMessage
            - sqs:ReceiveMessage
            - sqs:DeleteMessage
          Resource:
            - !GetAtt LedgerQueue.Arn

package:
  individually: true
  patterns:
    - '!**/*.test.ts'
    - '!**/__mocks__/**'

functions:
  createTokenCredit:
    handler: dist/handlers/create-token-credit.handler.handler
    events:
      - httpApi:
          path: /token/credits
          method: post

  processLedgerEvent:
    handler: dist/handlers/process-ledger-event.handler.handler
    timeout: 20
    events:
      - sqs:
          arn: !GetAtt LedgerQueue.Arn
          batchSize: 10
          maximumBatchingWindow: 5
          functionResponseType: ReportBatchItemFailures

resources:
  Resources:
    LedgerQueue:
      Type: AWS::SQS::Queue
      Properties:
        QueueName: ${self:service}-${self:provider.stage}-ledger
        VisibilityTimeout: 60
        RedrivePolicy:
          deadLetterTargetArn: !GetAtt LedgerDlq.Arn
          maxReceiveCount: 5

    LedgerDlq:
      Type: AWS::SQS::Queue
      Properties:
        QueueName: ${self:service}-${self:provider.stage}-ledger-dlq
```

## Implementation Defaults

- Use `package.individually: true` to reduce function bundle size
- Prefer `arm64` unless a dependency blocks it
- Route DB connections through RDS Proxy
- Keep HTTP handlers synchronous only for user-visible outcomes
- Push side effects to SQS when they do not belong on the request critical path
- Use `ReportBatchItemFailures` for SQS consumers to avoid replaying successful records

## PostgreSQL Guidance

- Put idempotency behind unique constraints or dedicated operation tables
- Keep schema changes additive and migration-driven
- Avoid ORM patterns that hide N+1 queries on Lambda hot paths
- Initialize DB clients once per container and reuse them across invocations

## Cost and Performance Checks

- Are all functions packaged individually?
- Are memory and timeout values measured instead of guessed?
- Are batch size and visibility timeout aligned?
- Is RDS Proxy used for connection control?
- Are request handlers free from unnecessary downstream calls?