###########################################################
# Frontend commands
###########################################################

serve-front:
	docker compose up -d --build frontend

down-front:
	docker compose stop frontend && docker compose rm -f frontend

logs-front:
	docker compose logs -f frontend

test-front:
	docker compose run --rm frontend npm run test

rebuild-front:
	docker compose build --no-cache frontend
