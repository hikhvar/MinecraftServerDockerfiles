#!/bin/bash


docker run -i -d --name minecraft_server_1.1.0  --user $(id -u minecraft) -p 25566:25565 -v /data/minecraft/tekkit_legends_server_v1.1.0/workdir/world:/minecraftserver/world legends_server_1.1.0
