#include battleroyale\utils\_common;

main()
{
	game["menu_main"] = "main_mp";
}

setPlayerModel()
{
	self detachAll();

	self setModel("body_mp_usmc_cqb");
	self setViewModel("viewmodel_hands_zombie");
}

setHealth()
{
	self.maxhealth = level.dvar["max_health"];
	self.health = self.maxhealth;
}

setSpeed()
{
	self setMoveSpeed(190);
	self setMoveSpeedScale(1.0);
}

setTeam(team)
{
	if (self.pers["team"] == team)
		return;

	self.pers["team"] = team;
	self.team = team;
	self.sessionteam = team;

	if (self isPlaying())
		self suicide();
}

setSpectatePermissions()
{
	self allowSpectateTeam("allies", true);
	self allowSpectateTeam("axis", true);
	self allowSpectateTeam("none", false);
}
