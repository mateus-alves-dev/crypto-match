.PHONY: install build dev debug test test-watch test-cov lint format \
        db db-stop db-reset \
        migrate-dev migrate migrate-deploy \
        prisma-generate prisma-studio prisma-reset deploy-dev deploy-prod

# ─── Setup ──────────────────────────────────────────────────────────────────────
install:
	npm install

# ─── Database (local Docker) ─────────────────────────────────────────────────
db:
	docker compose up -d db

db-stop:
	docker compose stop db

db-reset:
	docker compose down -v

# ─── Development ────────────────────────────────────────────────────────────────
build:
	npm run build

dev:
	npm run start:dev

debug:
	npm run start:debug

# ─── Tests ──────────────────────────────────────────────────────────────────────
test:
	npm run test

test-watch:
	npm run test:watch

test-cov:
	npm run test:cov

# ─── Lint & Format ──────────────────────────────────────────────────────────────
lint:
	npm run lint

format:
	npm run format

# ─── Prisma ─────────────────────────────────────────────────────────────────────
prisma-generate:
	npx prisma generate

# Create a new migration in dev (prompts for name)
migrate-dev:
	npx prisma migrate dev

# Alias: `make migrate` → migrate-dev
migrate: migrate-dev

# Apply pending migrations (CI / production)
migrate-deploy:
	npx prisma migrate deploy

prisma-studio:
	npx prisma studio

# DANGER: resets dev database – never use in production
prisma-reset:
	npx prisma migrate reset

# ─── Deploy ─────────────────────────────────────────────────────────────────────
deploy-dev:
	npm run deploy:dev

deploy-prod:
	npm run deploy:prod
