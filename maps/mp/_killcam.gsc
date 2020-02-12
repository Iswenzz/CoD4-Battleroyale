#include maps\mp\gametypes\_hud_util;
#include battleroyale\_dvar;

init( version )
{
	addDvar( "pi_kc", "plugin_killcam_enable", 1, 0, 1, "int" );
	addDvar( "pi_kc_show", "plugin_killcam_show", 2, 0, 2, "int" );
	addDvar( "pi_kc_tp", "plugin_killcam_thirdperson", 0, 0, 0, "int" );
	addDvar( "pi_kc_blur", "plugin_killcam_blur", 0, 0, 5.0, "float" );
	//0 = When Jumper killed Acti
	//1 = When Activator killed jumper
	//2 = Every Kill
	
	setArchive( true );
}

StartKillcam( attacker, sWeapon )
{
	wait 2;
	players = getEntArray( "player", "classname" );
	for(i=0;i<players.size;i++)
	{
		players[i] setClientDvars( "cg_thirdperson", int( level.dvar["pi_kc_tp"] ), "r_blur", level.dvar["pi_kc_blur"] );
		players[i] thread killcam( attacker GetEntityNumber(), -1, sWeapon, 0, 0, 0, 15, undefined, attacker );
	}
}

killcam(
	attackerNum, // entity number of the attacker
	killcamentity, // entity number of the attacker's killer entity aka helicopter or airstrike
	sWeapon, // killing weapon
	predelay, // time between player death and beginning of killcam
	offsetTime, // something to do with how far back in time the killer was seeing the world when he made the kill; latency related, sorta
	respawn, // will the player be allowed to respawn after the killcam?
	maxtime, // time remaining until map ends; the killcam will never last longer than this. undefined = no limit
	perks, // the perks the attacker had at the time of the kill
	attacker // entity object of attacker
)
{
	// monitors killcam and hides HUD elements during killcam session
	//if ( !level.splitscreen )
	//	self thread killcam_HUD_off();
	
	self endon("disconnect");
	self endon("spawned");

	if(attackerNum < 0)
		return;

	camtime = 8;
	
	if (isdefined(maxtime)) {
		if (camtime > maxtime)
			camtime = maxtime;
		if (camtime < .05)
			camtime = .05;
	}
	
	// time after player death that killcam continues for
	if (getdvar("scr_killcam_posttime") == "")
		postdelay = 2;
	else {
		postdelay = getdvarfloat("scr_killcam_posttime");
		if (postdelay < 0.05)
			postdelay = 0.05;
	}

	killcamlength = camtime + postdelay;
	
	// don't let the killcam last past the end of the round.
	if (isdefined(maxtime) && killcamlength > maxtime)
	{
		// first trim postdelay down to a minimum of 1 second.
		// if that doesn't make it short enough, trim camtime down to a minimum of 1 second.
		// if that's still not short enough, cancel the killcam.
		if (maxtime < 2)
			return;

		if (maxtime - camtime >= 1) {
			// reduce postdelay so killcam ends at end of match
			postdelay = maxtime - camtime;
		}
		else {
			// distribute remaining time over postdelay and camtime
			postdelay = 2;
			camtime = maxtime - 1;
		}
		
		// recalc killcamlength
		killcamlength = camtime + postdelay;
	}

	killcamoffset = camtime + predelay;
	
	self notify ( "begin_killcam", getTime() );
	
	self.sessionstate = "spectator";
	self.spectatorclient = attackerNum;
	self.killcamentity = killcamentity;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = offsetTime;

	// ignore spectate permissions
	self allowSpectateTeam("allies", true);
	self allowSpectateTeam("axis", true);
	self allowSpectateTeam("freelook", true);
	self allowSpectateTeam("none", true);
	
	// wait till the next server frame to allow code a chance to update archivetime if it needs trimming
	wait 0.05;

	if ( self.archivetime <= predelay ) // if we're not looking back in time far enough to even see the death, cancel
	{
		self.sessionstate = "spectator";
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

	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	level notify("final_killcam_end");
}

waitKillcamTime()
{
	self endon("disconnect");
	self endon("end_killcam");

	wait 9;
	self notify("end_killcam");
}

endKillcam()
{
	self.killcam = undefined;
}
