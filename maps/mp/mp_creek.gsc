#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	setExpFog(612, 25000, 0.613, 0.671, 0.75, 0);
	visionSetNaked("mp_creek", 0);

	maps\mp\mp_creek_fx::main();
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_creek");

	ambientPlay("ambient_creek_ext0");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	battleroyale\game\_api::removeAllMapTriggers();
	battleroyale\game\_api::removeAllSpawns();
	battleroyale\game\_api::createSpawn((-3127, 7024, 232), -80);

	battleroyale\game\_api::createPlanePath((-6588, 7764, 960), (2000, 6029, 960), -10);
	battleroyale\game\_api::createPlanePath((2089, 3007, 960), (-4328, 9038, 960), 137);
	battleroyale\game\_api::createPlaneDrop((-748, 6798, 800));
	battleroyale\game\_api::createPlaneDropTrigger((-748, 6798, 900), 3000);
	battleroyale\game\_api::createPlaneDuration(15);

	battleroyale\game\_api::createZoneLevels(3);
	battleroyale\game\_api::createZone((988, 5978, -400));
	battleroyale\game\_api::createZone((-288, 4596, -400));
	battleroyale\game\_api::createZone((-2372, 7277, -400));
	battleroyale\game\_api::createZone((-4168, 6531, -400));
	battleroyale\game\_api::createZone((-3468, 8351, -400));

	battleroyale\game\_api::createLobbyBlocker((-2889, 6700, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 6944, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3227, 7018, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-3288, 7230, 232), 150, 100);
	battleroyale\game\_api::createLobbyBlocker((-2880, 6929, 295), 150, 100);

	spawnEntities();
}

spawnEntities()
{
	battleroyale\game\_api::createEntity("ak47", (-3492, 6939, 223));
	battleroyale\game\_api::createEntity("ak47", (-888, 7431, 99));
	battleroyale\game\_api::createEntity("ak74u", (-3276, 7048, 232));
	battleroyale\game\_api::createEntity("at4", (-588, 5145, 357));
	battleroyale\game\_api::createEntity("beretta", (-2837, 6792, 232));
	battleroyale\game\_api::createEntity("colt45", (-964, 5207, 239));
	battleroyale\game\_api::createEntity("deserteagle", (-2053, 7076, 372));
	battleroyale\game\_api::createEntity("deserteagle", (-3879, 7755, 256));
	battleroyale\game\_api::createEntity("deserteaglegold", (407, 4950, 50));
	battleroyale\game\_api::createEntity("dragunov", (178, 3720, 90));
	battleroyale\game\_api::createEntity("dragunov", (-3776, 6170, 244));
	battleroyale\game\_api::createEntity("dragunov", (-3868, 8071, 256));
	battleroyale\game\_api::createEntity("g3", (-4326, 6229, 218));
	battleroyale\game\_api::createEntity("g36c", (-2555, 7587, 294));
	battleroyale\game\_api::createEntity("g36c", (-609, 5372, 353));
	battleroyale\game\_api::createEntity("m1014", (53, 7562, -12));
	battleroyale\game\_api::createEntity("m1014", (597, 3869, 90));
	battleroyale\game\_api::createEntity("m14", (-3236, 7035, 385));
	battleroyale\game\_api::createEntity("m16", (572, 4873, 187));
	battleroyale\game\_api::createEntity("m21", (-132, 7842, 81));
	battleroyale\game\_api::createEntity("m21", (-2185, 6262, 112));
	battleroyale\game\_api::createEntity("m4", (-2968, 6728, 384));
	battleroyale\game\_api::createEntity("m40a3", (-2762, 7071, 232));
	battleroyale\game\_api::createEntity("m40a3", (-31, 4854, 102));
	battleroyale\game\_api::createEntity("m60e4", (-1811, 5711, 336));
	battleroyale\game\_api::createEntity("m60e4", (-3273, 7620, 234));
	battleroyale\game\_api::createEntity("m60e4", (-4260, 5799, 244));
	battleroyale\game\_api::createEntity("m60e4", (918, 5820, 106));
	battleroyale\game\_api::createEntity("mp44", (-1380, 5537, 41));
	battleroyale\game\_api::createEntity("mp44", (-1425, 6299, -59));
	battleroyale\game\_api::createEntity("remington700", (-375, 4112, 122));
	battleroyale\game\_api::createEntity("rpd", (-2999, 7110, 242));
	battleroyale\game\_api::createEntity("rpg", (-1240, 5971, 264));
	battleroyale\game\_api::createEntity("rpg", (-2652, 5693, 325));
	battleroyale\game\_api::createEntity("rpg", (-3802, 7801, 256));
	battleroyale\game\_api::createEntity("rpg", (458, 4106, 196));
	battleroyale\game\_api::createEntity("saw", (-1610, 5765, 345));
	battleroyale\game\_api::createEntity("skorpion", (-192, 6069, 351));
	battleroyale\game\_api::createEntity("skorpion", (-2254, 6041, 64));
	battleroyale\game\_api::createEntity("skorpion", (665, 4060, 188));
	battleroyale\game\_api::createEntity("uzi", (-3505, 5515, 236));
	battleroyale\game\_api::createEntity("uzi", (-3757, 5596, 244));
	battleroyale\game\_api::createEntity("uzi", (678, 6890, 216));

	battleroyale\game\_api::createEntity("12_gauge", (-1330, 5242, 53));
	battleroyale\game\_api::createEntity("12_gauge", (42, 3927, 90));
	battleroyale\game\_api::createEntity("45", (-2893, 7163, 232));
	battleroyale\game\_api::createEntity("45", (-3015, 7277, 268));
	battleroyale\game\_api::createEntity("45", (-3254, 5857, 276));
	battleroyale\game\_api::createEntity("5_45", (-1418, 5188, 47));
	battleroyale\game\_api::createEntity("5_45", (-158, 5990, 338));
	battleroyale\game\_api::createEntity("5_45", (-2549, 7529, 294));
	battleroyale\game\_api::createEntity("5_45", (414, 4985, 187));
	battleroyale\game\_api::createEntity("7_62", (-1150, 6022, 253));
	battleroyale\game\_api::createEntity("7_62", (-2105, 5755, 329));
	battleroyale\game\_api::createEntity("7_62", (-3668, 8197, 256));
	battleroyale\game\_api::createEntity("7_62", (-4058, 6024, 244));
	battleroyale\game\_api::createEntity("7_62", (-4782, 6357, 232));
	battleroyale\game\_api::createEntity("7_62", (280, 3727, 90));
	battleroyale\game\_api::createEntity("7_62", (454, 4145, 90));
	battleroyale\game\_api::createEntity("9mm", (-3020, 5516, 231));
	battleroyale\game\_api::createEntity("9mm", (-3541, 5607, 270));
	battleroyale\game\_api::createEntity("9mm", (-3737, 6212, 244));
	battleroyale\game\_api::createEntity("9mm", (-813, 7441, 98));
	battleroyale\game\_api::createEntity("rocket", (-2026, 7156, 377));
	battleroyale\game\_api::createEntity("rocket", (-2339, 5985, 54));
	battleroyale\game\_api::createEntity("rocket", (-2772, 6940, 384));
	battleroyale\game\_api::createEntity("rocket", (-3616, 8231, 293));
	battleroyale\game\_api::createEntity("rocket", (-3712, 5731, 280));
	battleroyale\game\_api::createEntity("rocket", (-5304, 6811, 252));
	battleroyale\game\_api::createEntity("rocket", (-992, 5700, 400));

	battleroyale\game\_api::createEntity("flash_grenade", (-1508, 5339, 36));
	battleroyale\game\_api::createEntity("flash_grenade", (-2994, 6660, 232));
	battleroyale\game\_api::createEntity("flash_grenade", (-3, 7692, -23));
	battleroyale\game\_api::createEntity("flash_grenade", (-3326, 5751, 10));
	battleroyale\game\_api::createEntity("flash_grenade", (-3595, 8151, 256));
	battleroyale\game\_api::createEntity("flash_grenade", (-4092, 5655, 244));
	battleroyale\game\_api::createEntity("flash_grenade", (-4285, 5714, 244));
	battleroyale\game\_api::createEntity("flash_grenade", (486, 4962, 50));
	battleroyale\game\_api::createEntity("frag_grenade", (-2245, 5298, 15));
	battleroyale\game\_api::createEntity("frag_grenade", (-3034, 7149, 242));
	battleroyale\game\_api::createEntity("frag_grenade", (-3398, 6845, 224));
	battleroyale\game\_api::createEntity("frag_grenade", (253, 3569, 103));
	battleroyale\game\_api::createEntity("smoke_grenade", (-2848, 6460, 287));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3059, 8065, 254));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3132, 7469, 232));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3263, 6925, 232));
	battleroyale\game\_api::createEntity("smoke_grenade", (-3964, 6046, 244));
	battleroyale\game\_api::createEntity("smoke_grenade", (-939, 3413, 152));
	battleroyale\game\_api::createEntity("smoke_grenade", (933, 4400, 110));

	battleroyale\game\_api::createEntity("bandage", (-1444, 5537, 34));
	battleroyale\game\_api::createEntity("bandage", (-2208, 5594, 6));
	battleroyale\game\_api::createEntity("bandage", (-2420, 5753, 325));
	battleroyale\game\_api::createEntity("bandage", (-2946, 7266, 232));
	battleroyale\game\_api::createEntity("bandage", (-2985, 7186, 384));
	battleroyale\game\_api::createEntity("bandage", (-3046, 7204, 386));
	battleroyale\game\_api::createEntity("bandage", (-3061, 6661, 232));
	battleroyale\game\_api::createEntity("bandage", (-3901, 7868, 256));
	battleroyale\game\_api::createEntity("bandage", (-3969, 7889, 256));
	battleroyale\game\_api::createEntity("bandage", (-67, 4729, 102));
	battleroyale\game\_api::createEntity("bandage", (77, 7651, -23));
	battleroyale\game\_api::createEntity("first_kit", (-1533, 5874, 322));
	battleroyale\game\_api::createEntity("first_kit", (-1997, 7786, 295));
	battleroyale\game\_api::createEntity("first_kit", (-3130, 6780, 232));
	battleroyale\game\_api::createEntity("first_kit", (-3194, 7824, 235));
	battleroyale\game\_api::createEntity("first_kit", (-3424, 5488, -58));
	battleroyale\game\_api::createEntity("first_kit", (-3500, 7991, 256));
	battleroyale\game\_api::createEntity("first_kit", (-3689, 5648, 244));
	battleroyale\game\_api::createEntity("first_kit", (-4172, 5735, 244));
	battleroyale\game\_api::createEntity("first_kit", (1280, 6646, 210));
	battleroyale\game\_api::createEntity("first_kit", (296, 5919, 131));
}
