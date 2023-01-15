//allow admins to cancel vote
//allow admins to force vote
init()
{
	self.mapselection = loadmaps(false);
	self.votePage = 0;
	self displayMaps();
	self thread menuresponse();
}

//returns an array of maps - does not include current map being played
//true = array includes current map being played
//false = array wont include currentmap being played
loadmaps(x)
{
	map_list = [];
	index = 0;
	currentmap = getdvar("mapname");
	tkn = strtok(getdvar("sv_maprotation"), " ");

	for(i=0; i<tkn.size; i++)
	{
		if(tkn[i] == "map" && !x)
			continue;
		else
		{
			if(tkn[i] == currentmap)
				continue;
			map_list[index] = tkn[i];
			index++;
		}
	}
	return map_list;
}

//writes map names to client dvars for display
displayMaps()
{
	if(!isDefined(self.mapselection))
		return;
	maps = self.mapselection;
	if(maps.size < 24)
	{
		for(i=0; i<maps.size; i++)
			self setClientDvar("sr_votemap_"+i, maps[i]);
		return;
	}
	page = self.votePage;
	index = 0;
	start = page*24;
	end = (page+1)*24;
	if(end>maps.size)
		end = maps.size;
	for(i=start; i<end; i++)
	{
		self setClientDvar("sr_votemap_"+index, maps[i]);
		index++;
	}
}
//clears dvars showing maps
clearMapList()
{
	for(i=0; i<24; i++)
		self setClientDvar("sr_votemap_"+i, "");
}

menuresponse()
{
	self endon("disconnect");
	self notify("votemenu_end");
	self endon("votemenu_end");
	maxpage = 1;

	sum = self.mapselection.size/24;
	//shouldnt be more then 20 pages
	for(i=0; i<20; i++)
	{
		if(sum <= i && sum > i-1)
			maxpage = i;
	}

	selectedmap = "";
	self setClientDvar("sr_selectedmap","");
	self setClientDvar("sr_votepage", (self.votePage+1)+"/"+maxpage);

	while(1)
	{
		self waittill("menuresponse", menu, response);
		if(menu != "sr_votemap")
			continue;

		tkn = strtok(response, ":");

		if(tkn[0] == "page")
		{
			switch(tkn[1])
			{
				case "next":
					if(self.votePage < maxpage-1)
					{
						self.votePage++;
						self clearMapList();
						self displayMaps();
						self setClientDvar("sr_votepage", (self.votePage+1)+"/"+maxpage);
					}
					break;
				case "prev":
					if(self.votePage > 0)
					{
						self.votePage--;
						self clearMapList();
						self displayMaps();
						self setClientDvar("sr_votepage", (self.votePage+1)+"/"+maxpage);
					}
					break;
			}
		}

		if(tkn[0] == "votemap")
		{
			num = int(tkn[1]) + (self.votePage*24);
			if(self.mapselection.size >= num)
			{
				selectedmap = self.mapselection[num];
				self setClientDvar("sr_selectedmap", selectedmap);
				self setClientDvar("sr_selectedmap_material", "loadscreen_"+selectedmap); 
			}
		}

		if(tkn[0] == "callvote")
		{
			
			if( (gettime() - self.voteCoolDown) < 300000)
			{
				self CloseMenu();
				self closeInGameMenu();
				self IPrintLnBold("You cannot vote yet");
				break;
			}
			
			if(level.voteInProgress)
			{
				self CloseMenu();
				self closeInGameMenu();
				self IPrintLnBold("A vote is already in progress");
				break;
			}
			if(tkn[1] == "map")
			{
				if(selectedmap != "")
				{
					self CloseMenu();
					self closeInGameMenu();
					thread startvote(tkn[1], selectedmap);
					self.voteCoolDown = GetTime();
					break;
				}
			}
			else
			{
				self CloseMenu();
				self closeInGameMenu();
				thread startvote(tkn[1], selectedmap);
				self.voteCoolDown = GetTime();
				break;
			}
		}
	}
}

startvote(vote, type, what)
{
	level.voteInProgress = true;
	level.voteTimer = 20;
	level.votesYes = 0;
	level.votesNo = 0;

	players = GetEntArray("player", "classname");
	for(i=0; i<players.size; i++)
	{
		players[i] thread watchVotes();
		players[i] thread vote_hud(vote);
	}

	while(level.voteTimer>0)
	{
		level.voteTimer--;
		wait 1;
	}

	level notify("vote_ended");
	//destroy hud

	for(i=0; i<players.size; i++)
	{
		players[i] vote_hud_close();
	}

	IPrintLn("votes yes  "+level.votesYes);
	IPrintLn("votes no  "+level.votesNo);
	if(level.votesYes > level.votesNo)
	{
		IPrintLnBold("^2Vote Passed" );
		wait 2;
		level.voteInProgress = false;
		switch(type)
		{
			case "kick":
				kick(what getEntityNumber());
				break;
		}
	}
	else
		IPrintLnBold("^1Vote Failed");

	level.voteInProgress = false;
}

//use cj vote binds as most people already have these
watchVotes()
{
	self endon("disconnect");
	level endon("vote_ended");
	self.sr_vote = undefined;
	while(1)
	{
		self waittill("menuresponse", menu, response);
		if(response == "cjvoteyes")
		{
			level.votesYes++;
			//IPrintLn(self.name + " votes yes");
			break;
		}
		if(response == "cjvoteno")
		{
			level.votesNo++;
			//IPrintLn(self.name + " votes no");
			break;
		}
	}
}

vote_hud(s)
{
	self.votehud = [];
    /* Black shader Box #1 */
    self.voteHud[0] = addHud( self, -10, 0, 0.7, "left", "bottom", 1.8 );
    self.voteHud[0] setShader( "black", 180, 20 );
    /* Black shader Box #2 */
    self.voteHud[1] = addHud( self, -10, -20, 0.7, "left", "bottom", 1.8 );
    self.voteHud[1] setShader( "black", 180, 20 );
    /* Black shader Box #3 */
    self.voteHud[2] = addHud( self, -10, -40, 0.9, "left", "bottom", 1.8 );
    self.voteHud[2] setShader( "black", 180, 20 );
    /* F1 Text */
    self.voteHud[3] = addHud( self, 25, -20, 1, "left", "bottom", 1.4 );
    self.voteHud[3] setText( "Yes:(^2[{openscriptmenu cjvote cjvoteyes}]^7)" );
    self.voteHud[3].sort = 96;
    /* F2 Text */
    self.voteHud[4] = addHud( self, 95, -20, 1, "left", "bottom", 1.4 );
    self.voteHud[4] setText( "No:(^1[{openscriptmenu cjvote cjvoteno}]^7)" );
    self.voteHud[4].sort = 96;
    /* F1 Number */
    self.voteHud[5] = addHud( self, 25, 0, 1, "left", "bottom", 1.4 );
    self.voteHud[5] setText( "      " ); //change the variable
    self.voteHud[5].sort = 96;
    /* F2 Number */
    self.voteHud[6] = addHud( self, 95, 0, 1, "left", "bottom", 1.4 );
    self.voteHud[6] setText( "      " ); //change the variable
    self.voteHud[6].sort = 96;
    /* MAP NAME Text */
    self.voteHud[7] = addHud( self, 5, -42, 1, "left", "bottom", 1.4 );
    self.voteHud[7] setText( ""+s );  //change the variable for the thing voted:extend time / votemap etc
    self.voteHud[7].sort = 96;
    //timer
    self.voteHud[8] = addHud( self, 135, -42, 1, "left", "bottom", 1.4 );
    self.voteHud[8] setText( "" ); 
    self.voteHud[8].sort = 96;
    self vote_hud_update();
}

vote_hud_update()
{
	self endon("disconnect");
	level endon("vote_ended");
	yes = 0;
	no = 0;
	while(1)
	{

		self.voteHud[5] setText( "      "+level.votesYes ); //yes	
		self.voteHud[6] setText( "      "+level.votesNo ); //no

		self.voteHud[8] setText(""+level.voteTimer);
		wait 0.1;
	}

}

vote_hud_close()
{
	if(isDefined(self.voteHud))
		for(i=0; i<self.voteHud.size; i++)
			self.voteHud[i] Destroy();

}

addHud( who, x, y, alpha, alignX, alignY, fontScale )
{
    if( isPlayer( who ) )
        hud = newClientHudElem( who );
    else
        hud = newHudElem();

    hud.x = x;
    hud.y = y;
    hud.alpha = alpha;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzAlign = alignX;
    hud.vertAlign = alignY;
    hud.fontScale = fontScale;
    return hud;
}