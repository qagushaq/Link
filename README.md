# Backorator

Template back-end project to provide API for front-end applications on React and mobile applications

## Description

This project gives examples of the most common functionality typically required by
single-page web applications and mobile applications. The mentioned functionality
includes but not limited to:

- Sign Up
- Login Through Login and Password
- Login Through Facebook (with account sync)
- Forgot Password
- Logout
- Profile view/edit

To see the other information about general architecture, common approaches and flows please visit
https://wiki.yandex.ru/homepage/dev-knowledge-base/web-dev/backend/ror/

## Generating documentation

```shell
$ RAILS_ENV=test SWAGGER_DRY_RUN=0 rake rswag
```

## Running environment in Docker

It is possible to run the latest code in Docker container using Docker Compose. Here are the steps:

1. Copy `.env` into `.env.local` and set:
  - `RAILS_MASTER_KEY` (ask backend team)
  - `FIREBASE_SERVER_KEY` (ask backend or frontend team)

2. Setup gems and database (initially).

    ```shell
    $ bin/compose-run .dockerdev/entrypoints/setup.sh
    ```

3. Start the application

    ```shell
    $ docker-compose up
    ```

To generate docs:

```shell
$ bin/compose-docs
```