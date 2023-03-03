#include battleroyale\sys\_events;

getAllPlayers()
{
	return getEntArray("player", "classname");
}

getPlayingPlayers()
{
	players = getAllPlayers();
	array = [];
	for (i = 0; i < players.size; i++)
	{
		if (players[i] isPlaying() && players[i].pers["team"] != "spectator")
			array[array.size] = players[i];
	}
	return array;
}

getDeadPlayers()
{
	players = getAllPlayers();
	array = [];
	for (i = 0; i < players.size; i++)
	{
		if (!players[i] isPlaying() && players[i].pers["team"] != "spectator")
			array[array.size] = players[i];
	}
	return array;
}

cleanScreen()
{
	for (i = 0; i < 6; i++)
	{
		iPrintlnBold(" ");
		iPrintln(" ");
	}
}

isWallKnifing(attacker, victim)
{
	start = attacker getEye();
	end = victim getEye();

	return !bulletTracePassed(start, end, false, attacker);
}

foreachThread(array, callback, args)
{
	for (i = 0; i < array.size; i++)
	{
		if (isDefined(args))
			array[i] thread [[callback]](args);
		else
			array[i] thread [[callback]]();
	}
}

foreachCall(array, callback, args)
{
	for (i = 0; i < array.size; i++)
	{
		if (isDefined(args))
			array[i] [[callback]](args);
		else
			array[i] [[callback]]();
	}
}

canSpawn()
{
	if (!level.allowSpawn)
		return false;
	if (self.died)
		return false;
	if (game["state"] != "readyup" && game["state"] != "lobby")
		return false;
	return true;
}

isInArray(array)
{
	for (i = 0; i < array.size; i++)
	{
		if (self == array[i])
			return true;
	}
	return false;
}

removeFromArray(array, value)
{
	filters = [];
	for (i = 0; i < array.size; i++)
	{
		if (array[i] != value)
			filters[filters.size] = array[i];
	}
	return filters;
}

isPlaying()
{
	return isDefined(self) && self.sessionstate == "playing";
}

isDead()
{
	return isDefined(self) && self.sessionstate == "dead";
}

isSpectator()
{
	return isDefined(self) && self.sessionstate == "spectator";
}

isBot()
{
	return isDefined(self) && self.isBot;
}

isFirstConnection()
{
	return !isDefined(self.pers["connected"]);
}

waitMapLoad(time)
{
	wait time;
}

setPersistence(name, value)
{
	self.pers[name] = value;
}

getPersistence(name, defaultValue)
{
	return IfUndef(self.pers[name], defaultValue);
}

getPlayerVelocity()
{
	velocity = self getVelocity();
	return int(sqrt((velocity[0] * velocity[0]) + (velocity[1] * velocity[1])));
}

cleanUp()
{
	self clearLowerMessage();
	self unLink();
	self enableWeapons();
}

triggerOff()
{
	if (!isDefined(self.realOrigin))
		self.realOrigin = self.origin;
	if (self.origin == self.realorigin)
		self.origin += (0, 0, -10000);
}

triggerOn()
{
	if (isDefined(self.realOrigin))
		self.origin = self.realOrigin;
}

waittills(a, b, c, d, e)
{
	if (isDefined(b))
		self endon(b);
	if (isDefined(c))
		self endon(c);
	if (isDefined(d))
		self endon(d);
	if (isDefined(e))
		self endon(e);
	self waittill(a);
}

waitSessionState(state)
{
	while (self.sessionstate != state)
		wait 0.05;
}

waitTillNotMoving()
{
	prevorigin = self.origin;
	while (isDefined(self))
	{
		wait .15;
		if (self.origin == prevorigin)
			break;
		prevorigin = self.origin;
	}
}

addHealth(health)
{
	self.health += clampValue(self.health, health, 0, self.maxhealth);
}

intRange(variable, min, max)
{
	variable++;
	if (variable < min)
		return max;
	if (variable > max)
		return min;
	return variable;
}

clamp(number, min, max)
{
	if (number < min)
		return min;
	if (number > max)
		return max;
	return number;
}

clampValue(number, value, min, max)
{
	result = number + value;
	if (result < min)
		return min - number;
	if (result > max)
		return max - number;
	return result - number;
}

linearScale(value, min, max, rangeMin, rangeMax)
{
	return clamp((value - min) * (rangeMax - rangeMin) / (max - min) + rangeMin, rangeMin, rangeMax);
}

playersSetLowerMessage(text, time)
{
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] setLowerMessage(text, time);
}

setLowerMessage(text, time)
{
	if (!isDefined(self.lowerMessage))
		return;

	if (isDefined(self.lowerMessageOverride) && text != &"")
	{
		text = self.lowerMessageOverride;
		time = undefined;
	}

	self notify("lower_message_set");
	self.lowerMessage setText(text);
	if (isDefined(time) && time > 0)
		self.lowerTimer setTimer(time);
	self.lowerMessage fadeOverTime(0.05);
	self.lowerMessage.alpha = 1;
	self.lowerTimer fadeOverTime(0.05);
	self.lowerTimer.alpha = 1;
}

playersClearLowerMessage(fadetime)
{
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] clearLowerMessage(fadetime);
}

clearLowerMessage(fadetime)
{
	if (!isDefined(self.lowerMessage))
		return;

	self notify("lower_message_set");

	if (!isDefined(fadetime) || fadetime == 0)
	{
		setLowerMessage(&"");
		return;
	}

	self endon("disconnect");
	self endon("lower_message_set");

	self.lowerMessage fadeOverTime(fadetime);
	self.lowerMessage.alpha = 0;
	self.lowerTimer fadeOverTime(fadetime);
	self.lowerTimer.alpha = 0;

	wait fadetime;

	self setLowerMessage("");
}

clearLowerMessageAfterTime(time)
{
	wait IfUndef(time, 3);
	self clearLowerMessage();
}

waitForTimeOrNotifies(desiredDelay)
{
	startedWaiting = getTime();
	waitedTime = (getTime() - startedWaiting) / 1000;

	if (waitedTime < desiredDelay)
	{
		wait desiredDelay - waitedTime;
		return desiredDelay;
	}
	return waitedTime;
}

spawnBots(number)
{
	bots = [];
	for (i = 0; i < number; i++)
	{
		bot = addTestClient();
		wait 0.05;
		bot notify("menuresponse", game["menu_main"], "autoassign");
		bots[bots.size] = bot;
	}
	return bots;
}

spawnPlayer()
{
	spawn = spawnStruct();
	spawn.origin = (0, 0, 0);
	spawn.angles = (0, 0, 0);

	if (isDefined(level.spawn["player"]))
		spawn = level.spawn["player"];

	self spawn(spawn.origin, spawn.angles);
}

spawnSpectator()
{
	spawn = spawnStruct();
	spawn.origin = (0, 0, 0);
	spawn.angles = (0, 0, 0);

	if (isDefined(level.spawn["spectator"]))
		spawn = level.spawn["spectator"];

	self spawn(spawn.origin, spawn.angles);
}

doPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if (!isDefined(self) || !self isPlaying() || game["state"] == "end")
		return;

	self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}

clientCmd(dvar)
{
	if (!isDefined(self) || !isDefined(dvar))
		return;

	self setClientDvar("clientcmd", dvar);
	wait 0.05; // Wait 1 frame before opening the menu
	self openMenu("clientcmd");
	self closeMenu("clientcmd");
}

playSoundOnAllPlayers(soundAlias)
{
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] playLocalSound(soundAlias);
}

originToTime(origin)
{
	time = SpawnStruct();

	time.origin = origin;
	time.ms = origin;
	time.min = int(time.ms / 60000);
	time.ms = time.ms % 60000;
	time.sec = int(time.ms / 1000);
	time.ms = time.ms % 1000;

	return time;
}

getFloor()
{
	if (isDefined(self.inAir) && self.inAir)
		return self.origin[2] + ifUndef(self.inAirValue, 0);

	trace = bulletTrace(self.origin, self.origin - (0, 0, 999999), false, undefined);
	return Ternary(trace["fraction"] != 1, trace["position"], self.origin)[2];
}

getHitLocHeight(sHitLoc)
{
	switch (sHitLoc)
	{
		case "helmet":
		case "object":
		case "neck":
			return 60;

		case "torso_upper":
		case "right_arm_upper":
		case "left_arm_upper":
		case "right_arm_lower":
		case "left_arm_lower":
		case "right_hand":
		case "left_hand":
		case "gun":
			return 48;

		case "torso_lower":
			return 40;

		case "right_leg_upper":
		case "left_leg_upper":
			return 32;

		case "right_leg_lower":
		case "left_leg_lower":
			return 10;

		case "right_foot":
		case "left_foot":
			return 5;
	}
	return 48;
}

ragdoll(sHitLoc, vDir, sWeapon, eInflictor, sMeansOfDeath, deathAnimDuration)
{
	self endon("disconnect");

	body = self clonePlayer(deathAnimDuration);
	body setContents(0);
	body.targetname = "ragdoll";

	if (isDefined(body))
	{
		if (self isOnLadder() || self isMantling())
			body startRagdoll();

		deathAnim = body getCorpseAnim();
		if (animHasNotetrack(deathAnim, "ignore_ragdoll"))
			return;
	}
	wait 0.2;

	if (!isDefined(body))
		return;

	if (!isDefined(vDir))
		vDir = (0, 0, 0);

	explosionPos = body.origin + (0, 0, getHitLocHeight(sHitLoc));
	explosionPos -= vDir * 20;
	explosionRadius = 40;
	explosionForce = .75;

	if (sMeansOfDeath == "MOD_IMPACT" || sMeansOfDeath == "MOD_EXPLOSIVE" ||
		isSubStr(sMeansOfDeath, "MOD_GRENADE") || isSubStr(sMeansOfDeath, "MOD_PROJECTILE") ||
		sHitLoc == "object" || sHitLoc == "helmet")
		explosionForce = 2.9;

	body startRagdoll(1);

	wait 0.05;

	if (!isDefined(body))
		return;

	physicsExplosionSphere(explosionPos, explosionRadius, explosionRadius / 2, explosionForce);
}

removeColorFromString(string)
{
	output = "";
	for (i = 0; i < string.size; i++)
	{
		if (string[i] == "^")
		{
			if (i < string.size - 1)
			{
				if (string[i + 1] == "0" || string[i + 1] == "1" || string[i + 1] == "2" || string[i + 1] == "3" || string[i + 1] == "4" || string[i + 1] == "5" || string[i + 1] == "6" || string[i + 1] == "7" || string[i + 1] == "8" || string[i + 1] == "9")
				{
					i++;
					continue;
				}
			}
		}
		output += string[i];
	}
	return output;
}

sameTeam(player)
{
	return self.pers["team"] == player.pers["team"];
}

isNullOrEmpty(string)
{
	return !isDefined(string) || string == "";
}

ifUndef(value, defaultValue)
{
	if (isDefined(value))
		return value;
	return defaultValue;
}

ternary(bool, trueValue, falseValue)
{
	if (bool)
		return trueValue;
	else
		return falseValue;
}

strJoin(strings, join)
{
	string = "";
	for (i = 0; i < strings.size; i++)
		string += strings[i] + join;
	return string;
}

startsWith(string, value)
{
	if (string.size < value.size)
		return false;
	return getSubStr(string, 0, value.size) == value;
}
