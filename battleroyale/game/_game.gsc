#include battleroyale\game\_api;
#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

initGame()
{
	level.items = [];

	event("map", ::spawnItems);
	event("killed", ::lastKill);
	event("spawn", ::onSpawn);

	thread start();
}

spawnItems()
{
	level waittill("br_started");

	items = getAllItems();
	for (i = 0; i < items.size; i++)
		items[i] randomize();
}

onSpawn()
{
	items = getAllItems();
	for (i = 0; i < items.size; i++)
		self.pers[items[i].id] = 0;
}

start()
{
	level waittill("br_started");

	while (getPlayingPlayers().size > 1)
		wait 0.05;

	waitKillcam();
	battleroyale\game\_map::end();
}

waitKillcam()
{
	wait 2;
	if (isDefined(game["killcam"]))
		wait 10.5;
}

lastKill(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	if (isDefined(game["killcam"]) || getPlayingPlayers().size > 1)
		return;
	if (!isPlayer(attacker))
		return;

	game["killcam"] = true;
	battleroyale\game\_killcam::start(3, eInflictor, attacker, sWeapon);

	wins = attacker maps\mp\gametypes\_persistence::statGet("WINS");
	attacker maps\mp\gametypes\_persistence::statSet("WINS", wins + 1);

	wait 3;
	if (isDefined(attacker))
		attacker suicide();
}

randomize()
{
	for (i = 0; i < self.entities.size; i++)
	{
		if (randomIntRange(0, self.rng) == 0 || level.dvar["debug"])
		{
			self triggerEntity(self.entities[i]);
			continue;
		}
		self.entities[i] delete();
	}
}

createItemTrigger(origin)
{
	entity = createEntity(self.id, origin);
	self thread triggerEntity(entity);
	return entity;
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
	origin = entity.origin;

	if (self hasWeapon("dog_mp"))
		self takeWeapon("dog_mp");

	self refreshWeaponsList();
	if (self hasWeapon(item.weapon))
		return;

	trigger delete();
	entity delete();

	// Drop current gun if you have 2 weapons
	if (self.pers["weapons"].size == 2)
	{
		currentWeapon = self getCurrentWeapon();
		currentItem = getWeaponItem(currentWeapon);
		currentItem createItemTrigger(origin);
		iPrintLnBold(currentItem.origin);

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
