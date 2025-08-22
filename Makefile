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

.PHONY: files
files: directories
	@sudo chown -R $(UID):$(GID) data/
	@sudo chown -R $(UID):$(GID) config/

stop-server:
	@docker compose --profile '*' down

serve: clean files
	@docker compose --profile '*' up -d --force-recreate --remove-orphans
