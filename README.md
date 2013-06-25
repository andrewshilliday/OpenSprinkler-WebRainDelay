[OpenSprinkler Web-based Rain Delay](https://github.com/andrewshilliday/OpenSprinkler-WebRainDelay)
========================

A simple script to monitor current weather conditions via Yahoo's weather API and impose a rain delay on the OpenSprinkler interval program. The delay is configurable for each weather condition status code.

Overview:
---------

+ Script has been tested with the interval program on the OpenSprinkler for Raspberry Pi (OSPi).  It should also be capable of functioning with the OpenSprinkler.

+ Script is executed via a crontab (or any other scheduling system).  

Dependencies:
---------
+ bash

+ curl

+ grep

+ xsltproc (for parsing the response from the Yahoo Weather API)

Install:
---------
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
---------

+ Open raindelay.sh in your favorite editor

+ Set the variables following variables
  + ```loc``` - the WOEID of your Yahoo Weather location. Go [here](http://developer.yahoo.com/weather/) for more information.
  
  + ```os``` - the URL for the interval program running on your OpenSprinkler or OSPi (this should be the URL you can browse to interface with the device).

  + ```pw``` - the password for the interval program. Ray's default is opendoor.

Configure the delays:
---------

+ Open yahoo_weather.csv in your favorite editor.

+ Each line in the CSV file corresponds to a weather code returned by Yahoo's weather API. They are detailed [here](http://developer.yahoo.com/weather/#codes).

+ Change the thrid column of each line as described below. Do not alter the first two columns of any line in the file.

+ For each code, you can set the delay (in hours) to be sent to the interval program when that weather condition is encountered. For example, the line

  ```3,severe thunderstorms,48```

  indicates that a 48 hour delay will be imposed when sever thunderstorms are encountered.

+ If the delay is left blank (as in the following), no change will be sent to the OpenSprinkler.  Any existing delays will remain intact.

  ``` 19,dust,```
  
+ To force that any existing delay is canceled when a condition occurs, put a zero in the thrid column, as in

  ```36,hot,0```

Scheduling the script to run:
---------

To run the script automatically, set it up as a recurring cron job.  For example,

+ ```crontab -e```

+ ```*/5 * * * * /home/pi/webraindelay/raindelay.sh```
  
+ This will cause the script to be run every five minutes. 

That's it.
-------
