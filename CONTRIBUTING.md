# Guía de Contribución

¡Gracias por tu interés en contribuir a **dev-setup-mac-es**! Esta guía describe el flujo de trabajo, las convenciones de los scripts y el proceso de Pull Requests.

## Tabla de Contenidos

- [Configuración del Entorno](#configuración-del-entorno)
- [Flujo de Trabajo](#flujo-de-trabajo)
- [Convenciones de los Scripts](#convenciones-de-los-scripts)
- [Commits y Mensajes](#commits-y-mensajes)
- [Pull Requests](#pull-requests)
- [Revisión de Código](#revisión-de-código)
- [Pruebas](#pruebas)

## Configuración del Entorno

No hay dependencias que instalar: basta con un macOS con `bash`/`zsh`. Clona el repositorio y da permisos de ejecución a los scripts:

```bash
git clone https://github.com/brayandiazc/dev-setup-mac-es.git
cd dev-setup-mac-es
chmod +x scripts/*.sh
```

Se recomienda tener [`shellcheck`](https://www.shellcheck.net/) instalado para revisar los scripts localmente:

```bash
brew install shellcheck
shellcheck scripts/*.sh
```

## Flujo de Trabajo

Usamos un flujo **Git Flow** simplificado.

### Estrategia de Branching

| Rama       | Propósito                                        | Origen    | Destino            |
| ---------- | ------------------------------------------------ | --------- | ------------------ |
| `main`     | Código estable y publicado.                      | —         | —                  |
| `feat/*`   | Nuevo script o funcionalidad.                    | `main`    | `main`             |
| `fix/*`    | Corrección de un script.                         | `main`    | `main`             |
| `docs/*`   | Cambios solo de documentación.                   | `main`    | `main`             |
| `chore/*`  | Tareas de mantenimiento, tooling, configuración. | `main`    | `main`             |

### Flujo de una contribución

```bash
# 1. Parte de main actualizado
git checkout main
git pull origin main

# 2. Crea tu rama
git checkout -b feat/nombre-descriptivo

# 3. Trabaja y commitea (ver formato abajo)
git add .
git commit -m "feat: agrega script para instalar X"

# 4. Sube tu rama y abre un PR hacia main
git push origin feat/nombre-descriptivo
```

### Nombrado de ramas

- En minúsculas, con prefijo de tipo y descripción en `kebab-case`:
  `feat/instalar-go`, `fix/ruta-postgres`, `docs/actualizar-readme`.

## Convenciones de los Scripts

Los scripts siguen las [convenciones de shell scripting](docs/conventions/shell-scripts.md) del proyecto. En resumen:

- **Nombre**: `NN-verbo-herramienta.sh` en `kebab-case`, con numeración de dos dígitos que refleja el orden de instalación (p. ej. `09-instalar-java.sh`).
- **Cabecera**: comienza con `#!/bin/bash`, `set -e` y un bloque de comentario con descripción, autor y fecha.
- **Idempotencia**: verifica antes de instalar; no falles si la herramienta ya existe.
- **Mensajes claros**: informa al usuario de cada paso y de las acciones manuales pendientes.
- **Sin secretos**: nunca incluyas credenciales, tokens ni claves. Ver [SECURITY.md](SECURITY.md).
- Ejecuta `shellcheck` sobre tu script antes de abrir el PR.

## Commits y Mensajes

Usamos [Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/):

```
<tipo>(<ámbito opcional>): <descripción breve en imperativo>

<cuerpo opcional>

<footer opcional: BREAKING CHANGE, Closes #123>
```

Tipos comunes: `feat`, `fix`, `docs`, `style`, `refactor`, `chore`.

Ejemplos:

```
feat(scripts): agrega instalador de Go con gvm
fix(postgres): corrige la ruta agregada a /etc/paths.d
docs: actualiza el orden recomendado en el README
```

## Pull Requests

- Usa la [plantilla de PR](.github/PULL_REQUEST_TEMPLATE.md) (se carga automáticamente).
- Un PR por cambio lógico; mantenlos pequeños y enfocados.
- Vincula los issues relacionados (`Closes #123`).
- Actualiza el `README.md`, el `CHANGELOG.md` y la documentación en `docs/` cuando corresponda.

## Revisión de Código

**Como autor:**

- Haz una auto-revisión antes de pedir review.
- Responde a los comentarios y marca las conversaciones resueltas.

**Como revisor:**

- Sé respetuoso y específico; sugiere, no impongas.
- Verifica correctitud, idempotencia, legibilidad y ausencia de secretos.

## Pruebas

Este proyecto no tiene una suite de tests automatizada, pero antes de abrir un PR:

- Ejecuta `shellcheck scripts/*.sh` sin advertencias nuevas.
- Prueba el script en un macOS limpio (o una cuenta de usuario nueva) cuando sea posible.
- Verifica que el script sea idempotente ejecutándolo dos veces seguidas.
