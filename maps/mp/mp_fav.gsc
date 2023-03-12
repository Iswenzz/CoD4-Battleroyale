main()
{
	maps\mp\_load::main();
	maps\mp\mp_fav_struct::main();
	maps\mp\mp_fav_rotate::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_fav");

	ambientPlay("ambient_backlot_ext");
	setExpFog(0, 13000, 0.33, 0.39, 0.545313, 1);

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", ".25");
	setdvar("r_glowbloomintensity1", ".25");
	setdvar("r_glowskybleedintensity0", ".3");
	setdvar("compassmaxrange","1800");

	level.airstrikeHeightScale = 1.8;

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((997, 429, 233), -123);

	battleroyale\game\_api::createPlanePath((-531, 1658, 600), (3127, -3553, 600), -50);
	battleroyale\game\_api::createPlanePath((3486, -2128, 600), (-1036, 1734, 600), 139);
	battleroyale\game\_api::createPlaneDrop((634, -421, 651));
	battleroyale\game\_api::createPlaneDropTrigger((1421, -312, 651), 2000);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(3);
	battleroyale\game\_api::createZone((687, 11, 60));
	battleroyale\game\_api::createZone((-133, -729, 58));
	battleroyale\game\_api::createZone((-164, 63, 64));
	battleroyale\game\_api::createZone((476, 896, 69));
	battleroyale\game\_api::createZone((1513, 770, 114));
	battleroyale\game\_api::createZone((2843, -500, 329));
	battleroyale\game\_api::createZone((1859, -1556, 214));
	battleroyale\game\_api::createZone((739, -1223, 192));
	battleroyale\game\_api::createZone((13, -1744, 230));

	battleroyale\game\_api::createLobbyBlocker((1109, 285, 412), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((888, 167, 259), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((795, 241, 259), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((872, 674, 257), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((1138, 546, 259), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((857, 673, 73), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("beretta", (170, 583, 65));
	battleroyale\game\_api::createEntity("beretta", (93, -369, 208));
	battleroyale\game\_api::createEntity("colt45", (1165, -187, 253));
	battleroyale\game\_api::createEntity("colt45", (1603, -2060, 209));
	battleroyale\game\_api::createEntity("colt45", (917, 242, 233));
	battleroyale\game\_api::createEntity("colt45", (99, -683, 71));
	battleroyale\game\_api::createEntity("deserteagle", (1678, 1046, 234));
	battleroyale\game\_api::createEntity("m1014", (2481, -821, 244));
	battleroyale\game\_api::createEntity("m16", (2218, -121, 372));
	battleroyale\game\_api::createEntity("m16", (3115, -729, 268));
	battleroyale\game\_api::createEntity("m16", (953, -101, 253));
	battleroyale\game\_api::createEntity("m21", (1815, -48, 381));
	battleroyale\game\_api::createEntity("mp44", (1256, -601, 253));
	battleroyale\game\_api::createEntity("mp44", (1872, -100, 381));
	battleroyale\game\_api::createEntity("mp5", (1552, 42, 221));
	battleroyale\game\_api::createEntity("mp5", (1599, -809, 360));
	battleroyale\game\_api::createEntity("p90", (-339, -1857, 229));
	battleroyale\game\_api::createEntity("skorpion", (1960, 221, 232));
	battleroyale\game\_api::createEntity("usp", (10, 366, 233));
	battleroyale\game\_api::createEntity("usp", (248, -1062, 208));
	battleroyale\game\_api::createEntity("usp", (839, 637, 233));
	battleroyale\game\_api::createEntity("uzi", (1651, -891, 364));

	battleroyale\game\_api::createEntity("12_gauge", (1082, 526, 233));
	battleroyale\game\_api::createEntity("12_gauge", (1742, -2054, 208));
	battleroyale\game\_api::createEntity("12_gauge", (2431, -1850, 212));
	battleroyale\game\_api::createEntity("12_gauge", (3085, -933, 268));
	battleroyale\game\_api::createEntity("12_gauge", (964, -492, 253));
	battleroyale\game\_api::createEntity("45", (-265, 448, 68));
	battleroyale\game\_api::createEntity("45", (-72, -110, 208));
	battleroyale\game\_api::createEntity("45", (3423, -1289, 337));
	battleroyale\game\_api::createEntity("5_45", (-20, -544, 208));
	battleroyale\game\_api::createEntity("5_45", (-8, -364, 344));
	battleroyale\game\_api::createEntity("5_45", (1235, 1897, 74));
	battleroyale\game\_api::createEntity("5_45", (1857, 138, 221));
	battleroyale\game\_api::createEntity("5_45", (2347, -109, 372));
	battleroyale\game\_api::createEntity("7_62", (-14, -569, 80));
	battleroyale\game\_api::createEntity("7_62", (1468, -1344, 364));
	battleroyale\game\_api::createEntity("7_62", (1552, 1387, 234));
	battleroyale\game\_api::createEntity("7_62", (1677, 1443, 234));
	battleroyale\game\_api::createEntity("7_62", (221, -1182, 340));
	battleroyale\game\_api::createEntity("7_62", (268, 1559, 74));
	battleroyale\game\_api::createEntity("7_62", (599, -482, 59));
	battleroyale\game\_api::createEntity("9mm", (1080, -929, 348));
	battleroyale\game\_api::createEntity("9mm", (80, -415, 344));
	battleroyale\game\_api::createEntity("rocket", (1392, 1414, 234));
	battleroyale\game\_api::createEntity("rocket", (2137, -246, 372));
	battleroyale\game\_api::createEntity("rocket", (365, 639, 233));

	battleroyale\game\_api::createEntity("flash_grenade", (1173, -607, 253));
	battleroyale\game\_api::createEntity("flash_grenade", (17, -330, 118));
	battleroyale\game\_api::createEntity("flash_grenade", (547, -642, 59));
	battleroyale\game\_api::createEntity("flash_grenade", (949, -417, 368));
	battleroyale\game\_api::createEntity("frag_grenade", (20, 430, 233));
	battleroyale\game\_api::createEntity("frag_grenade", (2358, -307, 372));
	battleroyale\game\_api::createEntity("frag_grenade", (3078, -1181, 268));
	battleroyale\game\_api::createEntity("smoke_grenade", (233, -1380, 236));
	battleroyale\game\_api::createEntity("smoke_grenade", (260, -243, 208));
	battleroyale\game\_api::createEntity("smoke_grenade", (266, -1001, 208));
	battleroyale\game\_api::createEntity("smoke_grenade", (3230, -26, 374));
	battleroyale\game\_api::createEntity("smoke_grenade", (734, 328, 68));

	battleroyale\game\_api::createEntity("bandage", (-299, 555, 66));
	battleroyale\game\_api::createEntity("bandage", (1109, 1758, 74));
	battleroyale\game\_api::createEntity("bandage", (1354, 1143, 234));
	battleroyale\game\_api::createEntity("bandage", (1408, 1042, 234));
	battleroyale\game\_api::createEntity("bandage", (1752, -1320, 364));
	battleroyale\game\_api::createEntity("bandage", (1861, -33, 221));
	battleroyale\game\_api::createEntity("bandage", (253, -556, 80));
	battleroyale\game\_api::createEntity("bandage", (3232, 159, 373));
	battleroyale\game\_api::createEntity("bandage", (69, -328, 344));
	battleroyale\game\_api::createEntity("bandage", (71, -955, 208));
	battleroyale\game\_api::createEntity("bandage", (837, -1574, 240));
	battleroyale\game\_api::createEntity("first_kit", (1007, -565, 368));
	battleroyale\game\_api::createEntity("first_kit", (1202, 1633, 74));
	battleroyale\game\_api::createEntity("first_kit", (1463, -1237, 364));
	battleroyale\game\_api::createEntity("first_kit", (1561, -100, 381));
	battleroyale\game\_api::createEntity("first_kit", (1592, 263, 381));
	battleroyale\game\_api::createEntity("first_kit", (1686, 256, 401));
	battleroyale\game\_api::createEntity("first_kit", (1774, -1259, 364));
	battleroyale\game\_api::createEntity("first_kit", (2662, -1108, 210));
	battleroyale\game\_api::createEntity("first_kit", (270, -203, 80));
	battleroyale\game\_api::createEntity("first_kit", (915, -1589, 248));
}
