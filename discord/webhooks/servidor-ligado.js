const DISCORD_WEBHOOK_URL = process.env.DISCORD_WEBHOOK_URL;
const GITHUB_USERNAME = process.env.GITHUB_USERNAME;
const DOMAIN_NAME = process.env.DOMAIN_NAME;

fetch(
    DISCORD_WEBHOOK_URL,
    {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            "embeds": [
                {
                    "title": "Servidor ligado!",
                    "description": `Acesse [map.${DOMAIN_NAME}](https://map.${DOMAIN_NAME}) para ver o mapa do mundo.`,
                    "color": 5763719,
                    "fields": [
                        {
                            "name": "Nome",
                            "value": "Mine dos Crazy"
                        },
                        {
                            "name": "Endereço",
                            "value": DOMAIN_NAME
                        }
                    ],
                    "author": {
                        "name": GITHUB_USERNAME,
                        "url": `https://github.com/${GITHUB_USERNAME}`,
                        "icon_url": `https://github.com/${GITHUB_USERNAME}.png`
                    }
                }
            ]
        })
    }
)
