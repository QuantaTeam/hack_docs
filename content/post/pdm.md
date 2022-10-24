---
title: "PDM"
date: "2022-05-27"
categories:
  - Backend
tags:
  - PDM
toc: true
---

## Installation

### Linux/Mac

```bash
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
```

or:

```bash
brew install pdm
```

or:

```bash
pipx install pdm
```

### Windows

```bash
(Invoke-WebRequest -Uri https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py -UseBasicParsing).Content | python -
```

## Basic usage

Configure to not use virtual environment:

```bash
pdm config python.use_venv false
```

To install deps from `pyproject.toml`:

```bash
pdm sync
```

To add a dep:

```bash
pdm add numpy
```

To add test dep:

```bash
pdm add -dG test pytest
```

## Integration with IDE

### PyCharm

Mark `__pypackages__/3.10/lib` as [Sources Root](https://www.jetbrains.com/help/pycharm/configuring-project-structure.html#mark-dir-project-view). Then, select as [Python interpreter](https://www.jetbrains.com/help/pycharm/configuring-python-interpreter.html#interpreter) a Python installation with the same `3.10` version.

Additionally, if you want to use tools from the environment (e.g. `pytest`), you have to add the `__pypackages__/3.10/bin` directory to the `PATH` variable in the corresponding run/debug configuration.

### VSCode/Neovim/etc...

Figure it out yourself, you punk!
