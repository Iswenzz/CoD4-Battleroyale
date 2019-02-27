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
			item_trig[i] SetCursorHint("HINT_ACTIVATE");
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

item_give(trig, model, item)
{
	if (item.type == "ammo")
	{
		self.pers[item.ent] += item.count;
		self playSound(item.sound);
	}

	else if (item.type == "weapon")
	{
		self giveWeapon(item.weapon);
		self switchToWeapon(item.weapon);
		self playSound(item.sound);
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