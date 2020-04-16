#!/bin/bash

filename=eclipse-cdo-server-oxygen-x64.tar.gz
url=https://github.com/PioBeat/CDO-Server-as-Docker-Container/releases/download/v1.0.0/${filename}

echo "Starting the configuration process now ..."

echo "[1] Downloading Eclipse CDO Server from ${url} ..."
wget ${url} -P ./

echo "[2] Extracting the archive '${filename}' now ..."
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/plugins/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/features/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/dropins/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/eclipse
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/icon.xpm
echo "[3] Finished extraction of archive '${filename}'."

echo "[4] Copying the configuration now ..."
\cp -rf ./etc/* ./cdo-server-oxygen-docker/
echo "[5] Finished copying the configuration."

echo "[6] Configuration process completed."
