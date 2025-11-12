#!/bin/bash

MC_VERSION="1.21.10"
MC_RAM="2G"
MC_URL="https://launcher.mojang.com/v1/objects/fd5d45a0f0d35d06eaf78a8d4210f9f9de4f3f4b/server.jar"

rm -f server.jar
echo "Descargando server.jar versión $MC_VERSION..."
curl -f -O "$MC_URL" || { echo "Error al descargar server.jar"; exit 1; }

echo "eula=true" > eula.txt

echo "Iniciando Minecraft Server versión $MC_VERSION con $MC_RAM de RAM..."
java -Xmx$MC_RAM -Xms$MC_RAM -jar server.jar nogui



