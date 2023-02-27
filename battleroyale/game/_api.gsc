#include battleroyale\game\_game;

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
	level.spawn["player"] = spawn("script_origin", (origin[0], origin[1], origin[2] - 60));
	level.spawn["player"].angles = (0, angle, 0);
}

createLobbyBlocker(origin, width, height)
{
	trigger = spawn("trigger_radius", (origin[0], origin[1], origin[2] - 60), 0, width, height);

	trigger.targetname = "lobby";
	if (!level.dvar["debug"])
		trigger setContents(true);

	return trigger;
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

createPlaneDrop(origin)
{
	level.dropOrigin = origin;
}

createPlaneDropTrigger(origin, radius)
{
	ent = spawn("trigger_radius", origin, 0, radius, 2000);
	ent.radius = radius;
	ent.targetname = "drop";
}

createPlaneDuration(seconds)
{
	level.dvar["plane_duration"] = seconds;
	setDvar("br_plane_seconds", seconds);
}

createZone(origin)
{
	level.zoneSpawns[level.zoneSpawns.size] = origin;
}

createZoneLevels(levels)
{
	level.dvar["zone_levels"] = levels;
	setDvar("br_zone_levels", levels);
}

createEntity(id, origin)
{
	entity = spawn("script_model", (origin[0], origin[1], origin[2] - 60));
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

	level.items[id] = item;
	return item;
}

createWeapon(id, mag, sound, icon, weapon, rng)
{
	item = spawnStruct();
	item.type = "weapon";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.mag = mag;
	item.weapon = weapon;
	item.model = getWeaponModel(weapon);
	item.rng = rng;
	item.give = ::givePlayerWeapon;

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

	level.items[id] = item;
	return item;
}

createGrenade(id, sound, icon, weapon, rng)
{
	item = spawnStruct();
	item.type = "grenade";
	item.id = id;
	item.sound = sound;
	item.icon = icon;
	item.weapon = weapon;
	item.model = getWeaponModel(weapon);
	item.rng = rng;
	item.give = ::givePlayerGrenade;

	level.items[id] = item;
	return item;
}
