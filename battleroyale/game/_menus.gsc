#include battleroyale\sys\_events;
#include battleroyale\utils\_common;

main()
{
	precache();

	menu("-1", 			"back", 		::menu_Back);
	menu("main_mp", 	"allies", 		::menu_Team);
	menu("main_mp", 	"axis", 		::menu_Team);
	menu("main_mp", 	"autoassign", 	::menu_Team);
	menu("main_mp", 	"spectator", 	::menu_Spectator);

	menu_callback("quickcommands",	 	maps\mp\gametypes\_quickmessages::quickcommands);
	menu_callback("quickstatements", 	maps\mp\gametypes\_quickmessages::quickstatements);
	menu_callback("quickresponses",  	maps\mp\gametypes\_quickmessages::quickresponses);

	game["menu_main"] = "main_mp";
}

precache()
{
	precacheMenu("main/main_mp");
	precacheMenu("commands/wm_quickmessage");
	precacheMenu("commands/quickcommands");
	precacheMenu("commands/quickresponses");
	precacheMenu("commands/quickstatements");
	precacheMenu("commands/quickstuff");
	precacheMenu("controls/controls_multi");
	precacheMenu("popups/exit");
	precacheMenu("misc/clientcmd");
	precacheMenu("misc/endofgame");
	precacheMenu("misc/scoreboard");
	precacheMenu("misc/muteplayer");
}

menu_Back(arg)
{
	self closeMenu();
	self closeInGameMenu();
}

menu_Team(arg)
{
	self closeMenu();
	self closeInGameMenu();

	if (self isPlaying())
	{
		self iPrintLn("^1Suicide disabled");
		return;
	}
	self battleroyale\game\_teams::setTeam("allies");

	if (self canSpawn())
		self eventSpawn();
}

menu_Spectator(arg)
{
	self closeMenu();
	self closeInGameMenu();

	if(self isPlaying())
	{
		self iPrintln("^1Suicide disabled");
		return;
	}
	self battleroyale\game\_teams::setTeam("spectator");
	self eventSpectator();
}
