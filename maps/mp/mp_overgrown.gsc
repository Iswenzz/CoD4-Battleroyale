/*

  _|_|_|            _|      _|      _|                  _|
_|        _|    _|    _|  _|        _|          _|_|    _|  _|_|_|_|
  _|_|    _|    _|      _|          _|        _|    _|  _|      _|
      _|  _|    _|    _|  _|        _|        _|    _|  _|    _|
_|_|_|      _|_|_|  _|      _|      _|_|_|_|    _|_|    _|  _|_|_|_|

Map and GSC Made By SuX Lolz.

Steam: http://steamcommunity.com/profiles/76561198163403316/
Discord: https://discord.gg/76aHfGF
Youtube: https://www.youtube.com/channel/UC1vxOXBzEF7W4g7TRU0C1rw
Paypal: alexisnardiello@gmail.com
Email Pro: alexisnardiello@gmail.com

*/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.mapCredits = "SuX Lolz";

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetExpFog(5000, 50000, 123 / 255, 155 / 255, 175 / 255, 3);

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", "0.1");
	setdvar("r_glowbloomintensity1", "0.1");
	setdvar("r_glowskybleedintensity0", "0.1");

    setDvar("br_zone_start_level", 2);

    battleroyale\_auto::removeAllMapTriggers();
	battleroyale\_auto::removeAllSpawns();

	battleroyale\_auto::createSpawn((1299, -2310, -100-60), -160);
	battleroyale\_auto::createDropTrigger((285, -2438, 100), 3000);
	battleroyale\_auto::createPlanePath((-2874, -5010, 150), (3458, -438, 150), 36);
	battleroyale\_auto::createPlanePath((4745, -3831, 150), (-2155, -1273, 150), 160);
	battleroyale\_auto::createPlanePath((1570, 2492, 150), (-682, -6216, 150), -104);

	battleroyale\_auto::createZone((-616, -2053, 60));
	battleroyale\_auto::createZone((-414, 1071, -120));
	battleroyale\_auto::createZone((-113, -2724, -135));
	battleroyale\_auto::createZone((-47, -3431, -236));
	battleroyale\_auto::createZone((920, -4231, -71));
    battleroyale\_auto::createZone((2000, -3333, -120));
	battleroyale\_auto::setLastEjection((285, -2438, -264));

	battleroyale\_auto::createLobbyArea((890, -2387, -99), 200, 200);
	battleroyale\_auto::createLobbyArea((1197, -2496, -100), 200, 200);
	battleroyale\_auto::createLobbyArea((1369, -2283, -116), 200, 200);
	battleroyale\_auto::createLobbyArea((1077, -2915, 28), 200, 200);

	spawnEntities();
	spawnWeapons();
}

spawnEntities()
{
    battleroyale\_auto::createEntity("mag_beretta", (1122, -3317, 32));
    battleroyale\_auto::createEntity("mag_beretta", (1694, -1727, -132));
    battleroyale\_auto::createEntity("mag_colt45", (76, -3228, -219));

    battleroyale\_auto::createEntity("mag_dragunov", (-685, -5302, -107));
    battleroyale\_auto::createEntity("mag_dragunov", (-1001, -3373, -48));

    battleroyale\_auto::createEntity("mag_m16", (2529,  -2434, -84));
    battleroyale\_auto::createEntity("mag_m16", (1654, -4143, -60));

    battleroyale\_auto::createEntity("mag_ak47", (1680, -4069, 70));
    battleroyale\_auto::createEntity("mag_mp44", (517, -4294, -91));
    battleroyale\_auto::createEntity("mag_mp44", (-729, -3453, 88));

    battleroyale\_auto::createEntity("mag_mp5", (1121, -4465, 94));
    battleroyale\_auto::createEntity("mag_mp5", (997, -2303, -100));
    battleroyale\_auto::createEntity("mag_mp5", (1339, -2255, 38));
    battleroyale\_auto::createEntity("mag_mp5", (-851, -3659, -48));

    battleroyale\_auto::createEntity("mag_m1014", (2478, -2447, -84));
    battleroyale\_auto::createEntity("mag_m1014", (1592, -4170, -60));

    battleroyale\_auto::createEntity("mag_winchester1200", (2154, -4019, -55));
    battleroyale\_auto::createEntity("mag_winchester1200", (2003, -4089, -70));

    battleroyale\_auto::createEntity("mag_45", (1659, -4445, 46));
    battleroyale\_auto::createEntity("mag_9mm", (2803, -2534, -84));
    battleroyale\_auto::createEntity("mag_9mm", (-570, -3654, -41));

    battleroyale\_auto::createEntity("mag_7_62", (1572, -4416, 46));
    battleroyale\_auto::createEntity("mag_7_62", (2797, -2181, -38));

    battleroyale\_auto::createEntity("mag_5_45", (2780, -3024, -116));
    battleroyale\_auto::createEntity("mag_5_45", (558, -3719, -112));

    battleroyale\_auto::createEntity("mag_12_gauge", (-514, -5318, -100));
    battleroyale\_auto::createEntity("mag_12_gauge", (-1039, -3779, 88));
    battleroyale\_auto::createEntity("mag_12_gauge", (1756, -1541, -109));
    battleroyale\_auto::createEntity("mag_12_gauge", (2307, -3329, -116));
    battleroyale\_auto::createEntity("mag_12_gauge", (-1858, -4831, -93));

    battleroyale\_auto::createEntity("mag_flash_grenade", (2799, -2168, -58));
    battleroyale\_auto::createEntity("mag_flash_grenade", (1627, -4139, 46));
    battleroyale\_auto::createEntity("mag_flash_grenade", (2384, -2102, -115));

    battleroyale\_auto::createEntity("mag_smoke_grenade", (2588, -3514, -116));
    battleroyale\_auto::createEntity("mag_smoke_grenade", (1070, -2738, 28));
    battleroyale\_auto::createEntity("mag_smoke_grenade", (-530, -2352, -76));
    battleroyale\_auto::createEntity("mag_smoke_grenade", (1104, -4320, 78));

    battleroyale\_auto::createEntity("mag_bandage", (1455, -1728, -132));

    battleroyale\_auto::createEntity("mag_first_kit", (605, -3430, -112));
    battleroyale\_auto::createEntity("mag_first_kit", (-867, -3402, 88));
    battleroyale\_auto::createEntity("mag_first_kit", (1567, -1298, -137));
    battleroyale\_auto::createEntity("mag_first_kit", (-283, 459, -116));

    battleroyale\_auto::createEntity("mag_frag_grenade", (-538, -3378, -21));
    battleroyale\_auto::createEntity("mag_frag_grenade", (2798, -2504, -84));
    battleroyale\_auto::createEntity("mag_frag_grenade", (-1436, -1121, -120));
    battleroyale\_auto::createEntity("mag_frag_grenade", (-1661, -3068, -7));
}

spawnWeapons()
{
	battleroyale\_auto::createAmmo("mag_45", "sr_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_9mm", "sr_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_7_62", "sr_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	battleroyale\_auto::createAmmo("mag_12_gauge", "sr_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	battleroyale\_auto::createWeapon("beretta", "weapon_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("colt45", "weapon_colt1911_black", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("deserteagle", "weapon_desert_eagle_silver", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	battleroyale\_auto::createWeapon("dragunov", "weapon_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	battleroyale\_auto::createWeapon("m16", "weapon_m16_mp", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("ak47", "weapon_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("mp44", "weapon_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("mp5", "weapon_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	battleroyale\_auto::createWeapon("m1014", "weapon_benelli_super_90", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	battleroyale\_auto::createWeapon("winchester1200", "weapon_winchest1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	battleroyale\_auto::createSpecial("flash_grenade", "weapon_m84_flashbang_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	battleroyale\_auto::createSpecial("smoke_grenade", "weapon_us_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	battleroyale\_auto::createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", undefined, level.RNG_NORMAL);
	battleroyale\_auto::createSpecial("first_kit", "sr_first_kit", "health_pickup_large", "hud_icon_kit", undefined, level.RNG_BIG);
	battleroyale\_auto::createSpecial("frag_grenade", "weapon_m67_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
}
