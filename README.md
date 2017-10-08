# Shakespeare Script Editor (MLCH)

The Shakespeare Script Editor is a website made by team MLCH for CS121: Software Development in the Spring 2017 semester. The website allows users to choose a Shakespeare from a list or find one using a search bar, read the play, and cut words from the play. The script editor also analyzes each play, providing line numbers, a synopsis, and a navigation bar with the number of acts and scenes in the play.

## Installation

Prerequisites: install Ruby/Rails and git on your machine

1. Clone the repo: `git clone https://github.com/hmc-cs-lnorgaard/MLCH.git`
2. cd into the script_editor folder
2. Install gems: Nokogiri, bootstrap,
    use the command `bundle install` in terminal to install gems
3. Run the app: use the command `rails s` in terminal, then navigate to
    localhost:3000 in your prefered browser

## Usage

To run the website on localhost:

in terminal:

`cd MLCH`

`cd script_editor`

`rails s`

in browser:

localhost:3000


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

5/4/2017: Version 1.0
  
  Implemented Features:
    Homepage
    Search Bar
    Formatted Play Display
    Editing interface
    Internal Play Navigation
    Synopsis
    
## Credits

Contributors: Mahlet Melaku, Holly Mitchell, Lee Norgaard, Crystal Xiang

Client: Prof. Benjamin Wiedermann

CS121 Professor: Yekaterina Kharitonova

## Research

*  the HTML/CSS elements of this website were researched using https://w3schools.com.

* The lack of browser highlighting when editing a script was created by code from
    https://paulund.co.uk/disable-text-highlighting-with-css.

## License

See LICENSE.txt
