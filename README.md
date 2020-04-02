# Search for opportunities job for technology professionals
This project is a search engine for job opportunities for technology professionals.

# Stack
* stack
    * docker
    * API: Ruby On Rails
    * web client: React ou VueJs
    * Chatbot: DialogFlow

*Search for opportunities job*

> You can try here: *insert app url( [insert app url] )*.

# Docker Container

This project was done using docker container, the container name is Nameprogramadorhomeofficeapi_app

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

## Installation

clone:
```
$ git clone git@github.com:OneBitCodeBlog/programador-homeoffice-api.git
$ cd programador-homeoffice-api
```

gems install:
```
$ docker-compose run --rm app bundle install && update
```
RSpec install:
```
docker-compose run --rm app bundle exec rails generate rspec:install
```
generate database:
```
$ docker-compose run --rm app bundle exec rails db:create db:migrate

```
run the app:
```
$ docker-compose up --build
```
Access:
* [opportunities job here](http://0.0.0.0:3000/)

## PS. if an error like this happens
 * Listening on tcp://0.0.0.0:3000
app_1       | bundler: failed to load command: puma (/gems/ruby/2.7.0/bin/puma)
app_1       | Errno::ENOENT: No such file or directory @ rb_sysopen - tmp/pids/server.pid
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `initialize'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `open'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:216:in `write_pid'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:105:in `write_state'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/single.rb:103:in `run'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/launcher.rb:172:in `run'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/lib/puma/cli.rb:80:in `run'
app_1       |   /gems/ruby/2.7.0/gems/puma-4.3.3/bin/puma:10:in `<top (required)>'
app_1       |   /gems/ruby/2.7.0/bin/puma:23:in `load'
app_1       |   /gems/ruby/2.7.0/bin/puma:23:in `<top (required)>'
programadorhomeofficeapi_app_1 exited with code 1

### you can try this solution:
in a shell prompt you must create tmp/pips folder in your machine with:
```
$ mkdir -p tmp/pids/
```
now run again:
```
$ docker-compose up --build
```
and now, must be working!

## License

This project is licensed under the MIT License