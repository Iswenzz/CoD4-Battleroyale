#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	level.mapCredits = "SuX Lolz";
	level.fx["leaves"] = loadFX("dust/dust_wind_leaves_chernobyl");

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
	battleroyale\game\_api::createPlaneDuration(40);

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

	thread spawnSFXs();
	thread spawnFXs();
}

spawnFXs()
{
	fxs = getEntArray("tree_fx", "targetname");
	for (i = 0; i < fxs.size; i++)
	{
		if (randomInt(10) == 0)
			playLoopedFX(level.fx["leaves"], 0.75, fxs[i].origin);
		else
			fxs[i] delete();
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
