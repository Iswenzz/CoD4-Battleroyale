#include battleroyale\game\_api;
#include battleroyale\sys\_events;

main()
{
	event("spawn", ::weapons);
	event("spawn", ::grenades);
	event("spawn", ::reload);
}

grenades()
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
		self setWeaponAmmoStock(weaponName, 1);
	}
}

weapons()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	while (true)
	{
		wait 0.05;

		item = getWeaponItem(self getCurrentWeapon());
		if (!isDefined(item))
			continue;

		self setWeaponAmmoStock(item.weapon, self.pers[item.mag]);
	}
}

reload()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	while (true)
	{
		self waittill("reload_start");
		self reloadWeapon();
	}
}

reloadWeapon()
{
	self endon("weapon_change");

	item = getWeaponItem(self getCurrentWeapon());
	if (!isDefined(item))
		return;

	clip = self getWeaponAmmoClip(item.weapon);
	self waittill("reload");
	self.pers[item.mag] -= weaponClipSize(item.weapon) - clip;
}
