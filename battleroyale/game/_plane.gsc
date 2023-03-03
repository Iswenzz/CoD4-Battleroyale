#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	event("map", ::plane);
}

plane()
{
	level waittill("br_started");

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
		players[i] clearLowerMessage();
		players[i].health = players[i].maxhealth;
		players[i].origin = level.plane.origin + (0, 0, 700);
		players[i] setPlayerAngles((level.plane.angles[0] + 50, level.plane.angles[1], level.plane.angles[2]));
		players[i] linkTo(level.plane);
		players[i] takeAllWeapons();
		players[i] hide();
	}

	wait 0.2;
	level.plane moveTo(level.planePath[1].origin, level.dvar["plane_duration"]);
	level.plane playLoopSound("plane_loop");
	level notify("plane_start");

	wait level.dvar["plane_duration"];
	level.plane stopLoopSound();
	level.plane delete();
	level notify("plane_stop");
}

watchLastDrop()
{
	if (!isDefined(level.dropOrigin))
		assertMsg("ERROR: Plane drop is not defined.\nUse the function createPlaneDrop(<origin>).");

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

		origin = (origin[0] + randomIntRange(-500, 500), origin[1] + randomIntRange(-500, 500), origin[2]);
		player thread playerDrop(origin);
	}
}

watchDrops()
{
	triggers = getEntArray("drop", "targetname");
	if (!triggers.size)
		assertMsg("ERROR: Map needs atleast one trigger with targetname 'drop' where people can drop from the plane.\nUse the function createPlaneDropTrigger(<origin>, <radius>) to create one.");

	for (i = 0; i < triggers.size; i++)
		triggers[i] thread watchDropTrigger();
}

watchDropTrigger()
{
	while (true)
	{
		self waittill("trigger", player);
		player thread watchPlayerDrop(self);
	}
}

watchPlayerDrop(trigger)
{
	if (isDefined(self.watchPlaneDrop))
		return;
	self.watchPlaneDrop = true;

	self endon("death");
	self endon("disconnect");
	self endon("drop");

	while (!self useButtonPressed())
	{
		if (self isTouching(trigger))
			self setLowerMessage("^7Drop ^9[{+activate}]");
		else
			self clearLowerMessage();
		wait 0.1;
	}
	if (!self isTouching(trigger))
		return;

	origin = level.dropOrigin;
	if (isDefined(level.plane.origin))
		origin = level.plane.origin;

	self thread playerDrop(origin);
}

deg2rad(deg)
{
    return deg * 3.14159265 / 180.0;
}

rad2deg(rad)
{
    return rad * 180.0 / 3.14159265;
}

playerUnstuck()
{
	self endon("death");
	self endon("disconnect");
	self endon("drop_end");

	wait 1;

	while (self getVelocity()[2] == 0)
	{
		distance = distance2D(self.origin, level.zonePosition);
		amount = 1 / (distance / 100 + 1);
		speed = amount / 50;

		origin = vectorLerp(self.origin, level.zonePosition, speed);
		self setOrigin((origin[0], origin[1], self.origin[2]));
		wait 0.05;
	}
	self setVelocity((0, 0, -200));
}

playerDrop(origin)
{
	if (isDefined(self.planeDrop))
		return;
	self.planeDrop = true;

	self endon("death");
	self endon("disconnect");
	self notify("drop");
	self endon("drop");

	self thread playerUnstuck();
	self freezeControls(false);
	self clearLowerMessage();
	self disableweapons();
	self show();
	self unlink();
	self setOrigin(origin);
	self setClientDvar("cg_thirdperson", 1);
	self setGravity(100);
	self setMoveSpeed(350);
	self setVelocity((0, 0, -200));

	self attach("sr_parachute", "TAG_ORIGIN");
	self playSound("parachute_start");

	self giveWeapon("dog_mp");
	self switchToWeapon("dog_mp");
	self giveMaxAmmo("dog_mp");
	self.health = 99999999999999999;

	wait 1;
	while (!self IsOnGround() && self getVelocity()[2] <= 0)
		wait .05;

	self.health = self.maxhealth;
	self setClientDvar("cg_thirdperson", 0);
	self detach("sr_parachute", "TAG_ORIGIN");
	self playSound("parachute_end");
	self setGravity(800);
	self setMoveSpeed(190);
	self enableWeapons();
	self notify("drop_end");
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
		assertMsg("ERROR: Map doesn't have plane paths.\nUse createPlanePath(origin) to create one.");

	index = randomInt(paths) + 1;
	path = getEntArray("plane_" + index, "targetname");
	if (path.size != 2)
		assertMsg("ERROR: plane_" + paths + "entity needs to have a start and end origin.");

	level.planePath = path;
}
