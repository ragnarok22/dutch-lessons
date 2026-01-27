LATEXMK ?= latexmk

.PHONY: pdf clean

pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode main.tex

clean:
	$(LATEXMK) -C
