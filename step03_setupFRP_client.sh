#!/bin/bash

# modify the IP for each server. Not giving this as argument so that it can be hardcoded

# FRP directory
FRP_DIR="frp_0.50.0_linux_amd64"

# Set the IP address of the public server
FRP_SERVER_IP="your-public-server-ip"

# config file path
FRP_CONFIG_FILE="${FRP_DIR}/frpc.ini"
echo "Creating FRP client configuration file..."

echo "[common]" > $FRP_CONFIG_FILE
echo "server_addr = ${FRP_SERVER_IP}" >> $FRP_CONFIG_FILE
echo "server_port = 7000" >> $FRP_CONFIG_FILE
echo "" >> $FRP_CONFIG_FILE
echo "[ssh]" >> $FRP_CONFIG_FILE
echo "type = tcp" >> $FRP_CONFIG_FILE
echo "local_ip = 127.0.0.1" >> $FRP_CONFIG_FILE
echo "local_port = 22" >> $FRP_CONFIG_FILE
echo "remote_port = 6000" >> $FRP_CONFIG_FILE

if [ -f "$FRP_CONFIG_FILE" ] && [ -w "$FRP_CONFIG_FILE" ]; then
    echo "FRP client config file created successfully"
else
    echo "Failed to create FRP client config file"
    exit 1
fi

# Start the FRP client
echo "Starting FRP client..."
cd $FRP_DIR
./frpc -c frpc.ini &

if [ $? -ne 0 ]; then
    echo "FRP client failed to start"
    exit 1
fi

echo "FRP client started successfully!"
