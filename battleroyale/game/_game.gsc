#include battleroyale\game\_api;
#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

initGame()
{
	level.items = [];

	level.RNG_NONE = 0;
	level.RNG_SMALL = 1;
	level.RNG_NORMAL = 2;
	level.RNG_BIG = 3;
	level.RNG_RARE = 5;

	event("killed", ::lastKill);
	event("connect", ::onConnect);
	event("spawn", ::onSpawn);

	thread start();
}

defaultItems()
{
	createAmmo("45", "sr_45", "amunition", "hud_icon_mag_45", 8, level.RNG_NORMAL);
	createAmmo("9mm", "sr_9mm", "amunition", "hud_icon_mag_9mm", 15, level.RNG_NORMAL);
	createAmmo("7_62", "sr_7_62", "amunition", "hud_icon_mag_7_62", 30, level.RNG_NORMAL);
	createAmmo("5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
	createAmmo("12_gauge", "sr_gauge", "amunition", "hud_icon_mag_12_gauge", 6, level.RNG_NORMAL);
	createAmmo("rocket", "projectile_rpg7", "grenade_pickup", "hud_icon_40mm_grenade", 2, level.RNG_BIG);

	createWeapon("beretta", "9mm", "weap_pickup", "hud_icon_m9beretta", "beretta_mp", level.RNG_SMALL);
	createWeapon("colt45", "45", "weap_pickup", "hud_icon_colt_45", "colt45_mp", level.RNG_SMALL);
	createWeapon("usp", "45", "weap_pickup", "hud_icon_usp_45", "usp_mp", level.RNG_SMALL);
	createWeapon("deserteagle", "45", "weap_pickup", "hud_icon_desert_eagle", "deserteagle_mp", level.RNG_SMALL);
	createWeapon("deserteaglegold", "45", "weap_pickup", "hud_icon_desert_eagle", "deserteaglegold_mp", level.RNG_SMALL);
	createWeapon("dragunov", "7_62", "weap_pickup", "hud_icon_dragunov", "dragunov_mp", level.RNG_BIG);
	createWeapon("m16", "5_45", "weap_pickup", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
	createWeapon("ak47", "7_62", "weap_pickup", "hud_icon_ak47", "ak47_mp", level.RNG_NORMAL);
	createWeapon("mp44", "7_62", "weap_pickup", "hud_icon_mp44", "mp44_mp", level.RNG_NORMAL);
	createWeapon("mp5", "9mm", "weap_pickup", "hud_icon_mp5", "mp5_mp", level.RNG_NORMAL);
	createWeapon("m1014", "12_gauge", "weap_pickup", "hud_icon_benelli_m4", "m1014_mp", level.RNG_NORMAL);
	createWeapon("winchester1200", "12_gauge", "weap_pickup", "hud_icon_winchester_1200", "winchester1200_mp", level.RNG_NORMAL);
	createWeapon("m4", "5_45", "weap_pickup", "hud_icon_m4carbine", "m4_mp", level.RNG_NORMAL);
	createWeapon("g3", "5_45", "weap_pickup", "hud_icon_g3", "g3_mp", level.RNG_NORMAL);
	createWeapon("g36c", "5_45", "weap_pickup", "hud_icon_g36c", "g36c_mp", level.RNG_NORMAL);
	createWeapon("m14", "7_62", "weap_pickup", "hud_icon_m14", "m14_mp", level.RNG_NORMAL);
	createWeapon("skorpion", "9mm", "weap_pickup", "hud_icon_skorpian", "skorpion_mp", level.RNG_NORMAL);
	createWeapon("uzi", "9mm", "weap_pickup", "hud_icon_mini_uzi", "uzi_mp", level.RNG_NORMAL);
	createWeapon("ak74u", "7_62", "weap_pickup", "hud_icon_ak74u", "ak74u_mp", level.RNG_NORMAL);
	createWeapon("p90", "9mm", "weap_pickup", "hud_icon_p90", "p90_mp", level.RNG_NORMAL);
	createWeapon("saw", "5_45", "weap_pickup", "hud_icon_m249saw", "saw_mp", level.RNG_BIG);
	createWeapon("rpd", "7_62", "weap_pickup", "hud_icon_rpd", "rpd_mp", level.RNG_BIG);
	createWeapon("m60e4", "7_62", "weap_pickup", "hud_icon_m60e4", "m60e4_mp", level.RNG_BIG);
	createWeapon("m40a3", "7_62", "weap_pickup", "hud_icon_m40a3", "m40a3_mp", level.RNG_BIG);
	createWeapon("remington700", "7_62", "weap_pickup", "hud_icon_remington700", "remington700_mp", level.RNG_BIG);
	createWeapon("m21", "7_62", "weap_pickup", "hud_icon_m14_scoped", "m21_mp", level.RNG_BIG);
	createWeapon("rpg", "rocket", "weap_pickup", "hud_icon_stinger", "rpg_mp", level.RNG_BIG);
	createWeapon("at4", "rocket", "weap_pickup", "hud_icon_at4", "at4_mp", level.RNG_BIG);

	createGrenade("flash_grenade", "grenade_pickup", "hud_icon_flash", "flash_grenade_mp", level.RNG_NORMAL);
	createGrenade("smoke_grenade", "grenade_pickup", "hud_icon_smoke", "smoke_grenade_mp", level.RNG_SMALL);
	createGrenade("frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);

	createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", level.RNG_SMALL);
	createSpecial("first_kit", "sr_first_kit", "health_pickup_large", "hud_icon_kit", level.RNG_NORMAL);
}

onConnect()
{
	self endon("disconnect");

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
	defaultItems();

	level waittill("br_started");

	spawnItems();
	watchPlayers();

	end();
}

end()
{
	if (game["roundsplayed"] < level.dvar["rounds"])
		battleroyale\game\_map::levelRestart(true);
	else
		battleroyale\game\_map::end();
}

spawnItems()
{
	wait 1;

	items = getAllItems();
	for (i = 0; i < items.size; i++)
		items[i] randomize();
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
	killcam.entity battleroyale\game\_killcam::start(3, 10, killcam.eInflictor, killcam.attacker, killcam.sWeapon);
	wait 3;
	if (isDefined(killcam.attacker) && isPlayer(killcam.attacker))
		killcam.attacker suicide();
	wait 10;
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
	self.entities = getEntArray(self.id, "targetname");

	for (i = 0; i < self.entities.size; i++)
	{
		if (!level.dvar["randomize"] || randomIntRange(level.RNG_NONE, level.RNG_RARE) >= self.rng)
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

	radius = 30;
	entity.trigger = spawn("trigger_radius", entity.origin, 0, radius, radius);
	entity.trigger.radius = radius;
	entity thread triggerEntityLoop();
}

triggerEntityLoop()
{
	trigger = self.trigger;
	wait 0.5;

	while (isDefined(self.trigger))
	{
		trigger waittill("trigger", player);
		player thread playerEntityAction(self);
	}
}

playerEntityAction(entity)
{
	self endon("death");
	self endon("disconnect");

	item = entity.item;

	self thread battleroyale\player\huds\_hint::draw(entity);
	if (self useButtonPressed())
		self thread [[item.give]](entity);
}

refreshWeaponsList()
{
	self endon("death");
	self endon("disconnect");

	weapons = [];
	list = self getWeaponsList();

	for (i = 0; i < list.size; i++)
	{
		weapon = list[i];
		class = weaponClass(weapon);
		type = weaponInventoryType(weapon);

		if (class == "grenade")
			continue;
		if (type == "item")
		{
			self setActionSlot(3, "weapon", weapon);
			continue;
		}
		weapons[weapons.size] = weapon;
	}
	self.pers["weapons"] = weapons;
}

dropWeapon()
{
	currentItem = getWeaponItem(self.currentWeapon);

	if (!isDefined(currentItem))
		return;

	origin = (self.origin[0], self.origin[1], self getFloor());
	currentItem createItemTrigger(origin);
}

newWeapon(weapon)
{
	return !self.pers[weapon];
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

	currentWeapon = self getCurrentWeapon();
	if (currentWeapon == "none")
		return;

	if (self hasWeapon("dog_mp"))
		self takeWeapon("dog_mp");

	self refreshWeaponsList();
	if (self hasWeapon(item.weapon))
		return;

	type = weaponInventoryType(item.weapon);

	trigger delete();
	entity delete();

	// Drop current gun if you have 2 weapons
	if (self.pers["weapons"].size >= 2 && type != "item")
	{
		currentItem = getWeaponItem(currentWeapon);
		if (!isDefined(currentItem))
			return;

		currentItem createItemTrigger(origin);
		self takeWeapon(currentWeapon);
	}

	self giveWeapon(item.weapon);
	self switchToWeapon(item.weapon);
	self playSound(item.sound);
	self refreshWeaponsList();

	mag = getAmmoItem(item.mag);
	if (!isDefined(mag) || !self newWeapon(item.id))
		return;
	self.pers[mag.id] += mag.count;
	self.pers[item.id] = true;
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

getItemsByType(type)
{
	items = [];
	keys = getArrayKeys(level.items);
	for (i = 0; i < keys.size; i++)
	{
		item = level.items[keys[i]];
		if (item.type != type)
			continue;
		items[items.size] = item;
	}
	return items;
}

getEntitiesByType(type)
{
	entities = [];
	items = getItemsByType(type);

	for (i = 0; i < items.size; i++)
	{
		item = items[i];
		for (j = 0; j < item.entities.size; j++)
		{
			if (isDefined(item.entities[j]))
				entities[entities.size] = item.entities[j];
		}
	}
	return entities;
}
