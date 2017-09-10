# Caronaê - Docker setup

**Configuração do Caronaê usando Docker**

Este repositório serve como configuração de todos os serviços necessários para executar o Caronaê, tanto localmente, executando os serviços essenciais, quanto em produção, carregando todos os serviços para o funcionamento do Caronaê.

As imagens Docker do Caronaê se encontram no nosso [Docker Hub](https://hub.docker.com/u/caronae/).


## Instruções

### Ambiente local (desenvolvimento)

* caronae-backend
* caronae-backend-worker
* nginx
* postgres
* redis

```bash
docker-compose up --build
```

O backend está acessível em [http://localhost:8000](http://localhost:8000).


### Ambiente de produção

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
* certificados SSL do Let's Encrypt e link para eles em /var/caronae/certs

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build
```

Todos os serviços ficam disponíveis na porta 443 e os requests são encaminhados para cada um de acordo com o host.
