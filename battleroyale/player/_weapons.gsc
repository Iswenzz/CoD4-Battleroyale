#include battleroyale\game\_game;
#include battleroyale\sys\_events;

main()
{
	event("spawn", ::weapons);
	event("spawn", ::grenade);
}

grenade()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	while (true)
	{
		self waittill("grenade_fire", grenade, weaponName);

		item = getGrenadeItem(weaponName);
		if (!isDefined(item))
			continue;

		self.pers[item.id]--;
		if (self.pers[item.id] < 0)
			self.pers[item.id] = 0;

		self setWeaponAmmoStock(weaponName, self.pers[item.id]);
	}
}

weapons()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	self.prevWeapon = "";
	self.prevAmmoClip = 0;

	while (true)
	{
		self.currentWeapon = self getCurrentWeapon();
		item = getWeaponItem(self.currentWeapon);

		if (!isDefined(item))
		{
			wait 0.05;
			continue;
		}
		self updateClip(item);
		self updateStock(item);

		wait 0.05;

		self.prevWeapon = self.currentWeapon;
		self.prevAmmoClip = self.ammoClip;
	}
}

updateClip(item)
{
	self.ammoClip = self getWeaponAmmoClip(item.weapon);
	reloaded = self.ammoClip - self.prevAmmoClip;

	if (self.currentWeapon != self.prevWeapon || reloaded <= 0)
		return;

	self.pers[item.mag] -= reloaded;
	if (self.pers[item.mag] < 0)
		self.pers[item.mag] = 0;
}

updateStock(item)
{
	self setWeaponAmmoStock(item.weapon, self.pers[item.mag]);
}
