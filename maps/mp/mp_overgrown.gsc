#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\mp_overgrown_fx::main();
	maps\createart\mp_overgrown_art::main();
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_overgrown");

	ambientPlay("ambient_overgrown_day");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", "0.25");
	setdvar("r_glowbloomintensity1", "0.25");
	setdvar("r_glowskybleedintensity0", "0.3");
	setdvar("compassmaxrange","2200");

    battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((1299, -2310, -100), -160);

	battleroyale\game\_api::createPlanePath((-2874, -5010, 150), (3458, -438, 150), 36);
	battleroyale\game\_api::createPlanePath((4745, -3831, 150), (-2155, -1273, 150), 160);
	battleroyale\game\_api::createPlanePath((1570, 2492, 150), (-682, -6216, 150), -104);
	battleroyale\game\_api::createPlaneDrop((285, -2438, -264));
	battleroyale\game\_api::createPlaneDropTrigger((285, -2438, 100), 3000);
	battleroyale\game\_api::createPlaneDuration(15);

	battleroyale\game\_api::createZoneLevels(3);
	battleroyale\game\_api::createZone((-616, -2053, -400));
	battleroyale\game\_api::createZone((-414, 1071, -400));
	battleroyale\game\_api::createZone((-113, -2724, -400));
	battleroyale\game\_api::createZone((-47, -3431, -400));
	battleroyale\game\_api::createZone((920, -4231, -400));
    battleroyale\game\_api::createZone((2000, -3333, -400));

	battleroyale\game\_api::createLobbyBlocker((890, -2387, -99), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1197, -2496, -100), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1369, -2283, -116), 200, 200);
	battleroyale\game\_api::createLobbyBlocker((1077, -2915, 28), 200, 200);

	spawnEntities();
}

spawnEntities()
{

}
