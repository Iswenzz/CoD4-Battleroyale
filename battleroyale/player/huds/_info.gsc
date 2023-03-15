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

	self.huds["info"] = [];
	self.huds["info"]["alive"] = addHud(self, -22, 34, 1, "right", "top", 1.4, 101, true);
	self.huds["info"]["alive"].label = &"&&1 ALIVE";
	self.huds["info"]["alive_background"] = addHud(self, -12, 34, 0.5, "right", "top", 1.4, 100, true);
	self.huds["info"]["alive_background"] setShader("black", 60, 17);

	while (true)
	{
		players = getPlayingPlayers();
		self.huds["info"]["alive"] setValue(players.size);
		wait 0.2;
	}
}

clear()
{
	self endon("disconnect");

	if (isDefined(self.huds["info"]))
	{
		huds = getArrayKeys(self.huds["info"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["info"][huds[i]]))
				self.huds["info"][huds[i]] destroy();
		}
	}
}
