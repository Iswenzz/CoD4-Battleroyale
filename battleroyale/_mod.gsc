/*

  _|_|_|            _|      _|      _|                  _|            
_|        _|    _|    _|  _|        _|          _|_|    _|  _|_|_|_|  
  _|_|    _|    _|      _|          _|        _|    _|  _|      _|    
      _|  _|    _|    _|  _|        _|        _|    _|  _|    _|      
_|_|_|      _|_|_|  _|      _|      _|_|_|_|    _|_|    _|  _|_|_|_|  

Steam: http://steamcommunity.com/profiles/76561198163403316/
Discord: https://discord.gg/76aHfGF
Youtube: https://www.youtube.com/channel/UC1vxOXBzEF7W4g7TRU0C1rw
Paypal: suxlolz@outlook.fr
Email Pro: suxlolz@outlook.fr

*/

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

#include battleroyale\_common;
#include battleroyale\_dvar;

main() 
{
	level.text = [];
	level.fx = [];

	init_spawns();

	battleroyale\_cod4stuff::main();
	battleroyale\_dvar::setupDvars();
	battleroyale\_hitmarker::init();
	
	maps\mp\_weapons::init();
	maps\mp\_killcam::init();

	level.game_countdown = 10;
	level.gamestarted = false;
	level.allowSpawn = true;

	level.RNG_EMPTY = 0;
	level.RNG_SMALL = 1;
	level.RNG_NORMAL = 3;
	level.RNG_BIG = 5;
	level.RNG_RARE = 6;

	level.br_item = [];

	setDvar("jump_slowdownEnable", 1);
	setDvar("bullet_penetrationEnabled", 1);
	setDvar("g_friendlyPlayerCanBlock", 1);

	game["state"] = "readyup";

	precacheShader("black");
	precacheShader("white");

	// Menus
	precacheMenu("clientcmd");
	precacheMenu("sr_map_menu");

	// Models
	precacheModel("german_sheperd_dog");
	precacheModel("vehicle_ac130_low");
	precacheModel("viewmodel_hands_zombie");
	precacheModel("tag_origin");
	precacheModel("body_mp_usmc_cqb");
	preCacheModel("collision_sphere");
	preCacheModel("sr_parachute");
	precacheModel("mil_frame_charge");
	precacheModel("sr_zonetrig_40k");
	precacheModel("sr_zonetrig_20k");
	precacheModel("sr_zonetrig_10k");
	precacheModel("sr_zonetrig_5k");
	precacheModel("sr_zonetrig_2k5");
	precacheModel("sr_zonetrig_250_red");
	precacheModel("sr_5_45");
	precacheModel("sr_7_62");
	precacheModel("sr_45");
	precacheModel("sr_gauge");
	precacheModel("sr_9mm");
	precacheModel("sr_bandage");
	precacheModel("sr_first_kit");

	// TEAM
	precacheShader("sr_dead");
	precacheShader("killiconsuicide");
	precacheShader("killiconmelee");
	precacheShader("killiconheadshot");
	precacheShader("killiconfalling");
	precacheShader("stance_stand");
	precacheShader("hudstopwatch");
	precacheShader("score_icon");
	precacheShader("vip_status");
	precacheShader("vip_gold");

	// Item
	precacheShader("sr_grenade");
	precacheShader("hud_icon_grenade");
	precacheShader("sr_flash");
	precacheShader("hud_icon_flash");
	precacheShader("sr_smoke");
	precacheShader("hud_icon_smoke");
	precacheShader("sr_kit");
	precacheShader("hud_icon_kit");
	precacheShader("sr_band");
	precacheShader("hud_icon_band");
	precacheShader("sr_mag_5_56");
	precacheShader("hud_icon_mag_5_56");
	precacheShader("sr_mag_7_62");
	precacheShader("hud_icon_mag_7_62");
	precacheShader("sr_mag_12_gauge");
	precacheShader("hud_icon_mag_12_gauge");
	precacheShader("sr_mag_45");
	precacheShader("hud_icon_mag_45");
	precacheShader("sr_mag_9mm");
	precacheShader("hud_icon_mag_9mm");

	// Stock Item
	precacheShader("hud_icon_30cal");
	precacheShader("hud_icon_357");
	precacheShader("hud_icon_40mm_grenade");
	precacheShader("hud_icon_40mm_grenade_mp");
	precacheShader("hud_icon_44");
	precacheShader("hud_icon_ak47");
	precacheShader("hud_icon_ak47_gp25");
	precacheShader("hud_icon_ak74u");
	precacheShader("hud_icon_artillery");
	precacheShader("hud_icon_at4");
	precacheShader("hud_icon_barrett50cal");
	precacheShader("hud_icon_benelli_m4");
	precacheShader("hud_icon_c4");
	precacheShader("hud_icon_claymore");
	precacheShader("hud_icon_cobra");
	precacheShader("hud_icon_colt_45");
	precacheShader("hud_icon_desert_eagle");
	precacheShader("hud_icon_desert_eagle_gold");
	precacheShader("hud_icon_dragunov");
	precacheShader("hud_icon_g3");
	precacheShader("hud_icon_g36c");
	precacheShader("hud_icon_g36c_mp");
	precacheShader("hud_icon_javelin");
	precacheShader("hud_icon_m14");
	precacheShader("hud_icon_m14_scoped");
	precacheShader("hud_icon_m16a4");
	precacheShader("hud_icon_m16a4_grenade");
	precacheShader("hud_icon_m249saw");
	precacheShader("hud_icon_m249saw_mounted");
	precacheShader("hud_icon_m40a3");
	precacheShader("hud_icon_m4carbine");
	precacheShader("hud_icon_m4m203_silencer");
	precacheShader("hud_icon_m4_grenadier");
	precacheShader("hud_icon_m4_grunt");
	precacheShader("hud_icon_m4_silencer");
	precacheShader("hud_icon_m60e4");
	precacheShader("hud_icon_m9beretta");
	precacheShader("hud_icon_minigun");
	precacheShader("hud_icon_mini_uzi");
	precacheShader("hud_icon_mp44");
	precacheShader("hud_icon_mp5");
	precacheShader("hud_icon_mp5_silencer");
	precacheShader("hud_icon_nvg");
	precacheShader("hud_icon_p90");
	precacheShader("hud_icon_pistol");
	precacheShader("hud_icon_remington700");
	precacheShader("hud_icon_rpd");
	precacheShader("hud_icon_rpg");
	precacheShader("hud_icon_rpg_dpad");
	precacheShader("hud_icon_shotgun");
	precacheShader("hud_icon_skorpian");
	precacheShader("hud_icon_sniperrifle");
	precacheShader("hud_icon_stinger");
	precacheShader("hud_icon_usp_45");
	precacheShader("hud_icon_winchester_1200");

	// Shock
	PreCacheShellShock("flashbang");
	PreCacheShellShock("death");

	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");
	precacheHeadIcon("headicon_admin");

	precacheItem("dog_mp");

	// FXs
	level.fx["endgame"] = loadFx("deathrun/endgame_fx");
	level.fx["gib_splat"] = loadFx("deathrun/gib_splat");
	level.fx["light_blink"] = loadFx("misc/light_c4_blink");
	level.fx["endtrig_fx"] = loadFx("deathrun/endtrig_fx");
	level.fx["endtrigcircle_fx"] = loadFx("deathrun/endtrigcircle_fx");
	level.fx["secrettrig_fx"] = loadFx("deathrun/secrettrig_fx");
	level.fx["secrettrigcircle_fx"] = loadFx("deathrun/secrettrigcircle_fx");
	level.fx["wr_event"] = loadFx("deathrun/wr_fx");

	level.text["waiting_for_players"] = "Waiting for more players to start...";

	// thread speedrun\_speedrun::speedrunstart();

	thread battleroyale\_menus::init();
	thread battleroyale\_rank::init();
	thread battleroyale\_health::init();
	thread battleroyale\_lobby::init();

	thread maps\mp\gametypes\_hud::init();
	thread maps\mp\gametypes\_hud_message::init();
	thread maps\mp\gametypes\_damagefeedback::init();
	thread maps\mp\gametypes\_clientids::init();
	thread maps\mp\gametypes\_gameobjects::init();
	thread maps\mp\gametypes\_spawnlogic::init();
	thread maps\mp\gametypes\_oldschool::deletePickups();
	thread maps\mp\gametypes\_quickmessages::init();

	setdvar("g_TeamName_Allies", "^9Battle");
	setdvar("g_TeamColor_Allies", "0 0.8 0.8");
	setdvar("g_ScoresColor_Allies", "0 0 0");

	setdvar("g_TeamName_Axis", "^0Dead");
	setdvar("g_TeamColor_Axis", "0.8 0 0");
	setdvar("g_ScoresColor_xis", "0 0 0");

	setdvar("g_ScoresColor_Spectator", ".25 .25 .25");
	setdvar("g_ScoresColor_Free", ".76 .78 .10");
	setdvar("g_teamColor_MyTeam", ".6 .8 .6" );
	setdvar("g_teamColor_EnemyTeam", "1 .45 .5" );	

	level thread game_start();
}

doHudActionSlot()
{
	self.hud_actionslot = [];
	self.hud_actionslot_text = [];

	// Action HUD
	self.hud_actionslot_background = addHud(self, 4, 4, 0.3, "left", "top", 1.8);
	self.hud_actionslot_background setShader("black", 152, 30);
	self.hud_actionslot[0] = newActionHud(5, 3, "sr_grenade", 30, 30);
	self.hud_actionslot_text[0] = newActionHud(10, 3);
	self.hud_actionslot[1] = newActionHud(35, 3, "sr_flash", 25, 30);
	self.hud_actionslot_text[1] = newActionHud(40, 3);
	self.hud_actionslot[2] = newActionHud(65, 3, "sr_smoke", 25, 30);
	self.hud_actionslot_text[2] = newActionHud(70, 3);
	self.hud_actionslot[3] = newActionHud(95, 3, "sr_kit", 30, 30);
	self.hud_actionslot_text[3] = newActionHud(100, 3);
	self.hud_actionslot[4] = newActionHud(125, 3, "sr_band", 30, 30);
	self.hud_actionslot_text[4] = newActionHud(130, 3);

	// Player Alive HUD
	self.player_alive = addHud(self, 10, 35, 1, "left", "top", 1.4);
	self.player_alive.label = &"^7Players Alive: &&1";

	// Item Hint HUD
	self.item_hint = addHud(self, 0, -150, 1, "center", "bottom", 1.5);
	self.item_hint setShader("", 40, 40);
	self.item_hint_text = addHud(self, 0, -200, 1, "center", "bottom", 1.5);
}

remove_lobby()
{
	if(getEntArray("lobby","targetname").size > 0) // remove lobby area
	{
		lobby = getEntArray("lobby","targetname");
		for (i = 0; i < lobby.size; i++)
			lobby[i] delete();
	}
}

game_start()
{
	// debug mode
	if (getDvarInt("br_debug_mode"))
	{
		wait 5;
		level.gamestarted = true;
		level notify("game_started");
		level notify("br_started");

		thread remove_lobby();
		return;
	}

	// get plane and zone coords
	tp = getTp();
	thread getZoneTrig();

	// wait lobby to be full and start countdown
	thread battleroyale\_lobby::watch_lobby();
	level waittill("game_started");
	thread battleroyale\_lobby::lobby_countdown();
	battleroyale\_lobby::countdown();

	// start br
	level.gamestarted = true;
	level notify("br_started");

	// remove lobby and watch plane/game actions
	thread remove_lobby();
	thread watch_eject();
	thread watch_last_eject(); // when people AFK in plane
	thread watch_game();

	// spawn plane
	level.plane = spawn("script_model", (0, 0, -10000));
	level.plane.angles = (0,0,0);
	level.plane setModel("vehicle_ac130_low");
	level.plane.angles = tp[0].angles;
	level.plane moveTo(tp[0].origin, 0.05);
	wait 0.2;

	// tp all players to the plane and watch player action
	players = getAllPlayers();
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"] != "allies")
			continue;

		players[i] clearLowerMessage();
		players[i].origin = level.plane.origin + (0, 0, 700);
		players[i] setPlayerAngles((level.plane.angles[0] + 50, level.plane.angles[1], level.plane.angles[2]));
		players[i] linkTo(level.plane);
		players[i] takeallweapons();
		players[i] hide();
		players[i] thread watch_player_game();
	}

	// move plane to end point
	wait 0.2;
	level.plane moveTo(tp[1].origin, 60);
	level.plane playLoopSound("plane_loop");

	// remove plane
	wait 60;
	level.plane stopLoopSound();
	level.plane delete();
}

zone_trig()
{
	level endon("game over");
	wait 60;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
	wait 90;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	thread zone_trig_on("sr_zonetrig_40k", 40000, 6);
	wait 10;

	final_zone = spawn("script_model", level.picked_zone_trig);
	final_zone setModel("sr_zonetrig_250_red");
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
	wait 90;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_20k", 20000, 4);
	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_10k", 10000, 2);
	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_5k", 5000, 1);
	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_2k5", 2500, 1);
}

zone_trig_on(model, radius, damage_time)
{
	level endon("zone_trig_respawn");
	wait 0.5;

	current_zone_trig = spawn("trigger_radius", level.picked_zone_trig, 0, radius, 15000);
	current_zone_trig_model = spawn("script_model", current_zone_trig.origin);
	current_zone_trig_model setModel(model);

	thread zone_trig_off(current_zone_trig_model, current_zone_trig);
	wait 0.2;

	players = getAllPlayers();
	for(i=0;i<players.size;i++)
		players[i] thread zone_trig_damage(current_zone_trig, damage_time);
}

zone_trig_off(model, trig)
{
	level waittill("zone_trig_respawn");

	model delete();
	trig delete();
}

zone_trig_damage(trig,damage_time)
{
	self endon("death");
	self endon("disconnect");
	level endon("zone_trig_respawn");
	level endon("game over");

	if(self.pers["team"] != "allies")
		return;

	while(isDefined(self))
	{
		if(!self isTouching(trig))
			self zone_trig_damage_verify(trig, damage_time);

		wait .05;
	}
}

zone_trig_damage_verify(trig, damage_time)
{
	level endon("zone_trig_respawn");
	self FinishPlayerDamage( self, self, 10, 0, "MOD_FALLING", "default_mp", (0,0,0), (0,0,0), "head", 0 );
	wait damage_time;
}

zone_trig_message(msg)
{
	players = getAllPlayers();

	for(i=0;i<players.size;i++)
		players[i] setLowerMessage(msg);

	wait 4;

	for(i=0;i<players.size;i++)
		players[i] clearLowerMessage();
}

watch_game()
{
	thread zone_trig();

	while(level.gamestarted)
	{
		wait 0.2;
		level.jumper = [];
		level.jumpers = 0;
		level.deada = 0;
		level.totalPlayers = 0;
		level.totalPlayingPlayers = 0;

		players = getAllPlayers();
		if(players.size > 0)
		{
			for(i = 0; i < players.size; i++)
			{
				level.totalPlayers++;
				if(isDefined(players[i].pers["team"]))	
				{
					if(players[i] isReallyAlive())
						level.totalPlayingPlayers++;

					if(players[i].pers["team"] == "allies" && players[i] isReallyAlive())
					{
						level.jumpers++;
						level.jumper[level.jumper.size] = players[i];
					}
					if(players[i].pers["team"] == "axis" && players[i] isReallyAlive())
						level.deada++;
				}
			}

			if(level.jumpers < 2)
			{
				ambientPlay("br_win");
				thread end_map();

				wait 39;
				map_restart(false);
			}
		}
	}	
}

end_map()
{
	game["state"] = "endmap";
	level notify("intermission");
	level notify("game over");
	level notify("zone_trig_respawn");

	players = getAllPlayers();

	for(i=0;i<players.size;i++)
	{
		if(isDefined(players[i]))
		{
			while(isDefined(players[i].killcam))
				wait 0.2;

			if(isAlive(players[i]))
				players[i] suicide();

			players[i] spawnSpectator(level.spawn["spectator"].origin, level.spawn["spectator"].angles);
			players[i] closeMenu();
			players[i] closeInGameMenu();
			players[i] freezeControls(true);
			players[i] cleanUp();
			players[i] allowSpectateTeam("freelook", false);
		}
	}

	battleroyale\_credits::main();

	for(i=0;i<players.size;i++)
	{
		if(isDefined(players[i]))
		{
			while(isDefined(players[i].killcam))
				wait 0.2;

			if(isAlive(players[i]))
				players[i] suicide();

			players[i] spawnSpectator(level.spawn["spectator"].origin, level.spawn["spectator"].angles);
			players[i] closeMenu();
			players[i] closeInGameMenu();
			players[i] freezeControls(true);
			players[i] cleanUp();
			players[i] allowSpectateTeam("freelook", false);
		}
	}

	wait 10;

	for(i=0;i<players.size;i++)
	{
		if(isDefined(players[i]))
		{
			while(isDefined(players[i].killcam))
				wait 0.2;

			if(isAlive(players[i]))
				players[i] suicide();

			players[i] spawnSpectator(level.spawn["spectator"].origin, level.spawn["spectator"].angles);
			players[i] closeMenu();
			players[i] closeInGameMenu();
			players[i] freezeControls(true);
			players[i] cleanUp();
			players[i] allowSpectateTeam("freelook", false);
			players[i].sessionstate = "intermission";
		}
	}
}

watch_player_game()
{
	self endon("disconnect");
	self waittill("death");
	self battleroyale\_teams::setTeam("axis");
}

watch_last_eject()
{
	if(getEntArray("eject_last","targetname").size == 0)
		assertMsg("ERROR: Map needs a trigger with targetname 'eject_last' at the end of every plane_path.");
	if(!isDefined(level.eject_last_coord))
		assertMsg("ERROR: level.eject_last_coord isn't defined.");

	trig = getEnt("eject_last","targetname");
	ori = spawn("script_origin", level.eject_last_coord);

	for(;;)
	{
		trig waittill("trigger",player);
		player SetOrigin(ori.origin);
		player thread player_eject();
	}
}

watch_eject()
{
	if(getEnt("can_fall","targetname").size == 0)
		assertMsg("ERROR: Map needs a trigger with targetname 'can_fall' where people can eject from the plane.");

	trig = getEnt("can_fall","targetname");
	
	for(;;)
	{
		trig waittill("trigger",player);
		player thread watch_eject_player(trig);
	}
}

watch_eject_player(trig)
{
	self endon("death");
	self endon("disconnect");

	if(isDefined(self.ejected))
		return;

	self.ejected = true;

	if(self isReallyAlive() && self.pers["team"] != "spectator" && self.pers["team"] != "axis")
	{
		self setLowerMessage("^7Drop ^9[{+activate}]");
	
		while(!self useButtonPressed())
			wait .05;
			
		if(self isTouching(trig))
			self thread player_eject();
	}
}

player_eject()
{
	self endon("death");
	self endon("disconnect");

	self clearLowerMessage();
	self show();
	self unlink();
	self setClientDvar("cg_thirdperson", 1);
	wait 0.2;

	if(isDefined(level.plane))
		self.origin = level.plane.origin + (0, 0, -100);
	self attach("sr_parachute", "TAG_ORIGIN");
	self playsound("parachute_start");
	wait 0.5;

	self setgravity(100);
	self setmovespeed(350);
	self giveWeapon("dog_mp");
	self switchtoweapon("dog_mp");
	self giveMaxAmmo("dog_mp");
	self.health = 99999999999999999;

	while( !self IsOnGround() )
		wait .05;

	self setClientDvar("cg_thirdperson",0);
	self detach("sr_parachute", "TAG_ORIGIN");
	self playSound("parachute_end");
	self.health = self.maxhealth;
	self thread battleroyale\_update::check_health();
	self setgravity(800);
	self setmovespeed(190);
}

getTp()
{
	max = 1;
	while(getEntArray("plane_" + max, "targetname").size > 0)
	{
		max++;
		wait 0.05;
	}
	max -= 1;

	if(max == 0)
		assertMsg("ERROR: Map doesn't have plane path.");

	path = getEntArray("plane_" + randomIntRange(1, max), "targetname");
	if(path.size != 2)
		assertMsg("ERROR: plane_" + max + "entity needs to have a start origin and a end origin");

	return getEntArray("plane_" + randomIntRange(1, max), "targetname");
}

getZoneTrig()
{
	if(!isDefined(level.zone))
		assertMsg("ERROR: level.zone array isn't defined.");
	if(isDefined(level.zone) && level.zone.size < 1)
		assertMsg("ERROR: level.zone array need atleast 1 vector.");

	level.picked_zone_trig = level.zone[randomIntrange(0, level.zone.size - 1)];
}

init_spawns()
{
	level.spawn = [];
	level.spawn["allies"] = getEntArray("mp_jumper_spawn", "classname");
	level.spawn["axis"] = getEntArray("mp_activator_spawn", "classname");
	
	if(getEntArray("mp_global_intermission", "classname").size == 0)
    {
        level.spawn["spectator"] = spawn("script_origin", (0, 0, 0));
        level.spawn["spectator"].angles = (0, 0, 0);
    }
    else
        level.spawn["spectator"] = getEntArray("mp_global_intermission", "classname")[0];

	if(!level.spawn["allies"].size)
		level.spawn["allies"] = getEntArray( "mp_dm_spawn", "classname");
	if(!level.spawn["axis"].size)
		level.spawn["axis"] = getEntArray( "mp_tdm_spawn", "classname");

	for(i = 0; i < level.spawn["allies"].size; i++)
		level.spawn["allies"][i] placeSpawnPoint();

	for(i = 0; i < level.spawn["axis"].size; i++)
		level.spawn["axis"][i] placeSpawnPoint();
}

playerConnect()
{
	level notify("connected", self);
	self thread cleanUp();
	self.guid = self getGuid();
	self.number = self getEntityNumber();
	self.statusicon = "hud_status_connecting";
	self.died = false;
	self.doingNotify = false;
	self.tagName = "Player";
	self.pShortGuid = getSubStr(self.guid, 12, 19);
	self setcontents(0);

	if(!isDefined(self.name))
		self.name = "undefined name";
	if(!isDefined(self.guid))
		self.guid = "undefined guid";

	self setClientDvars("show_hud", "true", "ip", getDvar("net_ip"), "port", getDvar("net_port"));
	if( !isDefined(self.pers["team"])) 
	{
		iPrintln("^1" + self.name + " ^7entered the game");
		self.sessionstate = "spectator";
		self.team = "spectator";
		self.pers["team"] = "spectator";
		self.pers["score"] = 0;
		self.pers["kills"] = 0;
		self.pers["deaths"] = 0;
		self.pers["assists"] = 0;
		self.pers["ability"] = "specialty_null";
	}
	else
	{
		self.score = self.pers["score"];
		self.kills = self.pers["kills"];
		self.assists = self.pers["assists"];
		self.deaths = self.pers["deaths"];
	}

	if(!isDefined(level.spawn["spectator"]))
		level.spawn["spectator"] = level.spawn["allies"][0];

	if(game["state"] == "endmap")
	{
		self spawnSpectator(level.spawn["spectator"].origin, level.spawn["spectator"].angles);
		self.sessionstate = "intermission";
		return;
	}

	if(isDefined(self.pers["weapon"]) && self.pers["team"] != "spectator")
	{
		self.pers["weapon"] = "colt_mp";
		self thread battleroyale\_teams::setTeam( "allies" );
		spawnPlayer();
		return;
	}

	else
	{
		self spawnSpectator(level.spawn["spectator"].origin, level.spawn["spectator"].angles);
		self thread delayedMenu();
		logPrint("J;" + self.guid + ";" + self.number + ";" + self.name + "\n");
	}

	self battleroyale\_teams::setTeam( "axis" );
}

spawnSpectator(origin, angles)
{
	if(!isDefined(origin))
		origin = (0, 0, 0);
	if(!isDefined(angles))
		angles = (0, 0, 0);

	self notify("joined_spectators");

	self thread cleanUp();
	resettimeout();
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.statusicon = "";
	self spawn( origin, angles );
	self battleroyale\_teams::setSpectatePermissions();

	level notify("player_spectator", self);
}

playerDisconnect()
{
	level notify("disconnected", self);
	self thread cleanUp();
	self.guid = self getGuid();
	self.tagName = "Player";
	self.pShortGuid = getSubStr(self.guid, 12, 19);

	if(!isDefined(self.name))
		self.name = "no name";
			
	iPrintln("^2" + self.name + " ^7left the game");
	logPrint("Q;" + self getGuid() + ";" + self getEntityNumber() + ";" + self.name + "\n");
}

PlayerLastStand(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self suicide();
}

PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{	
	if(self.sessionteam == "spectator" || game["state"] == "endmap")
		return;

	level notify("player_damage", self, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

	if(isPlayer(eAttacker) && eAttacker != self)
	{	
		eAttacker iPrintln("You hit " + self.name + " ^7for ^2" + iDamage + " ^7damage.");
		self iPrintln(eAttacker.name + " ^7hit you for ^2" + iDamage + " ^7damage.");
	}

	if(!isDefined(vDir))
		iDFlags |= level.iDFLAGS_NO_KNOCKBACK;

	if(!(iDFlags & level.iDFLAGS_NO_PROTECTION))
	{
		if(iDamage < 1)
			iDamage = 1;

		self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime );
	}
}

PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{	
	self endon("spawned");
	self notify("killed_player");
	self notify("death");

	if(self.sessionteam == "spectator" || game["state"] == "endmap")
		return;
	
	level notify( "player_killed", self, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration );

	if(sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
		sMeansOfDeath = "MOD_HEAD_SHOT";

	self.statusicon = "hud_status_dead";
	self.sessionstate =  "spectator";

	if(isPlayer(attacker))
	{
		if(attacker != self)
		{
			attacker thread battleroyale\_rank::giveRankXP( "", 250 );

			attacker.kills++;
			attacker.pers["kills"]++;
		}
	}

	deaths = self maps\mp\gametypes\_persistence::statGet("deaths");
	self maps\mp\gametypes\_persistence::statSet("deaths", deaths + 1);
	self.deaths++;
	self.pers["deaths"]++;
	self.died = true;

	lpselfnum = self getEntityNumber();
	lpselfname = self.name;
	lpattackGuid = "";
	lpattackname = "";
	lpselfteam = "";
	lpselfguid = self getGuid();
	lpattackerteam = "";
	lpattacknum = attacker getEntityNumber();
	killcamentity = -1;
	perks = getPerks(attacker);
	willRespawnImmediately = 0;

	self thread cleanUp();
	if(isPlayer(attacker) && attacker != self)
		attacker setLowerMessage("^7You killed ^9" + self.name);
	if(isPlayer(attacker) && attacker != self)
		attacker thread after_time_lower();

	wait (0.25);
	self.cancelKillcam = false;
	postDeathDelay = waitForTimeOrNotifies(1.75);
	self notify ("death_delay_finished");

	if(game["state"] != "endmap")
		self thread maps\mp\_killcam::killcam(attacker GetEntityNumber(), -1, sWeapon, 0, 0, 0, 15, undefined, attacker);

	if(game["state"] == "endmap")
		thread maps\mp\_killcam::StartKillcam(attacker, sWeapon);
}

getPerks(player)
{
	perks[0] = "specialty_null";
	perks[1] = "specialty_null";
	perks[2] = "specialty_null";

	return perks;
}

waitForTimeOrNotifies(desiredDelay)
{
	startedWaiting = getTime();
	waitedTime = (getTime() - startedWaiting) / 1000;
	
	if (waitedTime < desiredDelay)
	{
		wait desiredDelay - waitedTime;
		return desiredDelay;
	}
	else
		return waitedTime;
}

timeUntilRoundEnd()
{
	return 0;
}

after_time_lower()
{
	wait 3;
	self clearLowerMessage();
}

spawnPlayer(origin, angles)
{
	if(game["state"] == "endmap") 
		return;

	level notify("jumper", self);
	self thread cleanUp();
	resettimeout();
	self.pers["isDog"] = false;

	self thread setSpeed();
	self thread getXpBar();
	
	self.team = self.pers["team"];
	self.sessionteam = self.team;
	self.sessionstate = "playing";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.statusicon = "";
	self battleroyale\_teams::setPlayerModel();
	self SetActionSlot(3, "weapon", "flash_grenade_mp");
	self.ejected = undefined;

	spawnPoint = level.spawn[self.pers["team"]][randomInt(level.spawn[self.pers["team"]].size)];
	self spawn(spawnPoint.origin, spawnPoint.angles);
	self takeallweapons();
	self thread force_dvar();
    self setViewModel("viewmodel_hands_zombie");
    self.maxhealth = 200;
	self.health = self.maxhealth;
	self thread afterFirstFrame();

	self notify("spawned_player");
	level notify("player_spawn", self);

	self.pers["mag_45"] = 0;
	self.pers["mag_9mm"] = 0;
	self.pers["mag_7_62"] = 0;
	self.pers["mag_5_45"] = 0;
	self.pers["mag_12_gauge"] = 0;
	self.pers["mag_flash_grenade"] = 0;
	self.pers["mag_smoke_grenade"] = 0;
	self.pers["mag_bandage"] = 0;
	self.pers["mag_first_kit"] = 0;
	self.pers["mag_frag_grenade"] = 0;

	self.pers["weapons"] = "";

	self show();
	self thread respawn();
	self thread doHudActionSlot();
	self thread battleroyale\_update::check_stuff();
	self thread battleroyale\_update::check_bar();
	self thread battleroyale\_update::check_ammo_lobby();
	self thread battleroyale\_update::update_ammo();

	if (getDvarInt("br_debug_mode"))
		self.player_alive.label = &"^1DEBUG MODE";
}

getXpBar()
{
	self waittill("spawned_player");
	
    if(!isDefined(self.getxpbar))
    {
        self clientcmd("setu sr_xp_bar 0");
        self.getxpbar = true;
    }
}

setSpeed()
{
	self setMoveSpeedScale(1.0);
	self setmovespeed(190);
}

force_dvar()
{
	if (getDvarInt("br_debug_mode"))
		return;

	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
		self setClientDvar("cg_drawfriendlynames", 0);
		self setClientDvar("hud_enable", 1);
		self setClientDvar("ui_hud_hardcore", 1);
		self setClientDvar("ui_uav_client", 0);
		self setClientDvar("cg_drawThroughWalls", 0);
		self setClientDvar("cg_friendlyNameFadeIn", 0);
		self setClientDvar("cg_friendlyNameFadeOut", 0);
		self setClientDvar("g_teamcolor_myteam", "1 0 0 1");
		wait 0.5;
	}
}

respawn()
{
	self waittill("death");
	if(isDefined(self) && !level.gamestarted || getDvarInt("br_debug_mode"))
		self battleroyale\_mod::spawnPlayer();
}

afterFirstFrame()
{
	self endon("disconnect");
    self endon("joined_spectators");
    self endon("death");
	waittillframeend;
	wait 0.1;

	if(!self isPlaying())
		return;

	self clearPerks();
}

cleanUp()
{
	self clearLowerMessage();
	self notify("kill afk monitor");
	self unLink();
	self.bh = 0; 
	self.doingBH = false;
	self enableWeapons();
	self setClientDvar("cg_thirdperson", 0);

	if(isDefined(self.hud_actionslot))
	{
		for(i = 0; i < self.hud_actionslot.size; i++)
		{
			if(isDefined(self.hud_actionslot[i]))
				self.hud_actionslot[i] destroy();
		}
	}

	if(isDefined(self.hud_actionslot_text))
	{
		for(i = 0; i < self.hud_actionslot_text.size; i++)
		{
			if(isDefined(self.hud_actionslot_text[i]))
				self.hud_actionslot_text[i] destroy();
		}
	}

	if(isDefined(self.player_alive))
		self.player_alive destroy();

	if(isDefined(self.hud_actionslot_background))
		self.hud_actionslot_background destroy();
}
