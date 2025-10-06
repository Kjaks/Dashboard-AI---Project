###########################################################
# Frontend commands
###########################################################

serve-front-service:
	docker compose up -d --build frontend

down-front-service:
	docker compose stop frontend && docker compose rm -f frontend

logs-front-service:
	docker compose logs -f frontend

test-front-service:
	docker compose run --rm frontend npm run test

rebuild-front-service:
	docker compose build --no-cache frontend
