# g.sud.to

This is a personal blog of George Sudarkoff. The website is powered by a new static blog engine written in node.js called [wheat][].

[wheat]: http://github.com/creationix/wheat

### Article format

Every article is a markdown file with some meta-data at the top of the file.

    Title: Control Flow in Node Part II
    Author: Tim Caswell
    Date: Thu Feb 04 2010 02:24:35 GMT-0600 (CST)
    Node: v0.1.91

    I had so much fun writing the last article on control flow, that I decided to...

    ## First section: Display JavaScript files

    * display contents of external JavaScript file (path is relative to .markdown file)
    <test-code/test-file.js>

    * display contents of external JavaScript file and evaluate its contents
    <test-code/evaluate-file.js*>

    More content goes here.

### Author format

Every author has a markdown file located in `authors` folder. You should name this file by your name and surname `Name Surname.markdown`.

    Github:   your_github_account
    Email:    your_email@domain.com
    Homepage: http://yourhomepage.com
    Twitter:  your_twitter_account
    Location: City, State, Country

    A few words about you.

### Starting the project on your local machine

Please check if the project is still working after you add your contribution to it. You can run the project in three easy steps:

1. Install the `npm`packages: `npm install`
2. Start the server: `node server/server.js`
3. Enjoy your local blog clone at `http://localhost:8080`
