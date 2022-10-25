---
title: "API"
toc: true
weight: 10
---

**VERSION 1.0.0**

## /api/applications/{application_id}

Returns one application by specified ID.

## /api/applications/anomalies

Returns list of anomalies including only ID and coordinates. Can return 404 if no anomalies or if anomalies are not yet geo tagged.
