main()
{
	maps\mp\mp_vacant_fx::main();
	maps\createart\mp_vacant_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_vacant");

	ambientPlay("ambient_middleeast_ext");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", ".1");
	setdvar("r_glowbloomintensity1", ".1");
	setdvar("r_glowskybleedintensity0", ".1");
	setdvar("compassmaxrange", "1500");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((537, 842, 12), 41);

	battleroyale\game\_api::createPlanePath((739, 1837, 726), (-2270, -450, 726), -143);
	battleroyale\game\_api::createPlanePath((613, -1624, 718), (-2410, 1771, 718), 131);
	battleroyale\game\_api::createPlaneDrop((-2410, 1771, 731));
	battleroyale\game\_api::createPlaneDropTrigger((-406, 203, 731), 1500);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(4);
	battleroyale\game\_api::createZone((-698, 1074, -56));
	battleroyale\game\_api::createZone((-1608, 285, -51));
	battleroyale\game\_api::createZone((-124, -1167, -43));
	battleroyale\game\_api::createZone((-93, -191, 13));
	battleroyale\game\_api::createZone((1214, -57, 13));
	battleroyale\game\_api::createZone((678, 973, 13));

	battleroyale\game\_api::createLobbyBlocker((77, 908, 13), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((462, 681, 13), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((1083, 1101, 13), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((1103, 980, 13), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("at4", (-53, -633, 13));
	battleroyale\game\_api::createEntity("colt45", (288, 1629, -51));
	battleroyale\game\_api::createEntity("colt45", (502, -1336, -42));
	battleroyale\game\_api::createEntity("deserteaglegold", (-688, -939, 1));
	battleroyale\game\_api::createEntity("m16", (-667, -277, 13));
	battleroyale\game\_api::createEntity("m40a3", (177, 762, 13));
	battleroyale\game\_api::createEntity("mp44", (1599, 530, 13));
	battleroyale\game\_api::createEntity("mp5", (-250, 751, 13));
	battleroyale\game\_api::createEntity("p90", (-200, -600, 13));
	battleroyale\game\_api::createEntity("usp", (-500, 325, 53));
	battleroyale\game\_api::createEntity("winchester1200", (-1349, 383, -42));

	battleroyale\game\_api::createEntity("12_gauge", (-1799, 189, -42));
	battleroyale\game\_api::createEntity("12_gauge", (-422, -597, 13));
	battleroyale\game\_api::createEntity("12_gauge", (459, 1585, -51));
	battleroyale\game\_api::createEntity("12_gauge", (784, 1082, 56));
	battleroyale\game\_api::createEntity("45", (-174, -144, 13));
	battleroyale\game\_api::createEntity("45", (1238, -143, 13));
	battleroyale\game\_api::createEntity("5_45", (226, 1554, -53));
	battleroyale\game\_api::createEntity("7_62", (-47, 549, 13));
	battleroyale\game\_api::createEntity("7_62", (1171, -740, 13));
	battleroyale\game\_api::createEntity("7_62", (716, 1734, -51));
	battleroyale\game\_api::createEntity("9mm", (1626, 162, 33));
	battleroyale\game\_api::createEntity("rocket", (1321, 1206, 45));
	battleroyale\game\_api::createEntity("rocket", (1508, -905, 13));

	battleroyale\game\_api::createEntity("flash_grenade", (1138, 975, 13));
	battleroyale\game\_api::createEntity("flash_grenade", (252, 381, 13));
	battleroyale\game\_api::createEntity("flash_grenade", (486, 339, 13));
	battleroyale\game\_api::createEntity("flash_grenade", (887, 857, 68));
	battleroyale\game\_api::createEntity("frag_grenade", (-1189, -568, -43));
	battleroyale\game\_api::createEntity("frag_grenade", (-1944, -166, -51));
	battleroyale\game\_api::createEntity("frag_grenade", (1533, 596, 13));
	battleroyale\game\_api::createEntity("frag_grenade", (233, 1305, -45));
	battleroyale\game\_api::createEntity("frag_grenade", (491, -659, 13));
	battleroyale\game\_api::createEntity("frag_grenade", (702, -798, 13));
	battleroyale\game\_api::createEntity("smoke_grenade", (-559, -926, 2));
	battleroyale\game\_api::createEntity("smoke_grenade", (85, -258, 13));

	battleroyale\game\_api::createEntity("bandage", (-1610, -134, -51));
	battleroyale\game\_api::createEntity("bandage", (-1772, 518, -42));
	battleroyale\game\_api::createEntity("bandage", (-1794, 1695, -43));
	battleroyale\game\_api::createEntity("bandage", (-749, -786, 20));
	battleroyale\game\_api::createEntity("bandage", (-799, -224, 13));
	battleroyale\game\_api::createEntity("bandage", (153, 1092, 13));
	battleroyale\game\_api::createEntity("bandage", (219, 1173, 13));
	battleroyale\game\_api::createEntity("bandage", (274, -712, 13));
	battleroyale\game\_api::createEntity("bandage", (461, -1003, 13));
	battleroyale\game\_api::createEntity("bandage", (540, 228, 13));
	battleroyale\game\_api::createEntity("first_kit", (-1011, 1717, -46));
	battleroyale\game\_api::createEntity("first_kit", (-1166, -911, -43));
	battleroyale\game\_api::createEntity("first_kit", (-1434, 396, -42));
	battleroyale\game\_api::createEntity("first_kit", (-1714, 200, -42));
	battleroyale\game\_api::createEntity("first_kit", (1150, 767, 13));
	battleroyale\game\_api::createEntity("first_kit", (247, -787, 13));
	battleroyale\game\_api::createEntity("first_kit", (402, -623, 13));
	battleroyale\game\_api::createEntity("first_kit", (678, 519, 13));
	battleroyale\game\_api::createEntity("first_kit", (768, 539, 13));
	battleroyale\game\_api::createEntity("first_kit", (874, 816, 68));
	battleroyale\game\_api::createEntity("first_kit", (952, 77, 13));
}
