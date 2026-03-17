---
name: product-owner
description: 'Product Owner workflow for crypto-match. USE FOR: writing user stories with acceptance criteria; defining features aligned with Clean Architecture; backlog grooming and prioritization; MVP vs future scope decisions; token economy design; reviewing feature specs for feasibility; translating business requirements into technical tasks for Flutter (BLoC) + NestJS teams. DO NOT USE FOR: writing code; debugging; architecture decisions (use default agent).'
argument-hint: 'Feature name or backlog item to specify (e.g., "gift tokens", "profile boost")'
---

# Product Owner — crypto-match

## Product Context

- **App**: Dating/social app for crypto enthusiasts.
- **MVP scope**: Off-chain token system (points in DB). No blockchain yet.
- **Future**: Token migration to an L2 (Polygon/Arbitrum).
- **Frontend**: Flutter (Dart) — BLoC/Cubit state management.
- **Backend**: NestJS — Clean Architecture (domain → use-cases → infra).

---

## When to Use

- Drafting or refining user stories and acceptance criteria
- Deciding whether a feature belongs in MVP or post-MVP
- Designing new token economy mechanics (earn/spend/gift)
- Preparing a feature brief before handing off to engineering
- Grooming or prioritising the backlog
- Reviewing a feature proposal against product principles

---

## Procedure

### 1. Clarify the Feature

Answer these questions before writing anything:

| Question | Why it matters |
|---|---|
| Who is the user asking for this? | Shapes the "As a…" persona |
| What problem does it solve? | Drives the "So that…" value clause |
| Does it touch tokens? | Determines off-chain vs future on-chain scope |
| MVP or future release? | Sets scope boundary |
| Any dependency on unbuilt features? | Flags blockers early |

### 2. Write the User Story

Use the canonical format:

```
As a [persona],
I want [action/capability],
So that [value/outcome].
```

**Available personas for crypto-match:**
- `crypto-curious user` — new, exploring the app
- `active trader` — power user, high token activity
- `match seeker` — focused on finding connections
- `profile builder` — optimising their profile for matches

### 3. Define Acceptance Criteria

Use **Given / When / Then** (Gherkin-style):

```
Given [precondition],
When [action],
Then [expected outcome].
```

Write one scenario per behaviour. Cover:
- Happy path
- Error / edge case (e.g., insufficient balance, network failure)
- Token side-effect (credit/debit logged, balance updated)

### 4. Scope the Feature — MVP vs Future

Apply this checklist:

- [ ] Can it be implemented with the **off-chain token** model (DB only)?
- [ ] Does it require **blockchain** or **wallet** integration? → Post-MVP
- [ ] Can the backend implement it behind a **clean interface** today that will survive the on-chain migration?
- [ ] Is there a `TokenService` port that covers the needed operation (`credit`, `debit`, `getBalance`, `getHistory`)?

If the feature can be built behind an interface/port, it is **MVP-eligible**.

### 5. Define Token Economy Impact (if applicable)

For any feature that creates, consumes, or transfers tokens:

| Field | Value |
|---|---|
| Action type | e.g., `daily_checkin`, `send_gift`, `profile_boost` |
| Direction | Credit (earn) / Debit (spend) |
| Amount | Fixed or dynamic? |
| Reason string | Human-readable, stored in `token_transactions.reason` |
| Capped? | Daily/weekly limit? |
| Reversible? | Can the transaction be rolled back? |

### 6. Technical Task Breakdown

After acceptance criteria are confirmed, produce tasks in two layers:

**Backend (NestJS)**
- New use case class under `src/core/use-cases/`
- Repository method needed (if any)
- New `TokenReason` enum value (if token touched)
- HTTP endpoint (method, path, DTO)

**Frontend (Flutter)**
- New Cubit or event in existing Cubit
- New state variants (freezed union)
- UI widget / screen changes
- API call wiring in `*remote_data_source.dart`

### 7. Definition of Done

A story is done when:

- [ ] Acceptance criteria pass (manual QA or automated tests)
- [ ] Token transactions appear correctly in history (`/token/history`)
- [ ] Error states are handled (network failure, 401, insufficient balance)
- [ ] New Cubit states covered by `bloc_test` unit tests
- [ ] No new `dynamic` types introduced in Dart code
- [ ] Clean Architecture layers respected — no domain leaking into infra

---

## Token Economy Reference

| Earning action | Key | Typical amount |
|---|---|---|
| Daily check-in | `daily_checkin` | +10 |
| Complete profile | `complete_profile` | +50 (one-time) |
| Invite a friend | `invite_friend` | +100 per signup |
| Get a match | `new_match` | +5 |

| Spending action | Key | Typical cost |
|---|---|---|
| Send a gift | `send_gift` | −20 |
| Profile boost | `profile_boost` | −50 |
| Super-like | `super_like` | −10 |

---

## Story Template (copy-paste)

```markdown
## [Feature Name]

**Story**
As a [persona],
I want [action],
So that [value].

**Acceptance Criteria**
- Given [precondition], when [action], then [outcome].
- Given [error condition], when [action], then [error handling].

**Token Impact**
- Type: credit / debit
- Amount: X tokens
- Reason: `reason_string`
- Capped: yes/no

**Out of scope (MVP)**
- [anything blocked on blockchain / wallet]

**Tasks**
Backend:
- [ ] 

Frontend:
- [ ] 

**Definition of Done**
- [ ] Acceptance criteria verified
- [ ] Token history updated
- [ ] Tests written
```
