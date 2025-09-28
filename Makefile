# ---------------------------
# Frontend
# ---------------------------
.PHONY: front-up front-build front-down
front-up:
	docker compose -f docker-compose.yml up --build -d

front-down:
	docker compose -f docker-compose.yml down

front-build:
	docker compose -f docker-compose.yml run --rm frontend pnpm run build
