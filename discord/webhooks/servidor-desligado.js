const DISCORD_WEBHOOK_URL = process.env.DISCORD_WEBHOOK_URL;
const GITHUB_USERNAME = process.env.GITHUB_USERNAME;

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
                    "title": "Servidor desligado!",
                    "description": "Agora não é mais possível se conectar ao servidor.",
                    "color": 15548997,
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
