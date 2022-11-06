---
title: "Backend: База данных"
toc: true
next: true
weight: 11
---

В качестве базы данных используется PostgreSQL 15.

## Управление

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

## Схема
