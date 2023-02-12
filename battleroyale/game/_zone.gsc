#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	event("map", ::zone);
}

zone()
{
	if (!isDefined(level.zone))
		assertMsg("ERROR: level.zone array isn't defined.");
	if (isDefined(level.zone) && level.zone.size < 1)
		assertMsg("ERROR: level.zone array need atleast 1 vector. Please use createZone(origin) to create a final zone.");

	level.zoneTrigger = level.zone[randomIntrange(0, level.zone.size - 1)];
	level waittill("br_started");

	level endon("game over");
	start = level.dvar["zone_start_level"];
	wait 60;

	if (start <= 0)
	{
		thread message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
		wait 90;
		thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA...");
		thread update("sr_zonetrig_40k", 40000, 6);
		wait 10;
	}
	if (start <= 1)
	{
		thread message("^3RESTRICTING THE PLAY AREA IN 2 MIN");
		wait 90;
		thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA...");
		thread update("sr_zonetrig_20k", 20000, 4);
		level notify("zone");
		wait 10;
	}

	finalZone = spawn("script_model", level.zoneTrigger);
	finalZone setModel("sr_zonetrig_250_red");

	if (start <= 2)
	{
		thread message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA...");
		thread update("sr_zonetrig_10k", 10000, 2);
		level notify("zone");
		wait 10;
	}
	if (start <= 3)
	{
		thread message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA...");
		level notify("zone");
		thread update("sr_zonetrig_5k", 5000, 1);
		wait 10;
	}
	if (start <= 4)
	{
		thread message("^3RESTRICTING THE PLAY AREA IN 1 MIN");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA IN 30 SEC");
		wait 30;
		thread message("^3RESTRICTING THE PLAY AREA...");
		level notify("zone");
		thread update("sr_zonetrig_2k5", 2500, 1);
	}
}

update(model, radius, damageTime)
{
	level endon("zone");
	level endon("game over");

	origin = level.zoneTrigger;
	trigger = spawn("trigger_radius", (origin[0], origin[1], origin[2] - 2000), 0, radius, 15000);
	trigger.model = spawn("script_model", trigger.origin);
	trigger.model setModel(model);
	trigger thread removeAfter();

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread damage(trigger, damageTime);
}

removeAfter()
{
	level waittill("zone");

	self.model delete();
	self delete();
}

damage(trig, damageTime)
{
	level endon("zone");
	self endon("death");
	self endon("disconnect");

	if (self.pers["team"] != "allies")
		return;

	while (true)
	{
		if (!self isTouching(trig))
		{
			self doPlayerDamage(self, self, 10, 0, "MOD_FALLING", "default_mp", (0,0,0), (0,0,0), "head", 0);
			wait damageTime;
		}
		wait 0.05;
	}
}

message(msg)
{
	level endon("game over");

	playersSetLowerMessage(msg);
	wait 4;
	playersClearLowerMessage();
}
