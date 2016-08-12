Ruby JAM
--------

A time/buzz/topic tracker for Just A Minute games.

Setup
-----

* Install Ruby
* Install Rubygems
* bundle install
* Plug in the controllers from the playstation game, Buzz.

Configuration
-------------

To set up for a game of Just A Minute:

* Check screen resolution, if necessary add it to config/window.yml
* Put your desired subjects in to a file in topics/
* modify config/config.yml (more info in 
  * window\_type - a config from window.yml, including resolution and a full screen flag.
  * topics - a file from topics/ with the topics you'll play with 
* Configure panellists in config/panellists.yml
  * name1 - line one of their name, usually a first name
  * name2 - line two of their name, usually a surname
  * buzzer - the name of an audio file in audio/ which will sound as their buzzer
 
More detailed information in /docs/game/setup.md 
 
Operation
---------

`ruby game.rb`

By default, this will restore from the last game data.
You probably don't want this
To start from a clean game, hit some keys, then press enter.

Keys
----

|  key       | control          |
|------------|------------------|
|   .        | start/stop theme music |
| space      | start timer      |
|   P        | Next subject     |
|   O        | Previous subject |
| 1, 2, 3, 4 | Simulate buzz (testing only) |
| Q, W, E, R | Increase score   |
| A, S, D, F | Decrease score   |
| esc        | Exit             |

Docs
----

There's some more in-depth information available in the docs/ folder.

/docs/game/cheat_sheet.md

This is information about how to play the game of Just A Minute. Distribute this
to all panellists prior to a game. 

/docs/game/setup.md

This is a setup checklist to ensure everything is ready for the show.
Including detailed information about the config files.

/docs/tech/reporters.md

Explains the purpose of ruby-jam reporters. What is required to make one
and how they can be used and configured.