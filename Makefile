update:
	@git pull origin main

start-machine:
	@aws ec2 start-instances --instance-ids $(AWS_INSTANCE_ID)

stop-machine:
	@aws ec2 stop-instances --instance-ids $(AWS_INSTANCE_ID)

containers: update
	@docker compose down --remove-orphans
	@docker compose up -d

containers-ssl: update
	@docker compose --profile ssl down --remove-orphans
	@docker compose --profile ssl up -d

certificate: update
	@docker compose -f docker-compose.certbot.yaml up

notify-discord:
	@curl -X POST $(DISCORD_WEBHOOK_URL) \
		-H "Content-Type: application/json" \
		-d '$(shell cat discord/$(DISCORD_NOTIFICATION).json)'