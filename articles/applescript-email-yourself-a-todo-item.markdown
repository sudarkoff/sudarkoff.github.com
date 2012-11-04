Title: AppleScript, Email yourself a TODO item
Author: George Sudarkoff
Date: Sun, 04 Dec 2005 04:59:05 +0000

\
This script is based on the idea from
[here](http://www.urbanhonking.com/ideasfordozens/archives/2005/11/use_automator_t.html).
Create the AppleScript with the following content in your
`~/Library/Scripts/Mail Scripts/` folder (I named the file
`Append to TODO List.scpt`):\

    -- specify the path to your todo-list fileproperty todo_list : "~/Documents/todo.txt"property crlf : (ASCII character 13) & (ASCII character 10)on perform_mail_action(info)tell application "Mail"set the_messages to |SelectedMessages| of inforepeat with a_message in the_messagesset the_content to a_message's content as stringdo shell script "echo \"" & crlf & the_content & "\" >>" & todo_listend repeatend tellend perform_mail_action

\
Then add the following rule in Mail.app:\

\
![Mail.app
rule](http://s3.media.squarespace.com/production/398961/6786677/images/200512040442-append_to_todo_rule.png)\

\
Now you can just email yourself with the subject line "todo-SecretWord"
and the script will automatically append the content of the message to
your todo list.\

\
**Update:** Add a bookmarklet like
this—"mailto:you@domain.com?subject=todo-SecretWord"—to your browser's
toolbar and you'll always be just a click away from capturing that
brilliant idea of yours that came to you while you were surfing the
web.\

\

