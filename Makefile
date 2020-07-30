HTMLS:=$(wildcard *.html)

all: index.html $(HTMLS)

index.html: README.md Makefile style.css
	pandoc -s -c style.css README.md -o index.html

%.html: %.Rmd
	render $<
