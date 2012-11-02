# make VERBOSE=1 if you wanna see the command lines
ifeq ($(VERBOSE),)
   export Q := @
endif

ifeq ($(DESTINATION),)
   export DESTINATION := gen
endif

# pandoc is a handy tool for converting between numerous text formats:
# http://johnmacfarlane.net/pandoc/installing.html
PANDOC := pandoc

# pandoc options
# Liberation fonts: http://en.wikipedia.org/wiki/Liberation_fonts
PANDOC_PDF_OPTS := --toc --chapters --base-header-level=1 --number-sections --template=virsto_doc.tex --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=12pt --variable documentclass=book
PANDOC_EBOOK_OPTS := --toc --epub-stylesheet=epub.css --epub-cover-image=cover.jpg --base-header-level=1

# download kindlegen from http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
#KINDLEGEN := kindlegen
#KINDLEGEN_OPTS :=

# Only .markdown files are considered full documents. Any supporting notes and memos that are not
# to be converted should have either .md or .mdown extension.
MARKDOWN := $(wildcard blog/*.markdown)
PDF := $(patsubst %.markdown,$(DESTINATION)/%.pdf,$(MARKDOWN))
EBOOK := $(patsubst %.markdown,$(DESTINATION)/%.epub,$(MARKDOWN))
DOCX := $(patsubst %.markdown,$(DESTINATION)/%.docx,$(MARKDOWN))
HTML := $(patsubst %.markdown,$(DESTINATION)/%.html,$(MARKDOWN))

.PHONY: all publish pdf ebook doc wiki html clean

all: publish

publish: $(HTML)

pdf: $(PDF)

ebook: $(EBOOK)

doc: $(DOCX)

html: $(HTML)

# generate PDF
$(DESTINATION)/%.pdf: %.markdown
	@echo " ** pdf     :" $@
	${Q}$(PANDOC) $(PANDOC_PDF_OPTS) --self-contained -o $@ $<

# generate both iBooks (.epub) and then Kindle (.mobi) formats
$(DESTINATION)/%.epub: %.markdown
	@echo " ** ebook   :" $@
	${Q}$(PANDOC) $(PANDOC_EBOOK_OPTS) --self-contained -o $@ $<
	#${Q}$(KINDLEGEN) $(KINDLEGEN_OPTS) $@ > /dev/null

# generate Microsoft Word documents (.docx)
$(DESTINATION)/%.docx: %.markdown
	@echo " ** docx    :" $@
	${Q}$(PANDOC) --self-contained -o $@ $<

# generate HTML files
$(DESTINATION)/%.html: %.markdown
	@echo " ** html    :" $@
	${Q}$(PANDOC) --self-contained -o $@ $<
