###########################################################
# Backend commands
###########################################################

serve-back:
	docker compose up -d --build backend

down-back:
	docker compose stop backend && docker compose rm -f backend

logs-back:
	docker compose logs -f backend

test-back:
	docker compose run --rm backend npm run test

rebuild-back:
	docker compose build --no-cache backend
