#!/bin/bash

# Configuración
MC_VERSION="1.21.10"
MC_RAM="2G"
MC_URL="https://launcher.mojang.com/v1/objects/5c66f446e5ff02029136f8c80e07a892d0957c34/server.jar"

# Descargar server.jar si no existe
if [ ! -f server.jar ]; then
    echo "server.jar no encontrado, descargando..."
    curl -o server.jar $MC_URL
fi

# Aceptar EULA automáticamente
if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
fi

# Iniciar el servidor
echo "Iniciando Minecraft Server versión $MC_VERSION con $MC_RAM de RAM..."
java -Xmx$MC_RAM -Xms$MC_RAM -jar server.jar nogui

