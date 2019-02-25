#include battleroyale\_dvar;

init()
{
	addDvar("pi_hm", "plugin_hitmarker_enable", 1, 0, 1, "int");
	addDvar("pi_hm_av", "plugin_hitmarker_armorvest", 1, 0, 1, "int");

	thread onDamage();
}

onDamage()
{
	while(1)
	{
		level waittill("player_damage", victim, eAttacker);
		if(!isDefined(victim) || !isPlayer(victim) || !isDefined(eAttacker) || !isPlayer(eAttacker) || eAttacker == victim)
			continue;

		armor = false;
		if(victim hasPerk( "specialty_armorvest" ) && level.dvar["pi_hm_av"])
			armor = true;
		eAttacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(armor);
	}
}