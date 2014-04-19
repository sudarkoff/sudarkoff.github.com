---
title: Searching the source code
layout: post
comments: true
summary: In which I share a tip for navigating a large codebase.
tags: [hightech,programming,tools]
---

I have a few aliases in my `~/.bash_aliases` that help me find symbols in the source tree:

        alias hfind='find . \( -name "*.h" -o -name "*.hpp" -o -name "*.hxx" \) -printf "\"%p\"\n" | xargs grep --line-number --ignore-case --extended-regexp $1'...

For example, the following command will list all header files that
include boost's meta-programming library:

        $ hfind "^#include[[:space:]]+<boost/mpl/"

The result will look something like this:

        ./base_object.hpp:26:#include <boost/mpl/eval_if.hpp>
        ./base_object.hpp:27:#include <boost/mpl/int.hpp>
        ./collection_traits.hpp:26:#include <boost/mpl/integral_c.hpp>
        ./collection_traits.hpp:27:#include <boost/mpl/integral_c_tag.hpp>
        ./export.hpp:36:#include <boost/mpl/eval_if.hpp>
        ./export.hpp:37:#include <boost/mpl/or.hpp>
        ...

Just something to help you tear through millions of lines of code...
