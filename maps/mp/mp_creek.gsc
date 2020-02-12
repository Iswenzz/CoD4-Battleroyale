/*

  _|_|_|            _|      _|      _|                  _|            
_|        _|    _|    _|  _|        _|          _|_|    _|  _|_|_|_|  
  _|_|    _|    _|      _|          _|        _|    _|  _|      _|    
      _|  _|    _|    _|  _|        _|        _|    _|  _|    _|      
_|_|_|      _|_|_|  _|      _|      _|_|_|_|    _|_|    _|  _|_|_|_|  

Map and GSC Made By SuX Lolz.

Steam: http://steamcommunity.com/profiles/76561198163403316/
Discord: https://discord.gg/76aHfGF
Youtube: https://www.youtube.com/channel/UC1vxOXBzEF7W4g7TRU0C1rw
Paypal: suxlolz@outlook.fr
Email Pro: suxlolz@outlook.fr

*/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.map_authors = "SuX Lolz";
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetExpFog(5000, 50000, 123/255, 155/255, 175/255, 3);
 
	// Map dvar
	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", ".1");
	setdvar("r_glowbloomintensity1", ".1");
	setdvar("r_glowskybleedintensity0", ".1");

	// Mod dvar
	setDvar("br_required_players", 2);
	setDvar("br_debug_mode", 0);

	battleroyale\_auto::createPlanePath((0, 0, 0), (0, 0, 0));
	battleroyale\_auto::createPlanePath((0, 0, 0), (0, 0, 0));
	battleroyale\_auto::createPlanePath((0, 0, 0), (0, 0, 0));
	battleroyale\_auto::createPlanePath((0, 0, 0), (0, 0, 0));

	level.zone = [];
	level.zone[0] = (-2174, -3553, -1094);
	level.zone[1] = (1004, -7828, -815);
	level.zone[2] = (-2672, -13285, -2506);
	level.zone[3] = (273, 1156, -1358);
	level.zone[4] = (-11199, -6826, -3097);
	level.zone[5] = (-20439, -11104, -4304);
	level.zone[6] = (-13530, -1321, -3120);
	level.zone[7] = (7891, -2131, -1258);
	level.zone[8] = (7724, 6727, -1490);
	level.eject_last_coord = (-1008, -6207, 7021);

	thread spawnAssets();
	thread random_weapons();
}

spawnAssets() // coord list randomized with: https://github.com/Iswenzz/SRBR-Assets-Randomizer
{
	// createAssetEntity(ent_name, model, coord)

	mag_beretta = [];
	mag_beretta[0] = (523.9, 4908.5, 187.1);
	mag_beretta[1] = (-3400.7, 5355.0, -70.9);
	for (i = 0; i < mag_beretta.size; i++)
		battleroyale\_auto::createAssetEntity("mag_beretta", "weapon_beretta", mag_beretta[i]);

	mag_colt45 = [];
	mag_colt45[0] = (253.8, 3674.6, 90.9);
	for (i = 0; i < mag_colt45.size; i++)
		battleroyale\_auto::createAssetEntity("mag_colt45", "weapon_colt1911_black", mag_colt45[i]);

	mag_deserteagle = [];
	for (i = 0; i < mag_deserteagle.size; i++)
		battleroyale\_auto::createAssetEntity("mag_deserteagle", "weapon_desert_eagle_silver", mag_deserteagle[i]);

	mag_dragunov = [];
	for (i = 0; i < mag_dragunov.size; i++)
		battleroyale\_auto::createAssetEntity("mag_dragunov", "weapon_dragunov", mag_dragunov[i]);

	mag_m16 = [];
	mag_m16[0] = (90.7, 3896.7, 90.9);
	for (i = 0; i < mag_m16.size; i++)
		battleroyale\_auto::createAssetEntity("mag_m16", "weapon_m16_mp", mag_m16[i]);

	mag_ak47 = [];
	for (i = 0; i < mag_ak47.size; i++)
		battleroyale\_auto::createAssetEntity("mag_ak47", "weapon_ak47", mag_ak47[i]);

	mag_mp44 = [];
	mag_mp44[0] = (-3984, 6105, 244);
	for (i = 0; i < mag_mp44.size; i++)
		battleroyale\_auto::createAssetEntity("mag_mp44", "weapon_mp44", mag_mp44[i]);

	mag_mp5 = [];
	mag_mp5[0] = (-1463.4, 5392.0, 42.9);
	mag_mp5[1] = (-3937, 7811, 257);
	for (i = 0; i < mag_mp5.size; i++)
		battleroyale\_auto::createAssetEntity("mag_mp5", "weapon_mp5", mag_mp5[i]);

	mag_m1014 = [];
	mag_m1014[0] = (-1403.4, 5516.1, 38.9);
	mag_m1014[1] = (-3707, 5672, 244);
	for (i = 0; i < mag_m1014.size; i++)
		battleroyale\_auto::createAssetEntity("mag_m1014", "weapon_benelli_super_90", mag_m1014[i]);

	mag_winchester1200 = [];
	mag_winchester1200[0] = (-1453.3, 5227.4, 45.1);
	mag_winchester1200[1] = (-3138.2, 5919.4, -51.9);
	mag_winchester1200[2] = (-2968, 6703, 384);
	for (i = 0; i < mag_winchester1200.size; i++)
		battleroyale\_auto::createAssetEntity("mag_winchester1200", "weapon_winchest1200", mag_winchester1200[i]);

	mag_45 = [];
	mag_45[0] = (-359.2, 6599.7, 35.3);
	mag_45[1] = (492.3, 4973.6, 49.1);
	mag_45[2] = (-3293, 7005, 232);
	for (i = 0; i < mag_45.size; i++)
		battleroyale\_auto::createAssetEntity("mag_45", "sr_45", mag_45[i]);

	mag_9mm = [];
	for (i = 0; i < mag_9mm.size; i++)
		battleroyale\_auto::createAssetEntity("mag_9mm", "sr_9mm", mag_9mm[i]);

	mag_7_62 = [];
	mag_7_62[0] = (-118.5, 6042.4, 340.3);
	mag_7_62[1] = (-139.5, 7688.7, 0.3);
	mag_7_62[2] = (423.6, 4981.3, 187.1);
	mag_7_62[3] = (478.7, 4099.3, 196.9);
	mag_7_62[4] = (-3129, 6762, 232);
	for (i = 0; i < mag_7_62.size; i++)
		battleroyale\_auto::createAssetEntity("mag_7_62", "sr_7_62", mag_7_62[i]);

	mag_5_45 = [];
	mag_5_45[0] = (-3609, 8003, 257);
	for (i = 0; i < mag_5_45.size; i++)
		battleroyale\_auto::createAssetEntity("mag_5_45", "sr_5_45", mag_5_45[i]);

	mag_12_gauge = [];
	mag_12_gauge[0] = (445.7, 4119.1, 90.9);
	mag_12_gauge[1] = (-3872, 8076, 257);
	mag_12_gauge[2] = (-2770, 7072, 232);
	mag_12_gauge[3] = (-3202, 6882, 232);
	for (i = 0; i < mag_12_gauge.size; i++)
		battleroyale\_auto::createAssetEntity("mag_12_gauge", "sr_gauge", mag_12_gauge[i]);

	mag_flash_grenade = [];
	mag_flash_grenade[0] = (-2572.2, 7515.9, 294.1);
	mag_flash_grenade[1] = (-165.6, 5989.5, 338.5);
	for (i = 0; i < mag_flash_grenade.size; i++)
		battleroyale\_auto::createAssetEntity("mag_flash_grenade", "weapon_m84_flashbang_grenade", mag_flash_grenade[i]);

	mag_smoke_grenade = [];
	mag_smoke_grenade[0] = (-184.5, 6075.7, 351.5);
	mag_smoke_grenade[1] = (-3881, 7773, 257);
	mag_smoke_grenade[2] = (-3821, 7826, 257);
	mag_smoke_grenade[3] = (-3051, 7233, 384);
	mag_smoke_grenade[4] = (-2777, 6947, 384);
	for (i = 0; i < mag_smoke_grenade.size; i++)
		battleroyale\_auto::createAssetEntity("mag_smoke_grenade", "weapon_us_smoke_grenade", mag_smoke_grenade[i]);

	mag_bandage = [];
	mag_bandage[0] = (-29.1, 7500.1, 2.1);
	mag_bandage[1] = (-59.9, 4732.5, 102.6);
	mag_bandage[2] = (-3670, 8218, 257);
	mag_bandage[3] = (-3720, 5736, 280);
	mag_bandage[4] = (-2848, 6789, 232);
	for (i = 0; i < mag_bandage.size; i++)
		battleroyale\_auto::createAssetEntity("mag_bandage", "sr_bandage", mag_bandage[i]);

	mag_first_kit = [];
	mag_first_kit[0] = (-523.9, 5147.4, 193.5);
	for (i = 0; i < mag_first_kit.size; i++)
		battleroyale\_auto::createAssetEntity("mag_first_kit", "sr_first_kit", mag_first_kit[i]);

	mag_frag_grenade = [];
	mag_frag_grenade[0] = (-1172.4, 7679.9, 166.3);
	for (i = 0; i < mag_frag_grenade.size; i++)
		battleroyale\_auto::createAssetEntity("mag_frag_grenade", "weapon_m67_grenade", mag_frag_grenade[i]);
}

random_weapons()
{
	level waittill("br_started");
	wait 5;

	item = [];
	// createAmmo(ent, sound, hud_icon, giveammo, rng)
	item[0] = battleroyale\_auto::createAmmo("mag_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	item[1] = battleroyale\_auto::createAmmo("mag_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	item[2] = battleroyale\_auto::createAmmo("mag_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	item[3] = battleroyale\_auto::createAmmo("mag_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	item[4] = battleroyale\_auto::createAmmo("mag_12_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	// createWeapon(ent, sound, hud_icon, weapon_mp, rng)
	item[5] = battleroyale\_auto::createWeapon("mag_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	item[6] = battleroyale\_auto::createWeapon("mag_colt45", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	item[7] = battleroyale\_auto::createWeapon("mag_deserteagle", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	item[8] = battleroyale\_auto::createWeapon("mag_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	item[9] = battleroyale\_auto::createWeapon("mag_m16", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	item[10] = battleroyale\_auto::createWeapon("mag_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	item[11] = battleroyale\_auto::createWeapon("mag_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	item[12] = battleroyale\_auto::createWeapon("mag_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	item[13] = battleroyale\_auto::createWeapon("mag_m1014", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	item[14] = battleroyale\_auto::createWeapon("mag_winchester1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	// createSpecial(ent, sound, hud_icon, weapon_mp, rng)
	item[15] = battleroyale\_auto::createSpecial("mag_flash_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	item[16] = battleroyale\_auto::createSpecial("mag_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	item[17] = battleroyale\_auto::createSpecial("mag_bandage", "health_pickup_large", "hud_icon_band", "", level.RNG_NORMAL);
	item[18] = battleroyale\_auto::createSpecial("mag_first_kit", "health_pickup_large", "hud_icon_kit", "", level.RNG_BIG);
	item[19] = battleroyale\_auto::createSpecial("mag_frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);

	for(i = 0; i < item.size; i++)
		item[i] thread battleroyale\_auto::item_trig();
}
