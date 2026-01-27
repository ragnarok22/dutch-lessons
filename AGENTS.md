# Repository Guidelines

## Project Structure & Module Organization
- `main.tex` orchestrates the book and loads every chapter.
- Chapters live in `chapters/NN_tema/main.tex`; move long bits to `sections/*.tex` and `\input{...}` them.
- `vendor/` holds a `File::HomeDir` shim for `latexindent`; `.latexindent-cruft/` stores backups and is git-ignored.
- Sources are UTF-8; Spanish is primary with Dutch examples as needed.

## Build, Test, and Development Commands
- `make help` — list targets.
- `make pdf` — compile `main.tex` to PDF with `latexmk`.
- `make clean` — remove auxiliary files.
- `make format` — run `latexindent` on all sources with `PERL5LIB=vendor`.
- `make lint` — run `chktex` on all `.tex` files.

## Coding Style & Naming Conventions
- Follow `latexindent`; avoid manual alignment or trailing whitespace. Lists usually use `[leftmargin=*]`.
- Chapter folders keep two-digit prefixes; filenames stay lowercase with underscores.
- Write prose in Spanish; italicize Dutch tokens with `\textit{...}`; use `booktabs`; keep lines under ~110 chars.
- Pull supporting snippets via `\input{chapters/NN_tema/sections/...}` instead of inlining long blocks.

## Testing Guidelines
- Run `make format && make lint` before committing.
- Validate the build with `make pdf`; fix missing refs/figures and skim the PDF for accent/hyphenation issues.

## Commit & Pull Request Guidelines
- Use Conventional Commit style from history: `type(scope): summary`, e.g., `docs(saludos): add dialogue examples`.
- Keep commits scoped to one logical change; note affected chapters when relevant.
- PRs include a short description, commands run, linked issues/chapters, and—when layout changes—an updated PDF or screenshot.

## Architecture Overview
- Single LaTeX `book`; `babel` targets Spanish with Dutch secondary, so language switches are rarely needed inside chapters.
- `hyperref` handles links; use consistent label prefixes (`sec:`, `tab:`, `fig:`).

## Environment & Tooling
- Requires TeX Live or MacTeX with `latexmk`, `latexindent`, and `chktex` in `PATH`.
- If `latexindent` warns about `File::HomeDir`, run via `make format` or export `PERL5LIB=vendor`.
- Commit source `.tex` and small figures; keep generated PDFs and large binaries out of Git unless specifically requested.

## Security & Configuration Tips
- Keep `vendor/` intact to avoid Perl module fetches on CI or offline builds.
- Avoid `-shell-escape` unless strictly necessary; current Make targets do not enable it.
- Add packages from standard TeX Live/MacTeX to keep builds reproducible.
