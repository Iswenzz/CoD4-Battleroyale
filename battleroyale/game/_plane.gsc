#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	event("map", ::plane);
}

plane()
{
	computePath();

	thread watchDrops();
	thread watchLastDrop();

	level.plane = spawn("script_model", (0, 0, -10000));
	level.plane.angles = (0, 0, 0);
	level.plane setModel("vehicle_ac130_low");
	level.plane.angles = level.planePath[0].angles;
	level.plane moveTo(level.planePath[0].origin, 0.05);
	wait 0.2;

	// Teleport players to the plane
	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
	{
		if (players[i].pers["team"] != "allies")
			continue;

		players[i] clearLowerMessage();
		players[i].origin = level.plane.origin + (0, 0, 700);
		players[i] setPlayerAngles((level.plane.angles[0] + 50, level.plane.angles[1], level.plane.angles[2]));
		players[i] linkTo(level.plane);
		players[i] takeAllWeapons();
		players[i] hide();
	}

	wait 0.2;
	level.plane moveTo(level.planePath[1].origin, 60);
	level.plane playLoopSound("plane_loop");
	level notify("plane_start");

	wait 60;
	level.plane stopLoopSound();
	level.plane delete();
	level notify("plane_stop");
}

watchLastDrop()
{
	if (!isDefined(level.dropOrigin))
		assertMsg("ERROR: level.dropOrigin isn't defined. Please use the function setDrop(<origin>).");

	triggers = getEntArray("drop_recover", "targetname");
	for (i = 0; i < triggers.size; i++)
		triggers[i] thread lastDropTrigger();
}

lastDropTrigger()
{
	origin = level.dropOrigin;
	while (true)
	{
		self waittill("trigger", player);
		player setOrigin((origin[0] + randomIntRange(-500, 500), origin[1] + randomIntRange(-500, 500), origin[2]));
		player thread playerDrop();
	}
}

watchDrops()
{
	trigger = getEnt("drop", "targetname");
	if (!isDefined(trigger))
		assertMsg("ERROR: Map needs a trigger with targetname 'drop' where people can drop from the plane. \nUse the function createDropTrigger(<origin>, <radius>) to create one.");

	while (true)
	{
		trigger waittill("trigger", player);
		player thread watchPlayerDrop(trigger);
	}
}

watchPlayerDrop(trigger)
{
	self endon("death");
	self endon("disconnect");

	if (isDefined(self.planeDrop) || self.pers["team"] != "axis")
		return;
	self.planeDrop = true;

	while (!self useButtonPressed())
	{
		if (self isTouching(trigger))
			self setLowerMessage("^7Drop ^9[{+activate}]");
		else
			self clearLowerMessage();
		wait 0.1;
	}
	if (self isTouching(trigger))
		self thread playerDrop();
}

playerUnstuck()
{
	self endon("death");
	self endon("disconnect");
	self endon("parachute_end");

	while (true)
	{
		while (self getVelocity() != (0, 0, 0))
			wait 0.5;

		for (i = 5; i >= 0; i--)
		{
			self setLowerMessage("^1Teleporting in " + i + " sec ...");
			wait 1;
		}
		self clearLowerMessage();

		origin = level.dropOrigin;
		self setOrigin((origin[0] + randomIntRange(-100, 100), origin[1] + randomIntRange(-100, 100), origin[2]));
		self setVelocity((0, 0, -300));
		break;
	}
}

playerDrop()
{
	self endon("death");
	self endon("disconnect");

	self freezeControls(true);
	self clearLowerMessage();
	self show();
	self unlink();
	self setClientDvar("cg_thirdperson", 1);
	wait 0.05;
	self freezeControls(false);
	wait 0.2;
	self thread playerUnstuck();

	self.origin = level.plane.origin + (0, 0, -100);
	self attach("sr_parachute", "TAG_ORIGIN");
	self playSound("parachute_start");
	self notify("parachute_start");
	wait 0.5;

	self setGravity(100);
	self setMoveSpeed(350);
	self giveWeapon("dog_mp");
	self switchToWeapon("dog_mp");
	self giveMaxAmmo("dog_mp");
	self.health = 99999999999999999;

	while (!self IsOnGround())
		wait .05;

	self setClientDvar("cg_thirdperson", 0);
	self detach("sr_parachute", "TAG_ORIGIN");
	self playSound("parachute_end");
	self.health = self.maxhealth;
	self setGravity(800);
	self setMoveSpeed(190);
	self notify("parachute_end");
	self clearLowerMessage();
}

computePath()
{
	paths = 0;
	while (getEntArray("plane_" + (paths + 1), "targetname").size > 0)
	{
		paths++;
		wait 0.05;
	}
	if (!paths)
		assertMsg("ERROR: Map doesn't have plane path. Use createPlanePath(origin) to create a plane path.");

	index = randomInt(paths - 1) + 1;
	path = getEntArray("plane_" + index, "targetname");
	if (path.size != 2)
		assertMsg("ERROR: plane_" + paths + "entity needs to have a start origin and a end origin");

	level.planePath = path;
}
