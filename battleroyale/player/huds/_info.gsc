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
	self.huds["info"]["number"] = addHud(self, 10, 35, 1, "left", "top", 1.4);
	self.huds["info"]["number"].label = &"#&&1";

	while (true)
	{
		players = getPlayingPlayers();
		self.huds["info"]["number"] setValue(players.size);

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