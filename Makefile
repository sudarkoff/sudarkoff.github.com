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
PANDOC_HTML_OPTS := -s -S -c /css/blog.css -A meta/blog_footer.html

# Only .markdown files are considered full documents. Any supporting notes and memos that are not
# to be converted should have either .md or .mdown extension.
MARKDOWN := $(wildcard blog/*.markdown make/*.markdown)
HTML := $(patsubst %.markdown,$(DESTINATION)/%.html,$(MARKDOWN))

.PHONY: all publish html

all: publish

publish: $(HTML)

html: $(HTML)

# generate HTML files
$(DESTINATION)/%.html: %.markdown css
	@echo " ** html    :" $@
	@mkdir -p $(DESTINATION)/$(dirname $@)
	${Q}$(PANDOC) $(PANDOC_HTML_OPTS) -o $@ $<

css: meta/blog.css
	@echo " ** css     :" $@
	@mkdir -p $(DESTINATION)/css
	${Q}cp -f $< $(DESTINATION)/css

