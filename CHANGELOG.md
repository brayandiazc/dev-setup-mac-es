# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.1.0] - 2026-07-03

### Added

- Workflow de CI con ShellCheck (`.github/workflows/ci.yml`) y su documentación.
- Sistema de labels: `.github/labeler.yml`, `.github/LABELS.md` y
  `.github/scripts/setup-labels.sh`.
- Plantillas de issue de Soporte Técnico y Tarea.
- Convención `docs/conventions/quality-tooling.md` (ShellCheck, shfmt, EditorConfig, CI).
- `docs/product/roadmap.md` con las próximas herramientas a agregar.
- ADR `0003-un-script-por-herramienta.md`.

### Changed

- Normalizado el shebang de todos los scripts a `#!/usr/bin/env bash`.
- Alineada la documentación y la gobernanza con el repo hermano
  [`dev-setup-ubuntu-es`](https://github.com/brayandiazc/dev-setup-ubuntu-es)
  para mantenerlos como espejo.
- ADR `0002` renombrado a `0002-gestores-de-version-para-lenguajes.md`; el ADR de
  apps de escritorio pasó a `0004`.

## [1.0.0] - 2026-07-03

### Added

- Estructura de documentación y gobernanza basada en la plantilla de proyectos:
  `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md`,
  `.editorconfig` y `.gitignore`.
- Carpeta `docs/` con arquitectura, stack, decisiones (ADRs), convenciones y glosario.
- Plantillas de `.github/` (issues, pull request, Dependabot y FUNDING).
- Script `09-instalar-java.sh` (Java LTS con SDKMAN!).
- Script `10-instalar-postgresql.sh` (PostgreSQL con Postgres.app).
- Script `11-instalar-docker.sh` (Docker Desktop, incluye Docker Compose).

### Changed

- Renumeración de los scripts al orden de la saga de entornos de desarrollo:
  node (06), python (07), ruby (08), terraform (12), kubernetes (13).
- README reescrito siguiendo la estructura de la plantilla de proyectos.

## [0.1.0] - 2025

### Added

- Scripts iniciales de configuración de macOS: base (Homebrew), Zsh, Oh My Zsh,
  Git, SSH, Ruby (rbenv), Node.js (nodenv), Python (pyenv), Kubernetes y Terraform.
- README con la guía de uso de los scripts.
- Licencia MIT.

<!--
Enlaces de comparación entre versiones:
[Unreleased]: https://github.com/brayandiazc/dev-setup-mac-es/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/brayandiazc/dev-setup-mac-es/releases/tag/v1.0.0
[0.1.0]: https://github.com/brayandiazc/dev-setup-mac-es/releases/tag/v0.1.0
-->

[Unreleased]: https://github.com/brayandiazc/dev-setup-mac-es/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/brayandiazc/dev-setup-mac-es/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/brayandiazc/dev-setup-mac-es/releases/tag/v1.0.0
