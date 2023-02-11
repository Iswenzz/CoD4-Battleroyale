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
Paypal: suxlolz@outlook.fr
Email Pro: suxlolz@outlook.fr

*/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.map_authors = "SuX Lolz";

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetExpFog(5000, 50000, 123/255, 155/255, 175/255, 3);

	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", ".1");
	setdvar("r_glowbloomintensity1", ".1");
	setdvar("r_glowskybleedintensity0", ".1");

	setDvar("br_required_players", 2);
	setDvar("br_debug_mode", 0);
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
	battleroyale\_auto::setLastEjectCoord((285, -2438, -264));

	thread spawnAssets();
	thread spawnLobby();
	thread random_weapons();
}

spawnLobby()
{
	trigs = [];
	trigs[trigs.size] = spawn("trigger_radius", (890, -2387, -99-60), 0, 200, 200);
	trigs[trigs.size] = spawn("trigger_radius", (1197, -2496, -100-60), 0, 200, 200);
	trigs[trigs.size] = spawn("trigger_radius", (1369, -2283, -116-60), 0, 200, 200);
	trigs[trigs.size] = spawn("trigger_radius", (1077, -2915, 28-60), 0, 200, 200);

	for (i = 0; i < trigs.size; i++)
	{
		trigs[i].radius = 200;
		battleroyale\_auto::createLobbyArea(trigs[i]);
	}
}

spawnAssets()
{
	mag_beretta = [];
    mag_beretta[0] = (1122, -3317, 32);
    mag_beretta[1] = (1694, -1727, -132);
    for (i = 0; i < mag_beretta.size; i++)
        battleroyale\_auto::createAssetEntity("mag_beretta", "weapon_beretta", mag_beretta[i]);

    mag_colt45 = [];
    mag_colt45[0] = (76, -3228, -219);
    for (i = 0; i < mag_colt45.size; i++)
        battleroyale\_auto::createAssetEntity("mag_colt45", "weapon_colt1911_black", mag_colt45[i]);

    mag_deserteagle = [];
    for (i = 0; i < mag_deserteagle.size; i++)
        battleroyale\_auto::createAssetEntity("mag_deserteagle", "weapon_desert_eagle_silver", mag_deserteagle[i]);

    mag_dragunov = [];
    mag_dragunov[0] = (-685, -5302, -107);
    mag_dragunov[1] = (-1001, -3373, -48);
    for (i = 0; i < mag_dragunov.size; i++)
        battleroyale\_auto::createAssetEntity("mag_dragunov", "weapon_dragunov", mag_dragunov[i]);

    mag_m16 = [];
    mag_m16[0] = (2529,  -2434, -84);
    mag_m16[1] = (1654, -4143, -60);
    for (i = 0; i < mag_m16.size; i++)
        battleroyale\_auto::createAssetEntity("mag_m16", "weapon_m16_mp", mag_m16[i]);

    mag_ak47 = [];
    mag_ak47[0] = (1680, -4069, 70);
    for (i = 0; i < mag_ak47.size; i++)
        battleroyale\_auto::createAssetEntity("mag_ak47", "weapon_ak47", mag_ak47[i]);

    mag_mp44 = [];
    mag_mp44[0] = (517, -4294, -91);
    mag_mp44[1] = (-729, -3453, 88);
    for (i = 0; i < mag_mp44.size; i++)
        battleroyale\_auto::createAssetEntity("mag_mp44", "weapon_mp44", mag_mp44[i]);

    mag_mp5 = [];
    mag_mp5[0] = (1121, -4465, 94);
    mag_mp5[1] = (997, -2303, -100);
    mag_mp5[2] = (1339, -2255, 38);
    mag_mp5[3] = (-851, -3659, -48);
    for (i = 0; i < mag_mp5.size; i++)
        battleroyale\_auto::createAssetEntity("mag_mp5", "weapon_mp5", mag_mp5[i]);

    mag_m1014 = [];
    mag_m1014[0] = (2478, -2447, -84);
    mag_m1014[1] = (1592, -4170, -60);
    for (i = 0; i < mag_m1014.size; i++)
        battleroyale\_auto::createAssetEntity("mag_m1014", "weapon_benelli_super_90", mag_m1014[i]);

    mag_winchester1200 = [];
    mag_winchester1200[0] = (2154, -4019, -55);
    mag_winchester1200[1] = (2003, -4089, -70);
    for (i = 0; i < mag_winchester1200.size; i++)
        battleroyale\_auto::createAssetEntity("mag_winchester1200", "weapon_winchest1200", mag_winchester1200[i]);

    mag_45 = [];
    mag_45[0] = (1659, -4445, 46);
    for (i = 0; i < mag_45.size; i++)
        battleroyale\_auto::createAssetEntity("mag_45", "sr_45", mag_45[i]);

    mag_9mm = [];
    mag_9mm[0] = (2803, -2534, -84);
    mag_9mm[1] = (-570, -3654, -41);
    for (i = 0; i < mag_9mm.size; i++)
        battleroyale\_auto::createAssetEntity("mag_9mm", "sr_9mm", mag_9mm[i]);

    mag_7_62 = [];
    mag_7_62[0] = (1572, -4416, 46);
    mag_7_62[1] = (2797, -2181, -38);
    for (i = 0; i < mag_7_62.size; i++)
        battleroyale\_auto::createAssetEntity("mag_7_62", "sr_7_62", mag_7_62[i]);

    mag_5_45 = [];
    mag_5_45[0] = (2780, -3024, -116);
    mag_5_45[1] = (558, -3719, -112);
    for (i = 0; i < mag_5_45.size; i++)
        battleroyale\_auto::createAssetEntity("mag_5_45", "sr_5_45", mag_5_45[i]);

    mag_12_gauge = [];
    mag_12_gauge[0] = (-514, -5318, -100);
    mag_12_gauge[1] = (-1039, -3779, 88);
    mag_12_gauge[2] = (1756, -1541, -109);
    mag_12_gauge[3] = (2307, -3329, -116);
    mag_12_gauge[4] = (-1858, -4831, -93);
    for (i = 0; i < mag_12_gauge.size; i++)
        battleroyale\_auto::createAssetEntity("mag_12_gauge", "sr_gauge", mag_12_gauge[i]);

    mag_flash_grenade = [];
    mag_flash_grenade[0] = (2799, -2168, -58);
    mag_flash_grenade[1] = (1627, -4139, 46);
    mag_flash_grenade[2] = (2384, -2102, -115);
    for (i = 0; i < mag_flash_grenade.size; i++)
        battleroyale\_auto::createAssetEntity("mag_flash_grenade", "weapon_m84_flashbang_grenade", mag_flash_grenade[i]);

    mag_smoke_grenade = [];
    mag_smoke_grenade[0] = (2588, -3514, -116);
    mag_smoke_grenade[1] = (1070, -2738, 28);
    mag_smoke_grenade[2] = (-530, -2352, -76);
    mag_smoke_grenade[3] = (1104, -4320, 78);
    for (i = 0; i < mag_smoke_grenade.size; i++)
        battleroyale\_auto::createAssetEntity("mag_smoke_grenade", "weapon_us_smoke_grenade", mag_smoke_grenade[i]);

    mag_bandage = [];
    mag_bandage[0] = (1455, -1728, -132);
    for (i = 0; i < mag_bandage.size; i++)
        battleroyale\_auto::createAssetEntity("mag_bandage", "sr_bandage", mag_bandage[i]);

    mag_first_kit = [];
    mag_first_kit[0] = (605, -3430, -112);
    mag_first_kit[1] = (-867, -3402, 88);
    mag_first_kit[2] = (1567, -1298, -137);
    mag_first_kit[3] = (-283, 459, -116);
    for (i = 0; i < mag_first_kit.size; i++)
        battleroyale\_auto::createAssetEntity("mag_first_kit", "sr_first_kit", mag_first_kit[i]);

    mag_frag_grenade = [];
    mag_frag_grenade[0] = (-538, -3378, -21);
    mag_frag_grenade[1] = (2798, -2504, -84);
    mag_frag_grenade[2] = (-1436, -1121, -120);
    mag_frag_grenade[3] = (-1661, -3068, -7);
    for (i = 0; i < mag_frag_grenade.size; i++)
        battleroyale\_auto::createAssetEntity("mag_frag_grenade", "weapon_m67_grenade", mag_frag_grenade[i]);
}

random_weapons()
{
	level waittill("br_started");
	wait 5;

	item = [];
	item[0] = battleroyale\_auto::createAmmo("mag_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	item[1] = battleroyale\_auto::createAmmo("mag_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	item[2] = battleroyale\_auto::createAmmo("mag_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	item[3] = battleroyale\_auto::createAmmo("mag_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	item[4] = battleroyale\_auto::createAmmo("mag_12_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	item[5] = battleroyale\_auto::createWeapon("mag_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	item[6] = battleroyale\_auto::createWeapon("mag_colt45", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	item[7] = battleroyale\_auto::createWeapon("mag_deserteagle", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	item[8] = battleroyale\_auto::createWeapon("mag_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	item[9] = battleroyale\_auto::createWeapon("mag_m16", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	item[10] = battleroyale\_auto::createWeapon("mag_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	item[11] = battleroyale\_auto::createWeapon("mag_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	item[12] = battleroyale\_auto::createWeapon("mag_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	item[13] = battleroyale\_auto::createWeapon("mag_m1014", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	item[14] = battleroyale\_auto::createWeapon("mag_winchester1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	item[15] = battleroyale\_auto::createSpecial("mag_flash_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	item[16] = battleroyale\_auto::createSpecial("mag_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	item[17] = battleroyale\_auto::createSpecial("mag_bandage", "health_pickup_large", "hud_icon_band", "", level.RNG_NORMAL);
	item[18] = battleroyale\_auto::createSpecial("mag_first_kit", "health_pickup_large", "hud_icon_kit", "", level.RNG_BIG);
	item[19] = battleroyale\_auto::createSpecial("mag_frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);

	for(i = 0; i < item.size; i++)
		item[i] thread battleroyale\_auto::item_trig();
}
