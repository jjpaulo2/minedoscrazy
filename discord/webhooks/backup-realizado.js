const DISCORD_WEBHOOK_URL = process.env.DISCORD_WEBHOOK_URL;
const S3_BUCKET = process.env.S3_BUCKET;
const AWS_REGION = process.env.AWS_REGION;
const BACKUP_FILENAME = process.env.BACKUP_FILENAME;
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
                    "title": "Backup realizado com sucesso!",
                    "description": "A última versão do mundo foi salva com sucesso. Pode ficar tranquilo!",
                    "color": 5763719,
                    "fields": [
                        {
                            "name": "Arquivo",
                            "value": `[${BACKUP_FILENAME}](https://${S3_BUCKET}.s3.${AWS_REGION}.amazonaws.com/${BACKUP_FILENAME})`
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