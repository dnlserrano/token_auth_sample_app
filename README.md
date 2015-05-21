# Why

This repo contains a sample app which uses a simple token authentication
strategy heavily based on a
[gist](https://gist.github.com/josevalim/fb706b1e933ef01e4fb6) by the
[Devise](https://github.com/plataformatec/devise) creator and Rails core
contributor [José Valim](https://github.com/josevalim).

The app serves as an attempt to replace my
[old sample app](https://github.com/dnlserrano/simple_authentication_token_sample_app)
which made use of the
[`simple_token_authentication` gem](https://github.com/gonzalo-bulnes/simple_token_authentication)
which I have come to think is an overkill in the way it must be used for such
a simple and easy task.

The discussion that led me to publish it began
[here](https://github.com/gonzalo-bulnes/simple_token_authentication/issues/94#issuecomment-104404240).

# How
Get your PostgreSQL server up and running:

- `postgres -D /usr/local/var/postgres`

Confirm the specs are green:

- `bundle exec rspec spec`

Boot up your rails server:

- `bundle exec rails s`

Create a user:

```
$:> curl -X POST http://localhost:3000/users -H 'Content-Type: application/json' -d '{ "user": { "username": "danserrano", "password": "dani1234", "email": "dnlserrano@mail.com" } }'

{"id":2,"email":"dnlserrano@mail.com","created_at":"2015-05-21T22:36:10.948Z","updated_at":"2015-05-21T22:36:10.965Z","username":"danserrano","token":null}
```

Login with that user:

```
$:> curl -X POST http://localhost:3000/users/sign_in -H 'Content-Type: application/json' -d '{ "user": { "email": "dnlserrano@mail.com", "password": "dani1234" } }'

{"id":2,"email":"dnlserrano@mail.com","created_at":"2015-05-21T22:36:10.948Z","updated_at":"2015-05-21T22:38:54.745Z","username":"danserrano","token":"a5b4a6d6d346b08b63efe03a3c85d7005d5382579447ae2601d561360c7159df"}
```

PROFIT


# TODO

1. LOL, bué... ("bué"" is slang for "a lot" in Portuguese)
2. Logout is not done! Hack away! :)

# Acknowledgements

For those who were interested in this,

Thank you,

Daniel
