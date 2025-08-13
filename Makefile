GID ?= 1000
UID ?= 1000

DOMAIN_NAME ?= localhost
DOMAIN_ADMIN_EMAIL ?= admin@localhost

DOCKER_COMPOSE_FILE = docker-compose.yaml

clean:
	@docker system prune -f

.PHONY: directories
directories:
	@mkdir -p data/minecraft
	@mkdir -p data/rcon
	@mkdir -p data/bluemap
	@mkdir -p data/portainer
	@mkdir -p data/prometheus
	@mkdir -p data/grafana
	@mkdir -p data/letsencrypt
	@mkdir -p data/nginx
	@sudo chown -R $(UID):$(GID) data/

.PHONY: files
files: directories
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