Title: AppleScript, Email Announcer
Author: George Sudarkoff
Date: Thu, 27 Oct 2005 17:25:16 +0000

\
Here’s a little AppleScript I wrote to announce new emails in Mail.app.
It pauses the iTunes if it’s playing, speaks the name of the sender if
the message is not marked as junk and then resumes the playback.\

    on performmailaction(info)-- see if iTunes is playingset itunesplaying to falsetell application "System Events"if (get name of every process) does not contain "iTunes" thenset itunesplaying to falseelsetell application "iTunes"if player state is playing then set itunesplaying to trueend tellend ifend tell    -- pause iTunes if needed    if itunesplaying is true then tell application "iTunes" to pause    tell application "Mail"set themessages to |SelectedMessages| of inforepeat with amessage in themessagesset thesender to extract name from sender of amessageif (junk mail status of amessage) is not true thensay "Mail from " & thesenderend ifend repeatend tell    -- resume iTunes if it was playing beforeif itunesplaying is true then tell application "iTunes" to playend performmailaction

\
\
Keep in mind that the script might turn up to be quite chatty depending
on the amount of mail that you receive every day. One way of dealing
with this is to apply the script only to those emails sent by people in
a certain group (Friends, Family, Colleagues and so on). Here’s one of
my email rules:\
\

\
\
![Email From Family
Rule](http://george.sudarkoff.com/storage/post-images/AnnounceFamily.png)\
\

\

