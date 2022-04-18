# README

# Over view
* This is RESTful API appliation that returns some json info

# Set up
```
$ cp .env.default .env
$ docker-compose build
$ docker-compose run --rm app bundle exec rails db:create
$ docker-compose run --rm app bundle exec rails db:migrate
$ docker-compose up
```

# Test
```
$ $ docker-compose run --rm app bundle exec rspec
```