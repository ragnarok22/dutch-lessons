# Guía y plan de estudios de holandés (A1)
[![Build and Release PDF](../../actions/workflows/build-pdf.yml/badge.svg)](../../actions/workflows/build-pdf.yml)
[![Format and Lint](../../actions/workflows/format-lint.yml/badge.svg)](../../actions/workflows/format-lint.yml)

Este proyecto en LaTeX reúne una guía autodidacta de 20 capítulos más un capítulo 0 sobre cómo aprender idiomas. Todo el contenido está pensado para hispanohablantes que empiezan neerlandés.

## Estructura
- `main.tex`: documento principal; configura paquetes y ordena los capítulos.
- `chapters/00_metodologia/`: carpeta del capítulo 0 (aprendizaje); contiene `main.tex`.
- `chapters/01_pronunciacion/` ... `chapters/20_repaso_a1/`: cada capítulo en su carpeta, con `main.tex` y espacio para sub-secciones (p.ej. `sections/`).

## Compilación
Usa el `Makefile` incluido (requiere `latexmk` instalado):

```bash
make pdf   # compila main.tex a PDF
make clean # elimina archivos auxiliares
make dev   # recompila en vivo con latexmk -pvc
make format # formatea main.tex y capítulos con latexindent
make lint   # lint básico con chktex
make help   # lista rápida de targets
```

Herramientas necesarias: `latexmk`, `latexindent`, `chktex` (suelen venir con TeX Live / MacTeX). Para evitar fallos por el módulo Perl `File::HomeDir`, el target `format` exporta `PERL5LIB` apuntando a `vendor/`, donde se incluye un shim mínimo. Los backups y `indent.log` de `latexindent` se guardan en `.latexindent-cruft/` (ignorado en Git).

## Próximos pasos sugeridos
- Completar cada capítulo con explicaciones, ejemplos y ejercicios.
- Añadir recursos de audio y enlaces en notas al pie o apéndices.
- Incluir ilustraciones o tablas donde sean útiles (alfabeto, horarios, mapas simples).
