removeAllMapTriggers()
{
	classnames = strTok("trigger_damage;trigger_disk;trigger_friendlychain;trigger_hurt;trigger_lookat;trigger_multiple;trigger_once;trigger_radius;trigger_use;trigger_use_touch", ";");
	for (i = 0; i < classnames.size; i++)
	{
		triggers = getEntArray(classnames[i], "classname");
		for (j = 0; j < triggers.size; j++)
			triggers[j] delete();
	}
}

createLobbyArea(origin, width, height)
{
	trigger = spawn("trigger_radius", (origin[0], origin[1], origin[2] - 60), 0, width, height);

	trigger.targetname = "lobby";
	if (!getDvarInt("br_debug"))
		trigger setContents(true);

	return trigger;
}

removeAllSpawns()
{
	classnames = strTok("mp_tdm_spawn;mp_dm_spawn", ";");
	for (i = 0; i < classnames.size; i++)
	{
		spawns = getEntArray(classnames[i], "classname");
		for (j = 0; j < spawns.size; j++)
			spawns[j] delete();
	}
}

createSpawn(origin, angle)
{
	level.spawn["player"] = spawn("script_origin", origin);
	level.spawn["player"].angles = (0, angle, 0);
}

createDropTrigger(origin, radius)
{
	ent = spawn("trigger_radius", origin, 0, radius, 2000);
	ent.radius = radius;
	ent.targetname = "drop";
}

createZone(origin)
{
	if (!isDefined(level.zone))
		level.zone = [];
	level.zone[level.zone.size] = origin;
}

createPlanePath(start, end, angle)
{
	if (!isDefined(level.planePath))
		level.planePath = 0;
	level.planePath++;

	path = [];
	path[0] = spawn("script_origin", start);
	path[0].angles = (0, angle, 0);
	path[0].targetname = "plane_" + level.planePath;
	path[1] = spawn("script_origin", end);
	path[1].targetname = "plane_" + level.planePath;

	trigger = spawn("trigger_radius", path[1].origin, 0, 300, 300);
	trigger.radius = 300;
	trigger.targetname = "drop_recover";
}

createEntity(id, origin)
{
	entity = spawn("script_model", (origin[0], origin[1], origin[2] - 60));
	entity.angles = (0, randomIntRange(-360, 360), 90);
	entity.targetname = id;
	return entity;
}

createEntities(id, origins)
{
	entities = [];
	for (i = 0; i < origins.size; i++)
		entities[i] = createEntity(id, origins[i]);
	return entities;
}

createItemTrigger(origin)
{
	entity = createEntity(self.id, origin);
	self thread triggerEntity(entity);
	return entity;
}

createAmmo(id, model, sound, icon, count, rng)
{
	item = spawnStruct();
	item.type = "ammo";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.count = count;
	item.model = model;
	item.rng = rng;
	item.give = ::givePlayerAmmo;

	item.entities = getEntArray(item.id, "targetname");
	item thread itemRandomize();

	level.items[id] = item;
	return item;
}

createWeapon(id, mag, model, sound, icon, weapon, rng)
{
	item = spawnStruct();
	item.type = "weapon";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.mag = mag;
	item.weapon = weapon;
	item.model = model;
	item.rng = rng;
	item.give = ::givePlayerWeapon;

	item.entities = getEntArray(item.id, "targetname");
	item thread itemRandomize();

	level.items[id] = item;
	return item;
}

createSpecial(id, model, sound, icon, rng)
{
	item = spawnStruct();
	item.type = "special";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.model = model;
	item.rng = rng;
	item.give = ::givePlayerSpecial;

	item.entities = getEntArray(item.id, "targetname");
	item thread itemRandomize();

	level.items[id] = item;
	return item;
}

createGrenade(id, model, sound, icon, weapon, rng)
{
	item = spawnStruct();
	item.type = "special";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.weapon = weapon;
	item.model = model;
	item.rng = rng;
	item.give = ::givePlayerGrenade;

	item.entities = getEntArray(item.id, "targetname");
	item thread itemRandomize();

	level.items[id] = item;
	return item;
}

getWeaponItem(weapon)
{
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type == "weapon" && item.weapon == weapon)
			return item;
	}
	return undefined;
}

getGrenadeItem(weapon)
{
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type == "grenade" && item.weapon == weapon)
			return item;
	}
	return undefined;
}

getSpecialItem(id)
{
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type == "special" && item.id == id)
			return item;
	}
	return undefined;
}

getAmmoItem(id)
{
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type == "ammo" && item.id == id)
			return item;
	}
	return undefined;
}

getAllItems()
{
	items = [];
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
		items[items.size] = level.items[keys[i]];
	return items;
}

getAllItemsHud()
{
	items = [];
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type == "grenade" || item.type == "special")
			items[items.size] = item;
	}
	return items;
}

triggerEntity(entity)
{
	radius = 10;

	entity.item = self;
	if (isDefined(self.model))
		entity setModel(self.model);

	entity.trigger = spawn("trigger_radius", entity.origin, radius, radius, radius);
	entity.trigger.radius = radius;
	entity thread triggerEntityLoop();
}

itemRandomize()
{
	level waittill("br_started");

	for (i = 0; i < self.entities.size; i++)
	{
		if (randomIntRange(0, self.rng) == 0 || getDvarInt("br_debug"))
		{
			self triggerEntity(self.entities[i]);
			continue;
		}
		self.entities[i] delete();
	}
}

triggerEntityLoop()
{
	trigger = self.trigger;
	item = self.item;

	while (isDefined(self.trigger))
	{
		trigger waittill("trigger", player);
		player thread battleroyale\player\huds\_hint::draw(self);

		if (player useButtonPressed())
			player thread [[item.give]](self);
	}
}

refreshWeaponsList()
{
	self endon("death");
	self endon("disconnect");

	self.pers["weapons"] = [];
	list = self getWeaponsList();

	for (i = 0; i < list.size; i++)
	{
		switch (list[i])
		{
			case "frag_grenade_mp":
			case "smoke_grenade_mp":
			case "flash_grenade_mp":
				continue;
		}
		index = self.pers["weapons"].size;
		self.pers["weapons"][index] = list[i];
	}
}

givePlayerAmmo(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	self.pers[item.id] += item.count;
	self playLocalSound(item.sound);

	entity delete();
	trigger delete();
}

givePlayerWeapon(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	if (self hasWeapon("dog_mp"))
		self takeWeapon("dog_mp");

	self refreshWeaponsList();
	if (self hasWeapon(item.weapon))
		return;

	trigger delete();
	entity delete();

	// Drop current gun if you have 3 weapons
	weapons = self.pers["weapons"];
	if (weapons.size == 3)
	{
		currentWeapon = self getCurrentWeapon();
		currentItem = getWeaponItem(currentWeapon);
		currentItem createItemTrigger(entity.origin);

		self takeWeapon(currentWeapon);
	}

	self giveWeapon(item.weapon);
	self switchToWeapon(item.weapon);
	self playLocalSound(item.sound);
	self refreshWeaponsList();
}

givePlayerGrenade(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	self.pers[item.id]++;
	self giveWeapon(item.weapon);
	self playLocalSound(item.sound);
	self setWeaponAmmoStock(item.weapon, 1);

	entity delete();
	trigger delete();
}

givePlayerSpecial(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	self.pers[item.id]++;
	self playLocalSound(item.sound);

	entity delete();
	trigger delete();
}

setDrop(origin)
{
	level.dropOrigin = origin;
}
