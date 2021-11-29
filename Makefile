# generate html from orgfiles

ORGFILES=$(wildcard *.org)
HTMLFILES=$(patsubst %.org,%.html,$(ORGFILES))

.PHONY: default touch all version generate clean

default: touch all
	@echo "$@ ... done"

touch:
	@$(shell find . -type f -name '*.org' -exec touch {} +)
	@echo "$@ ... done"

all: version generate
	@echo "$@ ... done"

version:
	@git rev-parse HEAD > version.txt
	@cp version.txt version.org
	@echo "$@ ... done"

generate: $(HTMLFILES)
	@echo "$@ ... done"

%.html: %.org
	@emacs $< --batch -f org-html-export-to-html --kill
	@echo "$@ ... done"

clean:
	@rm -f *.html version.txt version.org
	@echo "$@ ... done"
