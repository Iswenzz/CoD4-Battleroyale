#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v mod.ff

# SR
cd "$SR/assets"
cp -rv english "$GAME/raw"
cp -rv info "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv ui "$GAME/raw"
cp -rv ui_mp "$GAME/raw"

# Assets
cd "$MOD/assets"
cp -v mod.csv "$GAME/zone_source"
cp -rv english "$GAME/raw"
cp -rv info "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv ui "$GAME/raw"
cp -rv ui_mp "$GAME/raw"

# Compile
cd "$GAME/bin"
./linker_pc -language english -compress -cleanup mod
cp -v "$GAME/zone/english/mod.ff" "$MOD/mod.ff"
