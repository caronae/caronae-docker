# Caronaê - Docker setup

**Configuração do Caronaê usando Docker**

Este repositório serve como configuração de todos os serviços necessários para executar o Caronaê
usando docker-compose.

As imagens Docker do Caronaê se encontram no nosso [Docker Hub](https://hub.docker.com/u/caronae/).


## Serviços

* caronae-backend
* caronae-backend-worker
* caronae-backend-task-scheduler
* caronae-ufrj-authentication
* nginx
* postgres
* redis

O ambiente de produção possui requisitos adicionais que devem ser configurados:

* Arquivo .env com as variáveis de ambiente

```bash
docker-compose up --build
```


## Variáveis de ambiente sensíveis

Os ambientes possuem algumas variáveis de ambiente sensíveis, como a API key do Firebase Cloud Messaging.
Pra manter essas variáveis protegidas, elas estão em arquivos na pasta secrets criptografados usando
o [AWS Key Management Service](https://aws.amazon.com/kms/).

Se você tem acesso às chaves do KMS e já configurou o seu CLI da AWS, você pode decriptá-las usando
o script kms:

```bash
./scripts/kms decrypt env_prod
./scripts/kms decrypt env_dev
```

Uma vez que os arquivos foram decriptados, você pode modificá-los e encriptá-los novamente usando a
ação `encrypt` ao invés de `decrypt`.
