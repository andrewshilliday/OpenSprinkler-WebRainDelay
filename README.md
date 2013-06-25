[OpenSprinkler Web-based Rain Delay](https://github.com/andrewshilliday/OpenSprinkler-WebRainDelay)
========================

A simple script to monitor current weather conditions via Yahoo's weather API and impose a rain delay on the OpenSprinkler interval program. The delay is configurable for each weather condition status code.

Overview:
---------

+ Script has been tested with the interval program on the OpenSprinkler for Raspberry Pi (OSPi).  It should also be capable of functioning with the OpenSprinkler.

+ Script is executed via a crontab (or any other scheduling system).  

Dependencies:
-------------
+ bash

+ curl

+ grep

+ xsltproc (for parsing the response from the Yahoo Weather API)

Setup:
------

+ Install dependencies (all but xsltproc are installed by default on Raspbian)
  + sudo apt-get install bash curl grep xsltproc


