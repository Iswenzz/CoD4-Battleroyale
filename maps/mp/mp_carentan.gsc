main()
{
	maps\mp\mp_carentan_fx::main();
	maps\createart\mp_carentan_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_carentan");

	level.airstrikeHeightScale = 1.4;

	setExpFog(500, 3500, .5, 0.5, 0.45, 0);
	ambientPlay("ambient_carentan_ext0");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "urban";
	game["axis_soldiertype"] = "urban";

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((821, 555, 220), 132);

	battleroyale\game\_api::createPlanePath((1255, 3997, 700), (-186, -1121, 700), -106);
	battleroyale\game\_api::createPlanePath((2244, -582, 700), (-1363, 2416, 700), 140);
	battleroyale\game\_api::createPlaneDrop((1435, 962, 628));
	battleroyale\game\_api::createPlaneDropTrigger((420, 915, 620), 1500);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((669, 675, 248));
	battleroyale\game\_api::createZone((724, 725, 248));
	battleroyale\game\_api::createZone((939, 386, 248));
	battleroyale\game\_api::createZone((894, 465, 189));
	battleroyale\game\_api::createZone((1237, 725, 248));
	battleroyale\game\_api::createZone((347, -471, 139));
	battleroyale\game\_api::createZone((899, 168, 53));
	battleroyale\game\_api::createZone((488, 902, 53));
	battleroyale\game\_api::createZone((1501, 1006, 29));
	battleroyale\game\_api::createZone((1511, 1926, 29));
	battleroyale\game\_api::createZone((770, 1518, 21));
	battleroyale\game\_api::createZone((63, 1475, 60));
	battleroyale\game\_api::createZone((-442, 812, 60));
	battleroyale\game\_api::createZone((-416, 1634, 60));
	battleroyale\game\_api::createZone((-151, 2408, 29));
	battleroyale\game\_api::createZone((643, 3560, 37));
	battleroyale\game\_api::createZone((990, 2136, 28));

	battleroyale\game\_api::createLobbyBlocker((669, 675, 248), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((724, 725, 248), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((939, 386, 248), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((894, 465, 189), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((1237, 725, 248), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("ak74u", (-165, 601, 60));
	battleroyale\game\_api::createEntity("ak74u", (-729, 2154, 204));
	battleroyale\game\_api::createEntity("beretta", (560, 2166, 68));
	battleroyale\game\_api::createEntity("deserteagle", (908, 396, 188));
	battleroyale\game\_api::createEntity("g3", (1051, 541, 220));
	battleroyale\game\_api::createEntity("g3", (303, 1180, 68));
	battleroyale\game\_api::createEntity("g36c", (-930, 1991, 204));
	battleroyale\game\_api::createEntity("g36c", (694, 1824, 68));
	battleroyale\game\_api::createEntity("m14", (1199, 1344, 53));
	battleroyale\game\_api::createEntity("m14", (30, 2002, -83));
	battleroyale\game\_api::createEntity("m16", (137, 382, 68));
	battleroyale\game\_api::createEntity("m16", (607, -125, 108));
	battleroyale\game\_api::createEntity("m16", (685, 3364, 37));
	battleroyale\game\_api::createEntity("m21", (1050, 1741, 204));
	battleroyale\game\_api::createEntity("m4", (500, 1881, -83));
	battleroyale\game\_api::createEntity("mp44", (243, 686, 204));
	battleroyale\game\_api::createEntity("mp44", (272, 1131, 220));
	battleroyale\game\_api::createEntity("mp44", (275, 509, 60));
	battleroyale\game\_api::createEntity("p90", (-628, 2085, 204));
	battleroyale\game\_api::createEntity("skorpion", (885, 1131, 60));
	battleroyale\game\_api::createEntity("skorpion", (925, 592, 68));
	battleroyale\game\_api::createEntity("usp", (946, 1130, 212));
	battleroyale\game\_api::createEntity("winchester1200", (-572, 1923, 53));
	battleroyale\game\_api::createEntity("winchester1200", (1019, 72, 53));

	battleroyale\game\_api::createEntity("12_gauge", (309, -1293, 62));
	battleroyale\game\_api::createEntity("12_gauge", (905, 408, 364));
	battleroyale\game\_api::createEntity("45", (-836, 586, 64));
	battleroyale\game\_api::createEntity("45", (1225, 691, 220));
	battleroyale\game\_api::createEntity("45", (311, 1883, 220));
	battleroyale\game\_api::createEntity("45", (492, 2173, 68));
	battleroyale\game\_api::createEntity("45", (790, 652, 220));
	battleroyale\game\_api::createEntity("45", (810, 1282, 60));
	battleroyale\game\_api::createEntity("45", (812, 375, 68));
	battleroyale\game\_api::createEntity("5_45", (-1008, 2062, 53));
	battleroyale\game\_api::createEntity("5_45", (-836, 2197, 53));
	battleroyale\game\_api::createEntity("5_45", (1136, 1694, 53));
	battleroyale\game\_api::createEntity("5_45", (732, 2107, 220));
	battleroyale\game\_api::createEntity("7_62", (-169, 1896, 53));
	battleroyale\game\_api::createEntity("7_62", (-618, 2722, 37));
	battleroyale\game\_api::createEntity("7_62", (213, -109, 108));
	battleroyale\game\_api::createEntity("9mm", (190, 1825, 220));
	battleroyale\game\_api::createEntity("9mm", (728, -24, 160));
	battleroyale\game\_api::createEntity("9mm", (908, 513, 68));
	battleroyale\game\_api::createEntity("rocket", (-4, 1403, 60));
	battleroyale\game\_api::createEntity("rocket", (1328, 1341, 204));

	battleroyale\game\_api::createEntity("flash_grenade", (-794, 2237, 204));
	battleroyale\game\_api::createEntity("flash_grenade", (921, 3490, 37));
	battleroyale\game\_api::createEntity("frag_grenade", (-736, 1785, 204));
	battleroyale\game\_api::createEntity("frag_grenade", (311, 2061, -83));
	battleroyale\game\_api::createEntity("frag_grenade", (429, 2169, -83));
	battleroyale\game\_api::createEntity("frag_grenade", (487, 1322, 220));
	battleroyale\game\_api::createEntity("frag_grenade", (697, 526, 220));
	battleroyale\game\_api::createEntity("smoke_grenade", (1761, 2652, 37));
	battleroyale\game\_api::createEntity("smoke_grenade", (495, 1292, 68));
	battleroyale\game\_api::createEntity("smoke_grenade", (690, 3149, 37));
	battleroyale\game\_api::createEntity("smoke_grenade", (745, 1812, -83));

	battleroyale\game\_api::createEntity("bandage", (-65, 2023, 220));
	battleroyale\game\_api::createEntity("bandage", (-70, 1931, -83));
	battleroyale\game\_api::createEntity("bandage", (-75, -318, 161));
	battleroyale\game\_api::createEntity("bandage", (1111, 1324, 53));
	battleroyale\game\_api::createEntity("bandage", (1324, 1470, 204));
	battleroyale\game\_api::createEntity("bandage", (178, 1850, -83));
	battleroyale\game\_api::createEntity("bandage", (256, 436, 68));
	battleroyale\game\_api::createEntity("bandage", (693, 672, 220));
	battleroyale\game\_api::createEntity("first_kit", (-18, 692, 204));
	battleroyale\game\_api::createEntity("first_kit", (-369, 653, 60));
	battleroyale\game\_api::createEntity("first_kit", (-48, 522, 204));
	battleroyale\game\_api::createEntity("first_kit", (-731, 2347, 37));
}
