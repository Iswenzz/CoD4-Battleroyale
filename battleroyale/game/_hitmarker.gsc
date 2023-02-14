#include battleroyale\sys\_dvar;
#include battleroyale\sys\_events;
#include battleroyale\utils\_common;

main()
{
	addDvar("pi_hm", "hitmarker_enable", 1, 0, 1, "int");
	addDvar("pi_hm_av", "hitmarker_armorvest", 1, 0, 1, "int");

	if (!level.dvar["pi_hm"])
		return;

	event("damage", ::onDamage);
}

onDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset)
{
	if (!isPlayer(self) || !isPlayer(eAttacker) || self == eAttacker)
		return;

	armor = self hasPerk("specialty_armorvest") && level.dvar["pi_hm_av"];
	eAttacker maps\mp\gametypes\_damagefeedback::updateDamageFeedback(armor);
}
