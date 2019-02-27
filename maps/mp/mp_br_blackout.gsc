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
 
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	level.fx["leaves"] = loadFx("dust/dust_wind_leaves_chernobyl");

	SetExpFog( 5000, 40000, 123/255, 155/255, 175/255, 3 );

	thread onPlayerConnected();
	thread sfx();
	thread fx();
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
	zone = [];
	zone[0] = (-2174, -3553, -1094);
	zone[1] = (1004, -7828, -815);
	zone[2] = (-2672, -13285, -2506);
	zone[3] = (273, 1156, -1358);
	zone[4] = (-11199, -6826, -3097);
	zone[5] = (-20439, -11104, -4304);
	zone[6] = (-13530, -1321, -3120);
	zone[7] = (7891, -2131, -1258);
	zone[8] = (7724, 6727, -1490);

	for(i = 0; i < zone.size; i++)
	{
		ori = spawn("script_origin", zone[i]);
		ori playLoopSound("ambient_forest_loop");
	}
}

onPlayerConnected()
{
	for(;;)
	{
		level waittill("connected",player);
		player thread force_dvar();
	}
}

force_dvar()
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
