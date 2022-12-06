#!/bin/bash

filename=cdo-v4.20.zip
url=https://github.com/PioBeat/CDO-Server-as-Docker-Container/releases/download/v4.20/${filename}

echo "Starting the configuration process now ..."

echo "[1] Downloading Eclipse CDO Server from ${url} ..."
wget ${url} -P ./

echo "[2] Extracting the archive '${filename}' now ..."
unzip ./${filename}
echo "[3] Finished extraction of archive '${filename}'."

echo "[4] Configuration process completed."
