update:
	@git pull origin main

start: update
	@docker compose down
	@docker compose up -d

certificate: update
	@docker compose -f docker-compose.ssl.yaml up
