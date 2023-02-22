#include battleroyale\game\_api;
#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

initGame()
{
	level.items = [];

	event("map", ::spawnItems);
	event("killed", ::lastKill);
	event("connect", ::onConnect);
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

onConnect()
{
	self setClientDvars(
		"cg_drawfriendlynames", 1,
		"cg_friendlyNameFadeIn", 1,
		"cg_friendlyNameFadeOut", 1
	);

	level waittill("br_started");

	self setClientDvars(
		"cg_drawfriendlynames", 0,
		"cg_friendlyNameFadeIn", 0,
		"cg_friendlyNameFadeOut", 0
	);
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

	watchPlayers();

	battleroyale\game\_map::end();
}

watchPlayers()
{
	players = getPlayingPlayers();
	while (players.size > 1)
	{
		players = getPlayingPlayers();
		wait 0.05;
	}
	winner = players[0];
	if (!isDefined(winner))
		return;

	wins = winner maps\mp\gametypes\_persistence::statGet("WINS");
	winner maps\mp\gametypes\_persistence::statSet("WINS", wins + 1);
	winner battleroyale\game\_rank::giveRankXP("win");

	if (!isDefined(level.killcam))
		return;

	game["killcam"] = true;
	killcam = level.killcam;
	killcam.entity battleroyale\game\_killcam::start(3, killcam.eInflictor, killcam.attacker, killcam.sWeapon);
	wait 3;
	killcam.attacker suicide();
	wait 10.05;
}

lastKill(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	if (getPlayingPlayers().size > 1)
		return;

	killcam = spawnStruct();
	killcam.entity = self;
	killcam.eInflictor = eInflictor;
	killcam.attacker = attacker;
	killcam.sWeapon = sWeapon;

	level.killcam = killcam;
}

randomize()
{
	for (i = 0; i < self.entities.size; i++)
	{
		if (randomIntRange(0, self.rng) == 0)
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
	entity.origin = origin;
	self thread triggerEntity(entity);
	return entity;
}

triggerEntity(entity)
{
	entity.item = self;
	if (isDefined(self.model))
		entity setModel(self.model);

	angleZ = 0;
	if (self.type == "weapon")
		angleZ = 90;
	entity.angles = (0, randomIntRange(-360, 360), angleZ);

	radius = 10;
	entity.trigger = spawn("trigger_radius", entity.origin, radius, radius, radius);
	entity.trigger.radius = radius;
	entity thread triggerEntityLoop();
}

triggerEntityLoop()
{
	trigger = self.trigger;
	item = self.item;

	wait 0.5;

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
	self playSound(item.sound);

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

		self takeWeapon(currentWeapon);
	}

	self giveWeapon(item.weapon);
	self switchToWeapon(item.weapon);
	self playSound(item.sound);
	self refreshWeaponsList();
}

givePlayerGrenade(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	self.pers[item.id]++;
	self giveWeapon(item.weapon);
	self playSound(item.sound);
	self setWeaponAmmoStock(item.weapon, 1);

	entity delete();
	trigger delete();
}

givePlayerSpecial(entity)
{
	item = entity.item;
	trigger = entity.trigger;

	self.pers[item.id]++;
	self playSound(item.sound);

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
