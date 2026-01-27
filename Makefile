LATEXMK ?= latexmk
PERL5LIB := $(CURDIR)/vendor$(if $(PERL5LIB),:$(PERL5LIB))
TEX_SRCS := main.tex $(shell find chapters -name 'main.tex')
CRUFT_DIR := $(CURDIR)/.latexindent-cruft

.PHONY: help pdf clean format lint

help:
	@echo "Targets disponibles:"
	@echo "  make pdf      -> compila main.tex a PDF con latexmk"
	@echo "  make clean    -> limpia auxiliares de latexmk"
	@echo "  make format   -> formatea LaTeX con latexindent (usa vendor/File/HomeDir.pm)"
	@echo "  make lint     -> lint básico con chktex"

pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode main.tex

clean:
	$(LATEXMK) -C

format:
	PERL5LIB=$(PERL5LIB) latexindent -w -c=$(CRUFT_DIR) $(TEX_SRCS)

lint:
	chktex -q -l .chktexrc $(TEX_SRCS)
