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

* Check screen resolution, if necessary add it to config/window.yml
* modify config/config.yml
** window\_type - a config from window.yml, including resolution and a full screen flag.
** topics - a file from topics/ with the topics you'll play with
* Configure panellists in config/panellists.yml
** name1 - line one of their name, usually a first name
** name2 - line two of their name, usually a surname
** buzzer - the name of an audio file in audio/ which will sound as their buzzer
 
Operation
---------

`ruby game.rb`

Keys
----

|  key       | control          |
|------------|------------------|
|   .        | start/stop theme |
| space      | start timer      |
|   P        | Next subject     |
|   O        | Previous subject |
| 1, 2, 3, 4 | Simulate buzz (testing only) |
| Q, W, E, R | Increase score   |
| A, S, D, F | Decrease score   |
| esc        | Exit             |