# Random Ideas
This file is a collection of ideas. Literary and otherwise (but mostly literary).

Start each new idea with a 2nd level title (##) followed by a date (if available). Put new ideas at the top of the file. Namely, right after this line:


## Party Ideas
- “Make your own Sundae” bar


## Aliens
Their eyes are covered with skin because the sun in their world is very bright. So wherever they go, they carry around a million watt lighting system and of course lot's of living creatures are just simply die in this conditions. So the poor aliens don't see nothing...	


## Comic Strip
The idea for graphical design of a comic strip: (1) black background, (2) white silhouettes, (3) balloons should resemble tooltip balloons, (4) font should resemble grafiti. Characters' silhouettes could be derived from actual photographs.

Content could include: (1) any geeky ramblings, (2) recaps of both personal and public events, (3) abstract mussings.


## Brainstorming on IRC (or any other collaborative media)
Using IRC-like channel with bot keeping track of the specially formatted messages and generating web page afterwards might be a good idea for group brainstorming sessions and could work like this:

Joe> Bob: shell we discuss the today's meeting agenda?
Bob> Why not
Joe> bot: start Agenda
bot> starting Agenda
Joe> 1. Introduction
Joe> 2. Discuss coding style
Bob> Let's postpone coding style until Jack is back from Tokyo
Joe> Yes, sounds like a good idea
Joe> bot, remove (2)
Joe> 2. Discuss release notes for beta1.5
Joe> 2.1. List known bugs
Bob> 2.2 Who's translating RN into Spanish?
Joe> bot: publish Agenda
bot> Agenda published at http://company.com/internal/2004-04-23/agenda.html


## Finding orientation of old digital photos
I've been talking with to a friend of mine a couple of months ago and we were discussing an plug-in idea for iPhoto.

So, the plugin should traverse though the collection of photos and rotate those taken with the camera in the portrait orientation. There are two cases that split the problem into two parts one of which is extremely easy to implement (that is, if iPhoto is not already doing it on itself) and another one which is "a tiny bit more difficult". The first case being if you lucky to have a camera, that is capable of detecting the portrait mode and inserting an appropriate flag into an EXIF metadata. For this case all


## Untitled (old ramblings)
First, there goes my idea. I'm not sure how practical this idea is, it might cost a lot to do it properly, so don't judge it too hard, it's just a thought. Have you noticed how certain physical characteristics of the road affect the trajectory of your car, how on certain turns virtually every car slouches to one side of the lane, almost crossing it into the adjacent lane? So, instead of the radius of the turn being mathematically constant, how about making it to adapt to the road? As the road tilts inwards at the turn (internal side of the turn is lower), gradually make the radius of the turn smaller (you could probably even make the lanes narrower). And when the road tilts outwards, make the lanes wider. And make it change constantly depending on the tilt and perhaps other characteristics. (After writing it down, this idea makes even less sense to me than it did before. If we would be fixing anything, then why not fix those physical characteristics of the road that affect driving trajectory in the first place? And I'm now sure that's exactly what they are trying to achieve when building roads, maybe it's just not easy in certain conditions.)

My idea started as a joke when I saw a shop named "Unfinished Furniture". Jokingly, I said to my wife: "a company selling unfinished software would be a real hit, ha-ha-ha!" Then I thought "wait a second, that's not such a bad idea for a web-site!" How often do you start writing something and then run out of time or desire to finish the project, but think it could be of use to somebody (even yourself)? Then, how often do you try to come up with something to code while learning a new programming language or a technology and can't think of anything meaningful? Another example of how such a web-site could be of use is when (finish the sentence) somebody drops the ball on a software tool that you have been using for ages and have grown to rely on, you just go and nominate this project on the "unfinished software" website and somebody hopefully comes across and picks it up.

Now, hang in there! My wife's idea is a whole lot better and it's about a new safety feature for the car. It's some kind of a radar that monitors your car's blind spot and notifies you of the objects hanging in there. There's nothing revolutionary about this idea, but I quite frankly just love it. Of course, as usual, devil is in details and wether or not this feature will be successful will depend on the implementation. I see it implemented in the following way. First of all, make the appropriate sides of the rearview mirror glow if there's something in you blind spot. Then, when you try to engage turn signal make it not stick and if you do attempt changing lanes with something hanging in your blind spot (the technology that monitors lane changing is already available) buzz! The main objective of the implementation should be not to discourage the driver from checking his/her blind spot with their own eyes. I am sure it will save a lot of lives!


## Smart Toolbar
I got an idea for an application. Something I always wanted to do but never got around it. I am publishing it here in hope that somebody will read it and get interested enough to finally implement it.

### Motivation
I have been using Yahoo! Bookmarks for the last few years and got used to having them all in one place - well organized and easily accessible from any device that I could connect to the Internet. But I also always wanted my bookmarks to be stored on my own server and published on my own site in the form of a (not so) tiny directory. I have found all the necessary scripts, adjusted them to my environment, added missing functionality, and so on. But it's still not as convenient as Yahoo! Bookmarks. So what is missing now is a browser toolbar that would allow saving bookmarks easily and in the organized way, without the need to leave the page you are currently reading and without the need to open another application or a browser window. I could have coded it a long time ago but for some weird idea that is sitting in my head and which I am going to talk about here.

### Idea
I want a browser toolbar whose functionality is completely defined by the server through some simple protocol. This protocol should be simple enough to implement it with JavaScript.

### Usage
This will be the ultimate toolbar that webmasters could utilize to provide their users with any custom service they would like. From the above-mentioned bookmarks to blogrolling, news aggregation, stock quotes, email notification, and so on. Imagine opening http://weather.com in your browser and instantly knowing that this site could provide you with, say, local weather alerts! Imagine being able to subscribe to this service with just a single button click!

I could think of gazillions of various services seamlessly integrated into this mighty MetaToolbar. The need for custom toolbars will end and users will start happily removing all these numerous toolbars. Browser developers will recognize this trend and start supporting protocol out of the box. The name of the person to implement this first will enter the hall of fame and stay there forever... And so on, well, you get the idea.

### Implementation
A few days ago, reading about Atom (http://www.intertwingly.net/wiki/pie/) I finally realized the way to approach this. It should be an HTTP/XML-based protocol that would introduce services supported by the server by listing them in the introspection file. Record for each service would include its type (button, menu, indicator, etc.) and a list of supported actions along with their signatures. Actions should be implemented using HTTP verbs like GET, POST, and so on. Authentication should be a standard option as well.
