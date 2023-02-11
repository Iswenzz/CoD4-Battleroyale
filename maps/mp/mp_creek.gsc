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
Paypal: alexisnardiello@gmail.com
Email Pro: alexisnardiello@gmail.com

*/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.mapCredits = "SuX Lolz";

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetExpFog(5000, 50000, 123 / 255, 155 / 255, 175 / 255, 3);

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", "0.1");
	setdvar("r_glowbloomintensity1", "0.1");
	setdvar("r_glowskybleedintensity0", "0.1");

	setDvar("br_zone_start_level", 2);

	battleroyale\_auto::removeAllMapTriggers();
	battleroyale\_auto::removeAllSpawns();

	battleroyale\_auto::createSpawn((-3127, 7024, 232-60), -80);
	battleroyale\_auto::createDropTrigger((-748, 6798, 900), 3000);
	battleroyale\_auto::createPlanePath((-6588, 7764, 960), (3583, 6029, 960), -10);
	battleroyale\_auto::createPlanePath((2089, 3007, 960), (-4328, 9038, 960), 137);

	battleroyale\_auto::createZone((988, 5978, -14));
	battleroyale\_auto::createZone((-288, 4596, 86));
	battleroyale\_auto::createZone((-2372, 7277, 200));
	battleroyale\_auto::createZone((-4168, 6531, 171));
	battleroyale\_auto::createZone((-3468, 8351, 214));
	battleroyale\_auto::setLastEjection((-748, 6798, 900));

	battleroyale\_auto::createLobbyArea((-2889, 6700, 232), 150, 100);
	battleroyale\_auto::createLobbyArea((-3227, 6944, 232), 150, 100);
	battleroyale\_auto::createLobbyArea((-3227, 7018, 232), 150, 100);
	battleroyale\_auto::createLobbyArea((-3288, 7230, 232), 150, 100);
	battleroyale\_auto::createLobbyArea((-2880, 6929, 295), 150, 100);

	spawnEntities();
	spawnWeapons();
}

spawnEntities()
{
	battleroyale\_auto::createEntity("mag_beretta", (492.3, 4973.6, 49.1));
	battleroyale\_auto::createEntity("mag_beretta", (-3308, 5808, 24));
	battleroyale\_auto::createEntity("mag_colt45", (-2187, 5591, 8));

	battleroyale\_auto::createEntity("mag_deserteagle", (-139.5, 7688.7, 0.3));
	battleroyale\_auto::createEntity("mag_deserteagle", (-2770, 7072, 232));
	battleroyale\_auto::createEntity("mag_deserteagle", (997, 5779, 12));
	battleroyale\_auto::createEntity("mag_dragunov", (915, 5820, 107));

	battleroyale\_auto::createEntity("mag_m16", (-2848, 6789, 232));
	battleroyale\_auto::createEntity("mag_m16", (-4096, 6877, 216));
	battleroyale\_auto::createEntity("mag_m16", (-1998, 7805, 297));

	battleroyale\_auto::createEntity("mag_ak47", (-1859, 5713, 331));
	battleroyale\_auto::createEntity("mag_ak47", (-2308, 5993, 52));
	battleroyale\_auto::createEntity("mag_ak47", (1340, 6046, 96));

	battleroyale\_auto::createEntity("mag_mp44", (-118.5, 6042.4, 340.3));
	battleroyale\_auto::createEntity("mag_mp44", (253.8, 3674.6, 90.9));
	battleroyale\_auto::createEntity("mag_mp44", (-3881, 7773, 257));
	battleroyale\_auto::createEntity("mag_mp44", (-3670, 8218, 257));
	battleroyale\_auto::createEntity("mag_mp44", (653, 6839, 197));

	battleroyale\_auto::createEntity("mag_mp5", (-3138.2, 5919.4, -51.9));
	battleroyale\_auto::createEntity("mag_m1014", (-184.5, 6075.7, 351.5));
	battleroyale\_auto::createEntity("mag_winchester1200", (-1463.4, 5392.0, 42.9));
	battleroyale\_auto::createEntity("mag_winchester1200", (-820, 7439, 98));

	battleroyale\_auto::createEntity("mag_45", (-1172.4, 7679.9, 166.3));
	battleroyale\_auto::createEntity("mag_45", (-2263, 5310, 17));
	battleroyale\_auto::createEntity("mag_45", (-3393, 5616, -27));
	battleroyale\_auto::createEntity("mag_45", (1285, 6628, 205));

	battleroyale\_auto::createEntity("mag_9mm", (523.9, 4908.5, 187.1));
	battleroyale\_auto::createEntity("mag_9mm", (90.7, 3896.7, 90.9));
	battleroyale\_auto::createEntity("mag_9mm", (-3609, 8003, 257));
	battleroyale\_auto::createEntity("mag_9mm", (-3720, 5736, 280));
	battleroyale\_auto::createEntity("mag_9mm", (-3051, 7233, 384));
	battleroyale\_auto::createEntity("mag_9mm", (-1816, 5787, 402));
	battleroyale\_auto::createEntity("mag_9mm", (-2900, 7316, 261));

	battleroyale\_auto::createEntity("mag_7_62", (423.6, 4981.3, 187.1));
	battleroyale\_auto::createEntity("mag_7_62", (-3821, 7826, 257));
	battleroyale\_auto::createEntity("mag_7_62", (-4707, 7266, 234));
	battleroyale\_auto::createEntity("mag_7_62", (-1964, 5736, 330));
	battleroyale\_auto::createEntity("mag_7_62", (213, 3931, 177));
	battleroyale\_auto::createEntity("mag_7_62", (-916, 5272, 243));

	battleroyale\_auto::createEntity("mag_5_45", (-523.9, 5147.4, 193.5));
	battleroyale\_auto::createEntity("mag_5_45", (-2572.2, 7515.9, 294.1));
	battleroyale\_auto::createEntity("mag_5_45", (-3984, 6105, 244));
	battleroyale\_auto::createEntity("mag_5_45", (-3707, 5672, 244));
	battleroyale\_auto::createEntity("mag_5_45", (296, 5914, 131));
	battleroyale\_auto::createEntity("mag_5_45", (864, 3832, 127));

	battleroyale\_auto::createEntity("mag_12_gauge", (-359.2, 6599.7, 35.3));
	battleroyale\_auto::createEntity("mag_12_gauge", (-165.6, 5989.5, 338.5));
	battleroyale\_auto::createEntity("mag_12_gauge", (-3937, 7811, 257));
	battleroyale\_auto::createEntity("mag_12_gauge", (-485, 5291, 368));
	battleroyale\_auto::createEntity("mag_12_gauge", (-3856, 6256, 266));
	battleroyale\_auto::createEntity("mag_12_gauge", (2329, 5981, 54));
	battleroyale\_auto::createEntity("mag_12_gauge", (-2850, 6462, 287));
	battleroyale\_auto::createEntity("mag_12_gauge", (-4537, 6522, 249));

	battleroyale\_auto::createEntity("mag_flash_grenade", (-59.9, 4732.5, 102.6));
	battleroyale\_auto::createEntity("mag_flash_grenade", (-3400.7, 5355.0, -70.9));
	battleroyale\_auto::createEntity("mag_flash_grenade", (-3872, 8076, 257));
	battleroyale\_auto::createEntity("mag_flash_grenade", (-3044, 7149, 242));
	battleroyale\_auto::createEntity("mag_flash_grenade", (-2695, 5816, -5));
	battleroyale\_auto::createEntity("mag_flash_grenade", (-3328, 8369, 2255));

	battleroyale\_auto::createEntity("mag_smoke_grenade", (-2968, 6703, 384));
	battleroyale\_auto::createEntity("mag_smoke_grenade", (-3549, 5601, 270));
	battleroyale\_auto::createEntity("mag_smoke_grenade", (-3015, 7278, 268));
	battleroyale\_auto::createEntity("mag_smoke_grenade", (-1003, 5615, 438));
	battleroyale\_auto::createEntity("mag_smoke_grenade", (-890, 3545, 179));

	battleroyale\_auto::createEntity("mag_bandage", (-1403.4, 5516.1, 38.9));
	battleroyale\_auto::createEntity("mag_bandage", (445.7, 4119.1, 90.9));
	battleroyale\_auto::createEntity("mag_bandage", (-3129, 6762, 232));
	battleroyale\_auto::createEntity("mag_bandage", (-2777, 6947, 384));

	battleroyale\_auto::createEntity("mag_first_kit", (-1453.3, 5227.4, 45.1));
	battleroyale\_auto::createEntity("mag_first_kit", (-29.1, 7500.1, 2.1));
	battleroyale\_auto::createEntity("mag_first_kit", (478.7, 4099.3, 196.9));
	battleroyale\_auto::createEntity("mag_first_kit", (-3293, 7005, 232));
	battleroyale\_auto::createEntity("mag_first_kit", (1013, 4562, 104));
	battleroyale\_auto::createEntity("mag_first_kit", (-1878, 5942, -57));
	battleroyale\_auto::createEntity("mag_first_kit", (-3097, 7397, 232));
	battleroyale\_auto::createEntity("mag_first_kit", (94, 3979, 123));
	battleroyale\_auto::createEntity("mag_first_kit", (1136, 4733, 103));
	battleroyale\_auto::createEntity("mag_first_kit", (8, 6865, -2));

	battleroyale\_auto::createEntity("mag_frag_grenade", (-3202, 6882, 232));
	battleroyale\_auto::createEntity("mag_frag_grenade", (-3232, 7266, 234));
	battleroyale\_auto::createEntity("mag_frag_grenade", (-3001, 5525, 229));
}

spawnWeapons()
{
	battleroyale\_auto::createAmmo("mag_45", "sr_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_9mm", "sr_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_7_62", "sr_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_12_gauge", "sr_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	battleroyale\_auto::createWeapon("beretta", "weapon_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("colt45", "weapon_colt1911_black", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("deserteagle", "weapon_desert_eagle_silver", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("dragunov", "weapon_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	battleroyale\_auto::createWeapon("m16", "weapon_m16_mp", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("ak47", "weapon_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("mp44", "weapon_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("mp5", "weapon_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("m1014", "weapon_benelli_super_90", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	battleroyale\_auto::createWeapon("winchester1200", "weapon_winchest1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	battleroyale\_auto::createSpecial("flash_grenade", "weapon_m84_flashbang_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	battleroyale\_auto::createSpecial("smoke_grenade", "weapon_us_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	battleroyale\_auto::createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", undefined, level.RNG_NORMAL);
	battleroyale\_auto::createSpecial("first_kit", "sr_first_kit", "health_pickup_large", "hud_icon_kit", undefined, level.RNG_BIG);
	battleroyale\_auto::createSpecial("frag_grenade", "weapon_m67_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
}
