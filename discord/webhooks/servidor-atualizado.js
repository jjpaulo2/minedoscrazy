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
                    "title": "Servidor atualizado!",
                    "description": "O servidor acabou de ser atualizado com as últimas configurações do repositório.",
                    "color": 16705372,
                    "fields": [
                        {
                            "name": "Repositório",
                            "value": "[jjpaulo2/minedoscrazy](https://github.com/jjpaulo2/minedoscrazy)"
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
