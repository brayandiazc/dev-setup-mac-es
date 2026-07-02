# ⚙️ dev-setup-mac-es

Instaladores automatizados para configurar un entorno completo de desarrollo en macOS, usando herramientas modernas y gestionadas por versión: `zsh`, `git`, `ssh`, `node`, `python`, `ruby`, `java`, `postgresql`, `docker`, `terraform`, `kubernetes`.

> El orden de los scripts sigue la saga de entornos de desarrollo de [brayandiazc.com](https://brayandiazc.com), donde cada herramienta tiene su artículo paso a paso.

Proyecto modular y ordenado que permite instalar y configurar cada tecnología paso a paso con scripts independientes, seguros y comentados.

## 🖼️ Vista Previa (estructura del proyecto)

```bash
.
├── README.md
└── scripts
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

## ⚙️ Requisitos

- macOS (compatible con Apple Silicon y Intel)
- Conexión a internet
- Terminal con permisos de administrador
- `tree` (opcional, para visualizar estructura)

## 🚀 Instalación paso a paso

```bash
git clone https://github.com/brayandiazc/dev-setup-mac-es.git
cd dev-setup-mac-es
chmod +x scripts/*.sh  # Otorga permisos de ejecución a todos los scripts
```

- Ejecuta el script base (instala Homebrew y herramientas esenciales):

```bash
./scripts/01-instalacion-base.sh
```

- Luego puedes ejecutar, uno por uno, los scripts que necesites:

```bash
./scripts/02-instalar-zsh.sh
```

### 💡 Cierra la terminal, vuelve a abrirla y luego ejecuta

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

## 🔎 Scripts incluidos

| Nº  | Script                   | Descripción                                                     | Documentación                              |
| --- | ------------------------ | --------------------------------------------------------------- | ------------------------------------------ |
| 01  | `instalacion-base.sh`    | Instala Homebrew y prepara el entorno base                      | -                                          |
| 02  | `instalar-zsh.sh`        | Instala `zsh` como shell predeterminada                         | [Zsh](https://zsh.sourceforge.io/)         |
| 03  | `configurar-zsh.sh`      | Instala Oh My Zsh + plugins (tras reiniciar terminal)           | [Oh My Zsh](https://ohmyz.sh/)             |
| 04  | `instalar-git.sh`        | Instala Git y configura usuario, correo, y plantilla de commit  | [Git](https://git-scm.com/)                |
| 05  | `instalar-ssh.sh`        | Genera claves SSH para autenticación con GitHub                 | [SSH](https://www.openssh.com/)            |
| 06  | `instalar-node.sh`       | Instala Node.js usando `nodenv` con versión estable por defecto | [nodenv](https://github.com/nodenv/nodenv) |
| 07  | `instalar-python.sh`     | Instala Python con `pyenv` y paquetes esenciales                | [pyenv](https://github.com/pyenv/pyenv)    |
| 08  | `instalar-ruby.sh`       | Instala Ruby usando `rbenv` con versión seleccionable           | [rbenv](https://github.com/rbenv/rbenv)    |
| 09  | `instalar-java.sh`       | Instala Java (LTS) con SDKMAN!                                  | [SDKMAN!](https://sdkman.io/)              |
| 10  | `instalar-postgresql.sh` | Instala PostgreSQL con Postgres.app                             | [Postgres.app](https://postgresapp.com/)   |
| 11  | `instalar-docker.sh`     | Instala Docker Desktop (incluye Docker Compose)                 | [Docker](https://docs.docker.com/)         |
| 12  | `instalar-terraform.sh`  | Instala Terraform desde repositorio oficial de HashiCorp        | [Terraform](https://www.terraform.io/)     |
| 13  | `instalar-kubernetes.sh` | Instala kubectl y minikube para desarrollo local                | [Kubernetes](https://kubernetes.io/)       |

## 📋 Funcionalidades detalladas por script

### 🔧 **01-instalacion-base.sh**

- Instala Homebrew si no está presente
- Configura el PATH para Homebrew (Apple Silicon por defecto)
- Verifica e instala Xcode Command Line Tools
- Instala herramientas esenciales de desarrollo (git, wget, curl, openssl, readline, libyaml, libffi, xz, zlib, sqlite3, libpq, cmake, tree, pkg-config, llvm, imagemagick, libxml2, libxslt, libvips, ffmpeg, webp, poppler)
- Actualiza Homebrew y sugiere limpieza de paquetes

### 🐚 **02-instalar-zsh.sh**

- Verifica si Zsh está instalado e instala con Homebrew si es necesario
- Cambia el shell por defecto a Zsh si no lo es
- Instala Oh My Zsh en modo no interactivo
- Verifica la instalación y muestra la versión

### ⚙️ **03-configurar-zsh.sh**

- Instala plugins adicionales: `zsh-syntax-highlighting` y `zsh-autosuggestions`
- Configura plugins en `.zshrc` (aws, azure, bundler, colorize, docker, docker-compose, gcloud, gem, git, heroku, history-substring-search, node, nodenv, npm, pip, postgres, pyenv, python, rails, react-native, rbenv, ruby, vscode)
- Añade sources de plugins a `.zshrc`
- Proporciona instrucciones para aplicar cambios

### 📝 **04-instalar-git.sh**

- Verifica si Git está instalado e instala con Homebrew si es necesario
- Configura colores en la salida de Git
- Solicita y configura nombre de usuario y correo electrónico
- Establece 'main' como rama principal por defecto
- Opcional: descarga y configura plantilla de mensajes de commit desde GitHub
- Muestra la configuración final

### 🔐 **05-instalar-ssh.sh**

- Verifica si ya existe una clave SSH y permite sobrescribir
- Genera nueva clave RSA de 4096 bits con comentario personalizable
- Inicia el agente SSH y añade la clave privada
- Copia la clave pública al portapapeles automáticamente
- Proporciona instrucciones para añadir la clave a GitHub
- Prueba la conexión SSH con GitHub

### 🟢 **06-instalar-node.sh**

- Verifica si Homebrew está instalado
- Instala `nodenv` y `node-build` usando Homebrew
- Configura `nodenv` en `.zprofile`
- Muestra versiones recientes disponibles de Node.js
- Permite seleccionar versión específica de Node.js
- Instala la versión seleccionada y la establece como global
- Proporciona instrucciones para actualizar nodenv

### 🐍 **07-instalar-python.sh**

- Verifica si Homebrew está instalado
- Instala `pyenv` y `pyenv-virtualenv` usando Homebrew
- Configura `pyenv` en `.zprofile`
- Muestra versiones recientes disponibles de Python
- Permite seleccionar versión específica de Python
- Instala la versión seleccionada y la establece como global
- Verifica la instalación con `python --version` y `pip --version`
- Proporciona instrucciones para actualizar pyenv

### 💎 **08-instalar-ruby.sh**

- Verifica si Homebrew está instalado
- Instala `rbenv` y `ruby-build` usando Homebrew
- Configura `rbenv` en `.zprofile`
- Muestra versiones disponibles de Ruby
- Permite seleccionar versión específica de Ruby
- Instala la versión seleccionada y la establece como global
- Instala Bundler y actualiza RubyGems
- Proporciona instrucciones para actualizar rbenv

### ☕ **09-instalar-java.sh**

- Verifica dependencias (curl, zip, unzip; llegan con las Command Line Tools)
- Instala SDKMAN! si no existe
- Instala Java LTS (distribución Temurin por defecto)
- Verifica con `java -version`, `javac -version` y `sdk current java`
- Indica cómo instalar otras versiones, Maven y Gradle

### 🐘 **10-instalar-postgresql.sh**

- Verifica si Homebrew está instalado
- Instala Postgres.app (cask `postgres-unofficial`)
- Añade `psql` y las herramientas al PATH del sistema (`/etc/paths.d`)
- Abre la app para inicializar el servidor (clic en "Initialize")
- Indica los valores por defecto y cómo verificar la conexión

### 🐳 **11-instalar-docker.sh**

- Verifica si Homebrew está instalado
- Instala Docker Desktop (cask `docker-desktop`, incluye Docker Compose)
- Abre la app para completar el primer arranque
- Indica cómo verificar con `docker --version` y `hello-world`

### 🌍 **12-instalar-terraform.sh**

- Verifica si Homebrew está instalado
- Añade el tap oficial de HashiCorp
- Instala Terraform desde el repositorio oficial de HashiCorp
- Verifica la instalación
- Proporciona ejemplos de uso básico

### ☸️ **13-instalar-kubernetes.sh**

- Verifica si Homebrew está instalado
- Instala `kubectl` con Homebrew
- Instala `minikube` con Homebrew
- Verifica las instalaciones
- Proporciona comandos para iniciar clúster local y habilitar addons
- Incluye ejemplos de configuración de addons útiles

## 🧪 Recomendación de uso

Usa los scripts en orden secuencial solo si estás configurando un sistema desde cero.
También puedes ejecutar solo los que necesites de forma independiente.

### 🔄 Orden recomendado para instalación completa:

1. **Base**: `01-instalacion-base.sh`
2. **Shell**: `02-instalar-zsh.sh` → Reiniciar terminal → `03-configurar-zsh.sh`
3. **Control de versiones**: `04-instalar-git.sh` → `05-instalar-ssh.sh`
4. **Lenguajes**: `06-instalar-node.sh` → `07-instalar-python.sh` → `08-instalar-ruby.sh` → `09-instalar-java.sh`
5. **Base de datos**: `10-instalar-postgresql.sh`
6. **Contenedores**: `11-instalar-docker.sh`
7. **Infraestructura**: `12-instalar-terraform.sh`
8. **Orquestación**: `13-instalar-kubernetes.sh`

## 🔗 Enlaces útiles

### Documentación oficial de herramientas:

- [Zsh](https://zsh.sourceforge.io/) - Shell avanzado
- [Oh My Zsh](https://ohmyz.sh/) - Framework para Zsh
- [Git](https://git-scm.com/) - Control de versiones
- [rbenv](https://github.com/rbenv/rbenv) - Gestor de versiones de Ruby
- [nodenv](https://github.com/nodenv/nodenv) - Gestor de versiones de Node.js
- [pyenv](https://github.com/pyenv/pyenv) - Gestor de versiones de Python
- [SDKMAN!](https://sdkman.io/) - Gestor del ecosistema Java
- [Postgres.app](https://postgresapp.com/) - PostgreSQL como app de macOS
- [Docker](https://docs.docker.com/) - Contenedores
- [Kubernetes](https://kubernetes.io/) - Orquestación de contenedores
- [Terraform](https://www.terraform.io/) - Infraestructura como código

### Recursos adicionales:

- [GitHub SSH Keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) - Configurar SSH con GitHub
- [Homebrew](https://brew.sh/) - Gestor de paquetes para macOS
- [Minikube](https://minikube.sigs.k8s.io/) - Kubernetes local

## 🖇️ Contribuye

```bash
# Fork → Crea rama → Cambios → Commit → Pull Request
```

Lee [CONTRIBUTING.md](.github/CONTRIBUTING.md) para más detalles.

## 📄 Licencia

MIT — ver [LICENSE](LICENSE.md)

---

⌨️ con ❤️ por [Brayan Diaz C](https://github.com/brayandiazc)
