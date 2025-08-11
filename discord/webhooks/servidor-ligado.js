const DISCORD_WEBHOOK_URL = process.env.DISCORD_WEBHOOK_URL;
const GITHUB_USERNAME = process.env.GITHUB_USERNAME;
const DOMAIN_NAME = process.env.DOMAIN_NAME;

fetch({
    method: 'POST',
    url: DISCORD_WEBHOOK_URL,
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        "embeds": [
            {
                "title": "Servidor ligado!",
                "description": `Acesse [${DOMAIN_NAME}/map](https://${DOMAIN_NAME}/map/) para ver o mapa do mundo.`,
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
})
