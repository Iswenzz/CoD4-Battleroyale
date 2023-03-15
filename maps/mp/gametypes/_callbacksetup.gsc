#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

start()
{
	printLn("^5===================================");
	printLn("^5SR Mod (c) Iswenzz 2016-2023");
	printLn("^5iswenzz.com");
	printLn("^5===================================");

	level.script = toLower(getDvar("mapname"));
	level.gametype = toLower(getDvar("g_gametype"));
	level.splitscreen = isSplitScreen();
	level.xenon = false;
	level.ps3 = false;
	level.onlineGame = true;
	level.console = false;
	level.rankedMatch = getDvarInt("sv_pure");
	level.teamBased = true;
	level.oldschool = false;
	level.gameEnded = false;
	level.friendlyfire = true;
	level.map = getDvar("mapname");

	level.iDFLAGS_RADIUS = 1;
	level.iDFLAGS_NO_ARMOR = 2;
	level.iDFLAGS_NO_KNOCKBACK = 4;
	level.iDFLAGS_PENETRATION = 8;
	level.iDFLAGS_NO_TEAM_PROTECTION = 16;
	level.iDFLAGS_NO_PROTECTION = 32;
	level.iDFLAGS_PASSTHRU = 64;

	game["state"] = "start";
	if (!isDefined(game["allies"]))
		game["allies"] = "marines";
	if (!isDefined(game["axis"]))
		game["axis"] = "opfor";

	battleroyale\_mod::main();
}

CodeCallback_StartGameType()
{
	for (i = 0; isDefined(level.events["map"]) && i < level.events["map"].size; i++)
		self thread [[level.events["map"][i]]]();
}

CodeCallback_PlayerDamaged()
{
	self endon("connect");
	self endon("disconnect");

	while (true)
	{
		self waittill("damaged", eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

		self CodeCallback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
	}
}

CodeCallback_PlayerSpawned()
{
	self endon("connect");
	self endon("disconnect");

	while (true)
	{
		self waittill("spawned");

		self.team = self.pers["team"];
		self.sessionteam = self.team;
		self.sessionstate = "playing";
		self.statusicon = "";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.died = false;

		self battleroyale\game\_callbacks::playerSpawn();

		for (i = 0; isDefined(level.events["spawn"]) && i < level.events["spawn"].size; i++)
			self thread [[level.events["spawn"][i]]]();

		self notify("spawned_sync");
	}
}

CodeCallback_PlayerSpectator()
{
	self endon("connect");
	self endon("disconnect");

	while (true)
	{
		self waittill("spectator");
		self notify("joined_spectators");

		self.sessionstate = "spectator";
		self.statusicon = "";
		self.spectatorclient = -1;

		self battleroyale\game\_callbacks::playerSpectator();

		for (i = 0; isDefined(level.events["spectator"]) && i < level.events["spectator"].size; i++)
			self thread [[level.events["spectator"][i]]]();

		self notify("spectator_sync");
	}
}

CodeCallback_PlayerTeam()
{
	self endon("connect");
	self endon("disconnect");

	while (true)
	{
		self waittill("team");
		self notify("joined_team");

		for (i = 0; isDefined(level.events["team"]) && i < level.events["team"].size; i++)
			self thread [[level.events["team"][i]]]();

		self notify("team_sync");
	}
}

CodeCallback_PlayerConnect()
{
	self endon("disconnect");
	self waittill("begin");
	self notify("connected");
	level notify("connecting", self);

	self setClientDvar("g_scriptMainMenu", "main_mp");

	self.shortName = getSubStr(self.name, 0, 15);
	self.guid = getSubStr(self getGuid(), 24, 32);
	self.number = self getEntityNumber();
	self.team = IfUndef(self.pers["team"], "spectator");
	self.sessionteam = self.team;
	self.pers["team"] = self.team;
	self.sessionstate = Ternary(game["state"] == "end", "intermission", "spectator");
	self.statusicon = "hud_status_connecting";
	self.died = false;

	self battleroyale\game\_callbacks::playerConnect();

	self thread CodeCallback_PlayerSpawned();
	self thread CodeCallback_PlayerSpectator();
	self thread CodeCallback_PlayerTeam();
	self thread CodeCallback_PlayerDamaged();

	for (i = 0; isDefined(level.events["connect"]) && i < level.events["connect"].size; i++)
		self thread [[level.events["connect"][i]]]();

	if (self isFirstConnection())
	{
		for (i = 0; isDefined(level.events["connected"]) && i < level.events["connected"].size; i++)
			self thread [[level.events["connected"][i]]]();
		self battleroyale\game\_teams::setSpectator();
	}
	else self eventSpawn();

	self.pers["connected"] = true;
	self notify("connecting_sync");
}

CodeCallback_PlayerDisconnect()
{
	self notify("disconnect");

	self battleroyale\game\_callbacks::playerDisconnect();

	for (i = 0; isDefined(level.events["disconnect"]) && i < level.events["disconnect"].size; i++)
		self thread [[level.events["disconnect"][i]]]();
}

CodeCallback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset)
{
	self endon("disconnect");

	if (isDefined(self.godmode))
		return;

	self battleroyale\game\_callbacks::playerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);

	for (i = 0; isDefined(level.events["damage"]) && i < level.events["damage"].size; i++)
		self thread [[level.events["damage"][i]]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);
}

CodeCallback_PlayerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration)
{
	self endon("disconnect");

	self.statusicon = "hud_status_dead";
	self.sessionstate = "dead";
	self.died = true;

	self battleroyale\game\_callbacks::playerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);

	for (i = 0; isDefined(level.events["killed"]) && i < level.events["killed"].size; i++)
		self thread [[level.events["killed"][i]]](eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);
	for (i = 0; isDefined(level.events["death"]) && i < level.events["death"].size; i++)
		self thread [[level.events["death"][i]]]();
}

CodeCallback_PlayerLastStand(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration)
{
	self endon("disconnect");

	for (i = 0; isDefined(level.events["laststand"]) && i < level.events["laststand"].size; i++)
		self thread [[level.events["laststand"][i]]](eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);
}

CodeCallback_ScriptCommand(cmd, arg)
{
	self endon("disconnect");

	for (i = 0; isDefined(level.events["command"]) && i < level.events["command"].size; i++)
		self thread [[level.events["command"][i]]](cmd, arg);
}

AbortLevel()
{
	println("Gametype is not supported");
	setDvar("g_gametype", "battleroyale");
	exitLevel(false);
}
