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
	@mkdir -p data/bluemap
	@mkdir -p data/portainer
	@mkdir -p data/loki
	@mkdir -p data/prometheus
	@mkdir -p data/grafana

.PHONY: downloads
downloads:
	@curl -L -o data/minecraft/mods/easyauth-mc1.21.9-3.4.0-SNAPSHOT.jar https://github.com/NikitaCartes/EasyAuth/releases/download/3.4.0-SNAPSHOT.1/easyauth-mc1.21.9-3.4.0-SNAPSHOT.jar

.PHONY: files
files: clean directories downloads
	@sudo chown -R $(UID):$(GID) data/
	@sudo chown -R $(UID):$(GID) config/

stop-server:
	@docker compose --profile '*' down

serve:
	@docker compose --profile '*' up -d --force-recreate --remove-orphans

serve-only-minecraft:
	@docker compose --profile minecraft up --force-recreate --remove-orphans