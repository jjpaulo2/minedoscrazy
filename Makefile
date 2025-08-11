DOCKER_COMPOSE_FILE = docker-compose.yaml

clean:
	@docker system prune -f

.PHONY: templates
templates:
	@mkdir -p data/nginx
	@envsubst < templates/nginx/nginx.conf > data/nginx/nginx.conf
	@envsubst < templates/nginx/nginx.ssl.conf > data/nginx/nginx.ssl.conf

down-server:
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile "*" down

certificate: down-server clean
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile new-ssl-certificate up

serve: down-server clean templates
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile no-ssl down
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile no-ssl up -d

serve-ssl: down-server clean templates
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile ssl down
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile ssl up -d