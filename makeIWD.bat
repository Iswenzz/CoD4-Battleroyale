@ECHO OFF
del _images.iwd
del _sounds.iwd
del _weapons.iwd

7za a -r -tzip _images.iwd images

7za a -r -tzip _sounds.iwd sound
7za a -r -tzip _sounds.iwd dr_songs.cfg

7za a -r -tzip _weapons.iwd weapons_mod
7z rn _weapons.iwd weapons_mod weapons
pause