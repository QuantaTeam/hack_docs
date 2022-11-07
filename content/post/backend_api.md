---
title: "Backend: Основной API"
toc: true
next: true
weight: 1
---

Основной API реализован на Python 3.10 на асинхронном фреймворке [FastAPI](https://fastapi.tiangolo.com/). Рабочая папка - `./sarah`.

```txt
.
├── sarah/
│   ├── anomaly/
│   │   ├── api.py
│   │   ├── db.py
│   │   └── filters.py
│   ├── applications/       --> Основной API
│   │   └── api.py3 минуты
│   ├── api.py              --> Роутер FastAPI
│   ├── config.py           --> Конфигурация приложения
│   ├── conftest.py
│   ├── db.py               --> Управление сессиями базы данных
│   └── main.py             --> Корневой файл приложения
└── gunicorn_conf.py
```

Работа с базой данных осуществляется с помощью `SQLAlchemy Core`, использую асинхронный движок `asyncpg`.

Основной путь запросов на backend - функция `get_applications` (`./sarah/applications/api.py`, путь `GET .../api/applications/`).
Путь принимает в качестве query параметров текстовые и временные фильтры [описанные в документации](https://gerdahackdocs.netlify.app/api/#applications) а также параметр текстового поиска.

В качестве рабочего ASGI сервера используется [`Uvicorn`](https://www.uvicorn.org/).
