#include battleroyale\utils\_hud;
#include battleroyale\sys\_events;

main()
{
	menu("-1", "bandage", ::bandage);
	menu("-1", "first_kit", ::firstKit);
}

loading()
{
	self endon("death");
	self endon("disconnect");

	if (isDefined(self.loading))
		return;

	self.loading = true;
	self.loadingTime = 0;
	self.blocker = spawn("script_origin", self.origin);
	self linkTo(self.blocker);
	self disableWeapons();
	self playSound("bandage");
	self clear();

	loaded = false;
	size = 288;
	time = 5;

	self.huds["loading"] = [];
	self.huds["loading"]["background"] = addHud(self, 320, 385, 0.5, "center", "middle");
	self.huds["loading"]["background"] setShader("black", (size + 4), 14);
	self.huds["loading"]["progress"] = addHud(self, 320 - (size / 2.0), 385, 0.5, "left", "middle");
	self.huds["loading"]["progress"] setShader("white", 0, 8);
	self.huds["loading"]["progress"] scaleOverTime(time, size, 8);

	while (self.loadingTime < time)
	{
		wait 0.05;
		self.loadingTime += 0.05;

		if (self meleeButtonPressed())
		{
			loaded = false;
			break;
		}
	}
	if (self.loadingTime >= time)
		loaded = true;

	self.loading = undefined;
	self.blocker delete();
	self enableWeapons();
	self unlink();
	self clear();

	return loaded;
}

bandage()
{
	if (!self loading())
		return;

	self.health += 40;
	self.pers["mag_bandage"]--;
}

firstKit()
{
	if (!self loading())
		return;

	self.health += 150;
	self.pers["mag_first_kit"]--;
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
