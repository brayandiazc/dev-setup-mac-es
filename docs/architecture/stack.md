# Stack de herramientas

> Qué instala cada script y con qué método.
> **Última actualización**: 2026-07-03

Este documento inventaría las tecnologías que el proyecto instala. No son
dependencias del repositorio, sino el resultado de ejecutar los scripts.

| #   | Herramienta        | Método de instalación               | Notas                                              |
| --- | ------------------ | ----------------------------------- | -------------------------------------------------- |
| 01  | Base del sistema   | Homebrew + Xcode CLT                 | Instala Homebrew y librerías esenciales.           |
| 02  | Zsh                | Homebrew + Oh My Zsh                 | Fija Zsh como shell por defecto.                   |
| 03  | Zsh (config)       | Plugins (Homebrew)                   | Tras reiniciar la terminal.                        |
| 04  | Git                | Homebrew                            | Configura usuario, correo y rama `main`.           |
| 05  | SSH                | `ssh-keygen`                        | Genera clave RSA 4096 para GitHub.                 |
| 06  | Node.js            | `nodenv` + `node-build`             | Versión seleccionable.                             |
| 07  | Python             | `pyenv` + `pyenv-virtualenv`        | Versión seleccionable + pip.                       |
| 08  | Ruby               | `rbenv` + `ruby-build`              | Versión seleccionable + Bundler.                   |
| 09  | Java               | SDKMAN! (Temurin LTS)               | Maven/Gradle opcionales vía SDKMAN!.               |
| 10  | PostgreSQL         | Postgres.app (cask)                 | Añade `psql` al PATH del sistema.                  |
| 11  | Docker             | Docker Desktop (cask)               | Incluye Docker Compose.                            |
| 12  | Terraform          | Tap oficial de HashiCorp            | Vía Homebrew.                                       |
| 13  | Kubernetes         | `kubectl` + `minikube` (Homebrew)   | Para desarrollo local.                             |

## Requisitos del entorno

- macOS (Apple Silicon o Intel).
- Acceso `sudo` para algunos pasos.
- Conexión a internet.
- Shell `bash` o `zsh`.

## Por qué gestores de versión

Para los lenguajes (Node, Python, Ruby, Java) se prefieren gestores de versión
(`nodenv`, `pyenv`, `rbenv`, SDKMAN!) en vez de una fórmula global de Homebrew:
permiten instalar y alternar versiones por proyecto sin chocar con la versión del
sistema. Ver [ADR 0002](../decisions/0002-gestores-de-version-para-lenguajes.md).
