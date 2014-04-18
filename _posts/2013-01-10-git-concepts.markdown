---
title: Key Git Concepts
layout: post
category: general
tags: []
---
{% include JB/setup %}

*This article was initially written by my colleague Filip Machi.<br />
Published here with his blessing.*

Understanding a few key concepts will help you make sense of how Git works and how to use it effectively.

## Full history

With Git every repository contains a full copy of the project history, and no repository is inherently more important than any other. See:

> [http://www.kernel.org/pub/software/scm/git/docs/cvs-migration.html](http://www.kernel.org/pub/software/scm/git/docs/cvs-migration.html)

## Content-addressable 

Git stores content in files with names that are 40-hexdigit (160-bit) SHA1 hashes. This has some interesting implications. It means for example that Git will never store the same data twice within a repository because identical data would have identical SHA1 hashes and therefore be stored in the same file. It also means that the contents of a Git object will never change because that would change the name the object is stored under. See:

> [http://www.kernel.org/pub/software/scm/git/docs/tutorial-2.html](http://www.kernel.org/pub/software/scm/git/docs/tutorial-2.html)

Git objects are unique across all repositories, not just your repository. You can add objects from any repository to your repository and as long as the imported objects represent data different from data in your repository, they will never collide with any of your objects. The SHA1 object names derived from the data ensure that all stored content is truly unique.

It may help to note that the object store has a single namespace for all objects, which are stored in the ".git/objects/" subdirectory of your repository. But there is no danger of namespace collision when storing two objects representing different data because of the data uniqueness enforced by the SHA1 naming scheme.

Some Git objects represent files while others represent collections of files. The SHA1 object naming scheme also ensures that objects representing different hierarchies of files and directories also have unique object names. So you can add objects representing whole trees of files from other repositories to your repository and none of those objects will overwrite objects in your repository unless they represent exactly the same tree or file (in which case no information would be lost anyway).

## Types of objects

There are four kinds of objects in a Git repository: blobs, trees, commits and tags. Blob objects contain binary data and are used to store all file content. Tree objects represent a single directory. Commit objects contain a 'commit' message and one or more tree names and their SHA1 hashes, indicating how the tree objects are related. Tag objects represent a starting point in the object store. 

A file of data is stored in a blob object that is named after the SHA1 hash of its contents. The file name itself is stored separately in a tree object, paired with the SHA1 hash of the file data. A tree object stores the name and SHA1 hash of every file within a directory. It also stores the SHA1 hash of other tree objects that represent subdirectories. So a tree objects is a kind of directory within the object store.

Through the magic of SHA1 hashes, tree objects represent not just a single directory of files but an entire hierarchy rooted at a directory. Likewise, a commit object represents a history of a hierarchy. To see how that works suppose someone changes the contents of a file deep inside the hierarchy represented by a commit object. That will change the SHA1 hash of the edited file and result in a new blob object in the object store. That new SHA1 value will obviousely not appear in the tree object associated with the original file. The entire chain of objects leading back to the commit object will remain as before. The edited file is a new blob object and the original commit still represents the state of the hierarchy as it was before the file changed.

A similar effect happens when tree objects are changed. Say a file is added to a directory. The tree object corresponding to that directory will now have an additional entry. That causes the SHA1 hash for the tree object itself to change. So a new tree object has been created in the object store with a new SHA1 hash for its name. The original tree object remains the same as it was before the new file was added. All objects linked back to the commit object remain unchanged. The history has been preserved.

A tag object is the starting point for entering the object store. The actual files in that state consist of whatever blob objects are reachable from the starting tag object.

# How does this actually work?

The basic ideas described above can be illustrated quite easily. The following examples, though somewhat simplified, show in some detail what happens during some simple interactions with a mock repository. You are invited to follow along with the examples at a Unix shell.

Start with a couple of text files in a directory:

    $ mkdir d1
    $ echo "Hello, world!" >d1/f1
    $ echo "Today is Friday." >d1/f2

Build the initial object store from these files. Blob objects will contain the data from the files. In addition, there will be a tree object to represent the directory, and a commit object to represent the initial history of the **d1/** hierarchy:

    $ mkdir objects
    $ sha1sum - <d1/f1
    09fac8dbfd27bd9b4d23a00eb648aa751789536d -
    $ cat d1/f1 >objects/09fac8dbfd27bd9b4d23a00eb648aa751789536d

We now have a blob object for file **f1**. Make a blob object for file **f2**:

    $ sha1sum - <d1/f2
    09501bb74c5de43a8775fcdc1916be23c39840b9 -
    $ cat d1/f2 >objects/09501bb74c5de43a8775fcdc1916be23c39840b9

The tree object representing the directory **d1/** is constructed from the list of blob objects it contains:

    $ cp /dev/null tmpf
    $ echo '09fac8dbfd27bd9b4d23a00eb648aa751789536d d1/f1' >>tmpf
    $ echo '09fac8dbfd27bd9b4d23a00eb648aa751789536d d1/f2' >>tmpf
    $ sha1sum - <tmpf
    3a6e46ad035d2daa47dcddfc2fd4711ae53008a5 -
    $ cat tmpf >objects/3a6e46ad035d2daa47dcddfc2fd4711ae53008a5

So far we have:

    1. a blob object for d1/f1: objects/09fac8dbfd27bd9b4d23a00eb648aa751789536d
    2. a blob object for d1/f2: objects/09501bb74c5de43a8775fcdc1916be23c39840b9
    3. a tree object for d1/: objects/3a6e46ad035d2daa47dcddfc2fd4711ae53008a5

To capture the history at this point we need a commit object:

    $ cp /dev/null tmpf
    $ echo 'parent commit: none' >>tmpf
    $ echo 'message: "initial commit"' >>tmpf
    $ echo 'tree: 3a6e46ad035d2daa47dcddfc2fd4711ae53008a5' >>tmpf
    $ sha1sum - <tmpf
    b38566fa5aa3f04fdcc60df9faa4447796289a04 -
    $ cat tmpf >objects/b38566fa5aa3f04fdcc60df9faa4447796289a04

The repository, represented by the **objects/** directory, now contains:

    1. a blob object for d1/f1: objects/09fac8dbfd27bd9b4d23a00eb648aa751789536d
    2. a blob object for d1/f2: objects/09501bb74c5de43a8775fcdc1916be23c39840b9
    3. a tree object for d1/: objects/3a6e46ad035d2daa47dcddfc2fd4711ae53008a5
    4. a commit object for d1/: objects/b38566fa5aa3f04fdcc60df9faa4447796289a04

The commit object represents a starting point into the object store. From that starting point we can recreate the file hierarchy under **d1/**. We remember the starting commit object by saving its SHA1 file name to a well known place:

    $ echo b38566fa5aa3f04fdcc60df9faa4447796289a04 >HEAD

So starting from HEAD we can reconstruct the **d1/** directory:

    $ cat objects/$( cat HEAD )
    parent commit: none
    message: "initial commit"
    tree: 3a6e46ad035d2daa47dcddfc2fd4711ae53008a5

    $ cat objects/3a6e46ad035d2daa47dcddfc2fd4711ae53008a5
    09fac8dbfd27bd9b4d23a00eb648aa751789536d d1/f1
    09501bb74c5de43a8775fcdc1916be23c39840b9 d1/f2

    $ cat objects/09fac8dbfd27bd9b4d23a00eb648aa751789536d
    Hello, world!

    $ cat objects/09501bb74c5de43a8775fcdc1916be23c39840b9
    Today is Friday

Now we edit **d1/f1** and rebuild its blob, which will be different from the first blob for **d1/f1**:

    $ echo "Goodbye, world!" >d1/f1
    $ sha1sum - <d1/f1
    3b287f55eaebdaa8342e0a0119a49cb4243a305f -
    $ cat >objects/3b287f55eaebdaa8342e0a0119a49cb4243a305f

Notice that both blobs for file **d1/f1**, the one representing the initial contents of **d1/f1** and the one for the edited version, are now in the object store.

Because the SHA1 name of **d1/f1** changed, the tree object representing the **d1/** directory also changes:

    $ cp /dev/null tmpf
    $ echo '3b287f55eaebdaa8342e0a0119a49cb4243a305f d1/f1' >>tmpf
    $ echo '09fac8dbfd27bd9b4d23a00eb648aa751789536d d1/f2' >>tmpf
    $ sha1sum - <tmpf
    264c5ac9cd23dbf843e1bf528c83bae729be9a5a -
    $ cat tmpf >objects/264c5ac9cd23dbf843e1bf528c83bae729be9a5a

Likewise, there are now two tree objects in the object store, the initial one representing the initial **d1/** directory, and this new one representing the **d1/** directory after the file **d1/f1** changed.

We also capture the new history by creating a new commit object. This commit object contains a message, the SHA1 for the new tree object, and the SHA1 of the old commit. The pointer to the old commit captures the history indicating where this commit derives from:

    $ cp /dev/null tmpf
    $ echo 'parent commit: b38566fa5aa3f04fdcc60df9faa4447796289a04' >>tmpf
    $ echo 'message: "edited f1"' >>tmpf
    $ echo 'tree: 264c5ac9cd23dbf843e1bf528c83bae729be9a5a' >>tmpf
    $ sha1sum - <tmpf
    b38566fa5aa3f04fdcc60df9faa4447796289a04 -
    $ cat tmpf >objects/a6a6d088cc2db59ba7fced36b51942204aebabe2

The new commit object represents the latest state of the **d1/** hierarchy so we save this starting point again:

    $ echo a6a6d088cc2db59ba7fced36b51942204aebabe2 >HEAD

The latest hierarchy can be reconstructed from the latest commit:

    $ cat objects/$( cat HEAD )
    parent commit: b38566fa5aa3f04fdcc60df9faa4447796289a04
    message: "edited f1"
    tree: 264c5ac9cd23dbf843e1bf528c83bae729be9a5a

    $ cat objects/264c5ac9cd23dbf843e1bf528c83bae729be9a5a
    3b287f55eaebdaa8342e0a0119a49cb4243a305f d1/f1
    09501bb74c5de43a8775fcdc1916be23c39840b9 d1/f2

    $ cat objects/3b287f55eaebdaa8342e0a0119a49cb4243a305f
    Goodbye, world!

    $ cat objects/09501bb74c5de43a8775fcdc1916be23c39840b9
    Today is Friday

The old hierarchy is still there, it just begins at the old starting point:

    $ cat objects/b38566fa5aa3f04fdcc60df9faa4447796289a04
    parent commit: none
    message: "initial commit"
    tree: 3a6e46ad035d2daa47dcddfc2fd4711ae53008a5

    ... etc., like the initial commit above.

Notice that each unique piece of content is stored exactly once in the object store. Both the initial commit and the second commit share the same blob object for file **d1/f2**, which did not change between the two commits.
