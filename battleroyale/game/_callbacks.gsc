#include battleroyale\sys\_events;
#include battleroyale\game\_game;
#include battleroyale\utils\_common;

playerConnect()
{
	self endon("connect");
	self endon("disconnect");
	level notify("connected", self);

	self.enable3DWaypoints = true;
	self.enableDeathIcons = true;
	self.classType = undefined;
	self.selectedClass = false;
	self.teamKill = false;
	self.hidden = false;

	if (game["state"] == "end")
		return;

	if (!self isFirstConnection())
	{
		self.score = self.pers["score"];
		self.kills = self.pers["kills"];
		self.assists = self.pers["assists"];
		self.deaths = self.pers["deaths"];

		self battleroyale\game\_teams::setTeam("allies");
		return;
	}
	self.pers["score"] = 0;
	self.pers["kills"] = 0;
	self.pers["deaths"] = 0;
	self.pers["assists"] = 0;
	self.pers["lifes"] = 0;
	self.pers["headshots"] = 0;
	self.pers["knifes"] = 0;
	self.pers["activator"] = 0;
	self.pers["isDog"] = false;

	self openMenu("main_mp");
	self thread serverDvars();
}

playerDisconnect()
{
	level notify("disconnected", self);
	self cleanUp();
}

playerLastStand(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self suicide();
}

playerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if (self.sessionteam == "spectator" || game["state"] == "end")
		return;

	level notify("player_damage", self, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

	if (isPlayer(eAttacker) && sMeansOfDeath == "MOD_MELEE" && isWallbang(eAttacker, self))
		return;

	if (isPlayer(eAttacker) && eAttacker != self)
		eAttacker maps\mp\gametypes\_weapons::checkHit(sWeapon);

	iDFlags |= level.iDFLAGS_NO_KNOCKBACK;

	self doPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}

playerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self endon("spawned");
	self notify("killed_player");
	self notify("death");

	if (self.sessionteam == "spectator" || game["state"] == "end")
		return;

	level notify("player_killed", self, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);

	if (sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
		sMeansOfDeath = "MOD_HEAD_SHOT";

	if (game["state"] != "playing")
	{
		self eventSpawn();
		return;
	}
	if (sMeansOfDeath != "MOD_SUICIDE")
	{
		deaths = self maps\mp\gametypes\_persistence::statGet("DEATHS");
		self maps\mp\gametypes\_persistence::statSet("DEATHS", deaths + 1);
		self.deaths++;
		self.pers["deaths"]++;
		obituary(self, attacker, sWeapon, sMeansOfDeath);
	}

	self thread battleroyale\game\_game::dropWeapon();
	self thread battleroyale\game\_teams::setTeamDead();
	self thread ragdoll(sHitLoc, vDir, sWeapon, eInflictor, sMeansOfDeath, deathAnimDuration);

	if (!isPlayer(attacker) || attacker == self)
		return;

	attacker.kills++;
	attacker.pers["kills"]++;
	battleroyale\game\_rank::processXpReward(sMeansOfDeath, attacker, self);

	self cleanUp();
	attacker setLowerMessage("^7You killed ^9" + self.name);
	attacker thread clearLowerMessageAfterTime();

	self thread battleroyale\game\_killcam::killcam(attacker.number, -1, sWeapon, 1.5, 0, 0, 0, 6, undefined, attacker);
}

playerSpawn()
{
	if (game["state"] == "end")
		return;

	level notify("jumper", self);
	self cleanUp();

	self battleroyale\game\_teams::setPlayerModel();
	self battleroyale\game\_teams::setSpeed();
	self battleroyale\game\_teams::setHealth();

	self.pers["weapons"] = [];

	self spawnPlayer();

	self giveWeapon("dog_mp");
	self setSpawnWeapon("dog_mp");
	self setActionSlot(4, "weapon", "flash_grenade_mp");

	if (game["state"] != "playing")
		self disableWeapons();

	self notify("spawned_player");
	level notify("player_spawn", self);
}

playerSpectator()
{
	self endon("disconnect");
	self cleanUp();
	level notify("player_spectator", self);
}

serverDvars()
{
	self endon("disconnect");

	wait 3;
	self setClientDvars(
		"ui_3dwaypointtext", "1",
		"ui_deathicontext", "1",
		"cl_maxpackets", 125,
		"rate", 100000,
		"ip", getDvar("net_ip"),
		"port", getDvar("net_port")
	);
	wait 0.05;
	self setClientDvars(
		"show_hud", "true",
		"hud_enable", 1,
		"cg_drawSpectatorMessages", 1,
		"player_sprintTime", 4,
		"ui_hud_hardcore", 1,
		"ui_uav_client", 0
	);
	wait 0.05;
	self setClientDvars(
		"fx_enable", 1,
		"ragdoll_enable", 1,
		"cg_drawThroughWalls", 0,
		"ui_uav_client", 0
	);
}
