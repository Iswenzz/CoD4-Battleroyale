#include battleroyale\game\_api;
#include battleroyale\utils\_hud;
#include battleroyale\utils\_common;
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

	if (!self isPlaying())
		return;

	self clear();
	self huds();

	while (true)
	{
		items = getAllItemsHud();
		for (i = 0; i < items.size; i++)
		{
			item = items[i];
			self.huds["inventory"][item.id]["value"] setValue(self.pers[item.id]);
		}
		wait 0.05;
	}
}

huds()
{
	self.huds["inventory"] = [];
	items = getAllItemsHud();
	x = 0;

	for (i = 0; i < items.size; i++)
	{
		item = items[i];

		self.huds["inventory"][item.id]["icon"] = addHud(self, x, 6, 1, "left", "top");
		self.huds["inventory"][item.id]["icon"] setShader(item.icon, 60, 25);
		self.huds["inventory"][item.id]["value"] = addHud(self, x + 10, 16, 1, "left", "top", 1.4, 1001);
		self.huds["inventory"][item.id]["value"] setValue(0);
		self.huds["inventory"][item.id]["value"].label = &"&&1";
		x += 30;
	}
	self.huds["inventory"]["background"] = addHud(self, 4, 4, 0.3, "left", "top", 1.4, 1000);
	self.huds["inventory"]["background"] setShader("black", x + 5, 30);
}

clear()
{
	self endon("disconnect");

	if (!isDefined(self.huds["inventory"]))
		return;

	if (isDefined(self.huds["inventory"]["background"]))
		self.huds["inventory"]["background"] destroy();

	keys = getArrayKeys(self.huds["inventory"]);
	for (i = 0; i < keys.size; i++)
	{
		if (isDefined(self.huds["inventory"][keys[i]]) && !isDefined(self.huds["inventory"][keys[i]].size))
		{
			self.huds["inventory"][keys[i]] destroy();
			continue;
		}

		huds = getArrayKeys(self.huds["inventory"][keys[i]]);
		for (j = 0; j < huds.size; j++)
		{
			if (isDefined(self.huds["inventory"][keys[i]][huds[j]]))
				self.huds["inventory"][keys[i]][huds[j]] destroy();
		}
	}
}
