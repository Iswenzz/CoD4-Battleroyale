main()
{
	maps\mp\mp_farm_fx::main();
	maps\createart\mp_farm_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_farm");

	ambientPlay("ambient_farm");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar("r_specularcolorscale", "5");
	setdvar("compassmaxrange","2000");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((317, 1061, 277), 47);

	battleroyale\game\_api::createPlanePath((1842, 4725, 1000), (-1185, -2800, 1000), -111);
	battleroyale\game\_api::createPlaneDrop((932, 1719, 900));
	battleroyale\game\_api::createPlaneDropTrigger((932, 1719, 900), 1600);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((899, 1624, 276));
	battleroyale\game\_api::createZone((-234, 1979, 287));
	battleroyale\game\_api::createZone((147, 3383, 278));
	battleroyale\game\_api::createZone((1610, 3761, 272));
	battleroyale\game\_api::createZone((1417, 2410, 276));
	battleroyale\game\_api::createZone((908, 1516, 276));
	battleroyale\game\_api::createZone((466, 466, 259));
	battleroyale\game\_api::createZone((-405, -195, 249));
	battleroyale\game\_api::createZone((133, -947, 184));
	battleroyale\game\_api::createZone((513, -1394, 196));
	battleroyale\game\_api::createZone((-661, -1606, 184));
	battleroyale\game\_api::createZone((-1159, -2242, 209));

	battleroyale\game\_api::createLobbyBlocker((250, 1607, 276), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((707, 1137, 277), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("dragunov", (979, 4216, 277));
	battleroyale\game\_api::createEntity("g36c", (-825, -2283, 215));
	battleroyale\game\_api::createEntity("m16", (-1134, -1637, 322));
	battleroyale\game\_api::createEntity("m16", (1593, 885, 281));
	battleroyale\game\_api::createEntity("m4", (1051, 848, 281));
	battleroyale\game\_api::createEntity("m4", (1370, 1188, 281));
	battleroyale\game\_api::createEntity("m40a3", (305, 1070, 445));
	battleroyale\game\_api::createEntity("mp44", (2491, 891, 277));
	battleroyale\game\_api::createEntity("p90", (346, -1362, 190));
	battleroyale\game\_api::createEntity("rpg", (-907, -1600, 322));
	battleroyale\game\_api::createEntity("skorpion", (33, -1715, 196));
	battleroyale\game\_api::createEntity("uzi", (-738, 1949, 313));
	battleroyale\game\_api::createEntity("uzi", (1625, 3226, 276));
	battleroyale\game\_api::createEntity("winchester1200", (347, 1028, 277));

	battleroyale\game\_api::createEntity("12_gauge", (-787, 1458, 299));
	battleroyale\game\_api::createEntity("12_gauge", (1059, 2715, 429));
	battleroyale\game\_api::createEntity("45", (-1097, -1746, 314));
	battleroyale\game\_api::createEntity("45", (-1103, -1749, 212));
	battleroyale\game\_api::createEntity("45", (-356, -751, 352));
	battleroyale\game\_api::createEntity("45", (1962, 4398, 289));
	battleroyale\game\_api::createEntity("5_45", (616, 1079, 277));
	battleroyale\game\_api::createEntity("7_62", (-962, -1614, 216));
	battleroyale\game\_api::createEntity("7_62", (1205, 3558, 279));
	battleroyale\game\_api::createEntity("9mm", (1033, -430, 192));
	battleroyale\game\_api::createEntity("rocket", (1786, 3184, 277));

	battleroyale\game\_api::createEntity("flash_grenade", (-161, 3206, 282));
	battleroyale\game\_api::createEntity("flash_grenade", (1362, 2850, 276));
	battleroyale\game\_api::createEntity("flash_grenade", (1620, 4379, 274));
	battleroyale\game\_api::createEntity("flash_grenade", (2518, 1633, 274));
	battleroyale\game\_api::createEntity("flash_grenade", (343, 1594, 276));
	battleroyale\game\_api::createEntity("frag_grenade", (-1313, -2414, 209));
	battleroyale\game\_api::createEntity("frag_grenade", (-780, 884, 305));
	battleroyale\game\_api::createEntity("frag_grenade", (1308, -522, 192));
	battleroyale\game\_api::createEntity("frag_grenade", (1370, 1487, 281));
	battleroyale\game\_api::createEntity("frag_grenade", (1567, 1606, 281));
	battleroyale\game\_api::createEntity("frag_grenade", (1568, 1451, 281));
	battleroyale\game\_api::createEntity("frag_grenade", (1909, 3187, 277));
	battleroyale\game\_api::createEntity("frag_grenade", (318, 1462, 445));
	battleroyale\game\_api::createEntity("frag_grenade", (834, 2730, 429));
	battleroyale\game\_api::createEntity("smoke_grenade", (340, -887, 193));
	battleroyale\game\_api::createEntity("smoke_grenade", (380, 1359, 277));
	battleroyale\game\_api::createEntity("smoke_grenade", (445, 2581, 277));

	battleroyale\game\_api::createEntity("bandage", (-1192, -1222, 216));
	battleroyale\game\_api::createEntity("bandage", (-172, -751, 352));
	battleroyale\game\_api::createEntity("bandage", (1199, -292, 187));
	battleroyale\game\_api::createEntity("bandage", (1438, 3489, 279));
	battleroyale\game\_api::createEntity("bandage", (1492, 3547, 279));
	battleroyale\game\_api::createEntity("bandage", (1888, 2700, 277));
	battleroyale\game\_api::createEntity("bandage", (298, -390, 193));
	battleroyale\game\_api::createEntity("bandage", (324, 1219, 445));
	battleroyale\game\_api::createEntity("bandage", (600, 2335, 276));
	battleroyale\game\_api::createEntity("first_kit", (-1115, -2535, 206));
	battleroyale\game\_api::createEntity("first_kit", (-1186, -1626, 216));
	battleroyale\game\_api::createEntity("first_kit", (-329, -1786, 198));
	battleroyale\game\_api::createEntity("first_kit", (-344, -1568, 198));
	battleroyale\game\_api::createEntity("first_kit", (-584, -751, 352));
	battleroyale\game\_api::createEntity("first_kit", (-922, -1155, 216));
	battleroyale\game\_api::createEntity("first_kit", (1605, 1065, 281));
	battleroyale\game\_api::createEntity("first_kit", (1785, 3031, 315));
	battleroyale\game\_api::createEntity("first_kit", (206, -1693, 196));
	battleroyale\game\_api::createEntity("first_kit", (489, 817, 424));
	battleroyale\game\_api::createEntity("first_kit", (597, -624, 193));
}
