#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	event("map", ::zone);
}

zone()
{
	level endon("game over");

	if (!isDefined(level.zone) || level.zone.size < 1)
		assertMsg("ERROR: Map has no zones.\nUse createZone(origin) to create a zone.");

	level.zoneTrigger = level.zone[randomIntrange(0, level.zone.size - 1)];
	level waittill("br_started");

	// wait 60;

	finalZone = spawn("script_model", level.zoneTrigger);
	finalZone setModel("sr_zonetrig_final");
	objective_add(0, "active", level.zoneTrigger);

	restrict(0, "sr_zonetrig_40k", 40000, 6);
	restrict(1, "sr_zonetrig_20k", 20000, 6);
	restrict(2, "sr_zonetrig_10k", 10000, 4);
	restrict(3, "sr_zonetrig_5k", 5000, 4);
	restrict(4, "sr_zonetrig_2k5", 2500, 2);
	restrict(5, "sr_zonetrig_1k25", 1250, 2);
}

restrict(zoneLevel, model, radius, damageTime)
{
	if (level.dvar["zone_levels"] > zoneLevel)
		return;

	thread message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
	wait 90;
	thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
	wait 30;
	thread message("^3RESTRICTING THE PLAY AREA...");
	thread update(model, radius, damageTime);
}

update(model, radius, damageTime)
{
	level notify("zone");
	level endon("zone");
	level endon("game over");

	origin = level.zoneTrigger;
	zone = spawnStruct();
	zone.trigger = spawn("trigger_radius", (origin[0], origin[1], origin[2] - 2000), 0, radius, 15000);
	zone.trigger.radius = radius;
	zone.model = spawn("script_model", zone.trigger.origin);
	zone.model setModel(model);
	zone.model playSound("mp_last_stand");
	zone thread removeAfter();

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread damage(zone.trigger, damageTime);
}

removeAfter()
{
	level waittill("zone");

	self.model delete();
	self.trigger delete();
}

damage(trig, damageTime)
{
	level endon("zone");
	self endon("death");
	self endon("disconnect");

	while (isDefined(self) && isAlive(self))
	{
		if (!self isTouching(trig))
		{
			self doPlayerDamage(self, self, 10, 0, "MOD_UNKNOWN", "none", (0, 0, 0), (0, 0, 0), "none", 0);
			wait damageTime;
		}
		wait 0.05;
	}
}

message(msg)
{
	level endon("game over");

	playersSetLowerMessage(msg);
	wait 6;
	playersClearLowerMessage();
}
