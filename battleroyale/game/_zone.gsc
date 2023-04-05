#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	level.zones = [];
	level.zoneSpawns = [];
	level.zonePosition = (0, 0, 0);
	level.zoneLevel = 0;
	level.zoneRadius = 0;
	level.zoneNextRadius = 0;
	level.zoneDamageTime = 0;
	level.zoneTime = level.dvar["zone_time"];
	level.zoneLastTime = 90;

	addZone("sr_zonetrig_40k", 40000, 20000, 6, level.zoneTime);
	addZone("sr_zonetrig_20k", 20000, 10000, 6, level.zoneTime);
	addZone("sr_zonetrig_10k", 10000, 5000, 4, level.zoneTime);
	addZone("sr_zonetrig_5k", 5000, 2500, 4, level.zoneTime);
	addZone("sr_zonetrig_2k5", 2500, 1250, 4, level.zoneTime);
	addZone("sr_zonetrig_1k25", 1250, 625, 2, level.zoneTime);
	addZone("sr_zonetrig_625", 625, 625, 2, level.zoneTime);

	event("map", ::zone);
}

addZone(model, radius, nextRadius, damageTime, time)
{
	zone = spawnStruct();
	zone.index = level.zones.size;
	zone.model = model;
	zone.radius = radius;
	zone.nextRadius = nextRadius;
	zone.damageTime = damageTime;
	zone.time = time;

	level.zones[zone.index] = zone;

	if (zone.index == level.dvar["zone_levels"])
	{
		level.zoneRadius = radius * 2;
		level.zoneNextRadius = radius;
	}
}

zone()
{
	level endon("game over");

	if (!isDefined(level.zoneSpawns) || level.zoneSpawns.size < 1)
		assertMsg("ERROR: Map has no zones.\nUse createZone(origin) to create a zone.");

	level.zonePosition = level.zoneSpawns[randomIntrange(0, level.zoneSpawns.size - 1)];
	level waittill("br_started");

	wait 30;

	finalZone = spawn("script_model", level.zonePosition);
	finalZone setModel("sr_zonetrig_final");
	objective_add(0, "active", level.zonePosition);

	for (i = 0; i < level.zones.size; i++)
		level.zones[i] restrict();
	closeArea();

	objective_delete(0);
	finalZone delete();
}

closeArea()
{
	level notify("zone_close");
	level notify("zone", level.zoneLastTime);

	if (level.zoneLastTime < 60)
		thread message("^1CLOSING THE PLAY AREA IN " + level.zoneLastTime + " SEC");
	else
		thread message("^1CLOSING THE PLAY AREA IN " + int(level.zoneLastTime / 60) + " MIN");

	level.tempEntity playSound("mp_last_stand");
	wait level.zoneLastTime;

	level notify("zone_end");
	level.tempEntity playSound("mp_last_stand");
}

restrict()
{
	if (level.dvar["zone_levels"] > self.index)
	{
		level.zoneLevel = self.index;
		level.zoneRadius = self.radius;
		level.zoneNextRadius = self.nextRadius;
		level.zoneDamageTime = self.damageTime;
		return;
	}

	level endon("game over");
	level notify("zone", self.time);

	seconds = self.time;
	while (seconds)
	{
		time = Ternary(seconds > 60, 60, seconds);
		minutes = int(seconds / 60);

		if (seconds == 240)
			thread message("^3RESTRICTING THE PLAY AREA IN 4 MIN");
		if (seconds == 120)
			thread message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
		else if (seconds < 60)
			thread message("^3RESTRICTING THE PLAY AREA IN " + seconds + " SEC");

		seconds -= time;
		wait time;
	}
	level.zoneLevel = self.index;
	level.zoneRadius = self.radius;
	level.zoneNextRadius = self.nextRadius;
	level.zoneDamageTime = self.damageTime;
	level notify("zone_move");

	pos = level.zonePosition;
	zone = spawnStruct();
	zone.trigger = spawn("trigger_radius", (pos[0], pos[1], pos[2] - 2000), 0, self.radius, 40000);
	zone.trigger.radius = self.radius;
	zone.model = spawn("script_model", zone.trigger.origin);
	zone.model playSound("mp_last_stand");
	zone thread removeAfter();

	if (isDefined(self.model))
		zone.model setModel(self.model);

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread damage(zone.trigger, self.damageTime);

	wait 2;
}

removeAfter()
{
	level waittills("zone_move", "zone_end");

	self.model delete();
	self.trigger delete();
}

damage(trigger, damageTime)
{
	level endon("zone_move");
	self endon("death");
	self endon("disconnect");

	while (true)
	{
		wait 0.05;
		if (isDefined(trigger) && self isTouching(trigger))
			continue;

		self doPlayerDamage(self, self, 10, 0, "MOD_UNKNOWN", "none", (0, 0, 0), (0, 0, 0), "none", 0);
		wait damageTime;
	}
}

message(msg)
{
	level endon("game over");

	playersSetLowerMessage(msg);
	wait 6;
	playersClearLowerMessage();
}
