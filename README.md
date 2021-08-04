# README

# Animal Finder API - Urbano

Usando Ruby on Rails

## Instalar dependencias
```bash
bundle install
```

### Preparar banco de dados
```bash
bin/rails db:create
bin/rails db:migrate
```

### Popular o banco de dados com Faker data(gem Faker)
```bash
bin/rails dev:setup
```

* Aplicacao feita em modo Api only
* Autenticacao com JWT
* Paginacao com kamikari
* Upload com Active Storage


## Api public para listar animais desaparecidos
GET https://dominio.com/api/v1/pets

Parametros
page -> (opcional) -> Paginar lista de animais