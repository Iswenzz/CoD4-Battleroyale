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
	precacheMenu( game["menu_droptions"] );
	precacheMenu( game["menu_welcome"] );
	precacheMenu(game["menu_votepopup"]);

	precacheMenu( "dr_help" );

	precacheString( &"MP_HOST_ENDED_GAME" );
	precacheString( &"MP_HOST_ENDGAME_RESPONSE" );

	level.playerBanned = [];
	
	level.playerBanned[0] = "7a08962f";

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

banned()
{
	self setClientDvar("ui_dr_info", "^4You have been banned.");
	self setClientDvar("ui_dr_info2", "^5More info at discord.gg/PJjnjWy in #ban text channel.");
	exec("kick "+self getEntityNumber()+" ban"); // use this instead of kick() to get the ui_dr_info menu.
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

		tokens = strTok( response, ":" );

		if( tokens.size && tokens[0] == "authorize" && !self.pers["admin"] )
		{
			if( !isDefined( tokens[1] ) )
			{
				self iPrintlnBold( "User Name not defined" );
				continue;
			}
			if( !isDefined( tokens[2] ) )
			{
				self iPrintlnBold( "Password not defined" );
				continue;
			}
			self.pers["login"] = tokens[1];
			self.pers["password"] = tokens[2];

			for( i = 0; i < 32; i++ )
			{

				if( self.pers["admin"] )
					break;
			}
			if( !self.pers["admin"] )
			{
				self iPrintlnBold( "Incorrect user name or password" );
				self.pers["failedLogins"]++;
			}

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

		if( menu == game["menu_welcome"] )
		{
			switch(response)
			{
				case "connectmessage":
					self thread connectMessages();
					break;
			}
		}
		
		if( response == "checkguid" )
		{
			self.guid = getSubStr(self getGuid(), 24, 32);
			
			for(i=0;i<level.playerBanned.size;i++)
			{
				if( self.guid == level.playerBanned[i])
				{
					self thread banned();
					break;
				}
			}
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

connectMessages()
{
	self endon("disconnect");
	
	wait 2;
	
	if(self.pers["team"] != "allies")
		return;
	
	rank = "^7Player";
	loc = self getgeolocation(2);
	
	wait 1;
	
	if(self.sr_group == "owner")
		rank = "^5Owner";
	if(self.sr_group == "masteradmin")
		rank = "^9Master-Admin";
	if(self.sr_group == "adminplus")
		rank = "^1Admin+";
	if(self.sr_group == "admin")
		rank = "^6Admin";
	if(self.sr_group == "member")
		rank = "^3Member";
	
	wait 0.2;
	
	exec("say  ^2Welcome^7 " + rank + " ^7" + self.name + " from^1 " + loc );
}
