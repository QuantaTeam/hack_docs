---
title: "Backend: Пакетный менеджер Python - PDM"
categories:
  - Backend
tags:
  - PDM
toc: true
weight: 12
---

## Установка

### Linux/Mac

```bash
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
```

или:

```bash
brew install pdm
```

или:

```bash
pipx install pdm
```

### Windows

```bash
(Invoke-WebRequest -Uri https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py -UseBasicParsing).Content | python -
```

## Использование

Настройка, чтобы не использовать виртуальную среду:

```bash
pdm config python.use_venv false
```

Установка зависемостей из `pyproject.toml`:

```bash
pdm sync
```

Добавление зависимостей:

```bash
pdm add numpy
```

Добавление тестовых зависимостей:

```bash
pdm add -dG test pytest
```

## Интеграция с IDE

### PyCharm

Mark `__pypackages__/3.10/lib` as [Sources Root](https://www.jetbrains.com/help/pycharm/configuring-project-structure.html#mark-dir-project-view). Then, select as [Python interpreter](https://www.jetbrains.com/help/pycharm/configuring-python-interpreter.html#interpreter) a Python installation with the same `3.10` version.

Additionally, if you want to use tools from the environment (e.g. `pytest`), you have to add the `__pypackages__/3.10/bin` directory to the `PATH` variable in the corresponding run/debug configuration.
