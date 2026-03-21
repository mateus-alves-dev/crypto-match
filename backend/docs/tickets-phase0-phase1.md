# Tickets: Fase 0 + Fase 1 — CryptoMatch Backend

> Sequência executável. Cada ticket tem dependências explícitas, contratos, regras de negócio e critérios de aceite. Estimativas em horas de trabalho focado.

---

## Como Ler Este Documento

- **Depende de:** tickets que precisam ser concluídos antes.
- **Bloqueia:** tickets que não podem começar enquanto este não fechar.
- **DoD:** Definition of Done — condição mínima para marcar como concluído.
- **Contrato:** shape exato de request/response que o mobile já espera.

---

## Fase 0 — Fundação Técnica

### TICKET-0001 — Init NestJS + Serverless Framework

**Esforço:** 4h  
**Depende de:** nada  
**Bloqueia:** todos os outros tickets

**Objetivo**  
Configurar e iniciar o scaffold do backend gerado neste PR: instalar dependências, compilar o projeto TypeScript, rodar localmente via `start:dev` e garantir que o health check responde.

**Tarefas**
- [ ] `npm install` no diretório `backend/`
- [ ] Validar que `npm run build` conclui sem erros de TypeScript
- [ ] Criar arquivo `backend/.env` a partir de `.env.example` com valores locais
- [ ] Validar que `npm run start:dev` sobe na porta 3000
- [ ] Adicionar rota `GET /health` que retorna `{ status: 'ok', version: string }`
- [ ] Confirmar `npm run test` passa (zero testes por enquanto, apenas configuração)

**DoD**
- [ ] `GET http://localhost:3000/health` → `200 { status: ok }`
- [ ] `npm run build` exitcode 0
- [ ] Nenhum `any` implícito no compilador

---

### TICKET-0002 — Prisma: Schema + Primeira Migration

**Esforço:** 3h  
**Depende de:** TICKET-0001  
**Bloqueia:** TICKET-0004 a TICKET-0006 (qualquer coisa que acesse banco)

**Objetivo**  
Criar a migration inicial a partir do `prisma/schema.prisma`, garantindo que o schema alcança o banco local ou de dev sem erros.

**Tarefas**
- [ ] Provisionar banco local PostgreSQL (Docker ou instância existente)
- [ ] Definir `DATABASE_URL` no `.env` local
- [ ] `npx prisma generate` — gerar o client tipado
- [ ] `npx prisma migrate dev --name init` — aplicar a migration
- [ ] Verificar tabelas via `npx prisma studio` ou psql
- [ ] Confirmar índices críticos gerados: `User.email`, `Swipe.(actorUserId, targetUserId)`, `TokenTransaction.(userId, createdAt)`, `Match.(userAId)`, `Match.(userBId)`

**Convenções de migration**
- Nome no formato `snake_case_descricao`
- Nunca rodar `prisma db push` em produção; sempre via `migrate deploy`

**DoD**
- [ ] Todas as tabelas do schema existem no banco
- [ ] `prisma migrate status` reporta "Database schema is up to date"
- [ ] `npx prisma generate` sem warnings

---

### TICKET-0003 — AWS: VPC, RDS Proxy, SSM Parameters

**Esforço:** 4h  
**Depende de:** TICKET-0001  
**Bloqueia:** TICKET-0007 (primeiro deploy)

**Objetivo**  
Provisionar a infraestrutura mínima na AWS para que a Lambda se conecte ao PostgreSQL via RDS Proxy sem esgotamento de conexões.

**Tarefas**
- [ ] Criar ou selecionar VPC com 2 private subnets e 1 security group para Lambda
- [ ] Criar RDS Aurora PostgreSQL (Serverless v2 OU RDS t3.micro para dev)
- [ ] Criar RDS Proxy apontando para o cluster acima
- [ ] Armazenar no SSM Parameter Store (tipo SecureString):
  - `/crypto-match/dev/database-url` → string de conexão via proxy
  - `/crypto-match/dev/jwt-secret` → secret de pelo menos 64 chars
  - `/crypto-match/dev/lambda-sg-id` → Security Group ID da Lambda
  - `/crypto-match/dev/subnet-1` e `/crypto-match/dev/subnet-2`
  - `/crypto-match/dev/db-proxy-endpoint`
- [ ] Rodar `prisma migrate deploy` contra o RDS de dev (pode usar bastion ou lambda bootstrap)

**Segurança**
- Lambda deve ter policy `rds-db:connect` apenas para o RDS Proxy
- Security Group da Lambda: egress 5432 apenas para o SG do RDS Proxy
- Nenhuma credencial hardcoded no `serverless.yml`

**DoD**
- [ ] Lambda em VPC consegue conectar ao RDS Proxy (teste via invocação manual)
- [ ] Todos os parâmetros SSM existem no estágio `dev`
- [ ] Schema aplicado no banco de dev via `migrate deploy`

---

### TICKET-0004 — Auth JWT + Guards

**Esforço:** 2h  
**Depende de:** TICKET-0001  
**Bloqueia:** TICKET-1001 a TICKET-1010

**Objetivo**  
Validar que a estratégia JWT e o guard funcionam corretamente: tokens gerados pelo auth são aceitos por rotas protegidas, e tokens inválidos/expirados retornam 401.

**Tarefas**
- [ ] Escrever teste unitário para `JwtStrategy.validate()`:
  - payload válido → retorna `{ userId, email }`
  - payload sem `sub` → deve falhar a validação do guard
- [ ] Escrever teste e2e / integration para:
  - `GET /me` sem token → 401
  - `GET /me` com token expirado → 401
  - `GET /me` com token válido → `200` com dados do usuário

**DoD**
- [ ] `JwtStrategy` spec passa
- [ ] Testes de integração de auth passam

---

### TICKET-0005 — Exception Filter + Logger Interceptor

**Esforço:** 2h  
**Depende de:** TICKET-0001  
**Bloqueia:** nada (melhoria transversal)

**Objetivo**  
Garantir que todos os `DomainError` são mapeados para os HTTP status corretos e que cada request gera um log estruturado com `requestId`, `method`, `url`, `statusCode`, `durationMs`.

**Tarefas**
- [ ] Escrever testes unitários para `DomainExceptionFilter`:
  - `ConflictError` → 409
  - `NotFoundError` → 404
  - `UnauthorizedError` → 401
  - `BusinessRuleError` → 422
  - `RateLimitError` → 429
  - `Error` genérico → 500
  - `HttpException` (class-validator ValidationException) → 400 com array de mensagens
- [ ] Confirmar que o logger não logra `password`, `token` ou campos sensíveis

**Contrato de resposta de erro**
```json
{
  "statusCode": 409,
  "message": "Este e-mail já está cadastrado.",
  "timestamp": "2026-03-21T12:00:00.000Z"
}
```

**DoD**
- [ ] Todos os casos de teste passam
- [ ] Logs em JSON estruturado confirmados no stdout local

---

### TICKET-0006 — POST /devices/fcm-token

**Esforço:** 2h  
**Depende de:** TICKET-0002, TICKET-0004  
**Bloqueia:** notificações push em Fase 2 e 3

**Objetivo**  
Persistir o token FCM do device autenticado. Urgência: sem isso o backend não consegue enviar push de `new_match` nem `token_reward`.

**Contrato**
```
POST /devices/fcm-token
Authorization: Bearer <jwt>
Body: { token: string, platform: 'ios' | 'android' }

Response 200:
{
  id: string,
  userId: string,
  token: string,
  platform: 'ios' | 'android',
  lastSeenAt: ISO8601,
  createdAt: ISO8601
}
```

**Regras de negócio**
- Idempotente: mesmo token → atualiza `lastSeenAt` e `userId` (device pode trocar de conta)
- Um usuário pode ter múltiplos devices (iOS + Android)
- Token não pode ser exposto em logs

**Testes**
- [ ] Salvar token novo → 200 com deviceToken
- [ ] Salvar mesmo token → 200, `lastSeenAt` atualizado
- [ ] Sem Authorization → 401
- [ ] `platform` inválido → 400

**DoD**
- [ ] Controller, use case e repository implementados e testados
- [ ] Token não aparece em nenhum log

---

### TICKET-0007 — Primeiro Deploy: Serverless dev

**Esforço:** 2h  
**Depende de:** TICKET-0003, TICKET-0004, TICKET-0005, TICKET-0006  
**Bloqueia:** testes end-to-end com o mobile real

**Tarefas**
- [ ] `npm run deploy:dev` bem sucedido
- [ ] Validar URL da API Gateway no output do deploy
- [ ] Confirmar que `GET <api-url>/health` responde 200
- [ ] Confirmar que `GET <api-url>/me` sem token → 401
- [ ] Registrar a `API_BASE_URL` de dev no `mobile/lib/core/config/app_config.dart` (via `--dart-define`)
- [ ] Criar Lambda environment variables no CloudWatch Logs e confirmar que logs aparecem estruturados

**DoD**
- [ ] URL pública responde com health check
- [ ] Mobile consegue apontar para este backend em dev

---

## Fase 1 — Backbone do Usuário

### TICKET-1001 — POST /auth/register

**Esforço:** 3h  
**Depende de:** TICKET-0007  
**Bloqueia:** TICKET-1003, TICKET-1004

**Objetivo**  
Substituir o `MockAuthRepositoryImpl` do mobile pelo backend real para o fluxo de registro.

**Contrato**
```
POST /auth/register
Body: { name: string, email: string, password: string }

Response 201:
{
  accessToken: string,
  user: { id, email, name, createdAt, avatarUrl? }
}

Errors:
  409 – e-mail já cadastrado
  400 – validação de campo
```

**Regras de negócio**
- Email é case-insensitive (normalizar para lowercase antes de persistir)
- Senha Hash com bcrypt, `BCRYPT_ROUNDS` do env (default 12)
- Gerar `referralCode` único no cadastro
- Criar linha em `Profile` (displayName = name) e `UserSettings` (defaults) na mesma operação lógica (já implementado no `RegisterUserUseCase`)
- Criar linha em `TokenBalance` com saldo 0

**Testes**
- [ ] E-mail novo → 201 com token e user
- [ ] E-mail duplicado → 409
- [ ] Senha < 8 chars → 400
- [ ] Nome vazio → 400
- [ ] Senha não aparece no response nem em logs

**DoD**
- [ ] Testes unitários do use case e integration do controller passam
- [ ] Mobile: trocar `MockAuthRepositoryImpl` por `AuthRepositoryImpl` e confirmar registro

---

### TICKET-1002 — POST /auth/login

**Esforço:** 2h  
**Depende de:** TICKET-1001  
**Bloqueia:** TICKET-1003

**Contrato**
```
POST /auth/login
Body: { email: string, password: string }

Response 200:
{
  accessToken: string,
  user: { id, email, name, createdAt, avatarUrl? }
}

Errors:
  401 – credenciais inválidas (mesma mensagem para e-mail não encontrado e senha errada)
```

**Segurança**
- Comparação bcrypt com hash dummy mesmo quando o usuário não existe (já implementado no `LoginUserUseCase` com `invalidhashfortimingattackprevention`)
- Não diferenciar no response "e-mail não encontrado" vs "senha errada"

**Testes**
- [ ] Credenciais corretas → 200 com token
- [ ] E-mail inexistente → 401 (sem timing attack)
- [ ] Senha incorreta → 401
- [ ] Rate limiting manual (verificar que não há log com senha)

**DoD**
- [ ] Testes passam
- [ ] Mobile: flow de login funciona com backend real

---

### TICKET-1003 — GET /me

**Esforço:** 1h  
**Depende de:** TICKET-1002  
**Bloqueia:** TICKET-1004

**Contrato**
```
GET /me
Authorization: Bearer <jwt>

Response 200:
{
  id: string,
  email: string,
  name: string,
  createdAt: ISO8601,
  avatarUrl?: string
}
```

**Testes**
- [ ] Token válido → 200 com dados do usuário
- [ ] Token inválido → 401
- [ ] Token de usuário deletado → 404

**DoD**
- [ ] Mobile: `AuthCubit` usa token retornado do login para chamar GET /me e confirmar estado `authenticated`

---

### TICKET-1004 — GET /profiles/me

**Esforço:** 2h  
**Depende de:** TICKET-1001  
**Bloqueia:** TICKET-1005

**Contrato**
```
GET /profiles/me
Authorization: Bearer <jwt>

Response 200:
{
  id: string,
  userId: string,
  displayName: string,
  bio?: string,
  avatarUrl?: string,
  cryptoInterests: string[],
  personaTags: string[],
  age?: number,
  location?: string,
  profileVisible: boolean,
  badges: string[],
  updatedAt: ISO8601
}
```

**Testes**
- [ ] Perfil existe → 200
- [ ] Perfil não criado (usuário deletado) → 404
- [ ] Sem token → 401

**DoD**
- [ ] Mobile: trocar `MockProfileRepositoryImpl` por `ProfileRepositoryImpl` e confirmar que `ProfilePage` carrega dados reais

---

### TICKET-1005 — PUT /profiles/me

**Esforço:** 2h  
**Depende de:** TICKET-1004  
**Bloqueia:** onboarding real completo

**Contrato**
```
PUT /profiles/me
Authorization: Bearer <jwt>
Body (todos opcionais):
{
  displayName?: string,
  bio?: string,
  avatarUrl?: string,
  cryptoInterests?: string[],
  personaTags?: string[],
  age?: number,
  location?: string
}

Response 200: Profile (mesmo shape do GET)
Errors:
  400 – validação (age < 18, personaTags > 3, etc.)
```

**Regras de negócio**
- PATCH semântico: apenas os campos presentes no body são atualizados
- `personaTags` máximo 3 (validado no `UpdateProfileDto`)
- `cryptoInterests` máximo 24
- `avatarUrl` deve ser URL válida (já validado no DTO com `@IsUrl()`)

**Testes**
- [ ] Patch parcial → apenas campos enviados são alterados
- [ ] personaTags > 3 → 400
- [ ] avatarUrl inválida → 400
- [ ] Sem token → 401

**DoD**
- [ ] Mobile: `OnboardingPage._finish()` e `ProfileEditPage._save()` persistem no backend real

---

### TICKET-1006 — GET /settings

**Esforço:** 1h  
**Depende de:** TICKET-1001  
**Bloqueia:** TICKET-1007 a TICKET-1009

**Contrato**
```
GET /settings
Authorization: Bearer <jwt>

Response 200:
{
  matchPreferences: {
    maxDistanceKm: number,
    minAge: number,
    maxAge: number,
    filterByCryptoInterests: boolean
  },
  notificationSettings: {
    newMatches: boolean,
    newMessages: boolean,
    tokenRewards: boolean,
    appUpdates: boolean,
    dailyStreak: boolean
  },
  privacySettings: {
    showOnlineStatus: boolean,
    showDistance: boolean
  }
}
```

> **Nota:** O mobile usa a chave `notificationSettings` no JSON. Garantir que o serializer retorna exatamente essa chave (não `notificationPreferences`). Adicionar transformação no `SettingsController.get()` ou criar um DTO de resposta explícito se necessário.

**Testes**
- [ ] Primeira chamada (sem row existente) → retorna defaults
- [ ] Após update → retorna valores atualizados

**DoD**
- [ ] Mobile: `SettingsCubit.loadSettings()` retorna settings reais

---

### TICKET-1007 — PUT /settings/match-preferences

**Esforço:** 1h  
**Depende de:** TICKET-1006  
**Bloqueia:** TICKET-1009 (feed com filtros reais)

**Contrato**
```
PUT /settings/match-preferences
Authorization: Bearer <jwt>
Body: { maxDistanceKm, minAge, maxAge, filterByCryptoInterests }

Response 200: UserSettings (shape completo)
Errors:
  400 – minAge > maxAge, maxDistanceKm fora de [5, 500]
```

**Regras de negócio**
- `minAge` deve ser < `maxAge` (validação cruzada via custom validator ou no use case)

**Testes**
- [ ] minAge > maxAge → 400
- [ ] Valores válidos → 200 com settings atualizados

**DoD**
- [ ] Mobile: slider de distância e faixa etária persiste no backend

---

### TICKET-1008 — PUT /settings/notifications

**Esforço:** 30min  
**Depende de:** TICKET-1006  
**Bloqueia:** notificações direcionadas (Fase 2)

**Contrato**
```
PUT /settings/notifications
Authorization: Bearer <jwt>
Body: { newMatches, newMessages, tokenRewards, appUpdates, dailyStreak }
Response 200: UserSettings
```

**DoD**
- [ ] Toggle de notificação no mobile persiste no backend
- [ ] `NotificationHandler` no app lê settings salvos corretamente

---

### TICKET-1009 — PUT /settings/privacy

**Esforço:** 30min  
**Depende de:** TICKET-1006

**Contrato**
```
PUT /settings/privacy
Authorization: Bearer <jwt>
Body: { showOnlineStatus, showDistance }
Response 200: UserSettings
```

**DoD**
- [ ] Privacy settings persistem; `profileVisible` implícito em `showOnlineStatus` (discutir com PO se deve ser campo separado)

---

### TICKET-1010 — DELETE /user

**Esforço:** 1h  
**Depende de:** TICKET-1001  
**Bloqueia:** nada

**Contrato**
```
DELETE /user
Authorization: Bearer <jwt>

Response 204: empty
Errors:
  404 – usuário não encontrado (token de sessão inválido pós-deleção)
```

**Regras de negócio**
- Cascade via FK do Prisma: Profile, UserSettings, DeviceTokens, TokenBalance, TokenTransactions, Swipes, Matches, Referrals são todos deletados
- Após deletar, todas as chamadas com o mesmo JWT retornam 404 em `GET /me`

**Testes**
- [ ] DELETE com token válido → 204
- [ ] GET /me após delete → 404
- [ ] DELETE sem token → 401

**DoD**
- [ ] Mobile: `SettingsCubit.deleteAccount()` navega para `/login` no 204
- [ ] Dados do usuário removidos do banco

---

## Sequência Visual

```
TICKET-0001 (init)
    │
    ├── TICKET-0002 (schema)──────────────────────────────────┐
    │                                                         │
    ├── TICKET-0003 (AWS infra)                               │
    │                                                         │
    ├── TICKET-0004 (JWT)──────────────────────────────────┐  │
    │                                                      │  │
    └── TICKET-0005 (filter/logger)                        │  │
                                                           │  │
                              TICKET-0006 (FCM token) ←───┘──┘
                                          │
                              TICKET-0007 (1º deploy)
                                          │
        ┌─────────────────────────────────┼─────────────────────┐
        │                                 │                      │
  TICKET-1001 (register)          TICKET-1004 (get profile) TICKET-1006 (get settings)
        │                                 │                      │
  TICKET-1002 (login)             TICKET-1005 (put profile) TICKET-1007 (match prefs)
        │                                                   TICKET-1008 (notif settings)
  TICKET-1003 (get me)                                      TICKET-1009 (privacy)
                                                            TICKET-1010 (delete user)
```

---

## Definition of Done — Padrão Geral

Todos os tickets, além dos critérios específicos, devem atender:

- [ ] Código TypeScript com `strict: true` sem erros de build
- [ ] Nenhum `any` explícito no código de produção
- [ ] Dados sensíveis (password, token FCM, JWT secret) não aparecem em logs
- [ ] Input validado com `class-validator` na borda HTTP
- [ ] Erros de negócio lançados como `DomainError` (nunca `throw new Error()` genérico no domínio)
- [ ] Repositório Prisma não expõe tipos Prisma para fora da camada `infra/persistence`
- [ ] Pelo menos um teste unitário ou de integração por use case
- [ ] PR com diff revisado e aprovado antes de merge
