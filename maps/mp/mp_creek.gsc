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

	setDvar("r_specularcolorscale", "1");
	setDvar("r_glowbloomintensity0", "0.1");
	setDvar("r_glowbloomintensity1", "0.1");
	setDvar("r_glowskybleedintensity0", "0.1");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((-3127, 7024, 232), -80);

	battleroyale\game\_api::createPlanePath((-6588, 7764, 960), (3583, 6029, 960), -10);
	battleroyale\game\_api::createPlanePath((2089, 3007, 960), (-4328, 9038, 960), 137);
	battleroyale\game\_api::createPlaneDrop((-748, 6798, 900));
	battleroyale\game\_api::createPlaneDropTrigger((-748, 6798, 900), 3000);
	battleroyale\game\_api::createPlaneDuration(15);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((988, 5978, -14));
	battleroyale\game\_api::createZone((-288, 4596, 86));
	battleroyale\game\_api::createZone((-2372, 7277, 200));
	battleroyale\game\_api::createZone((-4168, 6531, 171));
	battleroyale\game\_api::createZone((-3468, 8351, 214));

	battleroyale\game\_api::createLobbyBlocker((-2889, 6700, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 6944, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 7018, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3288, 7230, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-2880, 6929, 295), 150, 100);

	spawnEntities();
	spawnWeapons();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("beretta", (492.3, 4973.6, 49.1));
	battleroyale\game\_api::createEntity("beretta", (-3308, 5808, 24));
	battleroyale\game\_api::createEntity("colt45", (-2187, 5591, 8));

	battleroyale\game\_api::createEntity("deserteagle", (-139.5, 7688.7, 0.3));
	battleroyale\game\_api::createEntity("deserteagle", (-2770, 7072, 232));
	battleroyale\game\_api::createEntity("deserteagle", (997, 5779, 12));
	battleroyale\game\_api::createEntity("dragunov", (915, 5820, 107));

	battleroyale\game\_api::createEntity("m16", (-2848, 6789, 232));
	battleroyale\game\_api::createEntity("m16", (-4096, 6877, 216));
	battleroyale\game\_api::createEntity("m16", (-1998, 7805, 297));

	battleroyale\game\_api::createEntity("ak47", (-1859, 5713, 331));
	battleroyale\game\_api::createEntity("ak47", (-2308, 5993, 52));
	battleroyale\game\_api::createEntity("ak47", (1340, 6046, 96));

	battleroyale\game\_api::createEntity("mp44", (-118.5, 6042.4, 340.3));
	battleroyale\game\_api::createEntity("mp44", (253.8, 3674.6, 90.9));
	battleroyale\game\_api::createEntity("mp44", (-3881, 7773, 257));
	battleroyale\game\_api::createEntity("mp44", (-3670, 8218, 257));
	battleroyale\game\_api::createEntity("mp44", (653, 6839, 197));

	battleroyale\game\_api::createEntity("mp5", (-3138.2, 5919.4, -51.9));
	battleroyale\game\_api::createEntity("m1014", (-184.5, 6075.7, 351.5));
	battleroyale\game\_api::createEntity("winchester1200", (-1463.4, 5392.0, 42.9));
	battleroyale\game\_api::createEntity("winchester1200", (-820, 7439, 98));

	battleroyale\game\_api::createEntity("45", (-1172.4, 7679.9, 166.3));
	battleroyale\game\_api::createEntity("45", (-2263, 5310, 17));
	battleroyale\game\_api::createEntity("45", (-3393, 5616, -27));
	battleroyale\game\_api::createEntity("45", (1285, 6628, 205));

	battleroyale\game\_api::createEntity("9mm", (523.9, 4908.5, 187.1));
	battleroyale\game\_api::createEntity("9mm", (90.7, 3896.7, 90.9));
	battleroyale\game\_api::createEntity("9mm", (-3609, 8003, 257));
	battleroyale\game\_api::createEntity("9mm", (-3720, 5736, 280));
	battleroyale\game\_api::createEntity("9mm", (-3051, 7233, 384));
	battleroyale\game\_api::createEntity("9mm", (-1816, 5787, 402));
	battleroyale\game\_api::createEntity("9mm", (-2900, 7316, 261));

	battleroyale\game\_api::createEntity("7_62", (423.6, 4981.3, 187.1));
	battleroyale\game\_api::createEntity("7_62", (-3821, 7826, 257));
	battleroyale\game\_api::createEntity("7_62", (-4707, 7266, 234));
	battleroyale\game\_api::createEntity("7_62", (-1964, 5736, 330));
	battleroyale\game\_api::createEntity("7_62", (213, 3931, 177));
	battleroyale\game\_api::createEntity("7_62", (-916, 5272, 243));

	battleroyale\game\_api::createEntity("5_45", (-523.9, 5147.4, 193.5));
	battleroyale\game\_api::createEntity("5_45", (-2572.2, 7515.9, 294.1));
	battleroyale\game\_api::createEntity("5_45", (-3984, 6105, 244));
	battleroyale\game\_api::createEntity("5_45", (-3707, 5672, 244));
	battleroyale\game\_api::createEntity("5_45", (296, 5914, 131));
	battleroyale\game\_api::createEntity("5_45", (864, 3832, 127));

	battleroyale\game\_api::createEntity("12_gauge", (-359.2, 6599.7, 35.3));
	battleroyale\game\_api::createEntity("12_gauge", (-165.6, 5989.5, 338.5));
	battleroyale\game\_api::createEntity("12_gauge", (-3937, 7811, 257));
	battleroyale\game\_api::createEntity("12_gauge", (-485, 5291, 368));
	battleroyale\game\_api::createEntity("12_gauge", (-3856, 6256, 266));
	battleroyale\game\_api::createEntity("12_gauge", (2329, 5981, 54));
	battleroyale\game\_api::createEntity("12_gauge", (-2850, 6462, 287));
	battleroyale\game\_api::createEntity("12_gauge", (-4537, 6522, 249));

	battleroyale\game\_api::createEntity("flash_grenade", (-59.9, 4732.5, 102.6));
	battleroyale\game\_api::createEntity("flash_grenade", (-3400.7, 5355.0, -70.9));
	battleroyale\game\_api::createEntity("flash_grenade", (-3872, 8076, 257));
	battleroyale\game\_api::createEntity("flash_grenade", (-3044, 7149, 242));
	battleroyale\game\_api::createEntity("flash_grenade", (-2695, 5816, -5));
	battleroyale\game\_api::createEntity("flash_grenade", (-3328, 8369, 2255));

	battleroyale\game\_api::createEntity("smoke_grenade", (-2968, 6703, 384));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3549, 5601, 270));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3015, 7278, 268));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1003, 5615, 438));
	battleroyale\game\_api::createEntity("smoke_grenade", (-890, 3545, 179));

	battleroyale\game\_api::createEntity("bandage", (-1403.4, 5516.1, 38.9));
	battleroyale\game\_api::createEntity("bandage", (445.7, 4119.1, 90.9));
	battleroyale\game\_api::createEntity("bandage", (-3129, 6762, 232));
	battleroyale\game\_api::createEntity("bandage", (-2777, 6947, 384));

	battleroyale\game\_api::createEntity("first_kit", (-1453.3, 5227.4, 45.1));
	battleroyale\game\_api::createEntity("first_kit", (-29.1, 7500.1, 2.1));
	battleroyale\game\_api::createEntity("first_kit", (478.7, 4099.3, 196.9));
	battleroyale\game\_api::createEntity("first_kit", (-3293, 7005, 232));
	battleroyale\game\_api::createEntity("first_kit", (1013, 4562, 104));
	battleroyale\game\_api::createEntity("first_kit", (-1878, 5942, -57));
	battleroyale\game\_api::createEntity("first_kit", (-3097, 7397, 232));
	battleroyale\game\_api::createEntity("first_kit", (94, 3979, 123));
	battleroyale\game\_api::createEntity("first_kit", (1136, 4733, 103));
	battleroyale\game\_api::createEntity("first_kit", (8, 6865, -2));

	battleroyale\game\_api::createEntity("frag_grenade", (-3202, 6882, 232));
	battleroyale\game\_api::createEntity("frag_grenade", (-3232, 7266, 234));
	battleroyale\game\_api::createEntity("frag_grenade", (-3001, 5525, 229));
}

spawnWeapons()
{
	battleroyale\game\_api::createAmmo("45", "sr_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("9mm", "sr_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("7_62", "sr_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("12_gauge", "sr_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	battleroyale\game\_api::createWeapon("beretta", "9mm", "weapon_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("colt45", "5_45", "weapon_colt1911_black", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("deserteagle", "45", "weapon_desert_eagle_silver", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("dragunov", "7_62", "weapon_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	battleroyale\game\_api::createWeapon("m16", "5_45", "weapon_m16_mp", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("ak47", "7_62", "weapon_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("mp44", "7_62", "weapon_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("mp5", "9mm", "weapon_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("m1014", "12_gauge", "weapon_benelli_super_90", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	battleroyale\game\_api::createWeapon("winchester1200", "12_gauge", "weapon_winchest1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	battleroyale\game\_api::createGrenade("flash_grenade", "weapon_m84_flashbang_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createGrenade("smoke_grenade", "weapon_us_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	battleroyale\game\_api::createGrenade("frag_grenade", "weapon_m67_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
	battleroyale\game\_api::createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", level.RNG_NORMAL);
	battleroyale\game\_api::createSpecial("first_kit", "sr_first_kit", "health_pickup_large", "hud_icon_kit", level.RNG_BIG);
}
