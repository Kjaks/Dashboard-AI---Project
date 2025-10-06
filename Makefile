###########################################################
# Basic commands
###########################################################
serve:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f

###########################################################
# Individual services
###########################################################

serve-front:
	docker compose up -d --build frontend

serve-back:
	docker compose up -d --build backend

down-front:
	docker compose stop frontend && docker compose rm -f frontend

down-back:
	docker compose stop backend && docker compose rm -f backend