# 0002. Gestores de versión por lenguaje

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

Un mismo Mac suele necesitar **varias versiones** de un lenguaje según el proyecto
(una app en Node 18, otra en Node 22). Instalar el lenguaje directamente con
Homebrew deja una sola versión global y hace difícil y frágil cambiar entre ellas.

## Opciones consideradas

- **Homebrew directo** (`brew install node python ruby`) — simple, pero una sola
  versión y actualizaciones que rompen proyectos.
- **Gestores de versión por lenguaje** (`nodenv`, `pyenv`, `rbenv`, `SDKMAN!`) —
  permiten instalar y cambiar entre múltiples versiones, incluso por directorio.
- **Un gestor universal** (`asdf`, `mise`) — unifica todos los lenguajes en una
  sola herramienta.

## Decisión

Usamos **un gestor de versión específico por lenguaje**: `nodenv` para Node,
`pyenv` para Python, `rbenv` para Ruby y `SDKMAN!` para Java. Los gestores se
instalan con Homebrew (salvo SDKMAN!, con su instalador oficial) y se configuran
en `.zprofile`.

Se prefiere sobre un gestor universal porque cada `*env` es el estándar más
documentado de su comunidad y coincide con lo que enseña la saga de artículos.

## Consecuencias

**Positivas:**

- Múltiples versiones por lenguaje, seleccionables por proyecto.
- Herramientas idiomáticas y bien documentadas en cada comunidad.

**Negativas / costos:**

- Cuatro herramientas distintas que aprender y mantener en el PATH.

**Neutras / a vigilar:**

- Si en el futuro el mantenimiento pesa, reevaluar migrar a `mise`/`asdf`.

## Referencias

- [nodenv](https://github.com/nodenv/nodenv), [pyenv](https://github.com/pyenv/pyenv),
  [rbenv](https://github.com/rbenv/rbenv), [SDKMAN!](https://sdkman.io/)
