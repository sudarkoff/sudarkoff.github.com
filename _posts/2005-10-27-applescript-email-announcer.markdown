---
title: AppleScript, Email Announcer
layout: post
comments: true
summary: An AppleScript for announcing emails as they arrive in the inbox.
tags: [howto,hightech,osx]
---

Here’s a little AppleScript I wrote to announce new emails in Mail.app. It pauses the iTunes if it’s playing, speaks the name of the sender if the message is not marked as junk and then resumes the playback.

    -- FIXME: after moving my blog from hosting to hosting, I think I
    -- finally broke this article enough to make it very nearly useless:
    -- the formatting is broken, the code might not work
    on performmailaction(info)
        -- see if iTunes is playing
        set itunesplaying to false
        tell application "System Events"
            if (get name of every process) does not contain "iTunes" then
                set itunesplaying to false
            else
                tell application "iTunes"
                    if player state is playing then set itunesplaying to true
                end tell
            end if
        end tell

        -- pause iTunes if needed
        if itunesplaying is true then tell application "iTunes" to pause
        tell application "Mail"
            set themessages to |SelectedMessages| of info
            repeat with amessage in themessages
                set thesender to extract name from sender of amessage
                if (junk mail status of amessage) is not true then
                    say "Mail from " & thesender
                end if
            end repeat
        end tell

        -- resume iTunes if it was playing before
        if itunesplaying is true then tell application "iTunes" to play
    end performmailaction

Keep in mind that the script might turn up to be quite chatty depending on the amount of mail that you receive every day. One way of dealing with this is to apply the script only to those emails sent by people in a certain group (Friends, Family, Colleagues and so on). Here’s one of my email rules:

![Email From Family Rule](http://george.sudarkoff.com/storage/post-images/AnnounceFamily.png)
