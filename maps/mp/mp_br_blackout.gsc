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
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
 
	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0", ".1");
	setdvar("r_glowbloomintensity1", ".1");
	setdvar("r_glowskybleedintensity0", ".1");

	level.fx["leaves"] = loadFx("dust/dust_wind_leaves_chernobyl");

	SetExpFog(5000, 50000, 123/255, 155/255, 175/255, 3);

	level.zone = [];
	level.zone[0] = (-2174, -3553, -1094);
	level.zone[1] = (1004, -7828, -815);
	level.zone[2] = (-2672, -13285, -2506);
	level.zone[3] = (273, 1156, -1358);
	level.zone[4] = (-11199, -6826, -3097);
	level.zone[5] = (-20439, -11104, -4304);
	level.zone[6] = (-13530, -1321, -3120);
	level.zone[7] = (7891, -2131, -1258);
	level.zone[8] = (7724, 6727, -1490);

	level.eject_last_coord = (-1008, -6207, 7021);

	thread onPlayerConnected();
	thread random_weapons();

	thread sfx();
	thread fx();
}

random_weapons()
{
	level waittill("br_started");

	item = [];
	// createAmmo(ent, sound, giveammo, rng)
	item[0] = battleroyale\_auto::createAmmo("mag_45", "amunition", 8, level.RNG_NORMAL);
	item[1] = battleroyale\_auto::createAmmo("mag_9mm", "amunition", 15, level.RNG_NORMAL);
	item[2] = battleroyale\_auto::createAmmo("mag_7_62", "amunition", 30, level.RNG_NORMAL);
	item[3] = battleroyale\_auto::createAmmo("mag_5_45", "amunition", 30, level.RNG_NORMAL);
	item[4] = battleroyale\_auto::createAmmo("mag_12_gauge", "amunition", 6, level.RNG_BIG);
	// createWeapon(ent, sound, weapon_mp, rng)
	item[5] = battleroyale\_auto::createWeapon("mag_beretta", "amunition", "beretta_mp", level.RNG_SMALL);
	item[6] = battleroyale\_auto::createWeapon("mag_colt45", "amunition", "colt45_mp", level.RNG_SMALL);
	item[7] = battleroyale\_auto::createWeapon("mag_deserteagle", "amunition", "deserteagle_mp", level.RNG_SMALL);
	item[8] = battleroyale\_auto::createWeapon("mag_dragunov", "amunition", "dragunov_mp", level.RNG_RARE);
	item[9] = battleroyale\_auto::createWeapon("mag_m16", "amunition", "m16_mp", level.RNG_NORMAL);
	item[10] = battleroyale\_auto::createWeapon("mag_ak47", "amunition", "ak47_mp", level.RNG_NORMAL);
	item[11] = battleroyale\_auto::createWeapon("mag_mp44", "amunition", "mp44_mp", level.RNG_NORMAL);
	item[12] = battleroyale\_auto::createWeapon("mag_mp5", "amunition", "mp5_mp", level.RNG_NORMAL);
	item[13] = battleroyale\_auto::createWeapon("mag_m1014", "amunition", "m1014_mp", level.RNG_BIG);
	item[14] = battleroyale\_auto::createWeapon("mag_winchester1200", "amunition", "winchester1200_mp", level.RNG_BIG);
	// createSpecial(ent, sound, weapon_mp, rng)
	item[15] = battleroyale\_auto::createSpecial("mag_flash_grenade", "grenade_pickup", "flash_grenade_mp", level.RNG_NORMAL);
	item[16] = battleroyale\_auto::createSpecial("mag_smoke_grenade", "grenade_pickup", "smoke_grenade_mp", level.RNG_SMALL);
	item[17] = battleroyale\_auto::createSpecial("mag_bandage", "health_pickup_large", "", level.RNG_NORMAL);
	item[18] = battleroyale\_auto::createSpecial("mag_first_kit", "health_pickup_large", "", level.RNG_BIG);
	item[19] = battleroyale\_auto::createSpecial("mag_frag_grenade", "grenade_pickup", "frag_grenade_mp", level.RNG_SMALL);

	for(i = 0; i < item.size; i++)
		item[i] thread battleroyale\_auto::item_trig();
}

fx()
{
	fxs = getEntArray("tree_fx", "targetname");

	for(i = 0; i < fxs.size;)
	{
		rng = randomIntRange(1, 10); // max ent
		coords = fxs[i].origin;
		fxs[i] delete();
		playLoopedFX(level.fx["leaves"], 0.75, coords);
		i += rng;
	}
}

sfx()
{
	for(i = 0; i < level.zone.size; i++)
	{
		ori = spawn("script_origin", level.zone[i]);
		ori playLoopSound("ambient_forest_loop");
	}
}

onPlayerConnected()
{
	for(;;)
	{
		level waittill("connected", player);
		player thread vision();
	}
}

vision()
{
	self endon("disconnect");

	while(isDefined(self))
	{
		self setClientDvar("dynent_active","1");
		self setClientDvar("r_detail","1");
		self setClientDvar("r_specular","1");
		self setClientDvar("r_specularmap","1");
		self setClientDvar("r_normal","1");
		self setClientDvar("r_normalmap","1");
		self setClientDvar("r_drawsun","0");
		self setClientDvar("r_drawwater","1");
		self setClientDvar("r_drawdecals","1");
		self setClientDvar("r_fog","1");
		self setClientDvar("fx_enable","1");
		self setClientDvar("r_lighttweaksunlight","1.2");
		self setClientDvar("r_filmTweakBrightness","0.151");
		self setClientDvar("r_filmTweakContrast","1.236");
		self setClientDvar("r_filmTweakDarktint","1.031 0.917 1.159");
		self setClientDvar("r_filmTweakDesaturation","0");
		self setClientDvar("r_filmTweakEnable","1");
		self setClientDvar("r_filmTweakLighttint","1.082 1.057 1.031");
		self setClientDvar("r_filmTweakInvert","0");
		self setClientDvar("r_filmUseTweaks","1");
		self setClientDvar("r_lodBiasRigid","-1000");
		self setClientDvar("r_lodBiasSkinned","-1000");
		self setClientDvar("r_lodScaleRigid","1");
		self setClientDvar("r_lodScaleSkinned","1");
		self setClientDvar("r_specularcolorscale","1");
		self setClientDvar("r_gamma","1");
		self setClientDvar("r_blur","0");
		self setClientDvar("r_desaturation","0");
		wait 1;
	}
}
