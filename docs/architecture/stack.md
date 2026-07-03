# Stack Tecnológico

> Fuente de verdad de qué instala cada script y con qué método. Los scripts
> permiten elegir la versión concreta al ejecutarlos, así que aquí se indica el
> método de instalación más que un número fijo.
>
> **Última actualización**: 2026-07-03

## Base del sistema

| Herramienta               | Método            | Script |
| ------------------------- | ----------------- | ------ |
| Homebrew                  | Instalador oficial| `01`   |
| Xcode Command Line Tools  | `xcode-select`    | `01`   |
| Librerías de compilación  | Homebrew          | `01`   |

## Shell

| Herramienta                | Método   | Script |
| -------------------------- | -------- | ------ |
| Zsh                        | Homebrew | `02`   |
| Oh My Zsh                  | Instalador oficial | `02` |
| zsh-syntax-highlighting    | Homebrew | `03`   |
| zsh-autosuggestions        | Homebrew | `03`   |

## Control de versiones

| Herramienta | Método   | Script |
| ----------- | -------- | ------ |
| Git         | Homebrew | `04`   |
| SSH (claves)| `ssh-keygen` (RSA 4096) | `05` |

## Lenguajes

| Lenguaje | Gestor de versión | Método del gestor  | Script |
| -------- | ----------------- | ------------------ | ------ |
| Node.js  | `nodenv`          | Homebrew           | `06`   |
| Python   | `pyenv`           | Homebrew           | `07`   |
| Ruby     | `rbenv`           | Homebrew           | `08`   |
| Java     | `SDKMAN!`         | Instalador oficial | `09`   |

## Base de datos, contenedores e infraestructura

| Herramienta | Método                             | Script |
| ----------- | ---------------------------------- | ------ |
| PostgreSQL  | Postgres.app (cask `postgres-unofficial`) | `10` |
| Docker      | Docker Desktop (cask `docker-desktop`)    | `11` |
| Terraform   | Tap oficial de HashiCorp (Homebrew)       | `12` |
| kubectl     | Homebrew                           | `13`   |
| minikube    | Homebrew                           | `13`   |

## Requisitos mínimos

- macOS (Apple Silicon o Intel).
- Homebrew (lo instala el script `01`).
- Conexión a internet y permisos de administrador.

## Justificación de elecciones

| Elección                       | Alternativa descartada        | Razón                                                          |
| ------------------------------ | ----------------------------- | -------------------------------------------------------------- |
| Gestores por versión (lenguajes)| Instalar el lenguaje con brew | Poder cambiar de versión por proyecto sin reinstalar           |
| Postgres.app                   | `postgresql` de Homebrew      | Arranque/parada con un clic y gestión de múltiples versiones   |
| Docker Desktop                 | `colima` / Docker CLI         | Experiencia estándar con GUI y Compose incluido                |

> Ver los ADRs en [`../decisions/`](../decisions/README.md) para el detalle de estas decisiones.
