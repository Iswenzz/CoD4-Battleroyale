///////////////////////////////////////////////////////////////
////|         |///|        |///|       |/\  \/////  ///|  |////
////|  |////  |///|  |//|  |///|  |/|  |//\  \///  ////|__|////
////|  |////  |///|  |//|  |///|  |/|  |///\  \/  /////////////
////|          |//|  |//|  |///|       |////\    //////|  |////
////|  |////|  |//|         |//|  |/|  |/////    \/////|  |////
////|  |////|  |//|  |///|  |//|  |/|  |////  /\  \////|  |////
////|  |////|  |//|  | //|  |//|  |/|  |///  ///\  \///|  |////
////|__________|//|__|///|__|//|__|/|__|//__/////\__\//|__|////
///////////////////////////////////////////////////////////////
/*
	battleroyale's Death Run Mod
	
	Website: www.battleroyale.org
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

#include battleroyale\_common;

init()
{
	game["menu_team"] = "team_select";
	game["menu_callvote"] = "callvote";
	game["menu_muteplayer"] = "muteplayer";
	game["menu_characters"] = "character_stuff";
	game["menu_quickstuff"] = "quickstuff";
	game["menu_droptions"] = "dr_options";
	game["menu_welcome"] = "sr_welcome";
	game["menu_votepopup"] = "sr_votepopup";

	precacheMenu(game["menu_callvote"]);
	precacheMenu(game["menu_muteplayer"]);
	precacheMenu("scoreboard");
	precacheMenu(game["menu_team"]);
	precacheMenu(game["menu_characters"]);
	precacheMenu(game["menu_quickstuff"]);
	precacheMenu(game["menu_droptions"]);
	precacheMenu(game["menu_welcome"]);
	precacheMenu(game["menu_votepopup"]);

	precacheMenu( "dr_help" );

	precacheString( &"MP_HOST_ENDED_GAME" );
	precacheString( &"MP_HOST_ENDGAME_RESPONSE" );

	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
		
		player setClientDvar("ui_3dwaypointtext", "1");
		player.enable3DWaypoints = true;
		player setClientDvar("ui_deathicontext", "1");
		player.enableDeathIcons = true;
		player.classType = undefined;
		player.selectedClass = false;
		
		player thread onMenuResponse();
	}
}

onMenuResponse()
{
	self endon("disconnect");
	
	if( !isDefined( self.pers["failedLogins"] ) )
		self.pers["failedLogins"] = 0;

	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if( response == "dog" )
		{
			if( !self.pers["isDog"] )
				self.pers["isDog"] = true;
			else
				self.pers["isDog"] = false;
		}

		if( response == "adminmenu" && self.pers["admin"] )
		{
			self closeMenu();
			self closeInGameMenu();
			self openMenu( "dr_admin" );
		}

		if( response == "2doff" )
		{
			self setClientDvar( "cg_draw2d", 0 );
		}

		if( response == "2don" )
		{
			self setClientDvar( "cg_draw2d", 1 );
		}

		if ( response == "back" )
		{
			self closeMenu();
			self closeInGameMenu();
			continue;
		}

		else if(response=="prestigemode")
        {    
				self closeMenu();
				self closeInGameMenu();
                self thread battleroyale\_rank::prestigeSystem();
        }
		
		else if( menu == game["menu_quickstuff"] )
		{
			switch(response)
			{
				case "laser":
				    if( self getStat( 977 ) == 0 )
					{
						self iPrintln( "Laser ^2Enabled" );
						self setClientDvar( "cg_laserForceOn", 1 );
						self setStat( 977, 1 );
					}

					else
					{
						self iPrintln( "Laser ^1Disabled" );
						self setClientDvar( "cg_laserForceOn", 0 );
						self setStat( 977, 0 );
					}	
					break;			
			}
		}

		else if( menu == game["menu_team"] )
		{
			switch(response)
			{
				case "allies":
				case "axis":
				case "autoassign":
					self closeMenu();
					self closeInGameMenu();

					if(!level.gamestarted)
						self battleroyale\_teams::setTeam( "allies" );
					if(level.gamestarted && !isalive(self))
						self battleroyale\_teams::setTeam( "axis" );

					if(self.sessionstate == "playing" || game["state"] == "round ended"  )
						continue;

					if( self canSpawn() && !level.gamestarted )
						self battleroyale\_mod::spawnPlayer();
					break;

				case "spectator":
					self closeMenu();
					self closeInGameMenu();
					break;
			}
		}

		else if ( !level.console )
		{
			if(menu == game["menu_quickcommands"])
				maps\mp\gametypes\_quickmessages::quickcommands(response);
			else if(menu == game["menu_quickstatements"])
				maps\mp\gametypes\_quickmessages::quickstatements(response);
			else if(menu == game["menu_quickresponses"])
				maps\mp\gametypes\_quickmessages::quickresponses(response);
		}
	}
}
