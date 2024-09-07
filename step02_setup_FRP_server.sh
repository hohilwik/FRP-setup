#!/bin/bash

# directory where FRP was extracted
# should probably add the versioning option to this as well
FRP_DIR="frp_0.50.0_linux_amd64"

# config file path
FRP_CONFIG_FILE="${FRP_DIR}/frps.ini"
echo "Creating FRP server configuration file..."

echo "[common]" > $FRP_CONFIG_FILE
echo "bind_port = 7000" >> $FRP_CONFIG_FILE

if [ -f "$FRP_CONFIG_FILE" ] && [ -w "$FRP_CONFIG_FILE" ]; then
    echo "FRP server config file created successfully"
else
    echo "Failed to create FRP server config file"
    exit 1
fi

# Start the FRP server
echo "Starting FRP server..."
cd $FRP_DIR
./frps -c frps.ini &

if [ $? -ne 0 ]; then
    echo "FRP server failed to start"
    exit 1
fi

echo "FRP server started successfully!"
