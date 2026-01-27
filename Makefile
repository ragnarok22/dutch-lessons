LATEXMK ?= latexmk
PERL5LIB := $(CURDIR)/vendor$(if $(PERL5LIB),:$(PERL5LIB))
TEX_SRCS := main.tex $(shell find chapters -name 'main.tex')
CRUFT_DIR := $(CURDIR)/.latexindent-cruft

.PHONY: pdf clean format lint

pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode main.tex

clean:
	$(LATEXMK) -C

format:
	PERL5LIB=$(PERL5LIB) latexindent -w -c=$(CRUFT_DIR) $(TEX_SRCS)

lint:
	chktex -q $(TEX_SRCS)
