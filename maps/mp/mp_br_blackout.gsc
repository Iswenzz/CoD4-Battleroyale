#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.mapCredits = "SuX Lolz";
	level.spawnFXs["leaves"] = loadFX("dust/dust_wind_leaves_chernobyl");

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

	battleroyale\game\_api::createPlaneDrop((-1008, -6207, 7021));

	battleroyale\game\_api::createZone((-2174, -3553, -1094));
	battleroyale\game\_api::createZone((1004, -7828, -815));
	battleroyale\game\_api::createZone((-2672, -13285, -2506));
	battleroyale\game\_api::createZone((273, 1156, -1358));
	battleroyale\game\_api::createZone((-11199, -6826, -3097));
	battleroyale\game\_api::createZone((-20439, -11104, -4304));
	battleroyale\game\_api::createZone((-13530, -1321, -3120));
	battleroyale\game\_api::createZone((7891, -2131, -1258));
	battleroyale\game\_api::createZone((7724, 6727, -1490));

	thread onPlayerConnected();

	thread spawnWeapons();
	thread spawnSFXs();
	thread spawnFXs();
}

spawnWeapons()
{
	battleroyale\game\_api::createAmmo("45", "sr_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("9mm", "sr_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("7_62", "sr_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	battleroyale\game\_api::createAmmo("12_gauge", "sr_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_BIG);
	battleroyale\game\_api::createWeapon("beretta", "9mm", "weapon_beretta", "weap_raise_plr", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("colt45", "5_45", "weapon_colt1911_black", "weap_raise_plr", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("deserteagle", "45", "weapon_desert_eagle_silver", "weap_raise_plr", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	battleroyale\game\_api::createWeapon("dragunov", "7_62", "weapon_dragunov", "weap_raise_plr", "hud_icon_dragunov", "dragunov_mp", level.RNG_RARE);
	battleroyale\game\_api::createWeapon("m16", "5_45", "weapon_m16_mp", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("ak47", "7_62", "weapon_ak47", "weap_raise_plr", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("mp44", "7_62", "weapon_mp44", "weap_raise_plr", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("mp5", "9mm", "weapon_mp5", "weap_raise_plr", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createWeapon("m1014", "12_gauge", "weapon_benelli_super_90", "weap_raise_plr", "hud_icon_benelli_m4", "m1014_mp", level.RNG_BIG);
	battleroyale\game\_api::createWeapon("winchester1200", "12_gauge", "weapon_winchest1200", "weap_raise_plr", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_BIG);
	battleroyale\game\_api::createGrenade("flash_grenade", "weapon_m84_flashbang_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	battleroyale\game\_api::createGrenade("smoke_grenade", "weapon_us_smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	battleroyale\game\_api::createGrenade("frag_grenade", "weapon_m67_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
	battleroyale\game\_api::createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", level.RNG_NORMAL);
	battleroyale\game\_api::createSpecial("first_kit", "sr_first_kit", "health_pickup_large", "hud_icon_kit", level.RNG_BIG);
}

spawnFXs()
{
	spawnFXss = getEntArray("tree_spawnFXs", "targetname");
	for (i = 0; i < spawnFXss.size; i += randomIntRange(1, 10))
	{
		spawnFXss[i] delete();
		playLoopedFX(level.spawnFXs["leaves"], 0.75, spawnFXss[i].origin);
	}
}

spawnSFXs()
{
	for (i = 0; i < level.zone.size; i++)
	{
		ori = spawn("script_origin", level.zone[i]);
		ori playLoopSound("ambient_forest_loop");
	}
}

onPlayerConnected()
{
	while (true)
	{
		level waittill("connected", player);
		player thread vision();
	}
}

vision()
{
	self endon("disconnect");

	self setClientDvar("dynent_active", "1");
	self setClientDvar("r_detail", "1");
	self setClientDvar("r_specular", "1");
	self setClientDvar("r_specularmap", "1");
	self setClientDvar("r_normal", "1");
	self setClientDvar("r_normalmap", "1");
	wait 0.05;

	self setClientDvar("r_drawsun", "0");
	self setClientDvar("r_drawwater", "1");
	self setClientDvar("r_drawdecals", "1");
	self setClientDvar("r_fog", "1");
	self setClientDvar("spawnFXs_enable", "1");
	self setClientDvar("r_lighttweaksunlight", "1.2");
	wait 0.05;

	self setClientDvar("r_filmTweakBrightness", "0.151");
	self setClientDvar("r_filmTweakContrast", "1.236");
	self setClientDvar("r_filmTweakDarktint", "1.031 0.917 1.159");
	self setClientDvar("r_filmTweakDesaturation", "0");
	self setClientDvar("r_filmTweakEnable", "1");
	self setClientDvar("r_filmTweakLighttint", "1.082 1.057 1.031");
	wait 0.05;

	self setClientDvar("r_filmTweakInvert", "0");
	self setClientDvar("r_filmUseTweaks", "1");
	self setClientDvar("r_lodBiasRigid", "-1000");
	self setClientDvar("r_lodBiasSkinned", "-1000");
	self setClientDvar("r_lodScaleRigid", "1");
	self setClientDvar("r_lodScaleSkinned", "1");
	wait 0.05;

	self setClientDvar("r_specularcolorscale", "1");
	self setClientDvar("r_gamma", "1");
	self setClientDvar("r_blur", "0");
	self setClientDvar("r_desaturation", "0");
}
