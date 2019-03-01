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
			if (!isDefined(self.touching_item)) 
			{
				self.item_hint setShader("", 40, 40);
				self.item_hint_text setText(" ");
			}
		}
		wait .05;
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
