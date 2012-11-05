Title: Refactoring
Author: George Sudarkoff
Date: Mon, 24 Oct 2005 22:04:09 +0000

> [To Really Improve Your System You Can't
> Refactor](http://radio.weblogs.com/0103955/categories/stupidHumanProgramming/2005/10/24.html#a202 "24.txt")\
> I firmly believe in constantly improving my code and I see a
> difference in quality because of that. Seemingly this would put me
> firmly in the refactoring camp. But it doesn't. Why? Refactoring says
> you can't break interfaces. That puts me in an awkward position.

\

Refactoring is all about improving your code and making sure your tests
still pass along the way. There could be no single method that works
equaly good for everyone and in every situation, though. I once was
refactoring the library and at some point just realized that it's going
to take far less time if I just rewrote it. And so I did, and the
resulting code was only 20% as big and it was all new code. But I still
call it refactoring! Because even though I was writing a new code, I
still had the existing code to consult with.

\

What's good about the method, though, is that we can automate some of
the routine tasks of refactoring.

\

