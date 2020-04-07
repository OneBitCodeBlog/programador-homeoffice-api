# Programador Home Office API
Este é um projeto desenvolvido durante o Week Code pelos alunos do Bootcamp Super Full Stack do OneBitCode.

A ideia central do projeto é ajudar programadores (futuramente outras áreas também) a encontrar trabalhos remotos de forma mais fácil, centralizando as vagas de múltiplas plataformas em um site simples com chatbot e alarmes periódicos de novas vagas.

## Instalação
```
git clone https://github.com/OneBitCodeBlog/programador-homeoffice-api.git

cd programador-homeoffice-api/

docker-compose build

docker-compose run --rm app bundle exec bundle install

docker-compose run --rm app bundle exec rails db:migrate

docker-compose up --build
```
Caso ocorra um erro semelhante a esse:
```bash
app_1_1b3103ab10ef | Errno::ENOENT: No such file or directory @ rb_sysopen - tmp/pids/server.pid
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `initialize'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `open'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `write_pid'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:105:in `write_state'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/single.rb:103:in `run'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:172:in `run'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/cli.rb:80:in `run'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/gems/puma-4.3.3/bin/puma:10:in `<top (required)>'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/bin/puma:23:in `load'
app_1_1b3103ab10ef |   /gems/ruby/2.7.0/bin/puma:23:in `<top (required)>'
```
Basta criar a seguinte pasta dentro do projeto:
```bash
mkdir tmp/pids
```
## API
`GET #index /api/v1/jobs`: retornar todos os Jobs do banco de dados.

`GET #index /api/v1/jobs?page[number]=?&page[size]=?`: este endpoint serve para paginação, podendo escolher a quantidade que a página deve ter de items page[size] e qual a página você quer acessar page[number].

`GET #show /api/v1/jobs/:id`: enviando o id do job que quiserem podem acessar diretamente apenas as informações do job desejado.

`GET #index /api/v1/search_jobs/:tag` - retornar todos os Jobs do banco de dados com a key_word :tag.

`GET #index /api/v1/search_jobs/:tag?page[number]=?&page[size]=?`: este endpoint serve para paginação, podendo escolher a quantidade que a página deve ter de items page[size] e qual a página você quer acessar page[number].

A estrutura do JSON ficou assim:

`#index - /api/v1/jobs?page[number]=1&page[size]=5`
```json
{
    "data": [
        {
            "id": "1",
            "type": "jobs",
            "attributes": {
                "title": "Consequatur repudiandae veritatis autem.",
                "description": "Sed impedit rerum. Rerum consequuntur debitis. Blanditiis eligendi animi.",
                "contract": "not_specified",
                "job-link": "http://oberbrunnerroberts.com/danyelle.wunsch",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-05"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 1,
                            "tag": "sed",
                            "created-at": "2020-04-05T07:38:42.047Z",
                            "updated-at": "2020-04-05T07:38:42.047Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "jobs",
            "attributes": {
                "title": "Temporibus ea laudantium ullam.",
                "description": "Impedit saepe rem. Aut eaque modi. Eius in ea.",
                "contract": "not_specified",
                "job-link": "http://watsica.biz/brock_tillman",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-05"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 2,
                            "tag": "explicabo",
                            "created-at": "2020-04-05T07:38:42.230Z",
                            "updated-at": "2020-04-05T07:38:42.230Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "3",
            "type": "jobs",
            "attributes": {
                "title": "Omnis delectus minus enim.",
                "description": "Natus qui nisi. Quasi sit qui. Consectetur sapiente vel.",
                "contract": "not_specified",
                "job-link": "http://marquardt.co/tameka",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-05"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 3,
                            "tag": "quam",
                            "created-at": "2020-04-05T07:38:42.298Z",
                            "updated-at": "2020-04-05T07:38:42.298Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "4",
            "type": "jobs",
            "attributes": {
                "title": "Atque exercitationem est reiciendis.",
                "description": "Qui id harum. Dolorem quos facilis. Aliquid quaerat aperiam.",
                "contract": "not_specified",
                "job-link": "http://bode.info/magda",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-05"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 4,
                            "tag": "sed",
                            "created-at": "2020-04-05T07:38:42.509Z",
                            "updated-at": "2020-04-05T07:38:42.509Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "5",
            "type": "jobs",
            "attributes": {
                "title": "Possimus sit dolor et.",
                "description": "Ut accusamus enim. Est nesciunt eos. Odit velit modi.",
                "contract": "not_specified",
                "job-link": "http://toy.name/eugene.oreilly",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-05"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 5,
                            "tag": "numquam",
                            "created-at": "2020-04-05T07:38:42.702Z",
                            "updated-at": "2020-04-05T07:38:42.702Z"
                        }
                    ]
                }
            }
        }
    ],
    "links": {
        "self": "http://localhost:3000/api/v1/jobs?page%5Bnumber%5D=1&page%5Bsize%5D=5",
        "first": "http://localhost:3000/api/v1/jobs?page%5Bnumber%5D=1&page%5Bsize%5D=5",
        "prev": null,
        "next": "http://localhost:3000/api/v1/jobs?page%5Bnumber%5D=2&page%5Bsize%5D=5",
        "last": "http://localhost:3000/api/v1/jobs?page%5Bnumber%5D=3&page%5Bsize%5D=5"
    }
}
```
E a `#show /api/v1/jobs/3`
```json
{
    "data": {
        "id": "3",
        "type": "jobs",
        "attributes": {
            "title": "Omnis delectus minus enim.",
            "description": "Natus qui nisi. Quasi sit qui. Consectetur sapiente vel.",
            "contract": "not_specified",
            "job-link": "http://marquardt.co/tameka",
            "salary": null,
            "company-name": null,
            "published-date": "2020-04-05"
        },
        "relationships": {
            "key-words": {
                "data": [
                    {
                        "id": 3,
                        "tag": "quam",
                        "created-at": "2020-04-05T07:38:42.298Z",
                        "updated-at": "2020-04-05T07:38:42.298Z"
                    }
                ]
            }
        }
    }
}
```
`GET #index /api/v1/search_jobs/quidem`
```json
{
    "data": [
        {
            "id": "90",
            "type": "jobs",
            "attributes": {
                "title": "Ab rem quia sit.",
                "description": "In libero quaerat. Labore doloribus rerum. Sit et ea.",
                "contract": "not_specified",
                "job-link": "http://kautzer.co/betty_bauch",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-07"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 78,
                            "tag": "quidem",
                            "created-at": "2020-04-07T01:38:41.129Z",
                            "updated-at": "2020-04-07T01:38:41.129Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "91",
            "type": "jobs",
            "attributes": {
                "title": "Velit magnam ducimus rerum.",
                "description": "Necessitatibus nostrum vel. Ad dolor laboriosam. Et et voluptate.",
                "contract": "not_specified",
                "job-link": "http://west.io/nana",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-07"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 78,
                            "tag": "quidem",
                            "created-at": "2020-04-07T01:38:41.129Z",
                            "updated-at": "2020-04-07T01:38:41.129Z"
                        }
                    ]
                }
            }
        }
    ],
    "links": {
        "self": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=25",
        "first": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=25",
        "prev": null,
        "next": null,
        "last": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=25"
    }
}
```
`#index -/api/v1/search_jobs/quidem?page[number]=1&page[size]=5`
```json
{
    "data": [
        {
            "id": "90",
            "type": "jobs",
            "attributes": {
                "title": "Ab rem quia sit.",
                "description": "In libero quaerat. Labore doloribus rerum. Sit et ea.",
                "contract": "not_specified",
                "job-link": "http://kautzer.co/betty_bauch",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-07"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 78,
                            "tag": "quidem",
                            "created-at": "2020-04-07T01:38:41.129Z",
                            "updated-at": "2020-04-07T01:38:41.129Z"
                        }
                    ]
                }
            }
        },
        {
            "id": "91",
            "type": "jobs",
            "attributes": {
                "title": "Velit magnam ducimus rerum.",
                "description": "Necessitatibus nostrum vel. Ad dolor laboriosam. Et et voluptate.",
                "contract": "not_specified",
                "job-link": "http://west.io/nana",
                "salary": null,
                "company-name": null,
                "published-date": "2020-04-07"
            },
            "relationships": {
                "key-words": {
                    "data": [
                        {
                            "id": 78,
                            "tag": "quidem",
                            "created-at": "2020-04-07T01:38:41.129Z",
                            "updated-at": "2020-04-07T01:38:41.129Z"
                        }
                    ]
                }
            }
        }
    ],
    "links": {
        "self": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=5",
        "first": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=5",
        "prev": null,
        "next": null,
        "last": "http://localhost:3000/api/v1/search_jobs/quidem?page%5Bnumber%5D=1&page%5Bsize%5D=5"
    }
}
```
