# Caronaê - Docker setup

**Configuração do Caronaê usando Docker**

Este repositório serve como configuração de todos os serviços necessários para executar o Caronaê.

As imagens Docker do Caronaê se encontram no nosso [Docker Hub](https://hub.docker.com/u/caronae/).


## Serviços

* caronae-backend
* caronae-backend-worker
* caronae-backend-task-scheduler
* caronae-ufrj-authentication
* nginx (com HTTPS e caronae-site)
* postgres
* redis

O ambiente de produção possui requisitos adicionais que devem ser configurados:

* .env com as variáveis de ambiente 
* diretório com os arquivos do site estático em /var/caronae/caronae-site
* certificados TLS em /var/caronae/certs

```bash
docker-compose up --build
```

Todos os serviços ficam disponíveis na porta 443 e os requests são encaminhados para cada um de acordo com o host.
