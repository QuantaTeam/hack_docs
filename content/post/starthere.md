---
title: "Start here"
toc: true
weight: 1
---

## Just

Cross-platfrom alternative to `make`. [Choose any installation method.](https://github.com/casey/just#packages). Use in like so:

```bash
just <command>
```

There is also [PyCharm plugin](https://plugins.jetbrains.com/plugin/18658-just), if you must.

## Database

Run database with:

```bash
just up-db
```

Run migrations with:

```bash
just db-migrate
```

Create a new migration with:

```bash
just db-makemigrations <migration_name>
```

You can view database contents by visiting [local pgweb instance](http://0.0.0.0:5055/) or using [pgcli](https://www.pgcli.com/) by running `just pgcli`.

To start over run:

```bash
docker compose down -v --remove-orphans
```
