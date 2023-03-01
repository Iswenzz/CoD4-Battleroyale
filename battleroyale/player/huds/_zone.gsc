#include battleroyale\utils\_hud;
#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	precacheShader("arrow_s");

	event("spawn", ::hud);
	event("death", ::clear);
}

hud()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	if (!self isPlaying())
		return;

	self vars();

	self thread timer();
	self thread position();
	self thread distance();
}

vars()
{
	self.zoneDistance = 0;

	self.huds["zone"] = [];
	self.huds["zone"]["background"] = addHud(self, 6, -119, 0.2, "left", "bottom", 1.4, 1, true);
	self.huds["zone"]["background"] setShader("white", 102, 6);
	self.huds["zone"]["timer"] = addHud(self, 6, -124, 0, "left", "bottom", 1.4, 1, true);
	self.huds["zone"]["timer"].label = &"&&1";
	self.huds["zone"]["progress"] = addHud(self, 6, -119, 1, "left", "bottom", 1.4, 1, true);
	self.huds["zone"]["progress"].color = (0.08, 0.38, 1);
	self.huds["zone"]["progress"] setShader("white", 2, 6);
	self.huds["zone"]["position"] = addHud(self, 102, -121, 1, "left", "bottom", 1.4, 200, true);
	self.huds["zone"]["position"] setShader("arrow_s", 6, 6);
	self.huds["zone"]["distance"] = addHud(self, 109, -124, 1, "left", "bottom", 1.4, 1, true);
	self.huds["zone"]["distance"].alignX = "right";
}

timer()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");
	level endon("zone_end");

	while (true)
	{
		level waittill("zone_start");

		self.huds["zone"]["timer"] fadeOverTime(0.1);
		self.huds["zone"]["timer"].alpha = 1;
		self.huds["zone"]["timer"] setTimer(level.zoneTime);
		self.huds["zone"]["progress"] scaleOverTime(0.2, 2, 6);
		wait 0.2;

		seconds = level.zoneTime;
		iteration = int(ceil(seconds / 60));
		progress = 102;

		for (i = iteration; i > 0; i--)
		{
			time = Ternary(seconds > 60, 60, seconds);
			seconds -= time;

			self.huds["zone"]["progress"] scaleOverTime(time, int(progress / i), 6);

			wait time;
		}
		self.huds["zone"]["timer"] fadeOverTime(0.1);
		self.huds["zone"]["timer"].alpha = 0;
		self.huds["zone"]["progress"] scaleOverTime(0.2, 2, 6);
		wait 0.2;
	}
}

position()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	min = 6;
	max = 102;
	prevScale = 0;

	level waittill("zone_start");

	while (true)
	{
		scale = int(max - linearScale(self.zoneDistance, 0, level.zoneNextRadius, min, max) + min);

		if (scale != prevScale)
		{
			self.huds["zone"]["position"] moveOverTime(0.2);
			self.huds["zone"]["position"].x = scale;
			self.huds["zone"]["position"].alpha = Ternary(scale == max, 0.6, 1);
		}
		wait 0.2;
		prevScale = scale;
	}
}

distance()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	level waittill("zone_start");

	while (true)
	{
		self.zoneDistance = distance2D(self.origin, level.zonePosition) - level.zoneNextRadius;
		self.zoneDistance = Ternary(self.zoneDistance < 0, 0, self.zoneDistance);

		self.huds["zone"]["distance"] setValue(int(self.zoneDistance));
		self.huds["zone"]["distance"].alpha = Ternary(self.zoneDistance > 0, 1, 0);
		wait 0.05;
	}
}

clear()
{
	self endon("disconnect");

	if (isDefined(self.huds["zone"]))
	{
		huds = getArrayKeys(self.huds["zone"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["zone"][huds[i]]))
				self.huds["zone"][huds[i]] destroy();
		}
	}
}
