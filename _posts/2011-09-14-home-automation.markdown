---
title: Home Automation
layout: post
tags: [make,electronics]
---

I was always intrigued by the idea of automating the routine parts of my
life. Over the years, I looked at different technologies and approaches,
but I couldn’t find an approach that would be both simple and cheap and
open to tinkering. Finally, thanks to a colleague, I
discovered [Arduino](http://www.arduino.cc/) - an awesome platform
supplemented by a lively community of makers. I have quite a few
projects in the works and I’m going to post the details here.

Some relevant
links: [arduino](https://sud.to/tag/arduino/), [electronics](https://sud.to/tag/electronics/), [home
automation](https://sud.to/tag/homeautomation/).

### X10 Motion+Light Sensor

This was my very first Arduino project. It’s still working off of a
breadboard and is still controlling lights in my home office. Some day
I’m gonna replace X10 with XBee and build a bunch of these to place all
around the house.

### Attic Fan Thermostat

This is my first big project related to Home Automation. There are two
sensors on the thermostat - temperature and relative humidity. The
thermostat can work either completely autonomously - monitor and
broadcast sensor readings and control the fan appropriately.
Alternatively, it can pass control to my home automation system (via
ZigBee wireless mesh network) which would decide when to turn the fan on
based on data it receives from multiple sources. The thermostat sensor
data is also dumped
to [bot.sud.to](http://bot.sud.to/datastream/attic1fan_temperature) for
testing and demonstration purposes.

### Garage Parking Assistant

This device serves dual purpose - helps to park perfect distance from
the wall every time and feed the car presence data to the home
automation system via ZigBee wireless mesh network.

### Garage Door Sensor/Opener (TODO)

This project will consist of four sensors - two for each door in my
garage - and two relays to control the doors. It will also share door
status and listen to remote commands via ZigBee wireless mesh network.

### Weather Station (TODO)

The goal is to build a complete weather station from scratch. The
station will be completely solar powered, will communicate with the home
automation system via ZigBee wireless mesh network and will include the
following sensors:

-   Temperature
-   Relative Humidity
-   Atmospheric Pressure
-   Light Sensor
-   Anemometer
-   Wind Vane
-   Rain Gauge

### Car Seat Memory (TODO)

My Jeep has power seats, but no memory. I think adding a couple of
memory buttons should be trivial by using multi-turn pots as position
sensors.

​
