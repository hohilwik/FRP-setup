#!/bin/bash

# FRP version
FRP_VERSION="0.50.0"
FRP_ARCH="linux_amd64"
FRP_TAR="frp_${FRP_VERSION}_${FRP_ARCH}.tar.gz"
FRP_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_TAR}"

echo "Downloading FRP version ${FRP_VERSION}..."
wget -q $FRP_URL -O $FRP_TAR

if [ $? -ne 0 ]; then
    echo "Download failed"
    exit 1
fi

echo "Extracting FRP..."
tar -xzf $FRP_TAR

if [ $? -ne 0 ]; then
    echo "Extraction failed. Check downloaded file"
    exit 1
fi

echo "FRP downloaded and extracted successfully"

# Cleanup
rm -f $FRP_TAR

echo "FRP is ready to use"
