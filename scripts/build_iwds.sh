#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v _images.iwd
rm -v _sounds.iwd
rm -v _weapons.iwd
rm -v _z.iwd
rm -v _zz.iwd

# SR
cd "$SR/assets"
7z a -r -tzip "$MOD/_images.iwd" images
7z a -r -tzip "$MOD/_sounds.iwd" sound
7z a -r -tzip "$MOD/_weapons.iwd" weapons
7z a -r -tzip "$MOD/_z.iwd" misc/iwds/_z
7z rn "$MOD/_z.iwd" misc/iwds/_z sound

# IWDs
cd "$MOD/assets"
7z a -r -tzip "$MOD/_images.iwd" images
7z a -r -tzip "$MOD/_sounds.iwd" sound
7z a -r -tzip "$MOD/_weapons.iwd" weapons
cd "$MOD/scripts"
