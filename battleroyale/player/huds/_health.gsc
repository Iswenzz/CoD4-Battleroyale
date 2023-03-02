#include battleroyale\sys\_dvar;
#include battleroyale\sys\_events;
#include battleroyale\utils\_common;
#include battleroyale\utils\_hud;

main()
{
	addDvar("healthbar", "br_healthbar", 1, 0, 1, "int");

	event("spawn", ::hud);
	event("death", ::clear);
}

hud()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	if (!level.dvar["healthbar"] || !self isPlaying())
		return;

	self clear();

	self.huds["health"] = [];
	self.huds["health"]["background"] = addHud(self, 0, 0, 0.6, "center", "bottom", 1.4, 1001, true);
	self.huds["health"]["background"].color = (0.4, 0.4, 0.4);
	self.huds["health"]["background"].hidewheninmenu = false;
	self.huds["health"]["background"] setShader("white", 250, 10);
	self.huds["health"]["foreground"] = addHud(self, 0, 0, 0.8, "center", "bottom", 1.4, 1002, true);
	self.huds["health"]["foreground"].color = (0.9, 0.9, 0.9);
	self.huds["health"]["foreground"].hidewheninmenu = false;
	self.huds["health"]["foreground"] setShader("white", 250, 10);

	while (true)
	{
		health = self.health;
		maxHealth = self.maxhealth;

		if (health <= 0)
			health = 1;
		if (maxHealth <= 0)
			maxHealth = health;
		if (health > maxHealth)
			health = maxHealth;

		self.huds["health"]["foreground"] scaleOverTime(0.2, int((health / maxHealth) * 250), 10);
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
