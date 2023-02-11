/*

 /##   /## /##   /##                         /######## /##
| ### | ##|__/  | ##                        | ##_____/|__/
| ####| ## /## /######    /######   /###### | ##       /##  /######   /######
| ## ## ##| ##|_  ##_/   /##__  ## /##__  ##| #####   | ## /##__  ## /##__  ##
| ##  ####| ##  | ##    | ##  \__/| ##  \ ##| ##__/   | ##| ##  \__/| ########
| ##\  ###| ##  | ## /##| ##      | ##  | ##| ##      | ##| ##      | ##_____/
| ## \  ##| ##  |  ####/| ##      |  ######/| ##      | ##| ##      |  #######
|__/  \__/|__/   \___/  |__/       \______/ |__/      |__/|__/       \_______/

   Name : NitroFire
   Scripts by : NitroFire
   Steam : david1205red
   [If you plan to use this script in any way, please give credit where it is due.]

*/

/*

  _|_|_|            _|      _|      _|                  _|
_|        _|    _|    _|  _|        _|          _|_|    _|  _|_|_|_|
  _|_|    _|    _|      _|          _|        _|    _|  _|      _|
      _|  _|    _|    _|  _|        _|        _|    _|  _|    _|
_|_|_|      _|_|_|  _|      _|      _|_|_|_|    _|_|    _|  _|_|_|_|

Steam: http://steamcommunity.com/profiles/76561198163403316/
Discord: https://discord.gg/76aHfGF
Youtube: https://www.youtube.com/channel/UC1vxOXBzEF7W4g7TRU0C1rw
Paypal: suxlolz@outlook.fr
Email Pro: suxlolz@outlook.fr

*/

#include battleroyale\_common;
#include battleroyale\_dvar;

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	thread gameLogic();
}

gameLogic()
{
	if (getDvarInt("br_debug"))
		return;

	level endon("intermission");
	level endon("disconnect");
	level endon("kill logic");

	waittillframeend;

	if(isDefined(level.matchStartText))
		level.matchStartText destroy();

	wait 0.2;

	level.matchStartText = createServerFontString("objective", 1.5);
	level.matchStartText setPoint("CENTER", "CENTER", 0, -20);
	level.matchStartText.sort = 1001;
	level.matchStartText setText(level.text["waiting_for_players"]);
	level.matchStartText.foreground = false;
	level.matchStartText.hidewheninmenu = true;

	waitForPlayers(getDvarInt("br_required_players"));

	thread check_leave();
	level notify("game_started");
	level.matchStartText destroy();
}

watch_lobby()
{
	while(!level.gamestarted)
	{
		wait 0.2;
		level.jumper = [];
		level.jumpers = 0;
		level.deada = 0;
		level.totalPlayers = 0;
		level.totalPlayingPlayers = 0;

		players = getAllPlayers();
		if(players.size > 0)
		{
			for(i = 0; i < players.size; i++)
			{
				level.totalPlayers++;
				if(isDefined(players[i].pers["team"]))
				{
					if(players[i] isReallyAlive())
						level.totalPlayingPlayers++;

					if(players[i].pers["team"] == "allies" && players[i] isReallyAlive())
					{
						level.jumpers++;
						level.jumper[level.jumper.size] = players[i];
					}
					if(players[i].pers["team"] == "axis" && players[i] isReallyAlive())
						level.deada++;
				}
			}
		}
	}
}

waitForPlayers(requiredPlayersCount)
{
	while(true)
	{
		wait 0.5;
		if(isDefined(level.jumpers) && level.jumpers >= requiredPlayersCount)
			break;
	}
}

check_leave()
{
	while(!level.gamestarted)
	{
		wait 0.5;
		if(isDefined(level.jumpers) && level.jumpers <= 1)
			map_restart(false);
	}
}

lobby_countdown()
{
	players = getAllPlayers();
	for(i=0;i<players.size;i++)
		players[i] thread lobby_countdown_hud();
}

lobby_countdown_hud()
{
	self endon("disconnect");

	while(level.game_countdown != 0)
	{
		self setLowerMessage(int(level.game_countdown)-1);
		wait .2;
	}
}

countdown()
{
	while(level.game_countdown != 0)
	{
		level.game_countdown -= 1;
		wait 1;
	}
}
