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

	self.huds["hint"]["icon"] = addHud(self, 0, -150, 1, "center", "bottom", 1.5);
	self.huds["hint"]["label"] = addHud(self, 0, -200, 1, "center", "bottom", 1.5);
}

clear()
{
	self endon("disconnect");

	if (isDefined(self.huds["health"]))
	{
		huds = getArrayKeys(self.huds["health"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["health"][huds[i]]))
				self.huds["health"][huds[i]] destroy();
		}
	}
}
