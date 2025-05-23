main()
{
	precacheShellshock("flashbang");
	fgmonitor = maps\mp\gametypes\_perplayer::init("fgmonitor", ::startMonitoringFlash, ::stopMonitoringFlash);
	maps\mp\gametypes\_perplayer::enable(fgmonitor);
}


startMonitoringFlash()
{
	self thread monitorFlash();
}


stopMonitoringFlash(disconnected)
{
	self notify("stop_monitoring_flash");
}


flashRumbleLoop(duration)
{
	self endon("stop_monitoring_flash");

	self endon("flash_rumble_loop");
	self notify("flash_rumble_loop");

	goalTime = getTime() + duration * 1000;

	while (getTime() < goalTime)
	{
		self PlayRumbleOnEntity("damage_heavy");
		wait(0.05);
	}
}


monitorFlash()
{
	self endon("disconnect");
	self.flashEndTime = 0;
	while (true)
	{
		self waittill("flashbang", amount_distance, amount_angle, attacker);

		if (!isalive(self))
			continue;

		hurtattacker = false;
		hurtvictim = true;

		if (amount_angle < 0.5)
			amount_angle = 0.5;
		else if (amount_angle > 0.8)
			amount_angle = 1;

		duration = amount_distance * amount_angle * 6;

		if (duration < 0.25)
			continue;

		rumbleduration = undefined;
		if (duration > 2)
			rumbleduration = 0.75;
		else
			rumbleduration = 0.25;

		assert(isdefined(self.pers["team"]));
		if (level.teamBased && isdefined(attacker) && isdefined(attacker.pers["team"]) && attacker.pers["team"] == self.pers["team"] && attacker != self)
		{
			if (level.friendlyfire == 0) // no FF
			{
				continue;
			}
			else if (level.friendlyfire == 1) // FF
			{
			}
			else if (level.friendlyfire == 2) // reflect
			{
				duration = duration * .5;
				rumbleduration = rumbleduration * .5;
				hurtvictim = false;
				hurtattacker = true;
			}
			else if (level.friendlyfire == 3) // share
			{
				duration = duration * .5;
				rumbleduration = rumbleduration * .5;
				hurtattacker = true;
			}
		}

		if (hurtvictim)
			self thread applyFlash(duration, rumbleduration);
		if (hurtattacker)
			attacker thread applyFlash(duration, rumbleduration);
	}
}

applyFlash(duration, rumbleduration)
{
	// wait for the highest flash duration this frame,
	// and apply it in the following frame

	if (!isdefined(self.flashDuration) || duration > self.flashDuration)
		self.flashDuration = duration;
	if (!isdefined(self.flashRumbleDuration) || rumbleduration > self.flashRumbleDuration)
		self.flashRumbleDuration = rumbleduration;

	wait .05;

	if (isdefined(self.flashDuration)) {
		self shellshock("flashbang", self.flashDuration); // TODO: avoid shellshock overlap
		self.flashEndTime = getTime() + (self.flashDuration * 1000);
	}
	if (isdefined(self.flashRumbleDuration)) {
		self thread flashRumbleLoop(self.flashRumbleDuration); //TODO: Non-hacky rumble.
	}

	self.flashDuration = undefined;
	self.flashRumbleDuration = undefined;
}


isFlashbanged()
{
	return isDefined(self.flashEndTime) && gettime() < self.flashEndTime;
}
