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
# Servicios individuales
###########################################################

front:
	docker compose up --build frontend

back:
	docker compose up --build backend

front-d:
	docker compose up -d --build frontend

back-d:
	docker compose up -d --build backend