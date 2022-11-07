---
title: "Backend: Применяемые методы оптимизации основного API"
toc: true
next: true
weight: 14
draft: true
---

## Async Python

Основной API полностью написан от асинхронном двжике без блокирующих функций.

## Кэширование

Кэширование есть для всех путей при помощи Redis.

## Оценка пагинации

Для ускорения ответа API на запросы вместо точной пагинации используется оценка с использованием динамического SQL:

```sql
CREATE FUNCTION row_estimator(query TEXT) RETURNS BIGINT
LANGUAGE plpgsql AS
$$DECLARE
   plan jsonb;
BEGIN
   EXECUTE 'EXPLAIN (FORMAT JSON) ' || query INTO plan;

   RETURN (plan->0->'Plan'->>'Plan Rows')::bigint;
END;$$;
```
