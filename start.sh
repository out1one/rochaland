#!/bin/bash

MC_VERSION="1.21.10"
MC_RAM="2G"
MC_URL="https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar"

rm -f server.jar
echo "Descargando server.jar versión $MC_VERSION..."
curl -f -O "$MC_URL" || { echo "Error al descargar server.jar"; exit 1; }

echo "eula=true" > eula.txt

echo "Iniciando Minecraft Server versión $MC_VERSION con $MC_RAM de RAM..."
java -Xmx$MC_RAM -Xms$MC_RAM -jar server.jar nogui




