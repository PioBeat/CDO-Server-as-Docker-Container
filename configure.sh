#!/bin/bash
filename=eclipse-bare-cdo.tar.gz

echo "Starting the configuration process now ..."
# TODO: we have to use our own "eclipse-stub" and cannot download a version
# it is only possible to install it via the eclipse installer
# echo "[1] Downloading Eclipse first ..."
# wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/R/eclipse-modeling-oxygen-R-linux-gtk-x86_64.tar.gz

echo "[2] Extracting the archive '${filename}' now ..."
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/plugins/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/features/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/dropins/
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/eclipse
tar -xzf ./${filename} -C cdo-server-oxygen-docker/ --strip-components=1 eclipse/icon.xpm
echo "[3] Finished extraction of archive '${filename}'."

echo "[4] Copying the configuration now ..."
\cp -rf ./aux/* ./cdo-server-oxygen-docker/
echo "[5] Finished copying the configuration."

echo "[6] Configuration process completed."
