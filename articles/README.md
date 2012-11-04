This folder contains **published** blog articles. Files **must** have the .markdown extension to be published. When ready to publish, move an article to this folder:

    $ git mv draft/blah.markdown articles/blah.markdown

Then commit and push to the `blog` remote:

    $ git ci -m"Publish blah.markdown to blog."
    $ git push blog origin

