#!/bin/bash
source .cod4env

cd "$GAME"
./cod4x18_dedrun$BIN_PREFIX +set fs_game "mods/adr_speedrun" +set dedicated 2 +set net_port 28960 +set developer 0 +exec server.cfg +map mp_sr_pure_strafe +set fs_basepath "$GAME" +set fs_homepath "$GAME"
