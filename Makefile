
certificado:
	@docker run --rm -it \
		-v ./data/certbot/conf:/etc/letsencrypt \
		-v ./data/certbot/www:/var/www/certbot \
		certbot/certbot:latest \
		certbot certonly
