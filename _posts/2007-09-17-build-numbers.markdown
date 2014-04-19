---
title: Build numbers
layout: post
comments: true
summary: Build numbers for projects that use Git for source control.
tags: [hightech,programming]
---

[Wincent Colaiuta](http://wincent.com/a/about/wincent/) in his blog post "[Build numbers in a Git-based development cycle](http://wincent.com/a/about/wincent/weblog/archives/2007/07/build_numbers_i.php)" is trying to come up with the build numbering scheme. His requirements are that the build number (1) uniquely identifies the revision of the source code used in the build and (2) provides a clear distinction between earlier and later builds (i.e. is sequential). Git is a distributed system and as such instead of a sequential revision number it uses sha1 to uniquely identify individual commits. The problem is, sha1 is quite long (even its abbreviated form is seven characters) and absolutely non-sequential.

I myself just converted all my repositories to git. But my build numbering scheme accommodates new environment just fine, so I wanted to share. First of all, why do you want the build number to be sequential? So that *your users* could tell which build they have installed on their system and whether or not it is the latest one. Second, why do you want the build number to uniquely identify the sources? So that *you* (the developer) could pinpoint the sources that were used to make the build (in order to find the change that introduces a bug, for example).

This divides the problem into two distinct parts and I decided to address them separately. That is, my build number has two components: a sequential number for the user and a unique source code identifier for myself. The former is just a number automatically incremented by the build infrastructure while the latter is the abbreviated sha1 of the latest commit in the repository used by the infrastructure to produce the build. Theoretically, I can have two builds made from the same revision, but in reality my build infrastructure is smart enough to avoid doing unnecessary work. That means, that although the full build number might look quite intimidating (e.g.: 4ef.7e93fcd) the first part of the number is always sufficient to uniquely identify the build. And in fact, the second part is almost never directly communicated to the user.

Additionally, I never number my developer's builds (builds created from my working tree). It is not only unnecessary, but actually quite undesirable. The reason? It would be a bad idea to distribute a build made from uncommitted changes and I want to make sure that the developer's builds are easily recognizable as such (e.g.: 0.0000000). All this makes it very easy to implement a script that automatically increments the sequential part of the build number and stick the abbreviated sha1 to it to form the complete build number.
