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

	self.huds["hint"]["icon"] = addHud(self, 0, -150, 1, "center", "bottom", 1.5);
	self.huds["hint"]["label"] = addHud(self, 0, -200, 1, "center", "bottom", 1.5);
}

draw(entity)
{
	self endon("death");
	self endon("disconnect");

	if (isDefined(self.touchingItem))
		return;

	trigger = entity.trigger;
	item = entity.item;

	while (isDefined(self) && isDefined(trigger) && self isTouching(trigger))
	{
		if (!isDefined(self.touchingItem))
		{
			self.huds["hint"]["icon"] setShader(item.icon, 100, 40);
			self.huds["hint"]["label"] setText("Press ^3[{+activate}] ^7to grab");
		}
		self.touchingItem = true;
		wait 0.05;
	}
	self.huds["hint"]["icon"] setShader("", 100, 40);
	self.huds["hint"]["label"] setText("");
	self.touchingItem = undefined;
}

clear()
{
	self endon("disconnect");

	if (isDefined(self.huds["hint"]))
	{
		huds = getArrayKeys(self.huds["hint"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["hint"][huds[i]]))
				self.huds["hint"][huds[i]] destroy();
		}
	}
}
