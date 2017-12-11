# Shakespeare Script Editor

This project was initially created by Mahlet Melaku, Holly Mitchell, Lee Norgaard, Crystal Xiang for Prof. Benjamin Wiedermann, and it was continued by Evan Amason, Israel Jones, Jake Palanker, and Ashley Schmit for Prof. Ambereen Dadabhoy.

The HMC Shakespeare Script editor makes the editing process easier by providing all of Shakespeare’s plays in a single location. It also provides the means for cutting the plays with click and drag strikethrough. The format for editing in the HMC Shakespeare Script Editor also maintains the original formatting of the plays, and it provides a navigation bar for ease of access. Users can create an account which is used to store of their edits in a convenient central location.

## Architecture

Database

We store all of our data in an SQL database, using SQLite3. The data is organized in a hierarchical setup with the highest level being Plays, and the lowest being individual Words. This allows us to quickly gather all the sub-components from any size division. 
	e.g. all Scenes in Act 2 
	e.g. all lines from Act 2 Scene 3
	e.g. all words from Act 2 Scene 3 Line 55
This data structure is used to construct the display of the individual plays, collect analytics, and generate scripts. 
Words struck from the script are attached to Edits, via the “Cuts” relationship. This means in our database there is a “Cuts” table whose elements consist of an edit id and a word id, one for each word cut in each edit. Words themselves store their contained text (besides metadata like id, time created, etc), and edits store the user id associated with them (as well as metadata).

Parsing

We populate our database by parsing through a set of XML files from Folgers using the Nokogiri ruby gem. Our parsing system lives in the seeds.rb file which can be called to fill our database. Given a hardcoded list of file paths to parse through, it moves through the play looping in the following pattern (Acts -> Scenes -> Lines -> Words). Must of the code for this parsing program came from the group before us, so we don’t know much about it’s functionality, just its output. Since parsing is only done on every play once, then that data is saved in the database, we haven’t worked at improving runtime performance at all.

Cutting

Cuts are made using Javascript, and minimally JQuery, because the code from previous teams primarily used pure Javascript. The two objects on the page which can be cut are words and stage directions. The scripting for this is really the most “run-time” related component, because it’s the part of the app that the users will actively interact with the most. The primary tasks that this component must complete are:
Adding line-through to the HTML elements in the play script
Informing the database that these words have been cut/uncut
Informing the database of cuts to the script is done with JQuery’s AJAX, an asynchronous call function. A table of cuts/removal of cuts is saved in a local cache, until the user presses a save button, at which point the table is sent to the “new edit page” via an AJAX call, and a “Cut” is created between each word and the edit currently open. The advantage of caching changes instead of sending them as they happen is that we don’t have to slow the user down until they’re done, and also avoids some issues with double saving of cuts that can happen when requests are sent at any time in any order.


### Prerequisites
While the general Prereqs are the same, how to get them differs depending on the operating system

The major components that need to be installed are:
ruby
ruby bundler 
rails
sqlite3
node.js

For help on installing these components we've included a few guides below

#### Debian systems (such as Ubuntu)
1. install the following packages ruby ruby-dev ruby-bundler build-essential libsqlite3-dev zlib1g-dev nodejs
2. this can be done with a package manager (in this example we use aptitude) with a command such as this one:
`sudo apt-get update && sudo apt-get install ruby ruby-dev ruby-bundler build-essential libsqlite3-dev zlib1g-dev nodejs`


#### Mac OSX
Using homebrew (https://brew.sh/) install ruby and rbenv.
If you already have a working rails installation you can skip most of these steps just make sure to have installed sqlite3 through brew.
Info for this section loving stolen with credit from this awesome guide: https://gorails.com/setup/osx/10.13-high-sierra

1. `brew install rbenv ruby-build`
2. `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile source ~/.bash_profile`
3. `rbenv install 2.4.2`
4. `rbenv global 2.4.2`
5. `gem install rails -v 5.1.4`
6. `rbenv rehash`
7. `brew install sqlite3`

#### Windows
Due to the…. more fun aspects of getting development packages installed on windows in this section we just link to other guides which should install the same prereqs we need.
1. If you’re on windows 10 and are willing to install the developmental linux subsystem this guide seems to do a good job: https://gorails.com/setup/windows/10 
2. Alternatively here is a good guide with a more windows-y approach: http://blog.teamtreehouse.com/installing-rails-5-windows 
3. Setting up a rails environment on windows is a wonky and very personal process. No single guide will get everything working and avoid all potential bugs. 
4. If given a choice, I would recommend either installing the linux subsystem or installing an ubuntu partition on your machine. 


### Gems

jQuery-Rails: Used to provide the functionality of the jQuery library in the Javascript chunks on each view.

Nokogiri: An XML parser that is used to parse the Folger's Shakespeare texts and put the words, scenes, and Ac

Devise: Devise is a gem used to setup user accounts and encrypted logins on the website.

Boostrap-Sass: Bootstrap is a gem that helps set up basic UI elements, primarily the site navigation bar.

sqlite3: Gem that simplifies connection between Ruby on Rails and sqlite3.

## Installation
Make sure to install any and all prerequisites before attempting these steps (See above)
1. Clone this repo with `git clone https://github.com/hmc-cs-mpalanker/EIJA.git`
2. Enter the relevant directory with `cd script_editor`
3. Install the above mentioned gems with the command `bundle install`
4. Seed the database to your liking (see the Seeding section below)
5. Run the app! enter the command `rails s` to begin the web server, and point your favorite web browser to `localhost:3000` or the url of your server 

## Seeding
Our project requires parsing the folger’s shakespeare XML which can take quite some time depending on your hardware. We have a testing “demo” mode enabled by default. Follow the steps below to seed the databse (with optional step 0 for switching to full deployment mode)

0. Go into the script_editor/db/ directory and edit the seeds.rb file: Switch `fullPlays = false` to `fullPlays = true` If you want to seed all of the plays into the database.
1. In the script_editor directory enter these commands `rails db:migrate`
2. `rails db:seed`
3. Wait as the database populates (this should only take a max of 10 minutes if you are seeding the testing play, but upwards for 2 hours for seeding all of the plays.


## Functionality

All of our functionality is designed around Professor Dadabhoy’s needs for her Shakespeare class. Students needs to be able to easily create and modify edits, see exactly how much of the play they have cut, and be able to easily return to previously made edits.  Professor Dadabhoy needs to be able to easily access students edits to evaluate their work. What follows is a list of features that work towards these goals:

Play Selection: The front page will display a complete list of Shakespeare’s works, sorted by category. The user can select any play and make an edit of it.

Account Registration/Login/Logout: The user can easily register for an account, which is necessary to create edits. Account registration requires some basic information the user, including name, email, major, class year, and whether or not they are currently enrolled in Professor Dadabhoy’s Shakespeare class. Once an account is made, users can easily log out of it and log back in using their email and password.

Display: Every play can be viewed in a basic display mode where no cuts can be made. The user should be able to easily navigate throughout this view through a navigation bar on the left side of the display. If the user would like to make an edit of this particular play, they will easily be able to make an edit through a button the right side of the display.

Edits: Users will be able to make edits easily through the edit button on the display. Once an edit is made, it can easily be changed by striking or un-striking in the edit and saving those changes. Saved edits can be easily accessed later through the user’s profile page.

Cuts: Users can make cuts when on an edit by clicking on the word they would like to cut. If they would like to cut more than one word at a time, then they can click on the first word they would like to cut out and then drag their mouse to the last word they would like to cut out. This will cut out all words in between as well. If a user would like to undo a cut, they can shift-click on the words they would like to uncut, or shift-click and drag, as with cutting. All of this is explained within the edit view to make sure that the user knows how to make and lift cuts.

Analytics: Within the navigation bar is an analytics button that users can click to see some analytics about the current cut of the play. It compares the total number of words in each scene and act to the current number of words in the same scene or act in the current edit.

## Known Problems

- Occasionally, when the play is loaded, there will be a word/series of words that, when you attempt to cut them, will gray our the entirety of the script, and strikethrough everything in the script BUT the cuttable words (headings, spaces, everything). We are unsure how to recreate this error, the pattern is inconsistent.
-Stage directions in the play are all off by at least a line. We thought we'd fixed this problem earlier in the project, and by the time we realized we had not we didn't have the time to fix it. This is simply true everywhere, nothing needs to be done to recreate it.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

