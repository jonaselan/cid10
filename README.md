# CID10

API para recuperar dados da tabela CID10

## Ferramentas

* [Ruby](https://www.ruby-lang.org) (2.3.0 used)
* [Rails](http://rubyonrails.org/) (5.1.6 used)
* [Postgresql](https://www.postgresql.org/) (10.3 used)
* [Docker](https://docs.docker.com/install/) and [Docker-compose](https://docs.docker.com/compose/install/) (optional)

## Configurar

```
# baixar imagens
docker-compose build

# iniciar aplicação
docker-compose up web db

# criar banco
docker-compose run web rake db:create

# entrar no container
docker-compose exec web bash

# baixar dependências
bundle

# executar migrações
rails db:migration

# executar seeds
rails db:seed
```

## Routes

**GET**  popular o banco baseado no xml

```
/generate
```
