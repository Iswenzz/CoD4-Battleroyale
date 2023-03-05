main()
{
	maps\mp\mp_cargoship_fx::main();
	maps\createart\mp_cargoship_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_cargoship");

	ambientPlay("ambient_cargoshipmp_ext");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar("r_specularcolorscale", "1");
	setdvar("compassmaxrange","2100");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((2954, 133, 396), -39);

	battleroyale\game\_api::createPlanePath((9316, 77, 2000), (-4684, 77, 2000), -180);
	battleroyale\game\_api::createPlanePath((-4684, 77, 2000), (9316, 77, 2000), 0);
	battleroyale\game\_api::createPlaneDrop((7, 8, 1000));
	battleroyale\game\_api::createPlaneDropTrigger((7, 8, 1000), 6000);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((2939, -1, 396));
	battleroyale\game\_api::createZone((2276, -82, 76));
	battleroyale\game\_api::createZone((1509, 56, 76));
	battleroyale\game\_api::createZone((483, 54, 76));
	battleroyale\game\_api::createZone((-434, 27, 76));
	battleroyale\game\_api::createZone((-1255, 4, 76));
	battleroyale\game\_api::createZone((-1948, 53, 76));
	battleroyale\game\_api::createZone((-3482, 7, 124));
	battleroyale\game\_api::createZone((-2476, -595, 284));
	battleroyale\game\_api::createZone((-2502, 565, 284));
	battleroyale\game\_api::createZone((432, -460, 76));
	battleroyale\game\_api::createZone((1044, 503, 76));

	battleroyale\game\_api::createLobbyBlocker((2955, 261, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((2955, -262, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3045, -271, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3128, -255, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3196, -221, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3238, -177, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3273, -106, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3287, -35, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3287, 31, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3274, 105, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3241, 172, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3188, 225, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3120, 258, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((3049, 271, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((2869, 19, 396), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((2958, -246, 396), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("ak47", (-1449, -614, 29));
	battleroyale\game\_api::createEntity("colt45", (1051, 355, 236));
	battleroyale\game\_api::createEntity("deserteagle", (2946, -163, 236));
	battleroyale\game\_api::createEntity("deserteaglegold", (2822, -27, 236));
	battleroyale\game\_api::createEntity("dragunov", (-605, -31, 236));
	battleroyale\game\_api::createEntity("dragunov", (2721, -294, 396));
	battleroyale\game\_api::createEntity("g36c", (-1471, 640, 29));
	battleroyale\game\_api::createEntity("m1014", (-3086, -307, 124));
	battleroyale\game\_api::createEntity("m14", (2086, -491, 182));
	battleroyale\game\_api::createEntity("m21", (-2655, -396, 284));
	battleroyale\game\_api::createEntity("m60e4", (1913, 630, 29));
	battleroyale\game\_api::createEntity("mp44", (-1140, 637, 29));
	battleroyale\game\_api::createEntity("mp44", (-2669, 371, 284));
	battleroyale\game\_api::createEntity("mp44", (-1128, -320, 289));
	battleroyale\game\_api::createEntity("mp5", (1181, -591, 289));
	battleroyale\game\_api::createEntity("p90", (-860, -522, 289));
	battleroyale\game\_api::createEntity("p90", (-581, -9, 76));
	battleroyale\game\_api::createEntity("uzi", (-3337, 44, 284));
	battleroyale\game\_api::createEntity("at4", (1930, -74, 289));
	battleroyale\game\_api::createEntity("rpg", (-1143, 424, 289));
	battleroyale\game\_api::createEntity("winchester1200", (-2438, 199, 124));
	battleroyale\game\_api::createEntity("winchester1200", (-2860, -306, 284));
	battleroyale\game\_api::createEntity("winchester1200", (167, 363, 182));
	battleroyale\game\_api::createEntity("winchester1200", (3871, -9, 272));

	battleroyale\game\_api::createEntity("12_gauge", (-2859, 314, 284));
	battleroyale\game\_api::createEntity("45", (-174, -539, 289));
	battleroyale\game\_api::createEntity("45", (-2387, -376, 284));
	battleroyale\game\_api::createEntity("45", (2949, 150, 236));
	battleroyale\game\_api::createEntity("45", (3567, -367, 272));
	battleroyale\game\_api::createEntity("5_45", (-1649, 77, 85));
	battleroyale\game\_api::createEntity("5_45", (-2845, 308, 124));
	battleroyale\game\_api::createEntity("5_45", (1026, -8, 236));
	battleroyale\game\_api::createEntity("5_45", (2542, 1, 240));
	battleroyale\game\_api::createEntity("7_62", (1211, 519, 289));
	battleroyale\game\_api::createEntity("7_62", (985, -309, 236));
	battleroyale\game\_api::createEntity("9mm", (-1581, 66, 289));
	battleroyale\game\_api::createEntity("9mm", (-3107, 305, 124));
	battleroyale\game\_api::createEntity("9mm", (2840, 131, 396));
	battleroyale\game\_api::createEntity("rocket", (-186, 565, 288));
	battleroyale\game\_api::createEntity("rocket", (1011, 2, 76));
	battleroyale\game\_api::createEntity("rocket", (1645, 617, 29));
	battleroyale\game\_api::createEntity("rocket", (2762, 342, 396));
	battleroyale\game\_api::createEntity("rocket", (3121, 117, 396));
	battleroyale\game\_api::createEntity("rocket", (3126, -105, 396));
	battleroyale\game\_api::createEntity("rocket", (3184, 3, 396));

	battleroyale\game\_api::createEntity("flash_grenade", (1495, -398, 289));
	battleroyale\game\_api::createEntity("frag_grenade", (-1547, -437, 182));
	battleroyale\game\_api::createEntity("frag_grenade", (-539, 342, 236));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1763, 112, 85));
	battleroyale\game\_api::createEntity("smoke_grenade", (-2669, -425, 124));
	battleroyale\game\_api::createEntity("smoke_grenade", (-523, -345, 236));
	battleroyale\game\_api::createEntity("smoke_grenade", (-857, 505, 290));
	battleroyale\game\_api::createEntity("smoke_grenade", (172, -586, 76));
	battleroyale\game\_api::createEntity("smoke_grenade", (2120, -4, 86));
	battleroyale\game\_api::createEntity("smoke_grenade", (3493, 392, 272));
	battleroyale\game\_api::createEntity("smoke_grenade", (572, 555, 288));

	battleroyale\game\_api::createEntity("bandage", (-1212, -627, 29));
	battleroyale\game\_api::createEntity("bandage", (-1697, -437, 182));
	battleroyale\game\_api::createEntity("bandage", (-2433, -157, 124));
	battleroyale\game\_api::createEntity("bandage", (-3602, 5, 124));
	battleroyale\game\_api::createEntity("bandage", (2009, -4, 86));
	battleroyale\game\_api::createEntity("first_kit", (-1741, 2, 85));
	battleroyale\game\_api::createEntity("first_kit", (-2392, 64, 284));
	battleroyale\game\_api::createEntity("first_kit", (-2818, -431, 124));
	battleroyale\game\_api::createEntity("first_kit", (1489, 392, 289));
	battleroyale\game\_api::createEntity("first_kit", (192, 569, 76));
	battleroyale\game\_api::createEntity("first_kit", (1923, -482, 182));
}
