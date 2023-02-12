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

	self.huds["players"] = addHud(self, 10, 35, 1, "left", "top", 1.4);
	self.huds["players"].label = &"^7Players Alive: &&1";

	while (true)
	{
		players = getPlayingPlayers();
		self.huds["players"] setValue(players.size);

		wait 0.2;
	}
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
