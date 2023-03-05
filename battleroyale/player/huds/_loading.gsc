#include battleroyale\utils\_hud;
#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	menu("-1", "bandage", ::bandage);
	menu("-1", "first_kit", ::firstKit);
}

loading()
{
	if (isDefined(self.loading) || !self isPlaying())
		return;

	self.loading = true;
	self.loadingTime = 0;
	self disableWeapons();
	self clear();

	loaded = false;
	size = 288;
	time = 5;

	self.huds["loading"] = [];
	self.huds["loading"]["background"] = addHud(self, 0, 50, 0.5, "center", "middle", 1.4, 1000, true);
	self.huds["loading"]["background"] setShader("black", (size + 4), 14);
	self.huds["loading"]["progress"] = addHud(self, (size / 2) * -1, 50, 0.75, "left", "middle", 1.4, 1001, true);
	self.huds["loading"]["progress"].horzAlign = "center";
	self.huds["loading"]["progress"] setShader("white", 0, 8);
	self.huds["loading"]["progress"] scaleOverTime(time, size, 8);

	while (isDefined(self) && self.loadingTime < time && !self meleeButtonPressed() && !self getPlayerVelocity())
	{
		wait 0.05;
		self.loadingTime += 0.05;
	}
	if (self.loadingTime >= time)
		loaded = true;

	if (!isDefined(self))
		return false;

	self.loading = undefined;
	self enableWeapons();
	self clear();

	return loaded;
}

bandage(args)
{
	if (!isDefined(self.pers["bandage"]) || !self.pers["bandage"])
		return;

	self playSound("bandage");
	if (!self loading())
		return;

	self addHealth(40);
	self.pers["bandage"]--;
}

firstKit(args)
{
	if (!isDefined(self.pers["first_kit"]) || !self.pers["first_kit"])
		return;

	self playSound("bandage");
	if (!self loading())
		return;

	self addHealth(150);
	self.pers["first_kit"]--;
}

clear()
{
	if (isDefined(self.huds["loading"]))
	{
		huds = getArrayKeys(self.huds["loading"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["loading"][huds[i]]))
				self.huds["loading"][huds[i]] destroy();
		}
	}
}
