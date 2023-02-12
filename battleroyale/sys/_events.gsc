initEvents()
{
	level.events = [];
	level.menus = [];
	level.huds = [];

	event("connect", ::connect);
}

event(name, callback)
{
	if (!isDefined(level.events[name]))
		level.events[name] = [];

	index = level.events[name].size;
	level.events[name][index] = callback;
}

connect()
{
	self endon("connect");
	self endon("disconnect");

	self.huds = [];
	self.loadings = [];

	while (true)
	{
		self waittill("menuresponse", menu, response);

		if (!isDefined(menu) || !isDefined(level.menus[menu]))
			continue;

		for (i = 0; i < level.menus[menu].size; i++)
		{
			script = level.menus[menu][i];

			if (script.type == "response" && script.response == response)
				self thread [[script.callback]](response);
			if (script.type == "callback")
				self thread [[script.callback]](response);
			if (script.type == "multiple" && StartsWith(response, script.response))
				self thread [[script.callback]](strTok(response, ":"));
		}
	}
}

menu(name, response, callback)
{
	index = menu_new(name, response, callback);
	level.menus[name][index].type = "response";
}

menu_multiple(name, response, callback)
{
	index = menu_new(name, response, callback);
	level.menus[name][index].type = "multiple";
}

menu_callback(name, callback)
{
	index = menu_new(name, undefined, callback);
	level.menus[name][index].type = "callback";
}

menu_new(name, response, callback)
{
	if (!isDefined(level.menus[name]))
	{
		precacheMenu(name);
		level.menus[name] = [];
	}
	index = level.menus[name].size;

	level.menus[name][index] = spawnStruct();
	level.menus[name][index].name = name;
	level.menus[name][index].response = response;
	level.menus[name][index].callback = callback;
	return index;
}

eventDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	// Players already have the "damage" callback but is only execute from engine damage
	self notify("damaged", eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}

eventSpawn(sync)
{
	self notify("spawned");
	if (isDefined(sync) && sync)
		self waittill("spawned_sync");
}

eventSpectator(sync)
{
	self notify("spectator");
	if (isDefined(sync) && sync)
		self waittill("spectator_sync");
}
