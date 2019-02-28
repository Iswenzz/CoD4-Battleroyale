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

#include speedrun\_speedrun;

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

	setDvar("jump_slowdownEnable", 1);
	setDvar("bullet_penetrationEnabled", 1);
	setDvar("g_friendlyPlayerCanBlock", 1);

	game["state"] = "readyup";

	precacheMenu("clientcmd");
	precacheMenu("sr_map_menu");

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

	precacheShader("black");
	precacheShader("white");
	precacheShader("sr_dead");
	precacheShader("sr_grenade");
	precacheShader("sr_flash");
	precacheShader("sr_smoke");
	precacheShader("sr_kit");
	precacheShader("sr_band");
	precacheShader("killiconsuicide");
	precacheShader("killiconmelee");
	precacheShader("killiconheadshot");
	precacheShader("killiconfalling");
	precacheShader("stance_stand");
	precacheShader("hudstopwatch");
	precacheShader("score_icon");
	precacheShader("vip_status");
	precacheShader("vip_gold");

	PreCacheShellShock("flashbang");

	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");

	precacheHeadIcon("headicon_admin");

	precacheItem("deserteagle_mp");
	precacheItem("dog_mp");

	level.fx["endgame"] = loadFx("deathrun/endgame_fx");
	level.fx["gib_splat"] = loadFx("deathrun/gib_splat");
	level.fx["light_blink"] = loadFx("misc/light_c4_blink");
	level.fx["endtrig_fx"] = loadFx("deathrun/endtrig_fx");
	level.fx["endtrigcircle_fx"] = loadFx("deathrun/endtrigcircle_fx");
	level.fx["secrettrig_fx"] = loadFx("deathrun/secrettrig_fx");
	level.fx["secrettrigcircle_fx"] = loadFx("deathrun/secrettrigcircle_fx");
	level.fx["wr_event"] = loadFx("deathrun/wr_fx");

	level.text["waiting_for_players"] = "Waiting for more players to start...";

	thread speedrunstart();

	thread battleroyale\_menus::init();
	thread battleroyale\_rank::init();
	thread speedrun\_playeroptions::init();
	thread battleroyale\_health::init();
	thread battleroyale\_lobby::init();

	thread maps\mp\gametypes\_hud::init();
	thread maps\mp\gametypes\_hud_message::init();
	thread maps\mp\gametypes\_damagefeedback::init();
	thread maps\mp\gametypes\_clientids::init();
	thread maps\mp\gametypes\_gameobjects::init();
	thread maps\mp\gametypes\_spawnlogic::init();
	thread maps\mp\gametypes\_oldschool::deletePickups();
	thread maps\mp\gametypes\_hud::init();
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

newActionHud(x, y, shader, w, d)
{
	hud = newClientHudElem(self);
	hud.foreground = true;
	hud.alignX = "left";
	hud.alignY = "top";
	hud.horzAlign = "left";
	hud.vertAlign = "top";
	hud.x = x;
	hud.y = y;
	hud.sort = 0;
	hud.fontScale = 1.4;
	hud.color = (1, 1, 1);
	hud.font = "objective";
	hud.hidewheninmenu = true;
	hud.alpha = 1;
	hud.archived = false;
	if (isDefined(shader))
		hud setShader(shader, w, d);
	else
		hud setText("");
	return hud;
}

addHud(who, x, y, alpha, alignX, alignY, fontScale)
{
	if(isPlayer(who))
		hud = newClientHudElem(who);
	else
		hud = newHudElem();
	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = alignX;
    hud.vertAlign = alignY;
	hud.fontScale = fontScale;
	hud.hidewheninmenu = true;
	return hud;
}

doHudActionSlot()
{
	self.hud_actionslot = [];
	self.hud_actionslot_text = [];

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

	self.player_alive = newClientHudElem(self);
	self.player_alive.foreground = true;
	self.player_alive.alignX = "left";
	self.player_alive.alignY = "top";
	self.player_alive.horzAlign = "left";
	self.player_alive.vertAlign = "top";
	self.player_alive.x = 10;
	self.player_alive.y = 35;
	self.player_alive.sort = 0;
	self.player_alive.fontScale = 1.4;
	self.player_alive.color = (1, 1, 1);
	self.player_alive.font = "default";
	self.player_alive.hidewheninmenu = true;
	self.player_alive.alpha = 1;
	self.player_alive.archived = false;
	self.player_alive.label = &"^7Players Alive: &&1";
}

bar_load(usage)
{
	self endon("death");
	self endon("disconnect");
	self endon("progress_done");

	self.temp_ent = spawn("script_origin",self.origin);
	self linkTo(self.temp_ent);
	self disableWeapons();

	self playSound("bandage");

	barsize = 288;
	bar_time = 5;
	hurt_time = 4;

	while(1)
	{
		wait .05;

		if(isDefined(self.in_load))
			return;		

		self.in_load = true;
		level.barincrement = (barsize / (20.0 * bar_time));

		if(!isDefined(self.progressbackground))
		{
			self.progressbackground = newClientHudElem(self);				
			self.progressbackground.alignX = "center";
			self.progressbackground.alignY = "middle";
			self.progressbackground.x = 320;
			self.progressbackground.y = 385;
			self.progressbackground.alpha = 0.5;
		}

		self.progressbackground setShader("black", (barsize + 4), 14);		

		if(!isDefined(self.progressbar))
		{
			self.progressbar = newClientHudElem(self);				
			self.progressbar.alignX = "left";
			self.progressbar.alignY = "middle";
			self.progressbar.x = (320 - (barsize / 2.0));
			self.progressbar.y = 385;
		}

		self.progressbar setShader("white", 0, 8);			
		self.progressbar scaleOverTime(bar_time, barsize, 8);

		self.progresstime = 0;
		d = 0;
		f = 0;

		while(isalive(self) && (self.progresstime < bar_time))
		{		
			d ++;
			f ++;
			
			wait 0.05;
			self.progresstime += 0.05;

			if(self.progresstime >= hurt_time)					
			{
				if(f >= 4)
					f = 0;
			}
			if(isalive(self) && self meleebuttonpressed())
			{   // load cancel
				self.progressbackground destroy();
				self.progressbar destroy();
				wait 0.025;
				self.in_load = undefined;
				self enableWeapons();
				self unlink();
				self.temp_ent delete();
				self notify("progress_done");
			}	
		}

		if(isalive(self) && (self.progresstime >= bar_time))
		{   // load done
			self.progressbackground destroy();
			self.progressbar destroy();
			wait 0.025;
			self.in_load = undefined;
			self enableWeapons();
			self unlink();
			self.temp_ent delete();

			if(usage == "bandage")
			{
				self.health += 40;
				self.pers["mag_bandage"]--;
			}
			if(usage == "first_kit")
			{
				self.health += 150;
				self.pers["mag_first_kit"]--;
			}
			self notify("progress_done");
		}
		wait .05;
	}
}

drawCircle(start, radius, height)
{
    points = [];
    r = radius;
    z = start[2];
    idx = 0;

    for(q = 0; q < 2; q++)
    {
        h = start[0];
        k = start[1];

        for(i = 0; i < 360; i++)
        {
            x = h + r * Cos(i);
            y = k - r * Sin(i);
            points[idx] = (x,y,z);
            iprintln(z);
            idx++;
        }

        z += height;
        for(i=0; i<points.size-1; i++)
            thread drawLine(points[i], points[i + 1], (1, 0, 0), false);
    }
}

drawLine(start, end, colour, depth)
{
    while(1)
    {
        /#
        line(start, end, colour, depth);
        #/

        wait 0.05;
    }
}

update_projectile()
{
	self endon("disconnect");
	self endon("death");

	while(isDefined(self))
	{
		self waittill ("grenade_fire", grenade, weaponName);
		switch(weaponName)
		{
			case "frag_grenade_short_mp":
			case "frag_grenade_mp":
				self.pers["mag_frag_grenade"]--;
				break;

			case "flash_grenade_mp":
				self.pers["mag_flash_grenade"]--;
				break;

			case "smoke_grenade_mp":
				self.pers["mag_smoke_grenade"]--;
				break;
		}
		wait 0.05;
	}
}

update_mag()
{
	self endon("disconnect");
	self endon("death");

	while(isDefined(self))
	{
		currWeapon = self GetCurrentWeapon();
		switch(currWeapon)
		{
			case "mp44_mp":
			case "dragunov_mp":
			case "ak47_mp": 
				self setWeaponAmmoStock(currWeapon, self.pers["mag_7_62"]); 
				break;

			case "m16_mp": 
				self setWeaponAmmoStock(currWeapon, self.pers["mag_5_45"]); 
				break;

			case "mp5_mp":
			case "beretta_mp":
				self setWeaponAmmoStock(currWeapon, self.pers["mag_9mm"]); 
				break;

			case "deserteagle_mp":
			case "colt45_mp":
				self setWeaponAmmoStock(currWeapon, self.pers["mag_45"]); 
				break;

			case "m1014_mp":
			case "winchester1200_mp":
				self setWeaponAmmoStock(currWeapon, self.pers["mag_12_gauge"]); 
				break;
		}
		wait 0.05;
	}
}

update_ammo()
{
	self endon("disconnect");
	self endon("death");

	self thread update_mag();
	self thread update_projectile();

	while(isDefined(self))
	{
		self waittill("reload_start");
		self update_ammo_check();
	}
}

update_ammo_check()
{
	self endon("disconnect");
	self endon("death");
	self endon("weapon_change");

	currWeapon = self GetCurrentWeapon();
	clip = self getWeaponAmmoClip(currWeapon);

	self waittill("reload");

	self thread update_ammo_do(currWeapon, clip);
}

update_ammo_do(currWeapon, clip)
{
	self endon("disconnect");
	self endon("death");

	switch(currWeapon)
	{
		case "mp44_mp":
		case "dragunov_mp":
		case "ak47_mp": 
			self.pers["mag_7_62"] -= int(weaponClipSize(currWeapon) - clip); 
			break;

		case "m16_mp": 
			self.pers["mag_5_45"] -= int(weaponClipSize(currWeapon) - clip); 
			break;

		case "mp5_mp":
		case "beretta_mp":
			self.pers["mag_9mm"] -= int(weaponClipSize(currWeapon) - clip); 
			break;

		case "deserteagle_mp":
		case "colt45_mp":
			self.pers["mag_45"] -= int(weaponClipSize(currWeapon) - clip); 
			break;

		case "m1014_mp":
		case "winchester1200_mp":
			self.pers["mag_12_gauge"] -= int(weaponClipSize(currWeapon) - clip); 
			break;
	}
}

game_start()
{
	tp = getTp();
	thread getZoneTrig();

	thread watch_lobby();
	level waittill("game_started");
	thread lobby_countdown();

	countdown();
	level.gamestarted = true;
	level notify("br_started");

	if(getEntArray("lobby","targetname").size > 0) // lobby clip
	{
		lobby = getEnt("lobby","targetname");
		lobby delete();
	}

	thread watch_eject();
	thread watch_last_eject(); // when people AFK in plane
	thread watch_game();

	level.plane = spawn("script_model", (0, 0, -10000));
	level.plane.angles = (0,0,0);
	level.plane setModel("vehicle_ac130_low");
	level.plane.angles = tp[0].angles;
	level.plane moveTo(tp[0].origin, 0.05);

	wait 0.2;

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

	wait 0.2;

	level.plane moveTo(tp[1].origin, 60);
	level.plane playLoopSound("plane_loop");

	wait 60;

	level.plane stopLoopSound();
	level.plane delete();
}

watch_lobby()
{
	while(!level.gamestarted)
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
		}
	}
}

waitForPlayers(requiredPlayersCount)
{
	while(true)
	{
		wait 0.5;

		if(isDefined(level.jumpers) && level.jumpers >= requiredPlayersCount)
			break;
	}
}

check_leave()
{
	while(!level.gamestarted)
	{
		wait 0.5;

		if(isDefined(level.jumpers) && level.jumpers <= 1)
			map_restart(false);
	}
}

countdown()
{
	while(level.game_countdown != 0)
	{
		level.game_countdown -= 1;
		wait 1;
	}
}

lobby_countdown()
{
	players = getAllPlayers();
	for(i=0;i<players.size;i++)
		players[i] thread lobby_countdown_hud();
}

lobby_countdown_hud()
{
	self endon("disconnect");

	while(level.game_countdown != 0)
	{
		self setLowerMessage(int(level.game_countdown)-1);
		wait .2;
	}
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
	thread zone_trig_on("sr_zonetrig_40k", 40000, 3);

	wait 10;

	final_zone = spawn("script_model", level.picked_zone_trig);
	final_zone setModel("sr_zonetrig_250_red");
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
	wait 90;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_20k", 20000, 2);

	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_10k", 10000, 1);

	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_5k", 5000, 0.5);

	wait 10;

	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread zone_trig_message("^3RESTRICTING THE PLAY AREA...");
	level notify("zone_trig_respawn");
	thread zone_trig_on("sr_zonetrig_2k5", 2500, 0.5);
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
	self thread check_health();
	self setgravity(800);
	self setmovespeed(190);
}

check_health()
{
	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
		if(isDefined(self) && self.health > self.maxhealth)
			self.health = self.maxhealth;

		wait .05;
	}
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

	self thread speedrun\_playerid::checkid();
	self thread speedrun\_playercommands::setGroup();
	self thread speedrun\_playeroptions::onConnectOptions();

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

	if( game["state"] == "endmap" )
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
		origin = (0,0,0);
	if(!isDefined(angles))
		angles = (0,0,0);

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

	self thread speedrun\_speedrun::setSpeed();
	self thread speedrun\_speedrun::getXpBar();
	self thread speedrun\_anticheat_hud::init();
	
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

	if(isDefined(self.isVIP))
		self.statusicon = "vip_status";

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
	self thread check_stuff();
	self thread check_bar();
	self thread check_ammo_lobby();
	self thread update_ammo();
}

force_dvar()
{
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

check_ammo_lobby()
{
	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
		if(level.gamestarted)
			break;

		if(self GetCurrentWeapon() != "dog_mp")
			self TakeAllWeapons();

		wait .05;
	}
}

check_bar()
{
	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
		self waittill("menuresponse", menu, response);

		if(response == "bandage" && self.pers["mag_bandage"] > 0 && self.health != self.maxhealth)
			self thread bar_load("bandage");

		if(response == "first_kit" && self.pers["mag_first_kit"] > 0 && self.health != self.maxhealth)
			self thread bar_load("first_kit");

		if(response == "sr_map")
		{
			self closeMenu();
			self closeInGameMenu();
			wait .05;
			self openMenu("sr_map_menu");
		}

		wait .05;
	}
}

check_stuff()
{
	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
		if(isDefined(self))
		{
			self.hud_actionslot_text[0] setValue(self.pers["mag_frag_grenade"]);
			self.hud_actionslot_text[1] setValue(self.pers["mag_flash_grenade"]);
			self.hud_actionslot_text[2] setValue(self.pers["mag_smoke_grenade"]);
			self.hud_actionslot_text[3] setValue(self.pers["mag_first_kit"]);
			self.hud_actionslot_text[4] setValue(self.pers["mag_bandage"]);
			if (isDefined(level.jumpers)) self.player_alive setValue(level.jumpers);
		}
		wait .05;
	}
}

respawn()
{
	self waittill("death");

	if(isDefined(self) && !level.gamestarted)
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
