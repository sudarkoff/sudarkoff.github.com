---
title: AppleScript, "Open Safe Files" Folder Action
layout: post
category: general
tags: []
---
{% include JB/setup %}

\
Continuing the AppleScript theme, here's the script that I wrote to use
as a Folder Action. It automatically opens "safe" files after you
download or copy them to the designated folder—I disabled this feature
in Safari, since my understanding of "safe" is quite different from
Safari's.\

    property safe_types_list : {"org.gnu.gnu-tar-archive", "public.tar-archive","org.gnu.gnu-zip-archive", "org.gnu.gnu-zip-tar-archive","com.apple.binhex-archive", "com.apple.macbinary-archive","public.cpio-archive", "com.pkware.zip-archive","com.allume.stuffit-archive","com.apple.disk-image-udif", "public.iso-image"}on adding folder items to this_folder after receiving added_itemstell application "Finder"repeat with a_file in added_itemsset UTI to type identifier of (info for a_file)-- display dialog UTI as stringif UTI is in safe_types_list thenopen a_fileend ifend repeatend tellend adding folder items to

\
\
If you'd like this script to handle some additional file types,
un-comment the `display dialog UTI as string` line, drop the file of the
desired type into the folder and the script will display the type
identifier that you need to add to the `safe_types_list` list.\
\

\

