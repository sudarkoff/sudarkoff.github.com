Title: AppleScript, Export iCal Birthdays to Remind
Author: George Sudarkoff
Date: Fri, 28 Oct 2005 09:00:00 +0000

\
Another AppleScript to export all Birthdays from iCal to
[remind](http://www.43folders.com/2005/02/24/guest-mike-harris-looks-at-remind/ "43 Folders: Mike Harris looks at ")-formated
text file:\

    property reminders_path : POSIX path of ((path to home folder) as text) & "Reminders/Birthdays.txt"property days_in_advance : 7 -- how many days in advance to remindtell application "iCal"do shell script "mv " & reminders_path & " " & reminders_path & ".bak"set this_calendar to first calendar whose title contains "Birthdays"repeat with this_event in every event of this_calendartell this_eventset es to summary as stringset n to offset of "’" in esset l to length of esset event_summary to (text 1 thru (n - 1) of es) & "'" & (text (n + 1) thru l of es)set start_date to start dateset date_string to (((month of start_date) as string) & " " & (day of start_date) as string)set reminder_string to date_string & " +" & days_in_advance & " MSG " & event_summary & " %b.%"do shell script "echo \"REM " & reminder_string & "\" >> " & reminders_pathend tellend repeatend tell

\
Make sure to update `reminders_path` and `days_in_advance` properties
according to your situation and/or liking.\

\
P.S. I promise it's the last one. At least for a little while.\

\

