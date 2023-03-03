#include battleroyale\game\_game;
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
			self.huds["inventory"]["items"][item.id]["value"] setValue(self.pers[item.id]);
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

		self.huds["inventory"]["items"][item.id]["icon"] = addHud(self, x - 8, 6, 1, "left", "top", 1.4, 1000, true);
		self.huds["inventory"]["items"][item.id]["icon"] setShader(item.icon, 60, 25);
		self.huds["inventory"]["items"][item.id]["value"] = addHud(self, x + 10, 16, 1, "left", "top", 1.4, 1001, true);
		self.huds["inventory"]["items"][item.id]["value"] setValue(0);
		// self.huds["inventory"]["items"][item.id]["value"].font = "objective";
		self.huds["inventory"]["items"][item.id]["value"].label = &"&&1";
		x += 30;
	}
	self.huds["inventory"]["background"] = addHud(self, 4, 4, 0.2, "left", "top", 1.4, 1000, true);
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
		if (keys[i] == "items")
		{
			items = getArrayKeys(self.huds["inventory"]["items"]);
			for (j = 0; j < items.size; j++)
			{
				if (isDefined(self.huds["inventory"]["items"][items[j]]))
				{
					self.huds["inventory"]["items"][items[j]]["icon"] destroy();
					self.huds["inventory"]["items"][items[j]]["value"] destroy();
				}
			}
			self.huds["inventory"]["items"] = undefined;
		}
		if (isDefined(self.huds["inventory"][keys[i]]))
			self.huds["inventory"][keys[i]] destroy();
	}
}
