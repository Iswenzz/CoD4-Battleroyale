#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_overgrown");

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
	battleroyale\game\_api::createSpawn((1299, -2310, -100), -160);

	battleroyale\game\_api::createPlanePath((-2874, -5010, 150), (3458, -438, 150), 36);
	battleroyale\game\_api::createPlanePath((4745, -3831, 150), (-2155, -1273, 150), 160);
	battleroyale\game\_api::createPlanePath((1570, 2492, 150), (-682, -6216, 150), -104);
	battleroyale\game\_api::createPlaneDrop((285, -2438, -264));
	battleroyale\game\_api::createPlaneDropTrigger((285, -2438, 100), 3000);
	battleroyale\game\_api::createPlaneDuration(15);

	battleroyale\game\_api::createZoneLevels(2);
	battleroyale\game\_api::createZone((-616, -2053, 60));
	battleroyale\game\_api::createZone((-414, 1071, -120));
	battleroyale\game\_api::createZone((-113, -2724, -135));
	battleroyale\game\_api::createZone((-47, -3431, -236));
	battleroyale\game\_api::createZone((920, -4231, -71));
    battleroyale\game\_api::createZone((2000, -3333, -120));

	battleroyale\game\_api::createLobbyBlocker((890, -2387, -99), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1197, -2496, -100), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1369, -2283, -116), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1077, -2915, 28), 200, 200);

	spawnEntities();
}

spawnEntities()
{
    battleroyale\game\_api::createEntity("beretta", (1122, -3317, 32));
    battleroyale\game\_api::createEntity("beretta", (1694, -1727, -132));
    battleroyale\game\_api::createEntity("colt45", (76, -3228, -219));

    battleroyale\game\_api::createEntity("dragunov", (-685, -5302, -107));
    battleroyale\game\_api::createEntity("dragunov", (-1001, -3373, -48));

    battleroyale\game\_api::createEntity("m16", (2529,  -2434, -84));
    battleroyale\game\_api::createEntity("m16", (1654, -4143, -60));

    battleroyale\game\_api::createEntity("ak47", (1680, -4069, 70));
    battleroyale\game\_api::createEntity("mp44", (517, -4294, -91));
    battleroyale\game\_api::createEntity("mp44", (-729, -3453, 88));

    battleroyale\game\_api::createEntity("mp5", (1121, -4465, 94));
    battleroyale\game\_api::createEntity("mp5", (997, -2303, -100));
    battleroyale\game\_api::createEntity("mp5", (1339, -2255, 38));
    battleroyale\game\_api::createEntity("mp5", (-851, -3659, -48));

    battleroyale\game\_api::createEntity("m1014", (2478, -2447, -84));
    battleroyale\game\_api::createEntity("m1014", (1592, -4170, -60));

    battleroyale\game\_api::createEntity("winchester1200", (2154, -4019, -55));
    battleroyale\game\_api::createEntity("winchester1200", (2003, -4089, -70));

    battleroyale\game\_api::createEntity("45", (1659, -4445, 46));
    battleroyale\game\_api::createEntity("9mm", (2803, -2534, -84));
    battleroyale\game\_api::createEntity("9mm", (-570, -3654, -41));

    battleroyale\game\_api::createEntity("7_62", (1572, -4416, 46));
    battleroyale\game\_api::createEntity("7_62", (2797, -2181, -38));

    battleroyale\game\_api::createEntity("5_45", (2780, -3024, -116));
    battleroyale\game\_api::createEntity("5_45", (558, -3719, -112));

    battleroyale\game\_api::createEntity("12_gauge", (-514, -5318, -100));
    battleroyale\game\_api::createEntity("12_gauge", (-1039, -3779, 88));
    battleroyale\game\_api::createEntity("12_gauge", (1756, -1541, -109));
    battleroyale\game\_api::createEntity("12_gauge", (2307, -3329, -116));
    battleroyale\game\_api::createEntity("12_gauge", (-1858, -4831, -93));

    battleroyale\game\_api::createEntity("flash_grenade", (2799, -2168, -58));
    battleroyale\game\_api::createEntity("flash_grenade", (1627, -4139, 46));
    battleroyale\game\_api::createEntity("flash_grenade", (2384, -2102, -115));

    battleroyale\game\_api::createEntity("smoke_grenade", (2588, -3514, -116));
    battleroyale\game\_api::createEntity("smoke_grenade", (1070, -2738, 28));
    battleroyale\game\_api::createEntity("smoke_grenade", (-530, -2352, -76));
    battleroyale\game\_api::createEntity("smoke_grenade", (1104, -4320, 78));

    battleroyale\game\_api::createEntity("bandage", (1455, -1728, -132));

    battleroyale\game\_api::createEntity("first_kit", (605, -3430, -112));
    battleroyale\game\_api::createEntity("first_kit", (-867, -3402, 88));
    battleroyale\game\_api::createEntity("first_kit", (1567, -1298, -137));
    battleroyale\game\_api::createEntity("first_kit", (-283, 459, -116));

    battleroyale\game\_api::createEntity("frag_grenade", (-538, -3378, -21));
    battleroyale\game\_api::createEntity("frag_grenade", (2798, -2504, -84));
    battleroyale\game\_api::createEntity("frag_grenade", (-1436, -1121, -120));
    battleroyale\game\_api::createEntity("frag_grenade", (-1661, -3068, -7));
}
