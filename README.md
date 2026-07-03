# ⚙️ dev-setup-mac-es

Instaladores automatizados para configurar un entorno completo de desarrollo en macOS, con herramientas modernas y gestionadas por versión: `zsh`, `git`, `ssh`, `node`, `python`, `ruby`, `java`, `postgresql`, `docker`, `terraform` y `kubernetes`.

![Shell](https://img.shields.io/badge/shell-bash-121011?logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/platform-macOS-000000?logo=apple&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)

> El orden de los scripts sigue la saga de entornos de desarrollo de [brayandiazc.com](https://brayandiazc.com), donde cada herramienta tiene su artículo paso a paso. Su repo hermano para Linux es [`dev-setup-ubuntu-es`](https://github.com/brayandiazc/dev-setup-ubuntu-es).

## Tabla de Contenidos

- [Descripción](#descripción)
- [Características](#características)
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Scripts Disponibles](#scripts-disponibles)
- [Funcionalidades por Script](#funcionalidades-por-script)
- [Orden Recomendado](#orden-recomendado)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Enlaces Útiles](#enlaces-útiles)
- [Documentación](#documentación)
- [Contribución](#contribución)
- [Versionado](#versionado)
- [Autores](#autores)
- [Licencia](#licencia)
- [Apóyanos](#apóyanos)
- [Agradecimientos](#agradecimientos)

## Descripción

Configurar un Mac nuevo para programar suele implicar decenas de pasos manuales, fáciles de olvidar o hacer en el orden equivocado. Este proyecto reúne ese proceso en **scripts independientes, numerados y comentados**: uno por herramienta, ejecutables por separado o en secuencia.

Cada script es idempotente en la medida de lo posible (verifica antes de instalar), explica lo que hace y deja instrucciones para los pasos que requieren intervención manual. Así puedes montar un entorno completo desde cero o incorporar solo la pieza que te falte.

## Características

- ✅ Un script por herramienta, ejecutable de forma independiente.
- ✅ Numeración que refleja el orden recomendado de instalación.
- ✅ Verificaciones previas para evitar reinstalaciones innecesarias.
- ✅ Gestores por versión para lenguajes (`nodenv`, `pyenv`, `rbenv`, `SDKMAN!`).
- ✅ Compatible con Apple Silicon e Intel.
- ✅ Comentado en español y pensado para seguirse paso a paso.

## Requisitos Previos

- **macOS** (compatible con Apple Silicon e Intel).
- **Conexión a internet.**
- **Terminal con permisos de administrador** (algunos pasos usan `sudo`).
- `tree` (opcional, solo para visualizar la estructura del proyecto).

> No necesitas instalar Homebrew de antemano: el primer script se encarga de ello.

## Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/brayandiazc/dev-setup-mac-es.git
cd dev-setup-mac-es
```

### 2. Dar permisos de ejecución

```bash
chmod +x scripts/*.sh
```

### 3. Ejecutar el script base

Instala Homebrew y las herramientas esenciales del sistema:

```bash
./scripts/01-instalacion-base.sh
```

## Uso

Tras el script base, ejecuta uno a uno los scripts que necesites:

```bash
./scripts/02-instalar-zsh.sh
```

> 💡 Después de instalar Zsh, **cierra la terminal y vuelve a abrirla** antes de continuar, para que el nuevo shell quede activo.

```bash
./scripts/03-configurar-zsh.sh
./scripts/04-instalar-git.sh
./scripts/05-instalar-ssh.sh
./scripts/06-instalar-node.sh
./scripts/07-instalar-python.sh
./scripts/08-instalar-ruby.sh
./scripts/09-instalar-java.sh
./scripts/10-instalar-postgresql.sh
./scripts/11-instalar-docker.sh
./scripts/12-instalar-terraform.sh
./scripts/13-instalar-kubernetes.sh
```

No es obligatorio ejecutarlos todos: cada script funciona por sí solo si ya tienes Homebrew instalado.

## Scripts Disponibles

| Nº  | Script                   | Descripción                                                     | Documentación                              |
| --- | ------------------------ | --------------------------------------------------------------- | ------------------------------------------ |
| 01  | `instalacion-base.sh`    | Instala Homebrew y prepara el entorno base                      | [Homebrew](https://brew.sh/)               |
| 02  | `instalar-zsh.sh`        | Instala `zsh` como shell predeterminada                         | [Zsh](https://zsh.sourceforge.io/)         |
| 03  | `configurar-zsh.sh`      | Instala Oh My Zsh + plugins (tras reiniciar terminal)           | [Oh My Zsh](https://ohmyz.sh/)             |
| 04  | `instalar-git.sh`        | Instala Git y configura usuario, correo y plantilla de commit   | [Git](https://git-scm.com/)                |
| 05  | `instalar-ssh.sh`        | Genera claves SSH para autenticación con GitHub                 | [SSH](https://www.openssh.com/)            |
| 06  | `instalar-node.sh`       | Instala Node.js usando `nodenv` con versión estable por defecto | [nodenv](https://github.com/nodenv/nodenv) |
| 07  | `instalar-python.sh`     | Instala Python con `pyenv` y paquetes esenciales                | [pyenv](https://github.com/pyenv/pyenv)    |
| 08  | `instalar-ruby.sh`       | Instala Ruby usando `rbenv` con versión seleccionable           | [rbenv](https://github.com/rbenv/rbenv)    |
| 09  | `instalar-java.sh`       | Instala Java (LTS) con SDKMAN!                                  | [SDKMAN!](https://sdkman.io/)              |
| 10  | `instalar-postgresql.sh` | Instala PostgreSQL con Postgres.app                             | [Postgres.app](https://postgresapp.com/)   |
| 11  | `instalar-docker.sh`     | Instala Docker Desktop (incluye Docker Compose)                 | [Docker](https://docs.docker.com/)         |
| 12  | `instalar-terraform.sh`  | Instala Terraform desde el repositorio oficial de HashiCorp     | [Terraform](https://www.terraform.io/)     |
| 13  | `instalar-kubernetes.sh` | Instala kubectl y minikube para desarrollo local                | [Kubernetes](https://kubernetes.io/)       |

## Funcionalidades por Script

### 🔧 01-instalacion-base.sh

- Instala Homebrew si no está presente.
- Configura el PATH para Homebrew (Apple Silicon por defecto).
- Verifica e instala las Xcode Command Line Tools.
- Instala herramientas esenciales de desarrollo (git, wget, curl, openssl, readline, libyaml, libffi, xz, zlib, sqlite3, libpq, cmake, tree, pkg-config, llvm, imagemagick, libxml2, libxslt, libvips, ffmpeg, webp, poppler).
- Actualiza Homebrew y sugiere limpieza de paquetes.

### 🐚 02-instalar-zsh.sh

- Verifica si Zsh está instalado e instala con Homebrew si es necesario.
- Cambia el shell por defecto a Zsh si no lo es.
- Instala Oh My Zsh en modo no interactivo.
- Verifica la instalación y muestra la versión.

### ⚙️ 03-configurar-zsh.sh

- Instala plugins adicionales: `zsh-syntax-highlighting` y `zsh-autosuggestions`.
- Configura plugins en `.zshrc` (aws, azure, bundler, colorize, docker, docker-compose, gcloud, gem, git, heroku, history-substring-search, node, nodenv, npm, pip, postgres, pyenv, python, rails, react-native, rbenv, ruby, vscode).
- Añade los `source` de los plugins a `.zshrc`.
- Proporciona instrucciones para aplicar los cambios.

### 📝 04-instalar-git.sh

- Verifica si Git está instalado e instala con Homebrew si es necesario.
- Configura colores en la salida de Git.
- Solicita y configura nombre de usuario y correo electrónico.
- Establece `main` como rama principal por defecto.
- Opcional: descarga y configura una plantilla de mensajes de commit.
- Muestra la configuración final.

### 🔐 05-instalar-ssh.sh

- Verifica si ya existe una clave SSH y permite sobrescribir.
- Genera una nueva clave RSA de 4096 bits con comentario personalizable.
- Inicia el agente SSH y añade la clave privada.
- Copia la clave pública al portapapeles automáticamente.
- Proporciona instrucciones para añadir la clave a GitHub.
- Prueba la conexión SSH con GitHub.

### 🟢 06-instalar-node.sh

- Verifica si Homebrew está instalado.
- Instala `nodenv` y `node-build` usando Homebrew.
- Configura `nodenv` en `.zprofile`.
- Muestra las versiones recientes disponibles de Node.js.
- Permite seleccionar una versión específica y la establece como global.
- Proporciona instrucciones para actualizar `nodenv`.

### 🐍 07-instalar-python.sh

- Verifica si Homebrew está instalado.
- Instala `pyenv` y `pyenv-virtualenv` usando Homebrew.
- Configura `pyenv` en `.zprofile`.
- Muestra las versiones recientes disponibles de Python.
- Permite seleccionar una versión específica y la establece como global.
- Verifica la instalación con `python --version` y `pip --version`.
- Proporciona instrucciones para actualizar `pyenv`.

### 💎 08-instalar-ruby.sh

- Verifica si Homebrew está instalado.
- Instala `rbenv` y `ruby-build` usando Homebrew.
- Configura `rbenv` en `.zprofile`.
- Muestra las versiones disponibles de Ruby.
- Permite seleccionar una versión específica y la establece como global.
- Instala Bundler y actualiza RubyGems.
- Proporciona instrucciones para actualizar `rbenv`.

### ☕ 09-instalar-java.sh

- Verifica dependencias (curl, zip, unzip; llegan con las Command Line Tools).
- Instala SDKMAN! si no existe.
- Instala Java LTS (distribución Temurin por defecto).
- Verifica con `java -version`, `javac -version` y `sdk current java`.
- Indica cómo instalar otras versiones, Maven y Gradle.

### 🐘 10-instalar-postgresql.sh

- Verifica si Homebrew está instalado.
- Instala Postgres.app (cask `postgres-unofficial`).
- Añade `psql` y las herramientas al PATH del sistema (`/etc/paths.d`).
- Abre la app para inicializar el servidor (clic en "Initialize").
- Indica los valores por defecto y cómo verificar la conexión.

### 🐳 11-instalar-docker.sh

- Verifica si Homebrew está instalado.
- Instala Docker Desktop (cask `docker-desktop`, incluye Docker Compose).
- Abre la app para completar el primer arranque.
- Indica cómo verificar con `docker --version` y `hello-world`.

### 🌍 12-instalar-terraform.sh

- Verifica si Homebrew está instalado.
- Añade el tap oficial de HashiCorp.
- Instala Terraform desde el repositorio oficial de HashiCorp.
- Verifica la instalación.
- Proporciona ejemplos de uso básico.

### ☸️ 13-instalar-kubernetes.sh

- Verifica si Homebrew está instalado.
- Instala `kubectl` con Homebrew.
- Instala `minikube` con Homebrew.
- Verifica las instalaciones.
- Proporciona comandos para iniciar el clúster local y habilitar addons.

## Orden Recomendado

Usa los scripts en orden secuencial solo si configuras un sistema desde cero; también puedes ejecutar de forma independiente los que necesites.

1. **Base**: `01-instalacion-base.sh`
2. **Shell**: `02-instalar-zsh.sh` → reiniciar terminal → `03-configurar-zsh.sh`
3. **Control de versiones**: `04-instalar-git.sh` → `05-instalar-ssh.sh`
4. **Lenguajes**: `06-instalar-node.sh` → `07-instalar-python.sh` → `08-instalar-ruby.sh` → `09-instalar-java.sh`
5. **Base de datos**: `10-instalar-postgresql.sh`
6. **Contenedores**: `11-instalar-docker.sh`
7. **Infraestructura**: `12-instalar-terraform.sh`
8. **Orquestación**: `13-instalar-kubernetes.sh`

## Estructura del Proyecto

```bash
.
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── LICENSE
├── .editorconfig
├── .gitignore
├── .github/                 # Plantillas de issues/PR, FUNDING y Dependabot
├── docs/                    # Documentación del proyecto (ver docs/README.md)
└── scripts/
    ├── 01-instalacion-base.sh
    ├── 02-instalar-zsh.sh
    ├── 03-configurar-zsh.sh
    ├── 04-instalar-git.sh
    ├── 05-instalar-ssh.sh
    ├── 06-instalar-node.sh
    ├── 07-instalar-python.sh
    ├── 08-instalar-ruby.sh
    ├── 09-instalar-java.sh
    ├── 10-instalar-postgresql.sh
    ├── 11-instalar-docker.sh
    ├── 12-instalar-terraform.sh
    └── 13-instalar-kubernetes.sh
```

## Enlaces Útiles

### Documentación oficial de las herramientas

- [Homebrew](https://brew.sh/) — Gestor de paquetes para macOS
- [Zsh](https://zsh.sourceforge.io/) — Shell avanzado
- [Oh My Zsh](https://ohmyz.sh/) — Framework para Zsh
- [Git](https://git-scm.com/) — Control de versiones
- [nodenv](https://github.com/nodenv/nodenv) — Gestor de versiones de Node.js
- [pyenv](https://github.com/pyenv/pyenv) — Gestor de versiones de Python
- [rbenv](https://github.com/rbenv/rbenv) — Gestor de versiones de Ruby
- [SDKMAN!](https://sdkman.io/) — Gestor del ecosistema Java
- [Postgres.app](https://postgresapp.com/) — PostgreSQL como app de macOS
- [Docker](https://docs.docker.com/) — Contenedores
- [Terraform](https://www.terraform.io/) — Infraestructura como código
- [Kubernetes](https://kubernetes.io/) — Orquestación de contenedores

### Recursos adicionales

- [GitHub SSH Keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) — Configurar SSH con GitHub
- [Minikube](https://minikube.sigs.k8s.io/) — Kubernetes local

## Documentación

La documentación del proyecto vive en [`docs/`](docs/README.md):

| Documento                                                                | Responde a                                |
| ------------------------------------------------------------------------ | ----------------------------------------- |
| [`docs/architecture/architecture.md`](docs/architecture/architecture.md) | ¿Cómo están organizados los scripts?      |
| [`docs/architecture/stack.md`](docs/architecture/stack.md)               | ¿Qué instala cada uno y con qué método?   |
| [`docs/decisions/`](docs/decisions/README.md)                            | ¿Por qué tomamos cada decisión?           |
| [`docs/conventions/`](docs/conventions/README.md)                        | ¿Cómo escribimos y probamos los scripts?  |
| [`docs/product/roadmap.md`](docs/product/roadmap.md)                     | ¿Qué falta por agregar?                   |
| [`docs/glossary.md`](docs/glossary.md)                                   | ¿Qué significa cada término?              |

## Contribución

Lee la [Guía de Contribución](CONTRIBUTING.md) para conocer el flujo de trabajo (Git Flow), el formato de commits ([Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/)) y las convenciones de los scripts. Por favor respeta también el [Código de Conducta](CODE_OF_CONDUCT.md).

## Versionado

Usamos [Git](https://git-scm.com) para el control de versiones y seguimos [Semantic Versioning](https://semver.org/lang/es/). Consulta las [etiquetas](https://github.com/brayandiazc/dev-setup-mac-es/tags) para ver las versiones disponibles y el [CHANGELOG](CHANGELOG.md).

## Autores

- **Brayan Diaz C** — _Trabajo inicial_ — [@brayandiazc](https://github.com/brayandiazc)

Consulta también la lista de [contribuidores](https://github.com/brayandiazc/dev-setup-mac-es/contributors).

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).

## Apóyanos

Si este proyecto te resulta útil y quieres apoyar su desarrollo:

- [GitHub Sponsors](https://github.com/sponsors/brayandiazc)

## Agradecimientos

Gracias a quienes usan y mejoran este proyecto. Si encuentras valor en él, puedes:

- Compartir el proyecto 📤
- Invitar un café ☕
- Abrir un issue o PR 🙌
- Dejar tu agradecimiento con un comentario 💬

---

⌨️ con ❤️ por [Brayan Diaz C](https://github.com/brayandiazc)
