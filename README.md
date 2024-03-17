
[![Docker Image CI](https://github.com/f1d094/alarmdecoder-mqtt/actions/workflows/docker-image.yml/badge.svg)](https://github.com/f1d094/alarmdecoder-mqtt/actions/workflows/docker-image.yml)
[![codeql](https://github.com/f1d094/alarmdecoder-mqtt/actions/workflows/codeql.yml/badge.svg)](https://github.com/f1d094/alarmdecoder-mqtt/actions/workflows/codeql.yml)

#### AlarmDecoder to MQTT Bridge (alarmdecoder-mqtt)

Simple Python application to interface [AlarmDecoder](https://github.com/nutechsoftware/alarmdecoder) with a [MQTT Broker](https://en.wikipedia.org/wiki/MQTT).

Designed to work with [Home Assistant](https://www.home-assistant.io/).  
Uses MQTT discovery to create sensors for all zones and the alarm panel
automatically.  Times are passed in the MQTT messages and retained so they
can be used to create real "last changed" time sensors if desired in HASS.

##### Direct python execution
```
git clone https://github.com/f1d094/alarmdecoder-mqtt.git
python3 -m venv venv
./venv/bin/pip install -r requirements.txt

[ Edit run-with-vars.sh and devices.py accordingly ]

./run-with-vars.sh
```

##### Direct Docker Execution
Example docker execution with some parameters passed as environment vars. 
Please notice the mandatory devices.py mapping.

```
sudo docker run -e ADMQTT_SOCKET_HOST=192.168.1.71  
  -e ADMQTT_MQTT_HOST=192.168.1.6 
  -e ADMQTT_LOG_LEVEL=DEBUG 
  -e ADMQTT_ALARM_CODE=4321
  -v /home/user/devices.py:/home/devices.py -d alarmdecoder-mqtt:latest
```
Use devices.py file in this repo as example file for configuring your zones.
Check run-with-vars.sh for available environment variables.

##### Docker Compose
Example docker compose file:
```

version: "3"
services:
  alarmdecoder-mqtt:
    image: f1d094/alarmdecoder-mqtt:latest
    container_name: alarmdecoder-mqtt
    environment:
      - ADMQTT_SOCKET_HOST=192.168.1.71
      - ADMQTT_MQTT_HOST=192.168.1.6
      - ADMQTT_LOG_LEVEL=DEBUG
      - ADMQTT_ALARM_CODE=4321
    volumes:
      - /mnt/data/docker-data/alarmdecoder-mqtt-data/devices.py:/home/devices.py
    restart: unless-stopped

```
Note device.py mounting and environment parameters.

##### Changelog

###### Version: 0.3.2
 - Forked from rgriffogoes/ad-mqtt 
 - Fixed encrytion in run.py to use dict entries
 - Updated requirements.txt to use modified insteon-mqtt locked to puha-mqtt<=1.6.1
 - Added notes in devices.py on where to find the data to populate it (Vista 20p)
 - Updated Dockerfile to use bookworm, which has images for ARM64
 - Updated workflow to create docker image f1d094/alarmdecoder-mqtt

###### Version: 0.3.1
 - Adding Device attribute in discovery (sn3ak)
 - Adding codeql in repo workflow

###### Version: 0.3.0
 - Environment variables for major configurations
 - External zone config file
 - Dockerfile for containerized execution
 - Github workflow to build and push docker image
 - Updating README to include further instruction, descripiton and changelog

###### Version: 0.2.3
 - Initial changelog recording
