# Convenciones de Shell Scripting

> Reglas y estándares de los scripts de dev-setup-mac-es.
> **Última actualización**: 2026-07-03

## Alcance

Todos los archivos de `scripts/`. El objetivo es que cualquier script sea
predecible, legible, idempotente y seguro de ejecutar en un Mac.

## Nombrado

- Formato: `NN-verbo-herramienta.sh` en `kebab-case`.
- `NN` es un número de dos dígitos que refleja el **orden de instalación**
  (`01`, `02`, … `13`). Al insertar un script nuevo, renumera los siguientes para
  mantener la secuencia coherente con el README.
- El verbo suele ser `instalar` o `configurar` (p. ej. `09-instalar-java.sh`).

## Estructura de un script

Cada script empieza con la misma cabecera:

```bash
#!/bin/bash
set -e

# Script para instalar y configurar <herramienta> en macOS
# Autor: Brayan Diaz C
# Fecha: <D mmm YYYY>

echo ""
```

- **Shebang**: `#!/bin/bash`.
- **`set -e`**: aborta ante el primer error.
- **Bloque de comentario**: una línea que describe qué hace el script, más autor y fecha.

## Reglas

- **Idempotencia**: verifica antes de instalar (`command -v`, `brew list`, comprobar
  rutas) y no falles si la herramienta ya existe.
- **Homebrew primero**: los scripts (salvo el `01`) asumen que Homebrew ya está
  instalado; verifícalo y avisa si falta.
- **Mensajes claros**: usa `echo` para informar cada paso y para dejar instrucciones
  de las acciones manuales (reiniciar terminal, inicializar una app, pegar la clave
  SSH en GitHub).
- **`sudo` mínimo**: úsalo solo cuando sea imprescindible y díselo al usuario.
- **Fuentes oficiales y HTTPS**: descarga solo de fuentes oficiales y por HTTPS.
- **Sin secretos**: nunca incluyas credenciales, tokens ni claves. Ver
  [secrets.md](secrets.md).
- **Interacción explícita**: cuando pidas datos (versión, correo, nombre), muestra
  las opciones disponibles y un valor por defecto razonable.

## Verificación antes de contribuir

```bash
# Análisis estático
shellcheck scripts/NN-mi-script.sh

# Idempotencia: ejecútalo dos veces; la segunda no debe romper nada
./scripts/NN-mi-script.sh
./scripts/NN-mi-script.sh
```

## Referencias

- [ShellCheck](https://www.shellcheck.net/)
- [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- [ADR 0002 — Gestores de versión por lenguaje](../decisions/0002-gestores-de-version-por-lenguaje.md)
