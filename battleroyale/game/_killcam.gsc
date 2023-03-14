#include battleroyale\sys\_dvar;
#include battleroyale\sys\_events;

main()
{
	addDvar("pi_kc", "plugin_killcam_enable", 1, 0, 1, "int");
	addDvar("pi_kc_tp", "plugin_killcam_thirdperson", 0, 0, 0, "int");
	addDvar("pi_kc_blur", "plugin_killcam_blur", 0, 0, 5.0, "float");

	if (!level.dvar["pi_kc"])
		return;

	setArchive(true);
}

start(startDelay, time, eInflictor, attacker, sWeapon)
{
	if (!isDefined(self) || !isDefined(attacker) || !isDefined(eInflictor) || !isPlayer(self))
		return;

	if (!isPlayer(attacker))
		attacker = self;

	players = getEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		players[i] setClientDvars("cg_thirdperson", int(level.dvar["pi_kc_tp"]), "r_blur", level.dvar["pi_kc_blur"]);
		players[i] thread killcam(attacker getEntityNumber(), -1, sWeapon, startDelay, 0, 0, 0, time, undefined, attacker);
	}
}

killcam(
	attackerNum, 	// Entity number of the attacker
	killcamentity, 	// Entity number of the attacker's killer entity aka helicopter or airstrike
	sWeapon, 		// Killing weapon
	startDelay,		// Time to wait before killcam starts
	predelay, 		// Time between player death and beginning of killcam
	offsetTime, 	// Something to do with how far back in time the killer was seeing the world when he made the kill
	respawn, 		// Will the player be allowed to respawn after the killcam
	camtime, 		// The killcam will never last longer than this
	perks, 			// The perks the attacker had at the time of the kill
	attacker 		// Entity object of attacker
)
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("spawned");
	self notify("killcam");
	wait 0.05;
	self endon("killcam");

	if (game["state"] == "end" || attackerNum < 0)
		return;

	if (camtime < 0.05)
		camtime = 0.05;
	if (isDefined(startDelay))
		wait startDelay;

	// Time after player death that killcam continues for
	if (getdvar("scr_killcam_posttime") == "")
		postdelay = 2;
	else
	{
		postdelay = getDvarFloat("scr_killcam_posttime");
		if (postdelay < 0.05)
			postdelay = 0.05;
	}
	killcamlength = camtime + postdelay;
	killcamoffset = camtime + predelay;

	self notify("begin_killcam", getTime());

	self.sessionstate = "spectator";
	self.spectatorclient = attackerNum;
	self.killcamentity = killcamentity;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = offsetTime;

	// Ignore spectate permissions
	self allowSpectateTeam("allies", true);
	self allowSpectateTeam("axis", true);
	self allowSpectateTeam("freelook", true);
	self allowSpectateTeam("none", true);

	// Wait till the next server frame to allow code a chance to update archivetime if it needs trimming
	wait 0.05;

	// If we're not looking back in time far enough to even see the death, cancel
	if (self.archivetime <= predelay)
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		return;
	}
	self.killcam = true;
	wait camtime;
	self notify("end_killcam", getTime());
	self.killcam = undefined;
	self setClientDvar("r_blur", "0");

	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;

	self battleroyale\game\_teams::setSpectatePermissions();
	self eventSpectator();
}
