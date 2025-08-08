update:
	@git pull origin main

start: update
	@docker compose down
	@docker compose up -d

start-ssl: update
	@docker compose --profile ssl down
	@docker compose --profile ssl up -d

certificate: update
	@docker compose -f docker-compose.certbot.yaml up
