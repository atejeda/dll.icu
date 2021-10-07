# generate html from orgfiles

ORGFILES=$(wildcard *.org)
HTMLFILES=$(patsubst %.org,%.html,$(ORGFILES))

.PHONY: all generate clean

all: generate
	@echo "$@ ... done"

generate: $(HTMLFILES)
	@echo "$@ ... done"

%.html: %.org
	@emacs $< --batch -f org-html-export-to-html --kill
	@echo "$@ ... done"

clean:
	@rm -f *.html
	@echo "$@ ... done"
