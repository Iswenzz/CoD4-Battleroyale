#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v _images.iwd
rm -v _sounds.iwd
rm -v _weapons.iwd

# SR
cd "$SR/assets"
7z a -r -tzip "$MOD/_images.iwd" images/*
7z a -r -tzip "$MOD/_sounds.iwd" sound/*
7z a -r -tzip "$MOD/_weapons.iwd" weapons/*

# IWDs
cd "$MOD/assets"
7z a -r -tzip "$MOD/_images.iwd" images/*
7z a -r -tzip "$MOD/_sounds.iwd" sound/*
7z a -r -tzip "$MOD/_weapons.iwd" weapons/*
cd "$MOD/scripts"
