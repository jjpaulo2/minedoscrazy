ANSIBLE_DIR ?= ansible
GITHUB_USERNAME ?= octocat
BACKUP_FILENAME ?= $(shell touch .backup_filename && cat .backup_filename)
DISCORD_NOTIFICATION ?= teste

DISCORD_NOTIFICATION_BODY := $(shell \
	S3_BUCKET=$(S3_BUCKET) \
	AWS_REGION=$(AWS_REGION) \
	BACKUP_FILENAME=$(BACKUP_FILENAME) \
	GITHUB_USERNAME=$(GITHUB_USERNAME) \
	envsubst < discord/$(DISCORD_NOTIFICATION).json.tpl)

update:
	@git pull origin main

start-machine:
	@aws ec2 start-instances --instance-ids $(AWS_INSTANCE_ID)

stop-machine:
	@aws ec2 stop-instances --instance-ids $(AWS_INSTANCE_ID)

stop-containers:
	@docker compose --profile ssl down --remove-orphans

containers: update stop-containers
	@docker compose up -d

containers-ssl: update stop-containers
	@docker compose --profile ssl up -d

certificate: update
	@docker compose -f docker-compose.certbot.yaml up

notify-discord:
	@curl -X POST $(DISCORD_WEBHOOK_URL) \
		-H "Content-Type: application/json" \
		-d '$(DISCORD_NOTIFICATION_BODY)'
