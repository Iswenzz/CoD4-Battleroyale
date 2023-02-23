#include battleroyale\sys\_events;
#include battleroyale\utils\_common;

main()
{
	level.spawn = [];
	level.colliders = [];
	level.rotation = getRotation(false);
	level.randomizedMaps = [];

	thread randomizeMaps(5);

	event("map", ::placeSpawns);
}

placeSpawns()
{
	level.spawn["allies"] = getEntArray("mp_dm_spawn", "classname");
	level.spawn["axis"] = getEntArray("mp_tdm_spawn", "classname");

	if (getEntArray("mp_global_intermission", "classname").size == 0)
	{
		level.spawn["spectator"] = spawn("script_origin", (0, 0, 0));
		level.spawn["spectator"].angles = (0, 0, 0);
	}
	else
		level.spawn["spectator"] = getEntArray("mp_global_intermission", "classname")[0];

	for (i = 0; i < level.spawn["allies"].size; i++)
		level.spawn["allies"][i] placeSpawnPoint();
	for (i = 0; i < level.spawn["axis"].size; i++)
		level.spawn["axis"][i] placeSpawnPoint();

	x = 0;
	y = 0;
	z = 0;

	angles = (0, 180, 0);

	for (i = 0; i < level.spawn["allies"].size; i++)
	{
		x += level.spawn["allies"][i].origin[0];
		y += level.spawn["allies"][i].origin[1];
	}
	if (level.spawn["allies"].size)
	{
		x /= level.spawn["allies"].size;
		y /= level.spawn["allies"].size;
		z = level.spawn["allies"][0].origin[2];

		angles = level.spawn["allies"][0].angles;
	}
	if (!isDefined(level.spawn["player"]))
	{
		level.spawn["player"] = spawn("script_origin", (x, y, z));
		level.spawn["player"].angles = angles;
		level.spawn["player"] placeSpawnPoint();
	}
}

end(map)
{
	if (game["state"] == "end")
		return;

	game["state"] = "end";
	level notify("intermission");
	level notify("game over");
	level notify("game_ended");

	// Sequence
	endMusic();
	endSpectate();

	if (IsNullOrEmpty(map))
		map = voteNextMap();

	credits();
	intermission();

	// Next map
	setDvar("sv_maprotationcurrent", "gametype " + getDvar("g_gametype") + " map " + map);
	levelExit(false);
}

levelRestart(persist)
{
	game["ended"] = true;
	map_restart(persist);
}

levelExit(persist)
{
	game["ended"] = true;
	exitLevel(persist);
}

endMusic()
{
	ambientPlay("end_map");
}

endSpectate()
{
	setDvar("g_deadChat", 1);

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
	{
		players[i] closeMenu();
		players[i] closeInGameMenu();
		players[i] freezeControls(true);
		players[i] cleanUp();
		players[i] battleroyale\game\_teams::setTeam("spectator");
		players[i] eventSpectator();
	}
	wait 0.05;

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
	{
		players[i] allowSpectateTeam("allies", false);
		players[i] allowSpectateTeam("axis", false);
		players[i] allowSpectateTeam("freelook", false);
		players[i] allowSpectateTeam("none", true);
	}
}

voteNextMap()
{
	maps = level.randomizedMaps;

	if (level.dvar["map_vote"])
		return vote(maps);
	wait 18;
	return maps[randomInt(maps.size)];
}

credits()
{
	battleroyale\game\_credits::start();
}

intermission()
{
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i].sessionstate = "intermission";
	wait 10;
}

vote(maps)
{
	result = battleroyale\game\_poll::poll("Next map", maps);
	if (isDefined(result))
		return result.label;
	return maps[randomInt(maps.size)];
}

randomizeMaps(amount)
{
	maps = [];
	rotation = level.rotation;

	if (rotation.size < amount)
	{
		level.randomizedMaps = rotation;
		return;
	}
	while (maps.size < amount)
	{
		picked = rotation[randomInt(maps.size)];
		if (!picked isInArray(maps))
			maps[maps.size] = picked;
	}
	level.randomizedMaps = maps;
}

getRotation(includeCurrent)
{
	list = [];
	currentMap = level.map;
	maps = strTok(getDvar("sv_maprotation"), " ");
	maps = removeFromArray(maps, "gametype");
	maps = removeFromArray(maps, "map");

	for (i = 0; i < maps.size; i++)
	{
		if (currentMap == maps[i] && !includeCurrent)
			continue;
		list[list.size] = maps[i];
	}
	return list;
}
