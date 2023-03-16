main()
{
	maps\mp\mp_crossfire_fx::main();
	maps\createart\mp_crossfire_art::main();
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_crossfire");

	ambientPlay("ambient_crossfire");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("r_specularcolorscale", "1.85");
	setdvar("compassmaxrange", "2100");

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((5163, -668, 76), 107);

	battleroyale\game\_api::createPlanePath((3662, -5396, 883), (5526, -791, 883), 68);
	battleroyale\game\_api::createPlanePath((3283, 18, 843), (5586, -4465, 843), -64);
	battleroyale\game\_api::createPlaneDrop((4691, -3031, 778));
	battleroyale\game\_api::createPlaneDropTrigger((4691, -3031, 778), 2000);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(4);
	battleroyale\game\_api::createZone((4868, -962, 84));
	battleroyale\game\_api::createZone((3737, -1107, 57));
	battleroyale\game\_api::createZone((5713, -2136, 81));
	battleroyale\game\_api::createZone((3924, -2332, -6));
	battleroyale\game\_api::createZone((3958, -3752, -84));
	battleroyale\game\_api::createZone((4905, -4525, -91));
	battleroyale\game\_api::createZone((6028, -4305, -94));

	battleroyale\game\_api::createLobbyBlocker((5021, -698, 76), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((4838, -619, 76), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((4448, -448, 84), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((4377, -264, 76), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("beretta", (4281, -3083, 132));
	battleroyale\game\_api::createEntity("beretta", (4333, -2324, 9));
	battleroyale\game\_api::createEntity("beretta", (5425, -3621, -11));
	battleroyale\game\_api::createEntity("beretta", (6597, -4584, 15));
	battleroyale\game\_api::createEntity("colt45", (3380, -3379, -83));
	battleroyale\game\_api::createEntity("colt45", (3469, -1307, 86));
	battleroyale\game\_api::createEntity("colt45", (3747, -3962, 53));
	battleroyale\game\_api::createEntity("colt45", (4195, -2832, -3));
	battleroyale\game\_api::createEntity("colt45", (5131, -679, 76));
	battleroyale\game\_api::createEntity("deserteagle", (5644, -4122, -93));
	battleroyale\game\_api::createEntity("deserteaglegold", (4647, -1910, 220));
	battleroyale\game\_api::createEntity("deserteaglegold", (5318, -763, 148));
	battleroyale\game\_api::createEntity("g3", (4805, -4970, -77));
	battleroyale\game\_api::createEntity("g3", (5903, -1497, 84));
	battleroyale\game\_api::createEntity("g36c", (3083, -449, 68));
	battleroyale\game\_api::createEntity("g36c", (3812, -1606, 86));
	battleroyale\game\_api::createEntity("g36c", (5505, -1149, 84));
	battleroyale\game\_api::createEntity("g36c", (5917, -1549, 220));
	battleroyale\game\_api::createEntity("m1014", (3163, -1060, 79));
	battleroyale\game\_api::createEntity("m1014", (3703, -2090, -1));
	battleroyale\game\_api::createEntity("m14", (4472, -5096, 84));
	battleroyale\game\_api::createEntity("m16", (4235, -3050, -3));
	battleroyale\game\_api::createEntity("m16", (6047, -2513, 88));
	battleroyale\game\_api::createEntity("m21", (3167, -4034, 53));
	battleroyale\game\_api::createEntity("m4", (4090, -4725, 84));
	battleroyale\game\_api::createEntity("m4", (5403, -3574, -11));
	battleroyale\game\_api::createEntity("m4", (6666, -4337, 100));
	battleroyale\game\_api::createEntity("m40a3", (6241, -2183, 105));
	battleroyale\game\_api::createEntity("m60e4", (3639, -1333, 86));
	battleroyale\game\_api::createEntity("m60e4", (3983, -2696, 132));
	battleroyale\game\_api::createEntity("m60e4", (5524, -1133, 220));
	battleroyale\game\_api::createEntity("mp44", (3270, -3334, -83));
	battleroyale\game\_api::createEntity("mp5", (3169, -3775, -83));
	battleroyale\game\_api::createEntity("mp5", (5192, -992, 220));
	battleroyale\game\_api::createEntity("p90", (3952, -3678, -83));
	battleroyale\game\_api::createEntity("remington700", (3611, -3601, -83));
	battleroyale\game\_api::createEntity("remington700", (6461, -4401, 108));
	battleroyale\game\_api::createEntity("rpd", (3514, -4274, 78));
	battleroyale\game\_api::createEntity("rpd", (5641, -3178, -13));
	battleroyale\game\_api::createEntity("rpg", (3060, -376, 68));
	battleroyale\game\_api::createEntity("rpg", (6345, -1365, 70));
	battleroyale\game\_api::createEntity("saw", (4826, -1983, 220));
	battleroyale\game\_api::createEntity("saw", (5318, -2511, 81));
	battleroyale\game\_api::createEntity("skorpion", (4565, -1763, 92));
	battleroyale\game\_api::createEntity("skorpion", (4809, -1855, 220));
	battleroyale\game\_api::createEntity("skorpion", (5897, -2722, 88));
	battleroyale\game\_api::createEntity("usp", (4123, -4581, 85));
	battleroyale\game\_api::createEntity("usp", (4385, -4908, -51));
	battleroyale\game\_api::createEntity("usp", (4446, -214, 76));
	battleroyale\game\_api::createEntity("usp", (5633, -2913, 88));
	battleroyale\game\_api::createEntity("winchester1200", (4278, -4913, 84));
	battleroyale\game\_api::createEntity("winchester1200", (4507, -362, 76));
	battleroyale\game\_api::createEntity("winchester1200", (5224, -3142, -11));
	battleroyale\game\_api::createEntity("winchester1200", (5481, -4849, -77));
	battleroyale\game\_api::createEntity("winchester1200", (5655, -4207, -96));
	battleroyale\game\_api::createEntity("winchester1200", (5756, -1803, 84));

	battleroyale\game\_api::createEntity("12_gauge", (3360, -3720, -79));
	battleroyale\game\_api::createEntity("12_gauge", (4401, -2170, 9));
	battleroyale\game\_api::createEntity("12_gauge", (5025, -4960, -77));
	battleroyale\game\_api::createEntity("12_gauge", (5030, -3092, -11));
	battleroyale\game\_api::createEntity("12_gauge", (5596, -1009, 84));
	battleroyale\game\_api::createEntity("12_gauge", (5865, -1491, 220));
	battleroyale\game\_api::createEntity("12_gauge", (6526, -4507, 13));
	battleroyale\game\_api::createEntity("45", (4331, -1903, 196));
	battleroyale\game\_api::createEntity("45", (4460, -1880, 227));
	battleroyale\game\_api::createEntity("45", (4487, -4914, -51));
	battleroyale\game\_api::createEntity("45", (4705, -265, 76));
	battleroyale\game\_api::createEntity("45", (6422, -2064, 105));
	battleroyale\game\_api::createEntity("5_45", (4306, -46, 71));
	battleroyale\game\_api::createEntity("5_45", (4402, -2763, 132));
	battleroyale\game\_api::createEntity("5_45", (4501, -4839, 84));
	battleroyale\game\_api::createEntity("5_45", (5124, -413, 76));
	battleroyale\game\_api::createEntity("5_45", (5772, -4882, -77));
	battleroyale\game\_api::createEntity("5_45", (5952, -2655, 88));
	battleroyale\game\_api::createEntity("7_62", (3244, -1354, 86));
	battleroyale\game\_api::createEntity("7_62", (4017, -1577, 86));
	battleroyale\game\_api::createEntity("7_62", (4413, -2911, 132));
	battleroyale\game\_api::createEntity("7_62", (5479, -1284, 220));
	battleroyale\game\_api::createEntity("7_62", (5703, -852, 84));
	battleroyale\game\_api::createEntity("7_62", (6010, -2164, 105));
	battleroyale\game\_api::createEntity("7_62", (6013, -1342, 84));
	battleroyale\game\_api::createEntity("9mm", (3625, -4643, -78));
	battleroyale\game\_api::createEntity("9mm", (4629, -303, 76));
	battleroyale\game\_api::createEntity("rocket", (3755, -3524, -83));
	battleroyale\game\_api::createEntity("rocket", (4463, -2415, 9));
	battleroyale\game\_api::createEntity("rocket", (5889, -1558, 84));
	battleroyale\game\_api::createEntity("rocket", (6201, -1171, 220));

	battleroyale\game\_api::createEntity("flash_grenade", (3052, -3958, 78));
	battleroyale\game\_api::createEntity("flash_grenade", (5586, -821, 256));
	battleroyale\game\_api::createEntity("flash_grenade", (5673, -4865, -77));
	battleroyale\game\_api::createEntity("flash_grenade", (5792, -3050, 88));
	battleroyale\game\_api::createEntity("frag_grenade", (3068, -4004, 78));
	battleroyale\game\_api::createEntity("frag_grenade", (3713, -4749, -78));
	battleroyale\game\_api::createEntity("frag_grenade", (4069, -2704, -3));
	battleroyale\game\_api::createEntity("frag_grenade", (6024, -2693, 88));
	battleroyale\game\_api::createEntity("frag_grenade", (6138, -1107, 84));
	battleroyale\game\_api::createEntity("frag_grenade", (6241, -2336, 105));
	battleroyale\game\_api::createEntity("smoke_grenade", (3543, -4229, 78));
	battleroyale\game\_api::createEntity("smoke_grenade", (3558, -4279, -71));
	battleroyale\game\_api::createEntity("smoke_grenade", (3595, -3559, 53));
	battleroyale\game\_api::createEntity("smoke_grenade", (4737, -1924, 92));
	battleroyale\game\_api::createEntity("smoke_grenade", (5728, -3146, -12));
	battleroyale\game\_api::createEntity("smoke_grenade", (6318, -1757, 105));

	battleroyale\game\_api::createEntity("bandage", (3166, -1129, 80));
	battleroyale\game\_api::createEntity("bandage", (3215, -1286, 86));
	battleroyale\game\_api::createEntity("bandage", (3989, -2703, -3));
	battleroyale\game\_api::createEntity("bandage", (3995, -1846, 86));
	battleroyale\game\_api::createEntity("bandage", (4083, -4922, -51));
	battleroyale\game\_api::createEntity("bandage", (4128, -3029, 152));
	battleroyale\game\_api::createEntity("bandage", (4446, -1859, 92));
	battleroyale\game\_api::createEntity("bandage", (4469, -4967, -17));
	battleroyale\game\_api::createEntity("bandage", (4484, -1835, 227));
	battleroyale\game\_api::createEntity("bandage", (5249, -476, 76));
	battleroyale\game\_api::createEntity("bandage", (5330, -4979, -77));
	battleroyale\game\_api::createEntity("bandage", (5605, -2635, 88));
	battleroyale\game\_api::createEntity("first_kit", (3291, -3248, -83));
	battleroyale\game\_api::createEntity("first_kit", (4088, -2758, 132));
	battleroyale\game\_api::createEntity("first_kit", (4551, -2004, 92));
	battleroyale\game\_api::createEntity("first_kit", (5182, -3410, -11));
	battleroyale\game\_api::createEntity("first_kit", (5479, -2251, 103));
	battleroyale\game\_api::createEntity("first_kit", (5934, -1302, 220));
	battleroyale\game\_api::createEntity("first_kit", (6448, -1751, 105));
}
