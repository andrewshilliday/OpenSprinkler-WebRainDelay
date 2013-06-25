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

Install:
-------
+ You first need a working OpenSprinkler setup that you can access via a browser
  + For further information please refer to the OpenSprinkler online user manual available on [Ray's Website](http://rayshobby.net/?page_id=192)

+ Install prerequisites (all but xsltproc are installed by default on Raspbian)
  + ```sudo apt-get install bash curl grep xsltproc```

+ Create the directory you wish to place the files in (ex. /home/pi/webraindelay)
  + ```mkdir /home/pi/webraindelay```

+ Download the files using git:
  + ```git clone https://github.com/andrewshilliday/OpenSprinkler-WebRainDelay.git /home/pi/webraindelay```

+ Ensure that raindelay.sh is executable
  + ```sudo chmod a+x /home/pi/webraindelay/raindelay.sh```

Configure raindelay.sh:
________________

+ Open raindelay.sh in your favorite editor

+ Set the variables following variables
  + ```loc``` (this should be set to the ID of your Yahoo Weather location)
  
