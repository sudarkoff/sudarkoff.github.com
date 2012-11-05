Title: Mute/unmute the sound
Author: George Sudarkoff
Date: Fri, 28 Oct 2005 08:00:00 +0000

\
I absolutely love Mac OS X for that behind the cute facade there's an
even more beautiful thing called unix. Combine the power of unix shell
with wide adoption of AppleScript and you can achieve pretty much
anything. For example, to automatically mute the sound at night, just do
the following:\

\
1. Start the Terminal\
\
2. Open
[crontab](http://en.wikipedia.org/wiki/Cron "Wikipedia article describing crontab")
for editing using the following command:\

    $ crontab -e

\
3. Now copy these two lines into the editor:\

    0 1 * * * osascript -e 'tell application "System Events" to set volume with output muted'0 6 * * * osascript -e 'tell application "System Events" to set volume without output muted'

\
4. Save and quit and you're done. This will mute the sound at 1:00AM and
un-mute it at 6:00AM.\

\

