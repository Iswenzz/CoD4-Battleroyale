#include battleroyale\sys\_dvar;

main()
{
	addDvar("pi_kc", "plugin_killcam_enable", 1, 0, 1, "int");
	addDvar("pi_kc_tp", "plugin_killcam_thirdperson", 0, 0, 0, "int");
	addDvar("pi_kc_blur", "plugin_killcam_blur", 0, 0, 5.0, "float");

	if (!level.dvar["pi_kc"])
		return;

	setArchive(true);
}

start(eInflictor, attacker, sWeapon)
{
	if (!isDefined(self) || !isDefined(attacker) || !isDefined(eInflictor)
		|| !isPlayer(self) || !isPlayer(attacker) || self == attacker)
		return;

	players = getEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		players[i] setClientDvars("cg_thirdperson", int(level.dvar["pi_kc_tp"]), "r_blur", level.dvar["pi_kc_blur"]);
		players[i] thread killcam(attacker getEntityNumber(), -1, sWeapon, 3, 0, 0, 0, 10, undefined, attacker);
	}
}

killcam(
	attackerNum, 	// Entity number of the attacker
	killcamentity, 	// Entity number of the attacker's killer entity aka helicopter or airstrike
	sWeapon, 		// Killing weapon
	startDelay,		// Time to wait before killcam starts
	predelay, 		// Time between player death and beginning of killcam
	offsetTime, 	// Something to do with how far back in time the killer was seeing the world when he made the kill; latency related, sorta
	respawn, 		// Will the player be allowed to respawn after the killcam?
	maxtime, 		// Time remaining until map ends; the killcam will never last longer than this. undefined = no limit
	perks, 			// The perks the attacker had at the time of the kill
	attacker 		// Entity object of attacker
)
{
	self endon("disconnect");
	self endon("spawned");
	level endon("game_ended");

	if (game["state"] == "end" || attackerNum < 0)
		return;

	camtime = 10;

	if (isDefined(maxtime))
	{
		if (camtime > maxtime)
			camtime = maxtime;
		if (camtime < .05)
			camtime = .05;
	}
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

	// Don't let the killcam last past the end of the round.
	if (isDefined(maxtime) && killcamlength > maxtime)
	{
		// First trim postdelay down to a minimum of 1 second.
		// If that doesn't make it short enough, trim camtime down to a minimum of 1 second.
		// If that's still not short enough, cancel the killcam.
		if (maxtime < 2)
			return;

		// Reduce postdelay so killcam ends at end of match
		if (maxtime - camtime >= 1)
			postdelay = maxtime - camtime;
		// Distribute remaining time over postdelay and camtime
		else
		{
			postdelay = 1;
			camtime = maxtime - 1;
		}
		killcamlength = camtime + postdelay;
	}
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
	self thread waitKillcamTime();
	self waittill("end_killcam");
	self endKillcam();
	self setClientDvar("r_blur", "0");

	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
}

waitKillcamTime()
{
	self endon("disconnect");
	self endon("end_killcam");

	wait 10;
	self notify("end_killcam");
}

endKillcam()
{
	self.killcam = undefined;
}
