{
  "embeds": [
    {
      "title": "Backup realizado com sucesso!",
      "description": "A última versão do mundo foi salva com sucesso. Pode ficar tranquilo!",
      "color": 5763719,
      "fields": [
        {
          "name": "Arquivo",
          "value": "[${BACKUP_FILENAME}](https://${S3_BUCKET}.s3.${AWS_REGION}.amazonaws.com/${BACKUP_FILENAME})"
        }
      ],
      "author": {
        "name": "${GITHUB_USERNAME}",
        "url": "https://github.com/${GITHUB_USERNAME}",
        "icon_url": "https://github.com/${GITHUB_USERNAME}.png"
      }
    }
  ]
}
