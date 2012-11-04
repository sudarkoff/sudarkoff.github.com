#!/usr/bin/env python

import os
import sys
from xml.dom.minidom import parse
import string
import codecs
from subprocess import Popen, PIPE, STDOUT

def getText(nodelist):
   rc = []
   for node in nodelist:
      if node.nodeType == node.TEXT_NODE:
         rc.append(node.data)
   return ''.join(rc)

def htmlToMarkdown(htmlText):
   pandoc = Popen(['pandoc', '-f', 'html', '-t', 'markdown'], stdout=PIPE, stdin=PIPE, stderr=STDOUT)
   markdown = pandoc.communicate(input=htmlText.encode('utf-8'))[0]
   return markdown

def handleRSS(slideshow):
   handleChannel(slideshow.getElementsByTagName("channel")[0])

def handleChannel(channel):
   items = channel.getElementsByTagName("item")
   for item in items:
      handleItem(item)

def handleItem(item):
   # Limit valid characters for a filename (that ultimately will become a link)
   # to just ascii letters, digits and the underscore.
   valid_chars = frozenset("-%s%s" % (string.ascii_letters, string.digits))
   linkname = getText(item.getElementsByTagName("link")[0].childNodes).rpartition('/')[2]
   filename = "articles/%s.markdown" % ''.join(c for c in linkname if c in valid_chars)
   print("%s" % filename)
   markdown = codecs.open(filename, 'w', 'utf-8')

   handleTitle(item.getElementsByTagName("title")[0], markdown)
   handlePubDate(item.getElementsByTagName("pubDate")[0], markdown)
   markdown.write("\n")
   handleContent(item.getElementsByTagName("content:encoded")[0], markdown)
   markdown.close()

def handleTitle(title, markdown):
   titleText = getText(title.childNodes)
   markdown.write("Title: %s\n" % titleText)
   markdown.write("Author: George Sudarkoff\n")

def handlePubDate(pubDate, markdown):
   pubDateText = getText(pubDate.childNodes)
   markdown.write("Date: %s\n" % pubDateText)

def handleContent(htmlContent, markdown):
   contentText = htmlToMarkdown(htmlContent.firstChild.wholeText)
   markdown.write(contentText.decode('utf-8'))

def main(argv):
   if len(argv) < 1:
      sys.stderr.write("ERROR! Usage: %s <filename.xml>" % argv[0])
      return -1
   xmlFile = argv[1]
   if not os.path.exists(xmlFile):
      sys.stderr.write("File doesn't exist: %s" % xmlFile)
      return -2
   dom = parse(xmlFile)
   handleRSS(dom)
   return 0

if __name__ == "__main__":
   sys.exit(main(sys.argv))

