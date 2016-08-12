Reporters
=========

A reporter is an object which reads data from the timer,
panellists and topics and reports it to another entity.

Currently there is only the CommandLineReporter, which 
displays a facsimile of the projection window in the 
command line using puts.

Possible others:

* A game log
* Web service calls

Attributes (in the `reporters:` attribute of config/config.yml):

* **class:** The class of your reporter
* **active:** true if you want to report using this reporter class

For specific classes:

* CommandLineReporter
  * **width:** total width in characters of the output
  * **player_width:** width in characters of each panellist
* RecoveryReporter

Contract for a reporter
-----------------------

* Ruby file in lib/reporters/
* A class name ending in Reporter
* An 'initialize' method with 2 arguments
  * **window:** The Window object the data will be pulled from
  * **config:** (hash) Any additional configuration, passed
                in from config/config.yml
* A 'report' method which will be called when data changes.
  * Report may read data from ruby-jam, but not change any.

Adding a reporter
-----------------

Once we have a Reporter class, add it to the `reporters:`
attribute in config/config.yml 