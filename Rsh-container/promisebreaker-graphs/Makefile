MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECTDIR := $(dir $(MAKEFILE_PATH))

ANALYSIS := corpus
DATADIR := $(PROJECTDIR)data
GRAPHDIR := $(PROJECTDIR)graphs
MACRODIR := $(PROJECTDIR)macros

# Tools
LATEXMK = latexmk
RM = rm -f
R = R

# Targets
all:
	pdflatex main && bibtex main

open: main.pdf
	open main.pdf

main.pdf: all

clean:
	rm *~ *.log *.aux *.bbl *.out *.blg

analysis:
	$(R) --slave -e "rmarkdown::render('$(ANALYSIS).Rmd', 'html_document', params = list(datadir = '$(DATADIR)', graphdir = '$(GRAPHDIR)', macrodir = '$(MACRODIR)'))"


performance:
	make analysis ANALYSIS=performance
	sed -i 's/Ř/\\v\{R\}/g' graphs/rshPromNorm.tex

watch: pdf
	evince main.pdf&
	while true; do inotifywait main.tex $(GRAPHDIR); make; done

.PHONY: all open clean pdf watch analysis corpus unevaluated side-effects reflection

# Include auto-generated dependencies
-include *.d
