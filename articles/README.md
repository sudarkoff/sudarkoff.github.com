This folder contains **published** blog articles. Files **must** have the .markdown extension to be published. When ready to publish, move an article to this folder:

    $ git mv Blah.markdown blog/Blah.markdown

Then commit and push to the `blog` remote:

    $ git ci -m"Publish Blah.markdown to blog."
    $ git push blog origin

The following hook on the `blog` remote will pick up the changes, convert .markdown's to .html and publish them:

    $ cat .git/hooks/post-receive
    #!/bin/sh
    LOCAL_COPY=/path/to/local/copy
    GIT_WORK_TREE=${LOCAL_COPY} git checkout -f
    make -C ${LOCAL_COPY} publish

