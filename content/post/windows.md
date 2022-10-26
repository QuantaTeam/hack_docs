---
title: "Windows Instructions"
toc: true
weight: 10
---

## 1. Установка WSL

Открой PowerShell (через пуск) от имени администратора:

Выполни:

```bash
wsl --install -d Ubuntu
```

после чего перезагрузи систему.

## 2. Настройка WSL

Открой терминал VS Code в папке проекта. Выполни:

```bash
.\misc\setup_wsl.ps1
```

После этого:

```bash
wsl --shutdown
```

## 3. Релиз

Теперь можно релизить проект, выполняя в терминале следующее:

```bash
.\deploy.ps1
```
