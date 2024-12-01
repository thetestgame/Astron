#!/bin/bash
# Check if the LOG_LEVEL environment variable is set, otherwise set to default 'info'
LOG_LEVEL=${LOG_LEVEL:-info}

# Check if the CONFIG_FILE environment variable is set, otherwise set to default 'astrond.yml'
CONFIG_FILE=${CONFIG_FILE:-astrond.yml}

# Run the astrond command with the specified log level and config file
./astrond -l "$LOG_LEVEL" "$CONFIG_FILE"
