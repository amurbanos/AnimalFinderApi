# README

# Animal Finder API - Urbano

Usando Ruby on Rails


## Instalar dependencias
```bash
bundle install
apt install  imagemagick # para manipulacao de imagens 
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
```bash
curl \
  --request GET  https://api-animalfinder.urbanodata.com.br/api/v1/pets?page=1 \
  --header "Content-Type: application/json" 
{
  "pets":[
    {
      "id":28,
      "name":"Dob",
      "age":2,
      "status":1,
      "city":"Fortaleza",
      "state":"Ceara",
      "information":null,
      "image_url":"/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0b88de7ed69fa1f93bcc2c3195dc0f4d6c52d353/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDRG9NWjNKaGRtbDBlVWtpQ2s1dmNuUm9Cam9HUlZRNkMzSmxjMmw2WlVraURUSXdNSGd5TURCZUJqc0dWRG9KWTNKdmNFa2lFREl3TUhneU1EQXJNQ3N3QmpzR1ZBPT0iLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--80dddf2d395f65144a42939fc42829daffa82da6/images%20(4).jpeg"
    },
  ],
  "total_pages":3
}

```