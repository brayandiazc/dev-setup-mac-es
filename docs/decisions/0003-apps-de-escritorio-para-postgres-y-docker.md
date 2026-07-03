# 0003. Apps de escritorio para PostgreSQL y Docker

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

PostgreSQL y Docker pueden instalarse de varias formas en macOS. Para un entorno
de desarrollo local buscamos la opción más sencilla de arrancar, detener y
mantener, que además coincida con lo que muestra la saga de artículos.

## Opciones consideradas

- **PostgreSQL**
  - `brew install postgresql` — servicio gestionado por `brew services`.
  - **Postgres.app** — app de macOS con arranque/parada por GUI y varias versiones.
- **Docker**
  - Docker CLI + `colima` — ligero, sin GUI.
  - **Docker Desktop** — GUI oficial, incluye Compose y gestión de recursos.

## Decisión

Instalamos **Postgres.app** (cask `postgres-unofficial`) para PostgreSQL y
**Docker Desktop** (cask `docker-desktop`) para Docker, ambos vía Homebrew Cask.

Se prefieren las apps de escritorio porque simplifican el ciclo arrancar/detener,
gestionan versiones y recursos desde una GUI, y son el método que documenta la
saga paso a paso. Postgres.app además añade `psql` al PATH del sistema vía
`/etc/paths.d`.

## Consecuencias

**Positivas:**

- Arranque/parada e inicialización con un clic; menos fricción para principiantes.
- Docker Desktop trae Compose y gestión de recursos incluidos.

**Negativas / costos:**

- Requieren un paso manual de primer arranque (inicializar / aceptar permisos).
- Docker Desktop es más pesado que una solución CLI como `colima`.

**Neutras / a vigilar:**

- Revisar los términos de licencia de Docker Desktop para uso en organizaciones grandes.

## Referencias

- [Postgres.app](https://postgresapp.com/) · [Docker Desktop](https://docs.docker.com/desktop/)
