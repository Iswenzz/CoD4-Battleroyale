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

createAmmo(ent, sound, count, rng)
{
	item = spawnStruct();
	item.type = "ammo";
	item.ent = ent;
	item.sound = sound;
	item.count = count;
	item.rng = rng;
	return item;
}

createWeapon(ent, sound, weapon, rng)
{
	item = spawnStruct();
	item.type = "weapon";
	item.ent = ent;
	item.sound = sound;
	item.weapon = weapon;
	item.rng = rng;
	return item;
}

createDropWeapon(sound, weapon)
{
	item = spawnStruct();
	item.type = "weapon";
	item.sound = sound;
	item.weapon = weapon;
	return item;
}

createSpecial(ent, sound, weapon, rng)
{
	item = spawnStruct();
	item.type = "special";
	item.ent = ent;
	item.sound = sound;
	item.weapon = weapon;
	item.rng = rng;
	return item;
}

item_trig()
{
	item_trig = [];
	item = getEntArray(self.ent, "targetname");
	v = 10;

	for(i = 0; i < item.size; i++)
	{
		if(randomIntRange(0, self.rng) == 0)
		{
			item_trig[i] = spawn("trigger_radius", item[i].origin, v, v, v);
			item_trig[i].radius = v;
			item_trig[i] thread item_setup(self, item[i]);
		}
		else
			item[i] delete();
	}
}

item_setup(item, model)
{
	while(isDefined(self))
	{
		self waittill("trigger", player);

		if(player usebuttonpressed())
			player thread item_give(self, model, item);

		wait .05;
	}
}

refreshWeaponsList()
{
	self endon("death");
	self endon("disconnect");
	wait 0.1;

	list = self getWeaponsList();
	self.pers["weapons"] = "";
	for(i = 0; i < list.size; i++)
	{
		switch(list[i])
		{
			case "frag_grenade_mp":
			case "smoke_grenade_mp":
			case "flash_grenade_mp":
			continue;
		}
		self.pers["weapons"] += list[i] + ";";
	}
}

item_give(trig, model, item)
{
	self endon("death");
	self endon("disconnect");

	if (item.type == "ammo")
	{
		self.pers[item.ent] += item.count;
		self playSound(item.sound);
	}

	else if (item.type == "weapon")
	{
		tok = [];
		if(self HasWeapon("dog_mp")) // remove default weapon when you have the first gun
			self TakeWeapon("dog_mp");

		self refreshWeaponsList();
		if(self hasWeapon(item.weapon) || tok.size > 3)
			return;

		tok = strTok(self.pers["weapons"], ";");

		if(tok.size == 3) // drop current gun if you have 3 weapons
		{
			new_model = spawn("script_model", model.origin);
			new_model.angles = (0, 270, 90);
			new_model setModel(getWeaponModel(self getCurrentWeapon()));
			new_item = createDropWeapon("amunition", self getCurrentWeapon());

			self TakeWeapon(self getCurrentWeapon());
			self giveWeapon(item.weapon);
			self switchToWeapon(item.weapon);
			self playSound(item.sound);
			self thread refreshWeaponsList();

			model delete();
			trig delete();

			wait 0.1;
			v = 10;
			new_trig = spawn("trigger_radius", new_model.origin, v, v, v);
			new_trig.radius = v;
			new_trig thread item_setup(new_item, new_model);
			return;
		}

		self giveWeapon(item.weapon);
		self switchToWeapon(item.weapon);
		self playSound(item.sound);
		self thread refreshWeaponsList();
	}

	else if (item.type == "special")
	{
		self.pers[item.ent]++;
		self giveWeapon(item.weapon);
		self playSound(item.sound);
	}

	model delete();
	trig delete();
}