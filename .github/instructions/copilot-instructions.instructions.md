Você é o GitHub Copilot desta codebase. Siga SEMPRE estas instruções.

## CONTEXTO DO PRODUTO

- App de namoro/social focado em pessoas que curtem cripto.
- MVP: sistema de “tokens” OFF-CHAIN (pontos internos no banco), sem blockchain real ainda.
- Futuro: migração desse token para um token on-chain em uma L2 (ex.: Polygon/Arbitrum).
- Objetivo:
  - Backend em NestJS com Clean Architecture.
  - Frontend em Flutter (Dart), com BLoC/Cubit para gerenciamento de estado.
  - Infra em AWS.

## PRINCÍPIOS GERAIS

1. **Separação de camadas (Clean Architecture)** é prioridade.
2. MVP deve ser simples, porém já **preparado para trocar a implementação de tokens** (ex.: banco de dados → blockchain).
3. Sempre prefira **tipagem forte**: TypeScript no backend (`"strict": true`) e Dart com `sound null safety` no frontend.
4. Escreva código **coeso, testável e desacoplado** (injeção de dependência, interfaces, ports/adapters).
5. Sempre que sugerir código, siga os padrões e estruturas descritos abaixo.

---

## BACKEND (NestJS + Clean Architecture)

### Tecnologias

- NestJS (TypeScript).
- PostgreSQL (via TypeORM ou Prisma – se o projeto já tiver um escolhido, seguir o existente).
- Redis (opcional para cache e rate limiting).
- JWT para autenticação.
- AWS:
  - RDS para Postgres.
  - S3 para upload de imagens de perfil (se necessário).
  - SQS ou SNS apenas se o projeto já estiver usando mensageria (caso contrário, evitar no MVP).

### Estrutura de Pastas (direcional)

Siga esta ideia de organização:

- `src/`
  - `core/` (domínio & aplicação)
    - `domain/`
      - entidades de domínio (ex.: `User`, `Profile`, `TokenBalance`, `Match`, `RewardEvent`)
      - interfaces (ports) de repositórios: `UserRepository`, `TokenLedgerRepository`, etc.
      - serviços de domínio (regras puras, sem Nest/HTTP)
    - `use-cases/`
      - casos de uso (application services):
        - `CreateUserProfileUseCase`
        - `GetMatchesUseCase`
        - `EarnTokensForActionUseCase`
        - `SpendTokensUseCase`
        - `SendGiftUseCase`
  - `infra/`
    - `persistence/` (adapters para Postgres/Redis)
    - `http/` (controllers NestJS, DTOs, pipes)
    - `auth/` (estratégias JWT/Guards)
    - `config/` (env, módulos de configuração)
    - `mappers/` (entre domínio e entidades do ORM)
  - `modules/`
    - módulos Nest organizando casos de uso e controladores, ex.:
      - `user/`
      - `profile/`
      - `token/`
      - `match/`
      - `gift/`

### Token (off-chain agora, on-chain depois)

- **NÃO** implemente blockchain no MVP.
- Trate o “token” como uma **moeda virtual interna**:
  - Tabelas sugestivas:
    - `token_balances` (user_id, balance, updated_at)
    - `token_transactions` (id, user_id, type, amount, metadata, created_at)
- Crie uma **interface de serviço de token** no domínio, por exemplo:
  - `TokenService` (port):
    - `credit(userId: string, amount: number, reason: TokenReason): Promise<void>`
    - `debit(userId: string, amount: number, reason: TokenReason): Promise<void>`
    - `getBalance(userId: string): Promise<number>`
    - `getHistory(userId: string, filters?): Promise<TokenTransaction[]>`

- Crie uma implementação **off-chain**:
  - `OffchainTokenService` em `infra/token/`.
  - Use transações atômicas no banco para crédito/débito.
- No futuro, para on-chain:
  - Poderemos adicionar `OnchainTokenService` implementando a mesma interface, usando SDK da blockchain.
  - Nunca deixe lógica de negócio de token diretamente em controllers ou repositórios.

### Endpoints principais (MVP)

Crie endpoints REST (ou GraphQL se o projeto já usar) para:

- Autenticação/usuário:
  - `POST /auth/register`
  - `POST /auth/login`
  - `GET /me`
- Perfil:
  - `GET /profiles/me`
  - `PUT /profiles/me`
- Matchmaking:
  - `GET /matches/feed` (lista de sugestões)
  - `POST /matches/swipe` (like/dislike)
  - `GET /matches` (lista de matches)
- Chat (somente se já houver design para isso):
  - `GET /conversations`
  - `GET /conversations/:id/messages`
  - `POST /conversations/:id/messages`
- Token:
  - `GET /token/balance`
  - `GET /token/history`
- Ações de recompensa (apenas como exemplos):
  - `POST /token/actions/complete-profile`
  - `POST /token/actions/invite-friend`
  - `POST /token/actions/daily-checkin`

### Estilo e Boas Práticas (backend)

- Use `class-validator` e `class-transformer` para DTOs.
- Valide inputs na camada de controller, regras na camada de caso de uso.
- Toda lógica de negócio fica em `use-cases` e `domain services`, nunca no controller nem em entidades do ORM.
- Escreva testes unitários para casos de uso principais.
- Use `eslint` + `prettier` com configurações consistentes (semis, aspas simples, etc., conforme o `.eslintrc` existente).

---

## FRONTEND (Flutter + Dart + BLoC)

### Tecnologias

- Flutter (Dart) com `sound null safety` (`dart >= 3.0`).
- **flutter_bloc** (BLoC/Cubit) para gerenciamento de estado.
- **dio** para chamadas HTTP à API (com interceptors para JWT).
- **get_it** + **injectable** para injeção de dependências.
- **freezed** + **json_serializable** para modelos imutáveis e serialização.
- **go_router** para navegação declarativa.
- **flutter_secure_storage** para armazenar JWT com segurança.
- **flutter_test** + **bloc_test** + **mocktail** para testes.

### Arquitetura (Clean Architecture no Flutter)

Siga a separação em três camadas:

1. **Domain** – regras de negócio puras, sem dependência de Flutter/Dart:IO:
   - Entities: `User`, `Profile`, `TokenBalance`, `Match`.
   - Repository interfaces (abstracts): `AuthRepository`, `ProfileRepository`, `TokenRepository`, `MatchRepository`.
   - Use cases: `LoginUseCase`, `GetMatchFeedUseCase`, `EarnTokenUseCase`, etc.

2. **Data** – implementações concretas dos repositórios:
   - Remote data sources usando `dio`.
   - Modelos com `freezed` + `json_serializable`.
   - Mapeadores (model → entity).

3. **Presentation** – UI + BLoC/Cubit:
   - Cubits/BLoCs por feature: `AuthCubit`, `ProfileCubit`, `TokenCubit`, `MatchCubit`.
   - Pages e Widgets organizados por feature.

### Estrutura de Pastas (direcional)

```
lib/
  core/
    di/                  # get_it / injectable setup
    network/             # dio client, interceptors, error handling
    router/              # go_router configuration
    theme/               # AppTheme, cores, tipografia
    utils/               # helpers, extensions
    error/               # Failure classes, Either pattern
  features/
    auth/
      domain/            # AuthRepository (abstract), LoginUseCase
      data/              # AuthRepositoryImpl, AuthRemoteDataSource
      presentation/      # AuthCubit, AuthState, LoginPage, widgets
    profile/
      domain/
      data/
      presentation/      # ProfileCubit, ProfilePage
    match/
      domain/
      data/
      presentation/      # MatchCubit, FeedPage, SwipeCard
    token/
      domain/
      data/
      presentation/      # TokenCubit, WalletPage, HistoryPage
    chat/
      domain/
      data/
      presentation/
  main.dart
  app.dart               # MaterialApp + go_router + BlocProviders
```

### BLoC / Gerenciamento de Estado

- Use **Cubit** para estados simples (formulários, toggle, loading).
- Use **BLoC** para fluxos com eventos múltiplos (feed de matches, chat).
- Estados com **freezed**: `initial`, `loading`, `success`, `failure`.
- Exemplo de `TokenState`:
  ```dart
  @freezed
  class TokenState with _$TokenState {
    const factory TokenState.initial() = _Initial;
    const factory TokenState.loading() = _Loading;
    const factory TokenState.loaded({required TokenBalance balance, required List<TokenTransaction> history}) = _Loaded;
    const factory TokenState.failure(String message) = _Failure;
  }
  ```
- **Nunca** coloque lógica de negócio dentro de Widgets. Toda lógica fica no Cubit/BLoC ou use case.

### Tokens no app (experiência do usuário)

- O app deve exibir de forma clara:
  - Saldo de tokens do usuário (dados vindos da API backend via `TokenCubit`).
  - Ações que geram tokens (ex.: completar perfil, daily check-in).
  - Onde gastar tokens (ex.: boost, super-like, presentes).
- O front **não** deve implementar regras de negócio de token (cálculos de ganho, validações).
  Tudo isso deve vir do backend; o client só envia "intenção de ação".

### Estilo e Boas Práticas (Flutter)

- **Null safety**: sempre declare tipos explicitamente, evite `dynamic`.
- **Imutabilidade**: prefira `freezed` para modelos e estados.
- **Widgets**: separe em `Page` (conectada ao BLoC) e `View` (widget puro, testável).
- **Injeção de dependências**: use `get_it` + `injectable`; nunca instancie repositórios direto na UI.
- **Temas**: use `ThemeData` centralizado via `AppTheme`; evite cores e estilos hardcoded.
- **Localização**: prepare para `flutter_localizations` desde o início.
- **Tratamento de erros**: use o padrão `Either<Failure, T>` (dartz ou implementação própria) nos repositórios.
- **Testes**:
  - Unit tests para use cases e cubits (`bloc_test`).
  - Widget tests para componentes críticos.
  - Use `mocktail` para mocks.
- **Lint**: use `flutter_lints` + regras adicionais no `analysis_options.yaml`.
- **Performance**: prefira `const` constructors sempre que possível; evite rebuilds desnecessários com `BlocSelector` e `BlocBuilder` com `buildWhen`.

---

## INFRA (AWS – visão geral)

Quando sugerir infra, considere:

- Banco de dados: AWS RDS (PostgreSQL).
- Storage de mídia (fotos de perfil): AWS S3.
- Backend NestJS:
  - Pode rodar em ECS Fargate, EC2 ou Lambda (serverless) dependendo da arquitetura já definida. Se o projeto ainda não escolheu, não force, apenas comente de forma neutra.
- Frontend:
  - Flutter com build nativo para iOS/Android.
  - Distribuição via App Store e Google Play (CI/CD com GitHub Actions ou Fastlane).
  - Variáveis de ambiente gerenciadas via `--dart-define` ou `flutter_dotenv`.
- Config:
  - Usar variáveis de ambiente (nunca hardcode secrets).
  - Gerenciar secrets via AWS Systems Manager Parameter Store ou Secrets Manager (se já houver essa decisão).

---

## QUALIDADE, TESTES E DOCUMENTAÇÃO

- Sempre que possível:
  - Gerar testes unitários para casos de uso críticos e componentes importantes.
  - Sugerir contratos de tipos entre backend e frontend (ex.: modelos `freezed` no Flutter espelhando os DTOs do NestJS).
  - Gerar testes de Cubit/BLoC com `bloc_test` para fluxos críticos.
- Documentar:
  - Endpoints principais com Swagger (NestJS) se o projeto já estiver usando.
  - Comentários curtos explicando interfaces de domínio e serviços de token.

---

## O QUE EVITAR

- Não sugerir código de blockchain real no MVP (solidity, Web3.js, Ethers.js etc.), salvo se o repositório explicitamente já tiver essa parte.
- Não acoplar lógica de token diretamente em controllers HTTP ou diretamente no cliente.
- Não misturar código de domínio com detalhes de framework (NestJS) – mantenha casos de uso e entidades independentes.
- Não usar bibliotecas aleatórias sem motivo. Prefira Node/Nest/TypeScript no backend e Flutter/Dart/BLoC/go_router/dio/get_it/freezed no frontend, sempre priorizando libs já presentes no projeto.

---

## RESUMO

- Você está ajudando a construir um MVP de app de namoro com economia de tokens interna, usando:
  - Backend: NestJS + Clean Architecture + PostgreSQL.
  - Frontend: Flutter + Dart + BLoC (Clean Architecture).
  - Infra: AWS.
- Foque sempre em:
  - Clean Architecture,
  - separação de responsabilidades,
  - abstração do serviço de tokens para futura migração on-chain,
  - tipagem forte com TypeScript.
