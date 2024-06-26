#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

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

setTeamDead()
{
	self setTeam("axis");
	self setSpectatePermissions();
	self eventSpectator();
}

setSpectator()
{
	self setTeam("spectator");
	self setSpectatePermissions();
	self eventSpectator(true);
	self spawnSpectator();
}

setSpectatePermissions()
{
	self allowSpectateTeam("allies", true);
	self allowSpectateTeam("axis", true);
	self allowSpectateTeam("freelook", true);
	self allowSpectateTeam("none", false);
}
