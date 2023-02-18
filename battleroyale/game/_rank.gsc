#include battleroyale\sys\_events;
#include battleroyale\utils\_common;

initRank()
{
	level.scoreInfo = [];
	level.ranks = [];

	level.maxRank = int(tableLookup("mp/rankTable.csv", 0, "maxrank", 1));
	level.maxPrestige = int(tableLookup("mp/rankIconTable.csv", 0, "maxprestige", 1));

	precacheShader("white");

	precacheString(&"RANK_PLAYER_WAS_PROMOTED_N");
	precacheString(&"RANK_PLAYER_WAS_PROMOTED");
	precacheString(&"RANK_PROMOTED");
	precacheString(&"MP_PLUS");

	registerScoreInfo("kill", 10);
	registerScoreInfo("headshot", 25);
	registerScoreInfo("melee", 15);
	registerScoreInfo("activator", 0);
	registerScoreInfo("trap_activation", 10);
	registerScoreInfo("jumper_died", 10);

	registerScoreInfo("win", 0);
	registerScoreInfo("loss", 0);
	registerScoreInfo("tie", 0);

	buildRanks();
	buildRanksIcon();

	menu("quickstuff", "prestige", ::prestige);

	event("connect", ::onConnect);
	event("team", ::onChangedTeam);
	event("spectator", ::onChangedTeam);
}

buildRanks()
{
	tableName = "mp/rankTable.csv";

	for (i = 0; i <= level.maxRank; i++)
	{
		level.ranks[i][1] = tableLookup(tableName, 0, i, 1);
		level.ranks[i][2] = tableLookup(tableName, 0, i, 2);
		level.ranks[i][3] = tableLookup(tableName, 0, i, 3);
		level.ranks[i][7] = tableLookup(tableName, 0, i, 7);
	}
}

buildRanksIcon()
{
	tableName = "mp/rankIconTable.csv";
	level.assets["rank"] = [];
	level.assets["prestige"] = [];

	for (rId = 0; rId <= level.maxRank; rId++)
	{
		icon = tableLookup(tableName, 0, rId, 1);
		level.assets["rank"][rId] = icon;
		precacheShader(icon);
	}
	for (pId = 0; pId <= level.maxPrestige; pId++)
	{
		icon = tableLookup(tableName, 0, 0, pId + 1);
		level.assets["prestige"][pId] = icon;
		precacheShader(icon);
	}
}

reset()
{
	self.pers["prestige"] = 0;
	self.pers["rank"] = 0;
	self.pers["rankxp"] = 0;

	self setRank(self.pers["rank"], self.pers["prestige"]);

	self setStat(2326, self.pers["prestige"]);
	self setStat(2350, self.pers["rank"]);
	self setStat(2301, self.pers["rankxp"]);

	self saveRank();
	updateRankStats(self, 0);
}

registerScoreInfo(type, value)
{
	level.scoreInfo[type]["value"] = value;
}

getScoreInfoValue(type)
{
	return level.scoreInfo[type]["value"];
}

getScoreInfoLabel(type)
{
	return level.scoreInfo[type]["label"];
}

getRankInfoMinXP(rankId)
{
	return int(level.ranks[rankId][2]);
}

getRankInfoXPAmt(rankId)
{
	return int(level.ranks[rankId][3]);
}

getRankInfoMaxXp(rankId)
{
	return int(level.ranks[rankId][7]);
}

getRankInfoFull(rankId)
{
	return tableLookupIString("mp/rankTable.csv", 0, rankId, 16);
}

getRankInfoFullInt(rankId)
{
	return int(tableLookupIString("mp/rankTable.csv", 0, rankId, 16));
}

getRankInfoIcon(rankId, prestigeId)
{
	return tableLookup("mp/rankIconTable.csv", 0, rankId, prestigeId + 1);
}

onConnect()
{
	self.pers["prestige"] = self getStat(2326);
	self.pers["rank"] = self getStat(2350);
	self.pers["rankxp"] = self getStat(2301);

	self.pers["participation"] = 0;
	self.pers["rankUpdateTotal"] = 0;

	self.huds["xp"] = newClientHudElem(self);
	self.huds["xp"].horzAlign = "center";
	self.huds["xp"].vertAlign = "middle";
	self.huds["xp"].alignX = "center";
	self.huds["xp"].alignY = "middle";
	self.huds["xp"].x = 0;
	self.huds["xp"].y = -60;
	self.huds["xp"].font = "default";
	self.huds["xp"].fontscale = 2.0;
	self.huds["xp"].archived = false;
	self.huds["xp"].color = (0.5, 0.5, 0.5);
	self.huds["xp"] maps\mp\gametypes\_hud::fontPulseInit();

	if (self isBot())
	{
		self getBotRank();
		self setRank(self.pers["rank"], int(self.pers["prestige"]));
		return;
	}
	if (!isDefined(self))
		return;

	self saveRank();
	self setRank(self.pers["rank"], int(self.pers["prestige"]));
}

onChangedTeam()
{
	self removeRankHUD();
}

giveRankXP(type, value)
{
	if (!isDefined(self) || isDefined(value) && value <= 0)
		return;

	value = int(value);
	if (!isDefined(value))
		value = getScoreInfoValue(type);

	if (value <= 0)
		return;

	self.score += value;
	self.pers["score"] = self.score;

	score = self maps\mp\gametypes\_persistence::statGet("SCORE");
	self maps\mp\gametypes\_persistence::statSet("SCORE", score + value);
	self thread updateRankScoreHUD(value);

	self incRankXP(value);
	self saveRank();
}

saveRank(xp, rank, prestige)
{
	if (self isBot())
		return;

	self setStat(2326, self.pers["prestige"]);
	self setStat(2350, self.pers["rank"]);
	self setStat(2301, self.pers["rankxp"]);
}

getBotRank()
{
	self.pers["rankxp"] = 0;
	self.pers["rank"] = 1;
	self.pers["prestige"] = 0;
}

prestige(args)
{
	if (!isDefined(self.pers["rank"]) || !isDefined(self.pers["rankxp"]) || !isDefined(self.pers["prestige"]))
		return;
	if (self.pers["prestige"] >= level.maxPrestige || self.pers["rankxp"] < getRankInfoMaxXP(level.maxRank))
	{
		self iPrintLn("^1Prestige Mode^7 is unavailable!");
		return;
	}
	self.pers["rankxp"] = 1;
	self.pers["rank"] = 0;
	self.pers["prestige"]++;
	self setRank(0, self.pers["prestige"]);
	self maps\mp\gametypes\_persistence::statset("RANKXP", 1);

	updateRankStats(self, 0);

	iPrintLn(fmt("%s has entered prestige %d", self.name, self.pers["prestige"]));
	self saveRank();
}

updateRankScoreHUD(amount)
{
	self endon("disconnect");
	self endon("team");
	self endon("spectator");

	if (amount == 0)
		return;

	self notify("update_score");
	self endon("update_score");

	self.pers["rankUpdateTotal"] += amount;

	wait (0.05);

	if (isDefined(self.huds["xp"]))
	{
		if (self.pers["rankUpdateTotal"] < 0)
		{
			self.huds["xp"].label = &"";
			self.huds["xp"].color = (1, 0, 0);
		}
		else
		{
			self.huds["xp"].label = &"MP_PLUS";
			self.huds["xp"].color = (1, 1, 0.5);
		}

		self.huds["xp"] setValue(self.pers["rankUpdateTotal"]);
		self.huds["xp"].alpha = 0.85;
		self.huds["xp"] thread maps\mp\gametypes\_hud::fontPulse(self);

		wait 1;
		self.huds["xp"] fadeOverTime(0.75);
		self.huds["xp"].alpha = 0;

		self.pers["rankUpdateTotal"] = 0;
	}
}

removeRankHUD()
{
	if (isDefined(self.huds["xp"]))
		self.huds["xp"].alpha = 0;
}

getRankForXp(xpVal)
{
	rankId = 0;
	rankName = level.ranks[rankId][1];

	while (!IsNullOrEmpty(rankName))
	{
		if (xpVal < getRankInfoMinXP(rankId) + getRankInfoXPAmt(rankId))
			return rankId;

		rankId++;
		if (isDefined(level.ranks[rankId]))
			rankName = level.ranks[rankId][1];
		else
			rankName = undefined;
	}

	rankId--;
	return rankId;
}

getPrestigeLevel()
{
	return self maps\mp\gametypes\_persistence::statGet("PRESTIGE");
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP(amount)
{
	xp = self getRankXP();
	newXp = (xp + amount);

	if (newXp > getRankInfoMaxXP(level.maxRank))
		newXp = getRankInfoMaxXP(level.maxRank);

	self.pers["rankxp"] = newXp;
	self maps\mp\gametypes\_persistence::statSet("RANKXP", newXp);

	rankId = self getRankForXp(self getRankXP());
	self updateRank(rankId);
}

updateRank(rankId)
{
	if (getRankInfoMaxXP(self.pers["rank"]) <= self getRankXP() && self.pers["rank"] < level.maxRank)
	{
		rankId = self getRankForXp(self getRankXP());
		self setRank(rankId, self.pers["prestige"]);
		self.pers["rank"] = rankId;
		self thread updateRankAnnounceHUD();
	}
	updateRankStats(self, rankId);
}

updateRankStats(player, rankId)
{
	player maps\mp\gametypes\_persistence::statSet("RANK", rankId);
	player maps\mp\gametypes\_persistence::statSet("MINXP", getRankInfoMinXp(rankId));
	player maps\mp\gametypes\_persistence::statSet("MAXXP", getRankInfoMaxXp(rankId));
	player maps\mp\gametypes\_persistence::statSet("PRESTIGE", player.pers["prestige"]);
}

updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if (!isDefined(team))
		return;

	self notify("reset_outcome");
	self.pers["rankstring"] = self.pers["rank"];
	self.pers["rankstring"]++;

	notifyData = spawnStruct();
	notifyData.titleText = &"RANK_PROMOTED";
	notifyData.iconName = self getRankInfoIcon(self.pers["rank"], self.pers["prestige"]);
	notifyData.sound = "mp_level_up";
	notifyData.duration = 4.0;
	notifyData.notifyText = self.pers["rankstring"];

	thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}

processXpReward(sMeansOfDeath, attacker, victim)
{
	if (attacker sameTeam(victim))
		return;

	kills = attacker maps\mp\gametypes\_persistence::statGet("KILLS");
	attacker maps\mp\gametypes\_persistence::statSet("KILLS", kills + 1);

	if (victim.pers["team"] == "allies")
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet("ALLIES_KILLS");
		attacker maps\mp\gametypes\_persistence::statSet("ALLIES_KILLS", kills + 1);
	}
	else if (victim.pers["team"] == "axis")
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet("AXIS_KILLS");
		attacker maps\mp\gametypes\_persistence::statSet("AXIS_KILLS", kills + 1);
	}

	switch (sMeansOfDeath)
	{
		case "MOD_HEAD_SHOT":
			attacker.pers["headshots"]++;
			attacker giveRankXP("headshot");
			hs = attacker maps\mp\gametypes\_persistence::statGet("HEADSHOTS");
			attacker maps\mp\gametypes\_persistence::statSet("HEADSHOTS", hs + 1);
			break;
		case "MOD_MELEE":
			attacker.pers["knifes"]++;
			attacker giveRankXP("melee");
			knife = attacker maps\mp\gametypes\_persistence::statGet("MELEE_KILLS");
			attacker maps\mp\gametypes\_persistence::statSet("MELEE_KILLS", knife + 1);
			break;
		default:
			pistol = attacker maps\mp\gametypes\_persistence::statGet("PISTOL_KILLS");
			attacker maps\mp\gametypes\_persistence::statSet("PISTOL_KILLS", pistol + 1);
			attacker giveRankXP("kill");
			break;
	}
}
