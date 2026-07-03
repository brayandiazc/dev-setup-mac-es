# 0001. Registrar las decisiones de arquitectura

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

A medida que el proyecto evoluciona se toman decisiones (qué método de instalación
usar, qué gestor de versiones adoptar, cómo ordenar los scripts) cuyo contexto y
motivación se pierden con el tiempo. Sin un registro, se repiten debates ya
resueltos y quien llega nuevo no entiende por qué el repo es como es.

## Opciones consideradas

- **No documentar** — confiar en la memoria y el historial de commits.
- **Documentar en una wiki** — fácil de editar pero desligado del código.
- **Architecture Decision Records (ADRs)** — archivos versionados junto al código.

## Decisión

Adoptamos **Architecture Decision Records (ADRs)** ligeros (estilo MADR),
versionados en `docs/decisions/`. Cada decisión relevante se documenta con la
plantilla [`0000-template.md`](0000-template.md) y se numera secuencialmente.

## Consecuencias

**Positivas:**

- El "por qué" de cada decisión queda registrado junto al código.
- Quien contribuye se pone al día más rápido.
- Se evita re-litigar decisiones ya tomadas.

**Negativas / costos:**

- Requiere disciplina para crear el ADR en el momento de decidir.

**Neutras / a vigilar:**

- Mantener el índice del [README](README.md) actualizado.

## Referencias

- [Documenting Architecture Decisions — Michael Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
- [MADR — Markdown Architectural Decision Records](https://adr.github.io/madr/)
