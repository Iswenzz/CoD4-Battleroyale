#include battleroyale\sys\_events;
#include battleroyale\utils\_common;

#include maps\mp\gametypes\_hud_util;

main()
{
	level.lobbyTimer = 10;
	level.allowSpawn = true;
	level.huds["match"] = [];

	game["roundStarted"] = false;
	game["state"] = "readyup";

	event("map", ::start);
}

start()
{
	level endon("endround");
	level endon("game over");
	level notify("kill logic");
	level endon("kill logic");

	canStartGame();

	game["roundsplayed"] = IfUndef(game["roundsplayed"], 1);
	level notify("round_started", game["roundsplayed"]);
	level notify("game started");
	game["state"] = "lobby";
	game["roundStarted"] = true;

	lobbyStart();
}

canStartGame()
{
	count = 0;
	players = getAllPlayers();

	for (i = 0; i < players.size; i++)
	{
		if (players[i] isPlaying())
			count++;
	}
	if (count >= level.dvar["match_need_players"])
		return;

	waitForMorePlayers();
	thread start();
}

waitForMorePlayers()
{
	if (isDefined(level.huds["match"]["text"]))
		level.huds["match"]["text"] destroyElem();

	level.huds["match"]["text"] = createServerFontString("objective", 1.5);
	level.huds["match"]["text"] setPoint("CENTER", "CENTER", 0, -20);
	level.huds["match"]["text"].sort = 1001;
	level.huds["match"]["text"] setText(level.texts["waiting_for_players"]);
	level.huds["match"]["text"].foreground = false;
	level.huds["match"]["text"].hidewheninmenu = true;

	wait 1;
}

lobbyStart()
{
	if (isDefined(level.huds["match"]["text"]))
		level.huds["match"]["text"] destroyElem();
	if (isDefined(level.huds["match"]["timer"]))
		level.huds["match"]["timer"] destroyElem();

	level notify("br_lobby");

	while (level.lobbyTimer)
	{
		players = getPlayingPlayers();
		for (i = 0; i < players.size; i++)
			players[i] setLowerMessage(level.lobbyTimer);

		wait 1;
		level.lobbyTimer--;
	}
	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
		players[i] clearLowerMessage();

	level notify("br_started");
	game["state"] = "playing";
	level removeLobby();
}

removeLobby()
{
	lobby = getEntArray("lobby", "targetname");
	for (i = 0; i < lobby.size; i++)
		lobby[i] delete();
}
