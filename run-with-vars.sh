#!/bin/bash

# Wrapper for run.py that sets the envionment variables first

ADMQTT_RESTORE_ON_STARTUP="False"

# AlarmDecoder ser2net or ser2sock server settings
ADMQTT_SOCKET_HOST="127.0.0.1"
ADMQTT_SOCKET_PORT="10000"

# Use FQDN / Common Name (CN) of the MQTT server or verify IP address is in SAN if using encrypted MQTT
# Otherwise the connection will fail
ADMQTT_MQTT_HOST="127.0.0.1"
ADMQTT_MQTT_PORT="1883"
ADMQTT_MQTT_USERNAME=""
ADMQTT_MQTT_PASSWORD=""
ADMQTT_MQTT_CA_CERT=""
ADMQTT_MQTT_CERTFILE=""
ADMQTT_MQTT_KEYFILE=""
ADMQTT_LOG_LEVEL="INFO"
ADMQTT_LOG_SCREEN="True"
ADMQTT_LOG_FILE=""
ADMQTT_ALARM_CODE="1234"

$(realpath $0)/run.py
