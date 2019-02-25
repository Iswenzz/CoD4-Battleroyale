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
#include battleroyale\_mod;
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

	min = 2;

	waitForPlayers(min);

  thread check_leave();
  level notify("game_started");
  level.matchStartText destroy();
}
