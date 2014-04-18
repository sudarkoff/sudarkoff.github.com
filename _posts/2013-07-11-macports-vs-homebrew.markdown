---
title: Why I switched from MacPorts to Homebrew
layout: post
category: general
tags: []
---
{% include JB/setup %}

This is my unscientific observations about and the reasons I switched from MacPorts to Homebrew. Some of this reasons are no doubt subjective. But that doesn't mean they are not important to me.

## Main reasons

 - /usr/local is a better location for installing software on a BSD-based Unix system than /opt (we can argue about this ad nauseam, but the record has been set straight decades ago)
 - Homebrew trusts the sanity of the OSX rather than try to bring its own bits, which nowadays is a better, more economical approach
 - it is much easier to contribute recipes to Homebrew
 - Homebrew is easier to integrate into custom DevOps contraptions
 - Homebrew has a real sense of community and this is important for OSS

## Superficial reasons

 - Homebrew is lighter
 - Homebrew uses Git throughout which makes installing, upgrading **and hacking** it a lot easier
 - Homebrew feels a lot more open
 - the cost of trying Homebrew is negligible
