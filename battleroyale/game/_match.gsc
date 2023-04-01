#include battleroyale\sys\_events;
#include battleroyale\utils\_common;
#include battleroyale\utils\_hud;

main()
{
	level.lobbyTimer = level.dvar["lobby_countdown"];
	level.allowSpawn = true;
	level.huds["match"] = [];

	game["roundsplayed"] = IfUndef(game["roundsplayed"], 0) + 1;
	game["roundStarted"] = false;
	game["state"] = "readyup";

	event("map", ::start);
}

start()
{
	level endon("endround");
	level endon("game over");
	level notify("kill logic");
	wait 0.05;
	level endon("kill logic");

	canStartGame();

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

	while (level.dvar["event"])
		wait 0.05;

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
		level.huds["match"]["text"] destroy();

	level.huds["match"]["text"] = addHud(level, 0, -20, 1, "center", "middle", 1.5, 1001);
	level.huds["match"]["text"] setText(level.texts["waiting_for_players"]);
	level.huds["match"]["text"].font = "objective";

	wait 1;
}

lobbyStart()
{
	if (isDefined(level.huds["match"]["text"]))
		level.huds["match"]["text"] destroy();

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

	setDvar("g_friendlyPlayerCanBlock", 1);
}

removeLobby()
{
	lobby = getEntArray("lobby", "targetname");
	for (i = 0; i < lobby.size; i++)
		lobby[i] delete();
}
