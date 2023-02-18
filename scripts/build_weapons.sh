#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v mod.ff

# SR
cd "$SR/assets"
cp -rv animtrees "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv weapons "$GAME/raw"

# Assets
cd "$MOD/assets"
cp -v mod.csv "$GAME/zone_source"
cp -rv animtrees "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv weapons "$GAME/raw"

# Compile
cd "$GAME/bin"
./linker_pc -language english -compress -cleanup mod
cp -v "$GAME/zone/english/mod.ff" "$MOD/mod.ff"
