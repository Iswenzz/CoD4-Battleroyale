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
	battleroyale\game\_api::createPlaneDropTrigger((634, -421, 651), 3000);
	battleroyale\game\_api::createPlaneDuration(10);

	battleroyale\game\_api::createZoneLevels(2);
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
	battleroyale\game\_api::createEntity("ak47", (-1811, 5711, 336));
	battleroyale\game\_api::createEntity("ak74u", (-2105, 5755, 329));
	battleroyale\game\_api::createEntity("ak74u", (-2848, 6460, 287));
	battleroyale\game\_api::createEntity("ak74u", (933, 4400, 110));
	battleroyale\game\_api::createEntity("at4", (-3879, 7755, 256));
	battleroyale\game\_api::createEntity("beretta", (-813, 7441, 98));
	battleroyale\game\_api::createEntity("beretta", (170, 583, 65));
	battleroyale\game\_api::createEntity("beretta", (93, -369, 208));
	battleroyale\game\_api::createEntity("colt45", (-3901, 7868, 256));
	battleroyale\game\_api::createEntity("colt45", (1165, -187, 253));
	battleroyale\game\_api::createEntity("colt45", (1603, -2060, 209));
	battleroyale\game\_api::createEntity("colt45", (917, 242, 233));
	battleroyale\game\_api::createEntity("colt45", (99, -683, 71));
	battleroyale\game\_api::createEntity("deserteagle", (-3595, 8151, 256));
	battleroyale\game\_api::createEntity("deserteagle", (-939, 3413, 152));
	battleroyale\game\_api::createEntity("deserteagle", (1678, 1046, 234));
	battleroyale\game\_api::createEntity("deserteaglegold", (-5304, 6811, 252));
	battleroyale\game\_api::createEntity("deserteaglegold", (486, 4962, 50));
	battleroyale\game\_api::createEntity("g3", (-1508, 5339, 36));
	battleroyale\game\_api::createEntity("g3", (-2994, 6660, 232));
	battleroyale\game\_api::createEntity("g36c", (678, 6890, 216));
	battleroyale\game\_api::createEntity("m1014", (2481, -821, 244));
	battleroyale\game\_api::createEntity("m1014", (253, 3569, 103));
	battleroyale\game\_api::createEntity("m14", (-3061, 6661, 232));
	battleroyale\game\_api::createEntity("m14", (-3254, 5857, 276));
	battleroyale\game\_api::createEntity("m16", (-2026, 7156, 377));
	battleroyale\game\_api::createEntity("m16", (-4782, 6357, 232));
	battleroyale\game\_api::createEntity("m16", (2218, -121, 372));
	battleroyale\game\_api::createEntity("m16", (3115, -729, 268));
	battleroyale\game\_api::createEntity("m16", (953, -101, 253));
	battleroyale\game\_api::createEntity("m21", (1815, -48, 381));
	battleroyale\game\_api::createEntity("m4", (-3263, 6925, 232));
	battleroyale\game\_api::createEntity("m4", (77, 7651, -23));
	battleroyale\game\_api::createEntity("m60e4", (-3868, 8071, 256));
	battleroyale\game\_api::createEntity("m60e4", (296, 5919, 131));
	battleroyale\game\_api::createEntity("mp44", (-3326, 5751, 10));
	battleroyale\game\_api::createEntity("mp44", (-3616, 8231, 293));
	battleroyale\game\_api::createEntity("mp44", (1256, -601, 253));
	battleroyale\game\_api::createEntity("mp44", (1872, -100, 381));
	battleroyale\game\_api::createEntity("mp5", (1552, 42, 221));
	battleroyale\game\_api::createEntity("mp5", (1599, -809, 360));
	battleroyale\game\_api::createEntity("p90", (-3059, 8065, 254));
	battleroyale\game\_api::createEntity("p90", (-339, -1857, 229));
	battleroyale\game\_api::createEntity("p90", (454, 4145, 90));
	battleroyale\game\_api::createEntity("skorpion", (1960, 221, 232));
	battleroyale\game\_api::createEntity("usp", (-3969, 7889, 256));
	battleroyale\game\_api::createEntity("usp", (10, 366, 233));
	battleroyale\game\_api::createEntity("usp", (248, -1062, 208));
	battleroyale\game\_api::createEntity("usp", (839, 637, 233));
	battleroyale\game\_api::createEntity("uzi", (-2245, 5298, 15));
	battleroyale\game\_api::createEntity("uzi", (1651, -891, 364));
	battleroyale\game\_api::createEntity("winchester1200", (-3130, 6780, 232));
	battleroyale\game\_api::createEntity("winchester1200", (-3541, 5607, 270));

	battleroyale\game\_api::createEntity("12_gauge", (-192, 6069, 351));
	battleroyale\game\_api::createEntity("12_gauge", (-2946, 7266, 232));
	battleroyale\game\_api::createEntity("12_gauge", (-2985, 7186, 384));
	battleroyale\game\_api::createEntity("12_gauge", (-3, 7692, -23));
	battleroyale\game\_api::createEntity("12_gauge", (-3194, 7824, 235));
	battleroyale\game\_api::createEntity("12_gauge", (-3737, 6212, 244));
	battleroyale\game\_api::createEntity("12_gauge", (1082, 526, 233));
	battleroyale\game\_api::createEntity("12_gauge", (1280, 6646, 210));
	battleroyale\game\_api::createEntity("12_gauge", (1742, -2054, 208));
	battleroyale\game\_api::createEntity("12_gauge", (2431, -1850, 212));
	battleroyale\game\_api::createEntity("12_gauge", (280, 3727, 90));
	battleroyale\game\_api::createEntity("12_gauge", (3085, -933, 268));
	battleroyale\game\_api::createEntity("12_gauge", (407, 4950, 50));
	battleroyale\game\_api::createEntity("12_gauge", (572, 4873, 187));
	battleroyale\game\_api::createEntity("12_gauge", (597, 3869, 90));
	battleroyale\game\_api::createEntity("12_gauge", (964, -492, 253));
	battleroyale\game\_api::createEntity("45", (-265, 448, 68));
	battleroyale\game\_api::createEntity("45", (-3020, 5516, 231));
	battleroyale\game\_api::createEntity("45", (-3046, 7204, 386));
	battleroyale\game\_api::createEntity("45", (-3500, 7991, 256));
	battleroyale\game\_api::createEntity("45", (-4285, 5714, 244));
	battleroyale\game\_api::createEntity("45", (-72, -110, 208));
	battleroyale\game\_api::createEntity("45", (3423, -1289, 337));
	battleroyale\game\_api::createEntity("5_45", (-20, -544, 208));
	battleroyale\game\_api::createEntity("5_45", (-2762, 7071, 232));
	battleroyale\game\_api::createEntity("5_45", (-3668, 8197, 256));
	battleroyale\game\_api::createEntity("5_45", (-3964, 6046, 244));
	battleroyale\game\_api::createEntity("5_45", (-4172, 5735, 244));
	battleroyale\game\_api::createEntity("5_45", (-8, -364, 344));
	battleroyale\game\_api::createEntity("5_45", (1235, 1897, 74));
	battleroyale\game\_api::createEntity("5_45", (1857, 138, 221));
	battleroyale\game\_api::createEntity("5_45", (2347, -109, 372));
	battleroyale\game\_api::createEntity("7_62", (-14, -569, 80));
	battleroyale\game\_api::createEntity("7_62", (-3424, 5488, -58));
	battleroyale\game\_api::createEntity("7_62", (-888, 7431, 99));
	battleroyale\game\_api::createEntity("7_62", (1468, -1344, 364));
	battleroyale\game\_api::createEntity("7_62", (1552, 1387, 234));
	battleroyale\game\_api::createEntity("7_62", (1677, 1443, 234));
	battleroyale\game\_api::createEntity("7_62", (221, -1182, 340));
	battleroyale\game\_api::createEntity("7_62", (268, 1559, 74));
	battleroyale\game\_api::createEntity("7_62", (599, -482, 59));
	battleroyale\game\_api::createEntity("9mm", (-2772, 6940, 384));
	battleroyale\game\_api::createEntity("9mm", (-3236, 7035, 385));
	battleroyale\game\_api::createEntity("9mm", (-67, 4729, 102));
	battleroyale\game\_api::createEntity("9mm", (1080, -929, 348));
	battleroyale\game\_api::createEntity("9mm", (80, -415, 344));
	battleroyale\game\_api::createEntity("rocket", (-1997, 7786, 295));
	battleroyale\game\_api::createEntity("rocket", (-2893, 7163, 232));
	battleroyale\game\_api::createEntity("rocket", (-3757, 5596, 244));
	battleroyale\game\_api::createEntity("rocket", (1392, 1414, 234));
	battleroyale\game\_api::createEntity("rocket", (2137, -246, 372));
	battleroyale\game\_api::createEntity("rocket", (365, 639, 233));

	battleroyale\game\_api::createEntity("flash_grenade", (-1533, 5874, 322));
	battleroyale\game\_api::createEntity("flash_grenade", (-2208, 5594, 6));
	battleroyale\game\_api::createEntity("flash_grenade", (-2339, 5985, 54));
	battleroyale\game\_api::createEntity("flash_grenade", (-3015, 7277, 268));
	battleroyale\game\_api::createEntity("flash_grenade", (-3276, 7048, 232));
	battleroyale\game\_api::createEntity("flash_grenade", (-4092, 5655, 244));
	battleroyale\game\_api::createEntity("flash_grenade", (1173, -607, 253));
	battleroyale\game\_api::createEntity("flash_grenade", (17, -330, 118));
	battleroyale\game\_api::createEntity("flash_grenade", (547, -642, 59));
	battleroyale\game\_api::createEntity("flash_grenade", (949, -417, 368));
	battleroyale\game\_api::createEntity("frag_grenade", (-1444, 5537, 34));
	battleroyale\game\_api::createEntity("frag_grenade", (-2999, 7110, 242));
	battleroyale\game\_api::createEntity("frag_grenade", (-3398, 6845, 224));
	battleroyale\game\_api::createEntity("frag_grenade", (20, 430, 233));
	battleroyale\game\_api::createEntity("frag_grenade", (2358, -307, 372));
	battleroyale\game\_api::createEntity("frag_grenade", (3078, -1181, 268));
	battleroyale\game\_api::createEntity("frag_grenade", (458, 4106, 196));
	battleroyale\game\_api::createEntity("smoke_grenade", (-1418, 5188, 47));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3034, 7149, 242));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3132, 7469, 232));
	battleroyale\game\_api::createEntity("smoke_grenade", (233, -1380, 236));
	battleroyale\game\_api::createEntity("smoke_grenade", (260, -243, 208));
	battleroyale\game\_api::createEntity("smoke_grenade", (266, -1001, 208));
	battleroyale\game\_api::createEntity("smoke_grenade", (3230, -26, 374));
	battleroyale\game\_api::createEntity("smoke_grenade", (42, 3927, 90));
	battleroyale\game\_api::createEntity("smoke_grenade", (734, 328, 68));

	battleroyale\game\_api::createEntity("bandage", (-1380, 5537, 41));
	battleroyale\game\_api::createEntity("bandage", (-2549, 7529, 294));
	battleroyale\game\_api::createEntity("bandage", (-299, 555, 66));
	battleroyale\game\_api::createEntity("bandage", (-3689, 5648, 244));
	battleroyale\game\_api::createEntity("bandage", (-3712, 5731, 280));
	battleroyale\game\_api::createEntity("bandage", (-4058, 6024, 244));
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
	battleroyale\game\_api::createEntity("bandage", (918, 5820, 106));
	battleroyale\game\_api::createEntity("first_kit", (-1150, 6022, 253));
	battleroyale\game\_api::createEntity("first_kit", (-1330, 5242, 53));
	battleroyale\game\_api::createEntity("first_kit", (-158, 5990, 338));
	battleroyale\game\_api::createEntity("first_kit", (-2420, 5753, 325));
	battleroyale\game\_api::createEntity("first_kit", (-2837, 6792, 232));
	battleroyale\game\_api::createEntity("first_kit", (-2968, 6728, 384));
	battleroyale\game\_api::createEntity("first_kit", (-3802, 7801, 256));
	battleroyale\game\_api::createEntity("first_kit", (-992, 5700, 400));
	battleroyale\game\_api::createEntity("first_kit", (1007, -565, 368));
	battleroyale\game\_api::createEntity("first_kit", (1202, 1633, 74));
	battleroyale\game\_api::createEntity("first_kit", (1463, -1237, 364));
	battleroyale\game\_api::createEntity("first_kit", (1561, -100, 381));
	battleroyale\game\_api::createEntity("first_kit", (1592, 263, 381));
	battleroyale\game\_api::createEntity("first_kit", (1686, 256, 401));
	battleroyale\game\_api::createEntity("first_kit", (1774, -1259, 364));
	battleroyale\game\_api::createEntity("first_kit", (178, 3720, 90));
	battleroyale\game\_api::createEntity("first_kit", (2662, -1108, 210));
	battleroyale\game\_api::createEntity("first_kit", (270, -203, 80));
	battleroyale\game\_api::createEntity("first_kit", (414, 4985, 187));
	battleroyale\game\_api::createEntity("first_kit", (915, -1589, 248));
}