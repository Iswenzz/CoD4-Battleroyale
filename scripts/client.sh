#!/bin/bash
source .cod4env

cd "$GAME"
$BIN_START iw3mp +set fs_game "mods\\$NAME" +developer 1 +connect 127.0.0.1
