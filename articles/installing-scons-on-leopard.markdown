Title: Installing SCons on Leopard
Author: George Sudarkoff
Date: Sat, 03 Nov 2007 01:15:04 +0000

In case you were wondering, here's how you would install
[SCons](http://www.scons.org/) on Mac OS X 10.5 (Leopard):

\

`` $ su -$ curl -O http://prdownloads.sourceforge.net/scons/scons-0.97.tar.gz$ tar zxvf scons-0.97.tar.gz$ cd scons-0.97$ python setup.py install --prefix=/System/Library/Frameworks/Python.framework/Versions/Current$ for i in /System/Library/Frameworks/Python.framework/Versions/Current/bin/scons*; do ln -s $i /usr/local/bin/`basename $i`; done$ exit ``\
\

\

