start:
	@docker compose down
	@docker compose up -d

certificate:
	@docker compose -f docker-compose.ssl.yaml up -d
