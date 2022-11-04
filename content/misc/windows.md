---
title: "Релиз Frontend части (Windows)"
toc: true
weight: 100
---

## 1. Установка WSL

Открой PowerShell (через пуск) от имени администратора:

Выполни:

```powershell
wsl --install -d Ubuntu
```

после чего перезагрузи систему.

## 2. Настройка WSL

Открой терминал VS Code в папке проекта. Выполни:

```powershell
.\misc\setup_wsl.ps1
```

После этого:

```powershell
wsl --shutdown
```

## 3. Релиз

Теперь можно релизить проект, выполняя в терминале следующее:

```powershell
.\deploy.ps1
```
