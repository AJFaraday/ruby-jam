Setting up a game
=================

Setup stages for a game of Just A Minute

-------------------------

Define your topics in a file in topics/. Add a .txt file
and define a new topic on each line.

-------------------------

change config/panellists.yml

* **name1:** First line of the panellists name
* **name2:** Second line of the panellists name
* **buzzer:** The sound this panellists buzzer will make. The name of a .ogg file from audio/
 
Define them in the order they are sitting, the panels
left-hand side, to their right.

-------------------------
 
change config/config.yml

* **window_type:** the size and shape of the window
  * dev - a small development window
  * dev_square - a 4:3 development window
  * dev_wide - a 16:9 development window
  * laptop_screen - The size of my laptop screen
  * square_screen - a 1024x768 4:3 screen, full.
  * full_hd - A full HD, 1080 16:3 screen, full.
  * If required, add more settings in config/window.yml
* **topics:** Topics for the game, a .txt file in topics/
* **reverse:** Boolean, should the projection display be in
               reverse order? If the projection is behind
               the panel, set this to true.
* **reporters:** Reporter objects used to distribute
                 information about the panel, timer and topics.
  * **class:** The class of object to be created
  * **active:** Will this object be created?
  * Other config as required...
  

(for more information about reporters look at docs/tech/reporters.md)  
              
-------------------------

Plug in the buzzers.
Distribute them to the panellists, their left to their right.

(always mark buzzers to speed this process up)

-------------------------

Start app:

`ruby game.rb`

-------------------------

Checklist:

* Pressing space starts the timer.
* pressing 1, 2, 3 or 4 makes a buzz sound.
* Both hosts screen and projector represent where the panel are sitting.
* Press a buzzer
  * The buzz sounds
  * The buzzer lights up
  * The correct name changes

