---
title: Markdown + Pandoc Workflow
layout: post
category: howto
tags: [writing,hightech]
---
{% include JB/setup %}

This article outlines my setup and workflow for writing documents using [Markdown](http://daringfireball.net/projects/markdown/syntax) and [pandoc](http://johnmacfarlane.net/pandoc/). This is a workflow that I personally find natural and convenient. There are some very important limitations (discussed below), but I've been successfully using this workflow for quite some time and it seems to be working great.

# Requirements

Main requirements for my workflow were:

-   plain text editing
-   keeping track of multiple revisions
-   collaboration with multiple simultaneous remote and offline authors
-   support for multiple target output formats
-   automated publishing (through an external build system and such)

## Limitations

Note that publishing is a one-way process in this workflow. If you publish on a Wiki, then you'll need to find a way to pull the changes from Wiki back into your "source" document. I'm using [Git-MediaWiki](https://github.com/Bibzball/Git-Mediawiki) bridge to publish/update articles to/from our corporate wiki. I've also looked into replacing MediaWiki with [gitit](http://gitit.net/) which uses Git as a backend and therefore would have allowed me to push/pull to it directly, but presently the feature set is not complete enough to be a viable replacement.

# Workflow

A lot of the pieces of this workflow are not strictly necessary - you can launch any text editor and start typing. And when you're done typing, execute pandoc directly to convert your Markdown text to a fancy document (PDF, Word, HTML). The workflow I present here supports more complex scenarios like writing large multipart documents (potentially multilingual), collaborating with multiple (potentially remote and offline) authors simultaneously and generating multiple output formats of the final document with a single command.

## SCM

The first component of my workflow is an SCM. I happen to prefer [Git](http://git-scm.com/), but any reasonable SCM will do. Anything and everything related to the document I'm working on is version-controlled. That includes an outline, notes, images, supporting scripts and so on. This allows me to focus on my writing and not worry about keeping track of multiple revisions, making a backup copy, merging multiple versions of the document and so on. It also allows me to evolve the accompanying tools (Makefiles, scripts, etc.) along with the document. Git in particular makes collaboration with multiple authors dramatically easier - authors work on their pieces in their own repositories and/or branches without stepping on each other's toes and then gracefully merge everything back together.

## Writing

Once again, I happen to prefer [Vim](http://www.vim.org/), but any reasonable editor would do (e.g.: [TextMate](http://macromates.com/) on Mac, [gEdit](http://projects.gnome.org/gedit/) on Linux or [Notepad++](http://notepad-plus-plus.org/) on Windows).

Some text editors are better than others. Particular Vim features (extended by a few strategically picked plugins) that would make your writing more pleasant include automatic indenting of lines in a certain way, inserting matching brackets for links, syntax highlighting, not slowing me down when working remotely through a slow internet connection (which happens more often that I'd like) and so on.

For formatting the text I use [Markdown](http://daringfireball.net/projects/markdown/) - my first secret ingredient. It is a plain text formatting syntax and as the author himself puts it: "the overriding design goal for Markdown’s formatting syntax is to make it as readable as possible. The idea is that a Markdown-formatted document should be publishable as-is, as plain text, without looking like it’s been marked up with tags or formatting instructions." And it's a very important feature because, once again, it allows me to focus on my writing rather than on formatting the text. Markdown is easy and unobtrusive to write and it doesn't get in the way when you read the document. At the same time, it's easily convertible to a plethora of fancier-looking formats. Which brings us to the next tool - Pandoc.

## Pandoc

[Pandoc](http://johnmacfarlane.net/pandoc/) is the second secret ingredient. It takes Markdown (in addition to a half dozen other formats) and converts it to a couple dozen other formats including HTML, Microsoft Word, PDF, EPUB and MediaWiki. Pandoc also introduces a few important extensions to Markdown that make it even easier to write content-rich documents. And all in plain text!

## Makefile

Sure, you can just execute pandoc directly from the command line, but if your document consists of a couple dozen chapters and you need to convert it to half a dozen formats, then managing it by hand becomes quite difficult. Again, make is a tool that was designed specifically to take a potentially very large collection of text files and produce a single (binary) file. If Makefile sounds like a little too much, it could easily be replaced by a batch/shell script that does the same thing just a bit less efficiently. 

Notice that almost all the tools I mention are designed to work with the source code. This is an important moment because although Markdown is a fine format on its own and you might never actually even bother converting it to any other format (many publishing tools accept Markdown as is and convert it on the fly), for as long as your document is a work in progress, it is essentially no different than a source code of a program - you write and rewrite various parts of the work, you try out ideas, merge multiple revisions together, review the history of edits and so on. Using the software development tools makes sense. Especially if you're already familiar with them.

# Alternatives?

**What about Google Docs?** It's an okay editor that saves you from having to install Microsoft Office (or OpenOffice.org). It keeps the history of edits and even allows you to collaborate with multiple authors. However, let's be honest, it's not the editor you'd use normally and it suffers from a few shortcomings. The formatting is very fragile and tends to implode if you move the text around or paste fragments from other sources. The offline mode is very limited. And it's very difficult to convert the document to any other format.

**What about Wiki?** Wiki is a great publishing platform and it does keep the history of edits. But it is an even worse editor than Google Docs, it typically has no offline mode and does not allow simultaneous edits. It is also most probably not available outside of your company network making it difficult to work disconnected. 

**But Git, Vim and Makefiles, really?!** Okay, you got me there. I admit, this stuff is pretty nerdy and I don't have a very good defense here. If you're a marketing person, you're not going to learn how to write Makefiles just to implement my workflow. If you're a software engineer, however, these (or similar) are the tools you're using every day anyway. And even if you're a sales guy, you can still use the Notepad to write a Markdown-formatted document, convert it into a nicely formatted document using Pandoc and forget about all that git-shmit mumbo-jumbo.

# Examples

The following text fragment is a Markdown-formatted first section of this article.

    # Requirements

    This article outlines my setup and workflow for writing
    documents using [Markdown](http://daringfireball.net/projects/markdown/syntax) 
    and [pandoc](http://johnmacfarlane.net/pandoc/). This is 
    a workflow that I personally find natural and convenient. 
    There are some very important limitations (discussed 
    below), but I've been successfully using this workflow 
    for quite some time and it seems to be working great.

    Main requirements for my workflow were:

    -   plain text editing
    -   keeping track of multiple revisions
    -   collaboration with multiple simultaneous remote and 
        offline authors
    -   support for multiple target output formats
    -   automated publishing (through an external build 
        system and such)

Makefile could be as [complex](https://gist.github.com/3956724) or as simple as you desire. The following is an example of a fairly trivial one:

    %.html: %.md style.css
        pandoc -c style.css -o $@ $<

    %.docx: %.md
        pandoc -o $@ $<

    %.pdf: %.md
        pandoc -o $@ $<

    all: doc.html doc.docx doc.pdf
