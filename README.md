# Mine dos Crazy

[![Ligar Servidor na AWS](https://github.com/jjpaulo2/minedoscrazy/actions/workflows/ligar.yaml/badge.svg)](https://github.com/jjpaulo2/minedoscrazy/actions/workflows/ligar.yaml) [![Desligar Servidor na AWS](https://github.com/jjpaulo2/minedoscrazy/actions/workflows/desligar.yaml/badge.svg)](https://github.com/jjpaulo2/minedoscrazy/actions/workflows/desligar.yaml)

⛏️ Configuração do servidor de Minecraft dos "Eternos Pratas".

### Containers

Executados com Docker Compose para facilitar o setup em qualquer máquina. A definição de todos os containers encontra-se no arquivo [docker-compose.yaml](./docker-compose.yaml).

#### [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server/)

Usado para prover o servidor do jogo em si.

**Referências para configuração:**

- [Variáveis de ambiente](https://docker-minecraft-server.readthedocs.io/en/latest/variables/)
- [Solução de problemas](https://docker-minecraft-server.readthedocs.io/en/latest/misc/troubleshooting/)

### Playbooks

Automações com Ansible usadas para facilitar algumas rotinas no servidor.

| Arquivo | Descrição |
|-|-|
| [ansible/atualizar.yaml](./ansible/atualizar.yaml) | Atualiza o servidor com a última versão deste repositório |
| [ansible/backup.yaml](./ansible/backup.yaml) | Executa um backup dos dados do servidor/mundo |

### Pipelines

Utilizam GitHub Actions para acionar alguma automação.

| Arquivo | Descrição |
|-|-|
| [.github/workflows/ligar.yaml](./.github/workflows/ligar.yaml) | Liga a máquina que hospeda o servidor |
| [.github/workflows/desligar.yaml](./.github/workflows/desligar.yaml) | Desliga a máquina que hospeda o servidor |
