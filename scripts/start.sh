#!/bin/bash
source .cod4env

cd "$GAME"
./cod4x18_dedrun$BIN_PREFIX +set fs_basepath "$GAME" +set fs_homepath "$GAME" +set fs_game "mods/$NAME" +set net_port 28960 +set developer 0 +set gscunit 0 +exec server.cfg +map mp_br_blackout
