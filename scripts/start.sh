#!/bin/bash
source .cod4env

cd "$GAME"
gdb -batch -ex run -ex bt 10 --args cod4x18_dedrun$BIN_PREFIX +set fs_game "mods/$NAME" +set dedicated 2 +set net_port 28960 +set developer 0 +exec server.cfg +map mp_br_blackout +set fs_basepath "$GAME" +set fs_homepath "$GAME" +set r_xassetnum "weapons=200 xmodel=1200 xanim=3200 material=3200 image=3200 fx=600" +set gscunit 0 +set br_debug 1
