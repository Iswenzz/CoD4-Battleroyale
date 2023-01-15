#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v mod.ff
cp -rv maps/mp/gametypes "$GAME/raw/maps/mp"

# SR
cd "$SR/assets"
cp -rv animtrees "$GAME/raw"
cp -v configs/* "$GAME/raw"
cp -rv source_data "$GAME"
cp -rv english "$GAME/raw"
cp -rv fx "$GAME/raw"
cp -rv images "$GAME/raw"
cp -rv material_properties "$GAME/raw"
cp -rv materials "$GAME/raw"
cp -rv info "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv rumble "$GAME/raw"
cp -rv soundaliases "$GAME/raw"
cp -rv sound "$GAME/raw"
cp -rv deffiles "$GAME"
cp -rv shader_bin "$GAME/raw"
cp -rv techniques "$GAME/raw"
cp -rv techsets "$GAME/raw"
cp -v techsets/* "$GAME/raw/techsets/sm2"
cp -rv ui "$GAME/raw"
cp -rv ui_mp "$GAME/raw"
cp -v weapons_maps/* "$GAME/raw/weapons"
cp -v weapons_mod/* "$GAME/raw/weapons"
cp -rv vision "$GAME/raw"
cp -rv xanim "$GAME/raw"
cp -rv xmodel "$GAME/raw"
cp -rv xmodelparts "$GAME/raw"
cp -rv xmodelsurfs "$GAME/raw"

# Assets
cd "$MOD/assets"
cp -v mod.csv "$GAME/zone_source"
cp -rv animtrees "$GAME/raw"
cp -v configs/* "$GAME/raw"
cp -rv english "$GAME/raw"
cp -rv fx "$GAME/raw"
cp -rv images "$GAME/raw"
cp -rv material_properties "$GAME/raw"
cp -rv materials "$GAME/raw"
cp -rv info "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv rumble "$GAME/raw"
cp -rv soundaliases "$GAME/raw"
cp -rv sound "$GAME/raw"
cp -rv deffiles "$GAME"
cp -rv shader_bin "$GAME/raw"
cp -rv techniques "$GAME/raw"
cp -rv techsets "$GAME/raw"
cp -v techsets/* "$GAME/raw/techsets/sm2"
cp -rv ui "$GAME/raw"
cp -rv ui_mp "$GAME/raw"
cp -rv weapons_maps/* weapons
cp -rv weapons_mod/* weapons
cp -rv weapons "$GAME/raw"
cp -rv vision "$GAME/raw"
cp -rv xanim "$GAME/raw"
cp -rv xmodel "$GAME/raw"
cp -rv xmodelparts "$GAME/raw"
cp -rv xmodelsurfs "$GAME/raw"

# Shaders
cd "$GAME/raw/shader_bin"
./shader_tool sr_blur_1d17d24e40 sr_edge_0cef709725 sr_glitch_06d9976ae5 sr_psy_glass_11d46ca201 sr_shake_9b04eed583 sr_translate_2fb01cf446 sr_vhs_e7a0beb465 sr_zoom_80ced10fcc sr_psy_edge_b3874b4a78 sr_mirror_52ec30e684 sr_volumetric_clouds_373849a5fc sr_hexagon_83d54f6fd6 sr_aurora_160a9bd1d3 sr_space_curvature_80a4ee4278 sr_grid_dcfcfec4a3 sr_spray_ec8ef9ff77 sr_loader_98d163c731

# Compile
cd "$GAME/bin"
./linker_pc -language english -compress -cleanup mod
cp -v "$GAME/zone/english/mod.ff" "$MOD/mod.ff"
