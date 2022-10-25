---
title: "API"
toc: true
weight: 10
---

**VERSION 1.0.0**. HOST: https://hack.barklan.com/api

### /applications/{application_id} <sup>1.0.0</sup>

Returns one application by specified ID.

### /applications/anomalies <sup>1.0.0</sup>

Returns list of anomalies including only ID and coordinates. Can return 404 if no anomalies or if anomalies are not yet geo tagged.
