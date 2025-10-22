###########################################################
# Basic commands
###########################################################
serve:
	make serve-ollama && docker compose up -d --build 

down:
	docker compose down --volumes --remove-orphans
	make down-ollama
	
logs:
	docker compose logs -f

###########################################################
# Individual services
###########################################################

serve-front-service:
	docker compose up -d --build frontend

serve-back-service:
	docker compose up -d --build db && docker compose up -d --build backend

down-front-service:
	docker compose stop frontend && docker compose rm -f frontend

down-back-service:
	docker compose stop db && docker compose rm -f db && docker compose stop backend && docker compose rm -f backend

###########################################################
# Ollama + DeepSeek
###########################################################

serve-ollama:
	docker network inspect ai_net >/dev/null 2>&1 || docker network create ai_net
	docker run -d --network ai_net -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

down-ollama:
	docker stop ollama && docker rm ollama

pull-deepseek:
	docker exec -it ollama ollama pull deepseek-r1:7b

# Try deepseek
curl-deepseek:
	curl -X POST http://localhost:11434/v1/chat/completions \
	  -H "Content-Type: application/json" \
	  -d '{"model":"deepseek-r1:7b","messages":[{"role":"user","content":"Hola"}]}'