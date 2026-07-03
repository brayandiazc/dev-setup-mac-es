# 0002. Usar gestores de versión para instalar lenguajes

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

Los lenguajes (Node.js, Python, Ruby, Java) pueden instalarse directamente con
Homebrew, pero esa fórmula fija una única versión a nivel de sistema y actualizarla
puede romper proyectos existentes. El desarrollo real necesita alternar versiones
por proyecto sin reinstalar.

## Opciones consideradas

- **Homebrew directo** (`brew install node python ruby`) — simple, pero una sola
  versión global y actualizaciones que rompen proyectos.
- **Gestores de versión por lenguaje** — `nodenv`, `pyenv`, `rbenv`, SDKMAN!:
  múltiples versiones por usuario, seleccionables por proyecto.
- **Un gestor universal** (`asdf`, `mise`) — unifica todos los lenguajes en una herramienta.

## Decisión

Instalamos los lenguajes mediante **gestores de versión**: `nodenv` (Node.js),
`pyenv` (Python), `rbenv` (Ruby) y **SDKMAN!** (Java). Los `*env` se instalan con
Homebrew y se configuran en `.zprofile`; SDKMAN! usa su instalador oficial.

Se prefiere sobre un gestor universal porque cada `*env` es el estándar más
documentado de su comunidad y coincide con lo que enseña la saga de artículos.

## Consecuencias

**Positivas:**

- Se pueden instalar y alternar varias versiones por proyecto.
- Herramientas idiomáticas y bien documentadas en cada comunidad.

**Negativas / costos:**

- Requiere reiniciar la terminal o recargar el entorno tras instalar.
- Cuatro herramientas distintas que mantener en el PATH.

**Neutras / a vigilar:**

- Mantener al día las URLs/instaladores oficiales de cada gestor.
- Si el mantenimiento pesa, reevaluar migrar a `mise`/`asdf`.

## Referencias

- [`../architecture/stack.md`](../architecture/stack.md)
- [nodenv](https://github.com/nodenv/nodenv), [pyenv](https://github.com/pyenv/pyenv),
  [rbenv](https://github.com/rbenv/rbenv), [SDKMAN!](https://sdkman.io/)
