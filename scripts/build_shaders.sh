#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v mod.ff

# SR
cd "$SR/assets"
cp -rv deffiles "$GAME"
cp -rv shader_bin "$GAME/raw"
cp -rv techniques "$GAME/raw"
cp -rv techsets "$GAME/raw"
cp -v techsets/* "$GAME/raw/techsets/sm2"

# Assets
cd "$MOD/assets"
cp -v mod.csv "$GAME/zone_source"
cp -rv deffiles "$GAME"
cp -rv shader_bin "$GAME/raw"
cp -rv techniques "$GAME/raw"
cp -rv techsets "$GAME/raw"
cp -v techsets/* "$GAME/raw/techsets/sm2"

# Shaders
cd "$GAME/raw/shader_bin"
./shader_tool sr_blur_1d17d24e40 sr_edge_0cef709725 sr_glitch_06d9976ae5 sr_psy_glass_11d46ca201 sr_shake_9b04eed583 sr_translate_2fb01cf446 sr_vhs_e7a0beb465 sr_zoom_80ced10fcc sr_psy_edge_b3874b4a78 sr_mirror_52ec30e684 sr_volumetric_clouds_373849a5fc sr_hexagon_83d54f6fd6 sr_aurora_160a9bd1d3 sr_space_curvature_80a4ee4278 sr_grid_dcfcfec4a3 sr_spray_ec8ef9ff77 sr_loader_98d163c731

# Compile
cd "$GAME/bin"
./linker_pc -language english -compress -cleanup mod
cp -v "$GAME/zone/english/mod.ff" "$MOD/mod.ff"
