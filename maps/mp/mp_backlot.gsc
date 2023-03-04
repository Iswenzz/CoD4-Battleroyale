main()
{
	maps\mp\mp_backlot_fx::main();
	maps\createart\mp_backlot_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_backlot");

	ambientPlay("ambient_backlot_ext");

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
	setdvar("compassmaxrange", "1800");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((-906, 1277, 140), -38);

	battleroyale\game\_api::createPlanePath((-991, 2925, 920), (1362, -2461, 920), 293);
	battleroyale\game\_api::createPlanePath((2193, 1502, 804), (-1705, -845, 804), 211);
	battleroyale\game\_api::createPlaneDrop((-86, -31, 500));
	battleroyale\game\_api::createPlaneDropTrigger((-86, -31, 500), 3000);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((-496, 1834, 124));
	battleroyale\game\_api::createZone((591, 1293, 90));
	battleroyale\game\_api::createZone((1209, -12, 118));
	battleroyale\game\_api::createZone((103, -38, 126));
	battleroyale\game\_api::createZone((-911, -142, 166));
	battleroyale\game\_api::createZone((283, -1064, 124));

	battleroyale\game\_api::createLobbyBlocker((-745, 1099, 140), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-927, 1408, 140), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("at4", (1481, -346, 300));
	battleroyale\game\_api::createEntity("at4", (232, 1673, 292));
	battleroyale\game\_api::createEntity("at4", (836, -1540, 132));
	battleroyale\game\_api::createEntity("at4", (982, -1426, 268));
	battleroyale\game\_api::createEntity("dragunov", (-820, 161, 318));
	battleroyale\game\_api::createEntity("g3", (1217, -1449, 132));
	battleroyale\game\_api::createEntity("g3", (299, 1685, 292));
	battleroyale\game\_api::createEntity("g36c", (-650, -2549, 124));
	battleroyale\game\_api::createEntity("g36c", (-964, -1017, 124));
	battleroyale\game\_api::createEntity("m1014", (-1227, -451, 318));
	battleroyale\game\_api::createEntity("m1014", (106, 1317, 128));
	battleroyale\game\_api::createEntity("m16", (-910, 1099, 140));
	battleroyale\game\_api::createEntity("m21", (268, -307, 128));
	battleroyale\game\_api::createEntity("m4", (-1146, -133, 166));
	battleroyale\game\_api::createEntity("m40a3", (-805, -319, 166));
	battleroyale\game\_api::createEntity("m40a3", (1062, 1366, 124));
	battleroyale\game\_api::createEntity("mp44", (851, -1351, 268));
	battleroyale\game\_api::createEntity("remington700", (1668, 1134, 124));
	battleroyale\game\_api::createEntity("remington700", (174, 943, 128));
	battleroyale\game\_api::createEntity("remington700", (1907, 304, 300));
	battleroyale\game\_api::createEntity("skorpion", (753, 1351, 124));
	battleroyale\game\_api::createEntity("usp", (-1258, 84, 15));
	battleroyale\game\_api::createEntity("usp", (1074, -1558, 268));
	battleroyale\game\_api::createEntity("winchester1200", (1439, 391, 300));

	battleroyale\game\_api::createEntity("12_gauge", (761, 1675, 124));
	battleroyale\game\_api::createEntity("45", (-1162, 1079, 124));
	battleroyale\game\_api::createEntity("45", (-1249, -458, -53));
	battleroyale\game\_api::createEntity("5_45", (-474, -1937, 125));
	battleroyale\game\_api::createEntity("5_45", (-744, -208, -22));
	battleroyale\game\_api::createEntity("5_45", (263, -272, 456));
	battleroyale\game\_api::createEntity("5_45", (443, -273, 264));
	battleroyale\game\_api::createEntity("5_45", (546, -458, 128));
	battleroyale\game\_api::createEntity("7_62", (-732, 2250, 124));
	battleroyale\game\_api::createEntity("9mm", (-777, 1477, 140));
	battleroyale\game\_api::createEntity("rocket", (-856, 1731, 140));
	battleroyale\game\_api::createEntity("rocket", (849, -1218, 268));

	battleroyale\game\_api::createEntity("flash_grenade", (-773, 1337, 140));
	battleroyale\game\_api::createEntity("flash_grenade", (240, 2404, 124));
	battleroyale\game\_api::createEntity("flash_grenade", (282, -490, 264));
	battleroyale\game\_api::createEntity("flash_grenade", (288, 571, 129));
	battleroyale\game\_api::createEntity("flash_grenade", (573, -353, 456));
	battleroyale\game\_api::createEntity("frag_grenade", (-1210, -39, 320));
	battleroyale\game\_api::createEntity("frag_grenade", (-1245, 1046, 124));
	battleroyale\game\_api::createEntity("frag_grenade", (-334, 590, 128));
	battleroyale\game\_api::createEntity("frag_grenade", (1663, 529, 126));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1056, -534, 166));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1102, -546, -53));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1227, -178, 318));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1262, -392, 166));
	battleroyale\game\_api::createEntity("smoke_grenade", (-270, -211, 241));
	battleroyale\game\_api::createEntity("smoke_grenade", (-830, 193, 15));
	battleroyale\game\_api::createEntity("smoke_grenade", (1767, -188, 359));
	battleroyale\game\_api::createEntity("smoke_grenade", (249, -460, 456));
	battleroyale\game\_api::createEntity("smoke_grenade", (820, -1561, 268));
	battleroyale\game\_api::createEntity("smoke_grenade", (91, 394, 129));

	battleroyale\game\_api::createEntity("bandage", (-565, 591, 128));
	battleroyale\game\_api::createEntity("bandage", (-741, 100, 15));
	battleroyale\game\_api::createEntity("bandage", (-920, 7, 166));
	battleroyale\game\_api::createEntity("bandage", (1215, -1562, 132));
	battleroyale\game\_api::createEntity("bandage", (1234, -1563, 268));
	battleroyale\game\_api::createEntity("bandage", (1496, 469, 300));
	battleroyale\game\_api::createEntity("bandage", (1904, 529, 300));
	battleroyale\game\_api::createEntity("bandage", (208, 502, 129));
	battleroyale\game\_api::createEntity("bandage", (508, -300, 456));
	battleroyale\game\_api::createEntity("first_kit", (-101, -224, 241));
	battleroyale\game\_api::createEntity("first_kit", (-1216, -1018, 124));
	battleroyale\game\_api::createEntity("first_kit", (-128, 556, 129));
	battleroyale\game\_api::createEntity("first_kit", (-488, -2001, 126));
	battleroyale\game\_api::createEntity("first_kit", (-633, -2156, 125));
	battleroyale\game\_api::createEntity("first_kit", (-932, 1172, 140));
	battleroyale\game\_api::createEntity("first_kit", (-940, 1667, 140));
	battleroyale\game\_api::createEntity("first_kit", (1561, 110, 124));
	battleroyale\game\_api::createEntity("first_kit", (265, -1796, 136));
	battleroyale\game\_api::createEntity("first_kit", (401, -319, 264));
	battleroyale\game\_api::createEntity("first_kit", (508, -373, 264));
	battleroyale\game\_api::createEntity("first_kit", (757, 1193, 124));
	battleroyale\game\_api::createEntity("first_kit", (813, 1503, 124));
	battleroyale\game\_api::createEntity("first_kit", (866, -1299, 132));
	battleroyale\game\_api::createEntity("first_kit", (935, -1198, 164));
}
