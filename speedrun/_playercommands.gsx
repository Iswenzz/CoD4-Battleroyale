#include battleroyale\_common;
#include speedrun\_gsxcommon;

init()
{
	//player
	addscriptcommand( "help", 1 );
	addscriptcommand( "fov", 1 );
	addscriptcommand( "fps", 1 );
	addscriptcommand( "myid", 1 );
	addscriptcommand( "!pm", 1 );
	addscriptcommand( "discord", 1 );
	addscriptcommand( "requirement", 1 );
	addscriptcommand( "votekick", 1 );

	//member
	addscriptcommand( "msg", 1 );
	addscriptcommand( "online", 1 );
	
	//admin
	addscriptcommand( "detail", 1 );
	addscriptcommand( "pid", 1 );
	addscriptcommand( "kill", 1 );
	addscriptcommand( "srkick", 1 );
	addscriptcommand( "renamepid", 1 );
	
	//masteradmin
	addscriptcommand( "resetpid", 1 );
	addscriptcommand( "banpid", 1 );

	//owner
	addscriptcommand( "setrank", 1 );
	addscriptcommand( "cmd", 1 );

}

setGroup()
{
	path = "./server_data/admins.txt";
	r = readAll(path);
	for(i=0; i<r.size; i++)
	{
		a = StrTok(r[i],"\\");
		if(isDefined(a[0]))
		{
			if(self.playerID == a[0])
			{
				if(isDefined(a[1]))
					self.sr_group = a[1];
			}
		}
	}
	if(!isDefined(self.sr_group))
		self.sr_group = "player";
	// self IPrintLn(self.sr_group);
}

commands(a, arg)
{
	players = getEntArray( "player", "classname" );
	switch(a)
	{	
		case "help":
			wait 0.05;
			all_cmds = "votekick;fps;fov;discord;!pm;myid;requirement";
			tkn = strTok(all_cmds, ";");
			help_str = "commands: ";
			for (i = 0; i < tkn.size; i++)
				help_str += tkn[i] + ", ";
			
			exec("tell " + self getEntityNumber() + " " + help_str);
			break;

		case "fps":
			wait 0.05;
			if(self.pers["fullbright"] == 0)
			{
				self.pers["fullbright"] = 1;
				self setClientDvar( "r_fullbright", 1 );
				self IPrintLnBold("^2Fullbright On");
				self thread speedrun\_playeroptions::func();
			}
			else
			{
				self.pers["fullbright"] = 0;
				self setClientDvar( "r_fullbright", 0 );
				self IPrintLnBold("^1Fullbright Off");
				self thread speedrun\_playeroptions::func();
			}
			break;

		case "votekick":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			self recordCommands(a, arg);
			id = getPlayerByName(arg);
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			thread speedrun\_mapvote::startvote("^5Kick ^7" + players[id[0]].name, "kick", players[id[0]]);
			break;
			
		case "!pm":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			self recordCommands(a, arg);
			tkn = StrTok(arg," ");
			if(tkn.size < 2)
				break;
			id = getPlayerByName(tkn[0]);
			if(!isDefined(tkn[1]) || tkn[1] == "")
				break;
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			string = "";
			for(i=1;i<tkn.size;i++)
				string += tkn[i]+" ";
			if( isDefined( players[id[0]] ) )
			{
				exec("tell " + players[id[0]] getEntityNumber() + " ^5" + self.name + " PM You:^7 " + string);
				exec("tell " + self getEntityNumber() + " ^5You PM to " + players[id[0]].name + ":^7 " + string);
			}
			break;
			
		case "fov":
			wait 0.05;
			if(!isDefined(arg) || arg == "" || !isStringFloat(arg))
				break;
			self.fovscale = FloatFov(arg);
			if(self.fovscale > 2000)
				break;
			if(self.fovscale < 200)
				break;
			self setClientDvar("cg_fovscale", arg);
			self IPrintLnBold("^5FOV scale ^7"+arg);
			self.pers["fovscale"] = self.fovscale;
			self thread speedrun\_playeroptions::func();
			break;
			
		case "discord":
			wait 0.05;
			if(!self testGroup("member:admin:adminplus:masteradmin:owner"))
			{
				exec( "tell " + self getEntityNumber() + "Join Sr- Discord: ^5discord.gg/76aHfGF" );
			}
			else
				exec( "say Join Sr- Discord: ^5discord.gg/76aHfGF" );
			wait 0.2;
			break;
			
		case "requirement":
			wait 0.05;
			if(!self testGroup("member:admin:adminplus:masteradmin:owner"))
			{
				exec( "tell " + self getEntityNumber() + "Check #sr-requirement channel in our discord: ^5discord.gg/76aHfGF" );
			}
			else
				exec( "say Check #sr-requirement channel in our discord: ^5discord.gg/76aHfGF" );
			wait 0.2;
			break;
			
		case "myid":
			wait 0.05;
			self IPrintLnBold("Your ID is ^2" + self.playerID );
			wait 0.5;
			self IPrintLnBold("Please make a note of your ID");
		break;
		
		case "reportplayer":
			wait 0.05;
			if(!self testGroup("member:admin:adminplus:masteradmin:owner"))
				break;
			if(!isDefined(arg) || arg == "")
			{
				self iprintlnbold("!reportplayer <playerName> <reason>");
				break;
			}
			tkn = StrTok(arg," ");
			if(tkn.size < 2)
			{
				self iprintlnbold("!reportplayer <playerName> <reason>");
				break;
			}
			id = getPlayerByName(tkn[0]);
			if(!isDefined(tkn[1]) || tkn[1] == "")
			{
				self iprintlnbold("!reportplayer <playerName> <reason>");
				break;
			}
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			string = "";
			for(i=1;i<tkn.size;i++)
				string += tkn[i]+" ";
			if( isDefined( players[id[0]] ) )
			{
				self recordReportPlayer( string, players[id[0]] );
			}
			break;
			
		case "reportmap":
			wait 0.05;
			if(!self testGroup("member:admin:adminplus:masteradmin:owner"))
				break;
			if(!isDefined(arg) || arg == "")
			{
				self iprintlnbold("!reportplayer <reason>");
				break;
			}
			tkn = StrTok(arg," ");
			if(tkn.size < 1)
			{
				self iprintlnbold("!reportplayer <reason>"); 
				break;
			}
			string = "";
			for(i=0;i<tkn.size;i++)
				string += tkn[i]+" ";
			self recordReportMap( string );
			break;
			
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		case "msg":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			if(isDefined(self.isVIP) && self.isVIP)
			{
				self recordCommands(a, arg);
				IPrintLnBold(arg);
			}
			else
			{
				if(!self testGroup("member:admin:adminplus:masteradmin:owner"))
					break;
				self recordCommands(a, arg);
				IPrintLnBold(arg);
			}
			break;

	case "online":
		wait 0.05;

		if(!self testGroup("member:admin:adminplus:masteradmin:owner")) 
			break;

		string = [];
		for(i=0;i<4;i++) 
			string[i] = "";

		count = 1;
		rank = "";

		for(i=0;i<players.size;i++)
		{
			if(isDefined(players[i].sr_group) && players[i].sr_group != "player")
			{
				if(players[i].sr_group == "owner") 
					rank = "^5Owner^7";
				if(players[i].sr_group == "masteradmin") 
					rank = "^9Master-Admin^7";
				if(players[i].sr_group == "adminplus") 
					rank = "^1Admin+^7";
				if(players[i].sr_group == "admin") 
					rank = "^6Admin^7";
				if(players[i].sr_group == "member") 
					rank = "^3Member^7";
				
				if(count <= 4) 
				{
					string[0] += "^7" + players[i].name + "^7[" + rank + "^7]" + "^7, "; 
					count++;
				}
				
				else if(count <= 8 && count > 4) 
				{
					string[1] += "^7" + players[i].name + "^7[" + rank + "^7]" + "^7, "; 
					count++;
				}
				
				else if(count <= 12 && count > 8) 
				{
					string[2] += "^7" + players[i].name + "^7[" + rank + "^7]" + "^7, "; 
					count++;
				}
				
				else if(count <= 16 && count > 12) 
				{
					string[3] += "^7" + players[i].name + "^7[" + rank + "^7]" + "^7, "; 
					count++;
				}
				
				else 
					string[4] += "^7" + players[i].name + "^7[" + rank + "^7]" + "^7, "; //Don't need if check because it's last reachable code
			}
		}
		wait 0.2;

		for(k=0;k<string.size;k++)
		{
			exec("say " + string[k]);
			wait 0.5;
		}
		
		break;
			
		case "detail":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			if(!self testGroup("admin:adminplus:masteradmin:owner"))
				break;
			
			self clientcmd("set sr_admin_detail 0");
			
			if(arg == "1")
				self clientcmd("sr_admin_detail 1");
			if(arg == "0")
				self clientcmd("sr_admin_detail 0");
			
				break;
			
		case "pid":
			wait 0.05;
			if(!self testGroup("admin:adminplus:masteradmin:owner"))
				break;
			players = getEntArray( "player", "classname" );
			for(i=0; i<players.size; i++)
			{
				players[i].guid = getSubStr(players[i] getGuid(), 24, 32);
				self IPrintLn("^2Name:^7 " + players[i].name + " ^3PID:^7 " + players[i] getEntityNumber() + " ^5ID:^7 " + players[i].playerID + " ^5GUID:^7 " + players[i].guid);
			}
			break;

		case "kill":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			if(!self testGroup("admin:adminplus:masteradmin:owner"))
				break;
			self recordCommands(a, arg);
			id = getPlayerByName(arg);
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			if( isDefined( players[id[0]] ) && players[id[0]] isReallyAlive() )
			{
				players[id[0]] Suicide();
				players[id[0]] IPrintLnBold("^6You were killed by an admin");
			}
			break;
			
		case "resetpid":
			wait 0.05;
			if(!isDefined(arg) || arg == "" || !isStringInt(arg))
				break;
			 if(!self testGroup("masteradmin:owner"))
                break;
            self recordCommands(a, arg);
            players = getEntArray( "player", "classname" );
            if(int(arg) < 0 || int(arg) > players.size)
                break;
            id = getPlayerByNum(arg);
            if(id.size > 1 || id.size == 0)
            {
                self IPrintLnBold("Could not find player");
                break;
            }
            if( isDefined( players[id[0]] ) && players[id[0]] isReallyAlive() )
            {
                players[id[0]] battleroyale\_rank::sr_reset();
                
                iPrintln( "^7" + players[id[0]].name + "'s ^7rank was reseted." );
            }
            break;
			
		case "renamepid":
			wait 0.05;
			if(!isDefined(arg) || arg == "" || !isStringInt(arg))
				break;
			 if(!self testGroup("admin:adminplus:masteradmin:owner"))
                break;
            self recordCommands(a, arg);
            players = getEntArray( "player", "classname" );
            if(int(arg) < 0 || int(arg) > players.size)
                break;
            id = getPlayerByNum(arg);
            if(id.size > 1 || id.size == 0)
            {
                self IPrintLnBold("Could not find player");
                break;
            }
            if( isDefined( players[id[0]] ) && players[id[0]] isReallyAlive() )
            {
				name = RandomInt(999999);
                players[id[0]] clientcmd("name "+name);
				wait 0.1;
				players[id[0]] clientcmd("reconnect");
            }
            break;

		case "srkick":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			if(!self testGroup("admin:adminplus:masteradmin:owner"))
				break;
			self recordCommands(a, arg);
			id = getPlayerByName(arg);
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			kick(players[id[0]] getEntityNumber());
			break;

		case "banpid":
			wait 0.05;
			if(!isDefined(arg) || arg == "" || !isStringInt(arg))
				break;
			 if(!self testGroup("masteradmin:owner"))
                break;
            self recordCommands(a, arg);
            players = getEntArray( "player", "classname" );
            if(int(arg) < 0 || int(arg) > players.size)
                break;
            id = getPlayerByNum(arg);
            if(id.size > 1 || id.size == 0)
            {
                self IPrintLnBold("Could not find player");
                break;
            }
			ban(players[id[0]] getEntityNumber());
			break;

		case "setrank":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			 if(!self testGroup("masteradmin:owner"))
                break;
            self recordCommands(a, arg);
            players = getEntArray( "player", "classname" );
			tkn = StrTok(arg," ");
			if(tkn.size > 2)
				break;
			if(!isStringInt(tkn[0]))
				break;
			if(int(tkn[0]) < 0 || int(tkn[0]) > players.size)
                break;
            id = getPlayerByNum(tkn[0]);
			if(!isDefined(tkn[1]) || tkn[1] == "")
				break;
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			if( isDefined( players[id[0]] ) && players[id[0]] isReallyAlive() && int(tkn[1]) > 1 )
			{
				rankId = int(tkn[1])-1;
				xp = TableLookup( "mp/rankTable.csv", 0, rankId, 2 );
				
				players[id[0]] thread battleroyale\_rank::giveRankXP("setrank", int(xp));
			}
			break;

		case "cmd":
			wait 0.05;
			if(!isDefined(arg) || arg == "")
				break;
			if(!self testGroup("owner"))
				break;
			self recordCommands(a, arg);
			tkn = StrTok(arg,":");
			if(tkn.size > 2)
				break;
			id = getPlayerByName(tkn[0]);
			if(!isDefined(tkn[1]) || tkn[1] == "")
				break;
			if(id.size > 1 || id.size == 0)
			{
				self IPrintLnBold("Could not find player");
				break;
			}
			players[id[0]] clientCmd(tkn[1]);
			break;

		default:
			break;

	}
}

testGroup(string)
{
	a = StrTok(string,":");
	for(i=0; i<a.size; i++)
	{
		if(self.sr_group == a[i])
			return true;
	}
	return false;
}

getPlayerByNum( pNum ) 
{
	players = getEntArray( "player", "classname" );
	x = [];
	for ( i = 0; i < players.size; i++ )
	{
		if ( players[i] getEntityNumber() == int(pNum) ) 
		{
			x[x.size] = i;
		}
	}
	return x;
}

getPlayerByName( nickname ) 
{
	players = getEntArray( "player", "classname" );
	x = [];
	for ( i = 0; i < players.size; i++ )
	{
		if ( isSubStr( toLower(players[i].name), toLower(nickname) ) ) 
		{
			x[x.size] = i;
		}
	}
	return x;
}

recordReportMap(argument)
{
	self.guid = getSubStr(self getGuid(), 24, 32);
	line = "";
	if(isDefined(argument))
		line += level.mapName + " name: " + self.name + " selfguid: " + self.guid + " arg: " + argument;
	else
		return;
	
	path = "./server_data/report_map.txt";
	file_exists = checkfile(path);
	if(!file_exists)
	{
		checkQueue();
		new = FS_Fopen(path, "write");
		FS_FClose(new);
	}
	WriteToFile(path, line);
}

recordReportPlayer(argument, player)
{
	self.guid = getSubStr(self getGuid(), 24, 32);
	line = "";
	if(isDefined(argument))
		line += self.name + " selfguid: " + self.guid + " who: " + player.name + " whoguid: " + player.guid + " arg: " + argument;
	else
		return;
	
	path = "./server_data/report_player.txt";
	file_exists = checkfile(path);
	if(!file_exists)
	{
		checkQueue();
		new = FS_Fopen(path, "write");
		FS_FClose(new);
	}
	WriteToFile(path, line);
}

recordCommands(command, argument)
{
	line = "";
	if(isDefined(argument))
		line += self.guid + " " + " " + self.name + "    " + command + " " + argument;
	else
		line += self.guid + " " + " " + self.name + "    " + command;
	//line = self.name + " " + self.playerID + " " + self.sr_group + " " + string;
	
	path = "./server_data/commands.txt";
	file_exists = checkfile(path);
	if(!file_exists)
	{
		checkQueue();
		new = FS_Fopen(path, "write");
		FS_FClose(new);
	}
	WriteToFile(path, line);
}

isStringFloat( var )
{   
    compatibleArray = getSubStr("1234567890.",0);
	
    if(var.size<3) 
		return false;
	
	var = getSubStr(var,0);
	
    for(i=0;i<var.size;i++)
    {
        validChar = false; //I set this to false to begin with, if it's still false by end of loop then we know string has a character not allowed in a float
        
		for(j=0;j<compatibleArray.size;j++)
            if(var[i]!=compatibleArray[j])
				continue;
			
            else 
				validChar = true; 
			
			break;
			
        if(!validChar) 
			return false;
    }
	
    if(var[0]=="."||var[var.size-1]== ".") 
		return false;
	
    value = strTok(var, ".");
	
    if(int(value[value.size -1])>10&&int(value[value.size -1])<100)
		divide = 100;
	
    else if(getSubStr(value[value.size-1], 0).size==2)
		divide = 100;
	
    else if(getSubStr(value[value.size-1], 0).size==3)
		divide = 1000;
	
    else if(getSubStr(value[value.size-1], 0).size>=4) 
		return false;
	
    else 
		divide = 10;
	
    value = int(value[0])+(int(value[value.size-1])/divide);
    return true;
}

FloatFov( var )
{   
    compatibleArray = getSubStr("1234567890.",0);
	
    if(var.size<3) 
		return false;
	
	var = getSubStr(var,0);
	
    for(i=0;i<var.size;i++)
    {
        validChar = false; //I set this to false to begin with, if it's still false by end of loop then we know string has a character not allowed in a float
        
		for(j=0;j<compatibleArray.size;j++)
            if(var[i]!=compatibleArray[j])
				continue;
			
            else 
				validChar = true; 
			
			break;
			
        if(!validChar) 
			return false;
    }
	
    if(var[0]=="."||var[var.size-1]== ".") 
		return false;
	
    value = strTok(var, ".");
	
    if(int(value[value.size -1])>10&&int(value[value.size -1])<100)
		divide = 100;
	
    else if(getSubStr(value[value.size-1], 0).size==2)
		divide = 100;
	
    else if(getSubStr(value[value.size-1], 0).size==3)
		divide = 1000;
	
    else if(getSubStr(value[value.size-1], 0).size>=4) 
		return false;
	
    else 
		divide = 10;
	
    value = int(value[0])+(int(value[value.size-1])/divide);
	kek = value * 1000;
    return kek;
}

