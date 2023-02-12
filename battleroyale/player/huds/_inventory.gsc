#include battleroyale\utils\_hud;
#include battleroyale\sys\_events;

main()
{
	event("spawn", ::hud);
	event("death", ::clear);
}

hud()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	self clear();
	self huds();

	while (true)
	{
		for (i = 0; i < level.items.size; i++)
		{
			item = level.items[i];
			if (item.type == "ammo")
				continue;

			self.huds["inventory"][item.id]["value"] setValue(self.pers[item.id]);
		}
		wait 0.05;
	}
}

huds()
{
	x = 5;
	self.huds["inventory"] = [];

	for (i = 0; i < level.items.size; i++)
	{
		item = level.items[i];
		if (item.type == "ammo")
			continue;

		self.huds["inventory"][item.id]["icon"] = addHud(self, x, 3, "left", "top", 1);
		self.huds["inventory"][item.id]["icon"] setShader(item.icon, 30, 30);
		self.huds["inventory"][item.id]["value"] = addHud(self, x + 10, 3, "left", "top", 1);
		self.huds["inventory"][item.id]["value"] setValue(0);
		self.huds["inventory"][item.id]["value"].label = &"&&1";
		x += 30;
	}
	self.huds["inventory"]["background"] = addHud(self, 4, 4, "left", "top", 0.3);
	self.huds["inventory"]["background"] setShader("black", x + 5, 30);
}

clear()
{
	self endon("disconnect");

	if (!isDefined(self.huds["inventory"]))
		return;

	keys = getArrayKeys(self.huds["inventory"]);
	for (i = 0; i < keys.size; i++)
	{
		if (!isDefined(self.huds["inventory"][keys[i]]))
			continue;

		huds = getArrayKeys(self.huds["inventory"][keys[i]]);
		for (j = 0; j < huds.size; j++)
		{
			if (isDefined(self.huds["inventory"][keys[i]][huds[j]]))
				self.huds["inventory"][keys[i]][huds[j]] destroy();
		}
		if (!huds.size)
			self.huds["inventory"][keys[i]] destroy();
	}
}
