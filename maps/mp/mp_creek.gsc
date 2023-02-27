#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_creek");

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

	battleroyale\game\_api::createPlanePath((-6588, 7764, 960), (2000, 6029, 960), -10);
	battleroyale\game\_api::createPlanePath((2089, 3007, 960), (-4328, 9038, 960), 137);
	battleroyale\game\_api::createPlaneDrop((-748, 6798, 800));
	battleroyale\game\_api::createPlaneDropTrigger((-748, 6798, 900), 3000);
	battleroyale\game\_api::createPlaneDuration(15);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((988, 5978, -400));
	battleroyale\game\_api::createZone((-288, 4596, -400));
	battleroyale\game\_api::createZone((-2372, 7277, -400));
	battleroyale\game\_api::createZone((-4168, 6531, -400));
	battleroyale\game\_api::createZone((-3468, 8351, -400));

	battleroyale\game\_api::createLobbyBlocker((-2889, 6700, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 6944, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 7018, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3288, 7230, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-2880, 6929, 295), 150, 100);

	spawnEntities();
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
