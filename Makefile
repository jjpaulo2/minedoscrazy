DOCKER_COMPOSE_FILE = docker-compose.yaml

clean:
	@docker system prune -f

.PHONY: files
files:
	@mkdir -p data/nginx
	@envsubst '$${DOMAIN_NAME}' < templates/nginx/nginx.conf > data/nginx/nginx.conf
	@envsubst '$${DOMAIN_NAME}' < templates/nginx/nginx.ssl.conf > data/nginx/nginx.ssl.conf

stop-server:
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile "*" down

serve: stop-server clean files
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile no-ssl down
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile no-ssl up -d

certificate: serve
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile new-ssl-certificate up

serve-ssl: stop-server clean files
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile ssl down
	@docker compose -f $(DOCKER_COMPOSE_FILE) --profile minecraft --profile ssl up -d