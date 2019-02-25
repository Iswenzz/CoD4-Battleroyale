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

	visionSetNaked("mp_br_blackout",0);

	level.fx["leaves"] = loadFx("dust/dust_wind_leaves_chernobyl");

	thread onPlayerConnected();

	ambientPlay("ambient_forest_loop");
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
		self setClientDvar("r_normal","1");
		self setClientDvar("r_drawsun","0");
		self setClientDvar("r_blur","0");
		self setClientDvar("r_drawdecals","1");
		self setClientDvar("cg_drawdecals","1");
		self setClientDvar("r_lighttweaksunlight","1.8");
		self setClientDvar("r_filmTweakBrightness","0.15");
		self setClientDvar("r_filmTweakContrast","1.3");
		self setClientDvar("r_filmTweakDarktint","0.4 0.42 0.5");
		self setClientDvar("r_filmTweakDesaturation","0.2");
		self setClientDvar("r_filmTweakEnable","1");
		self setClientDvar("r_filmTweakLighttint","1.2 1.1 1");
		self setClientDvar("r_filmTweakInvert","0");
		self setClientDvar("r_filmUseTweaks","1");
		self setClientDvar("r_lightTweakSunColor","1 0.8 0.5 1");
		self setClientDvar("r_lodBiasRigid","-1000");
		self setClientDvar("r_lodBiasSkinned","-1000");
		self setClientDvar("r_lodScaleRigid","1");
		self setClientDvar("r_lodScaleSkinned","1");
		self setClientDvar("r_contrast","1.1");
		self setClientDvar("r_specularcolorscale","1");
		self setClientDvar("r_gamma","1");
		self setClientDvar("r_blur","0.3");
		self setClientDvar("r_desaturation","0");
		wait 1;
	}
}
