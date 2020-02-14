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
	BraXi's Death Run Mod
	
	Website: www.braxi.org
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

/*********** MAPVOTING ***********

	Name: DMS
	Author: Bipo
	Design: Mr-X
	Desc: Dynamic Mapvoting Script
	Date: Feb. 2011
	
All rights reserved � iNext Gaming
**********************************/

#include battleroyale\_common;

init() 
{
	level.mapvote = 0;

	//BraX
	precacheString( &"MAPVOTE_PRESSFIRE" );
	precacheString( &"MAPVOTE_WAIT4VOTES" );
	//<--
}

startMapvote() 
{
	if(!getDvarInt("br_votemap"))
		return;

	level notify("pre_mapvote");
	mapList = retrieveMaps(1); //these are all maps available for mapvoting
	level.maps = getRandomSelection(mapList, 5, getdvar("mapname")); //size can be 0!
	level.maps[level.maps.size] = addMapItem(getdvar("mapname"), "Replay this map");
	level.mapvote = 1;
	level notify("mapvote");
	level.mapitems = 3;
	beginVoting( 15 ); //BraX
	level notify("post_mapvote");
	wait 1;
	delVisuals();
}

changeMap( map ) 
{ 	
	//setDvar("sv_maprotationcurrent", "gametype "+map.gametype+ " map "+map.mapname);
	setDvar( "sv_maprotationcurrent", "gametype battleroyale map " + map.mapname ); //BraX

	if (getDvar("mapname") == map.mapname || map.mapname == "Replay this map")
		map_restart(false);
	else
		exitLevel(false);
}

retrieveMaps(useMaprotation) { //returns an array with spawnstructs containg map_name, visual name and gametype
	if (useMaprotation) {
		return getMaprotation();
	}
	return [];

}

getRandomSelection(mapList, no, illegal) { //returns random selection of # elements of the maplist
	if (no>=mapList.size) {
		return mapList;
	}
	
	randomValues = []; //we create an array with legal indices
	for (i=0; i < mapList.size; i++)
	{
		if (isdefined(illegal)) {
			if (isLegal(mapList[i].mapname, illegal))
			randomValues[randomValues.size] = i;
		} else {
			randomValues[randomValues.size] = i;
		}
	}
	
	size = randomValues.size; //number of legal indices
	maps = []; //maps in selection
	
	if (size <= no) { //number of entries is less than mapvote elements so we return full array
		for (i=0; i<randomValues.size; i++)
		maps += mapList[randomValues[i]];
		return maps;
	}
	
	for (i=0; i<no; i++) //we select the maps here
	{
		rI = randomint(size);
		maps[i] = mapList[randomValues[rI]];
		for (ii = rI; ii < size - 1; ii++) //we remove index from legal indices
		{
			randomValues[ii] = randomValues[ii + 1];
		}
		size = size - 1;
	}
	
	return maps;
}

isLegal(name, illegal) { //check if map is specified in illegal list or string
	if (!isString(illegal)) {
		for (i=0; i<illegal.size; i++) {
			if (illegal[i].mapname == name)
			return false;
		}
	}
	else if (name == illegal)
	return false;
	
	return true;
}

/* Retrieve maps from sv_maprotation */
getMaprotation()
{	
	maprotation = [];
	index = 0;
	dissect_sv_rotation = strtok(getdvar("sv_maprotation"), " ");
	
	gametype = 0;
	map = 0;
	nextgametype = "";
	for (i=0; i<dissect_sv_rotation.size; i++)
	{
		if (!map)
		{
			if (dissect_sv_rotation[i] == "gametype")
			{
				gametype = 1;
				continue;
			}
			if (gametype)
			{
				gametype = 0;
				nextgametype = dissect_sv_rotation[i];
				continue;
			}
			if (dissect_sv_rotation[i] == "map")
			{
				map = 1;
				continue;
			}
		}
		else
		{
			maprotation[index] = addMapItem(dissect_sv_rotation[i], nextgametype);
			index += 1;
			map = 0;
		}
	}
	return maprotation;
}

/* creates the map spawnstruct */
addMapItem(mapname, gametype) {
	map = spawnstruct();
	if (mapname=="")
	return;
	if (!isdefined(gametype))
	gametype = getdvar("g_gametype");
	if (gametype=="")
	gametype = getdvar("g_gametype");
	
	map.mapname = mapname;
	map.visname = mapname;
	
	map.gametype = gametype;
	map.votes = 0;
	return map;
}

getMapNameString( mapName ) 
{
	tokens = strTok( toLower( mapName ), "_" );

	if( tokens.size < 2  || !tokens.size )
		return mapName;
	
	return tokens[2];
}

/* begins actual mapvoting procedure */
beginVoting(time) {
	level.alphaintensity = .5;
	level.voteswitchtime = .5;
	level.voteavg = int((level.mapitems+1)/2);
	level.votesup = level.mapitems - level.voteavg;
	
	createVisuals();
	level.votingplayers = getAllPlayers();
	//level.maps[0].votes = level.votingplayers.size;
	for (i=0; i<level.votingplayers.size; i++) {
		level.votingplayers[i] thread playerVote();
	}
	
//	level thread neon(int(time/5)-1); //BraX
	level thread updateWinningMap();
	
	wait time;
}

playerVote() {
	level endon("post_mapvote");
	self endon("disconnect");

	self.voteindex = -1;
	
	if ( issubstr(self.name, "bot") )
		return;
	
	self.changingVote = false;
	
	self playerVisuals();
	self thread playerUpdateVotes();
	self playerStartVoting();
	
	//BraX
	self closeMenu();
	self closeInGameMenu();
	//<--

	abp = false;
	ads = self adsbuttonpressed();
	while(1) {
		if (ads != self adsbuttonpressed()) {
			ads = self adsbuttonpressed();
			self.changingVote = true;
			self decVote();
			wait level.voteswitchtime;
			self.changingVote = false;
		}
		if (!abp) {
			if (self attackbuttonpressed()) {
				abp = true;
			}
		} else {
			self.changingVote = true;
			self incVote();
			wait level.voteswitchtime;
			self.changingVote = false;
			if (!self attackbuttonpressed()) {
				abp = false;
			}
		}
		wait 0.05;
	}
}

playerUpdateVotes() {
	level endon("post_mapvote");
	self endon("disconnect");
	while (1) {
		if (!self.changingVote)
		updateVotes();
		wait 0.5;
	}
}

playerStartVoting() {
	level endon("post_mapvote");
	self endon("disconnect");

	self.startvote = newClientHudElem(self);
	self.startvote.x = getX(level.voteavg);
	self.startvote.y = -80;
	self.startvote.elemType = "font";
	self.startvote.alignX = "center";
	self.startvote.alignY = "middle";
	self.startvote.horzAlign = "center";
	self.startvote.vertAlign = "bottom";
	self.startvote.color = (1, 1, 1);
	self.startvote.alpha = 1;
	self.startvote.sort = 0;
	self.startvote.font = "default";
	self.startvote.fontScale = 3;
	self.startvote.foreground = true;
	self.startvote.label = &"MAPVOTE_PRESSFIRE";
	
	while(!self attackbuttonpressed()) {
		wait 0.05;
	}
	
	self.voteindex = 0;
	changeVotes(0,1);
	updateVotes();
	
	self.startvote FadeOverTime(1);
	self.startvote.alpha = 0;
	
	wait 1;
	
	self.startvote destroy();

}

playerVisuals() {
	self setclientdvar("ui_hud_hardcore", 1);
	
		
	// BraX
	self battleroyale\_mod::spawnSpectator( level.spawn["spectator"].origin, level.spawn["spectator"].angles );

	self allowSpectateTeam( "allies", false );
	self allowSpectateTeam( "axis", false );
	self allowSpectateTeam( "freelook", false );
	self allowSpectateTeam( "none", true );

	for (i=0; i<=level.mapitems; i++ ) {
		self.voteitem[i] = newClientHudElem(self);
		self.voteitem[i].index = i;
		voteindex = getIndex((i-level.voteavg));
		self.voteitem[i].voteindex = voteindex;
		self.voteitem[i].x = getX(i);
		self.voteitem[i].y = getY(i);
		self.voteitem[i].elemType = "font";
		self.voteitem[i].alignX = "center";
		self.voteitem[i].alignY = "middle";
		self.voteitem[i].horzAlign = "center";
		self.voteitem[i].vertAlign = "middle";
		self.voteitem[i].color = (1, 1, 1);
		self.voteitem[i].alpha = getAlpha(i);
		self.voteitem[i].sort = 0;
		self.voteitem[i].font = "default";
		self.voteitem[i].fontScale = getFontSize(i);
		self.voteitem[i].foreground = true;
		self.voteitem[i] setText(level.maps[voteindex].visname);
		self.voteitem[i].parent = self;
		
		self.voteitem[i].votes = newClientHudElem(self);
		self.voteitem[i].votes.index = i;
		self.voteitem[i].votes.x = getX(i);
		self.voteitem[i].votes.y = getY(i)*1.75;
		self.voteitem[i].votes.elemType = "font";
		self.voteitem[i].votes.alignX = "center";
		self.voteitem[i].votes.alignY = "middle";
		self.voteitem[i].votes.horzAlign = "center";
		self.voteitem[i].votes.vertAlign = "middle";
		self.voteitem[i].votes.color = (1, 1, 0);
		self.voteitem[i].votes.alpha = getAlpha(i);
		self.voteitem[i].votes.sort = 0;
		self.voteitem[i].votes.font = "default";
		self.voteitem[i].votes.fontScale = getFontSize(i);
		self.voteitem[i].votes.foreground = true;
		self.voteitem[i].votes.value = level.maps[voteindex].votes;
		self.voteitem[i].votes setValue(level.maps[voteindex].votes);
	}
}

playerDelVisuals() {
	self endon("disconnect");

	//BraX - this gave runtime errors when bots were enabled...
	for (i=0; i<=level.mapitems; i++ ) 
	{
		self.voteitem[i] FadeOverTime(1);
		self.voteitem[i].alpha = 0;
		
		self.voteitem[i].votes FadeOverTime(1);
		self.voteitem[i].votes.alpha = 0;
	}
	
	if (isdefined(self.startvote))
	self.startvote destroy();
	
	wait 1;
	for (i=0; i<=level.mapitems; i++ ) {
		self.voteitem[i].votes destroy();
		self.voteitem[i] destroy();
	}
	


}


getIndex(i) {
	if (i>=level.maps.size)
	return int(i-level.maps.size);
	if (i<0)
	return int(level.maps.size + i);
	return int(i);
}

updateVotes() {
	for (i=0; i<=level.mapitems; i++ ) {
		val = level.maps[self.voteitem[i].voteindex].votes;
		if (val != self.voteitem[i].votes.value) {
			self.voteitem[i].votes.value = val;
			self.voteitem[i].votes setValue(val);
		}
	
	}
}

incVote() {
	changeVotes(self.voteindex, -1);
	
	self.voteindex++;
	if (self.voteindex>=level.maps.size)
	self.voteindex = 0;
	
	changeVotes(self.voteindex, 1);
	
	updateVotes();
	
	for (i=0; i<=level.mapitems; i++ ) {
	self.voteitem[i] nextIndex();
	}
}

decVote() {
	changeVotes(self.voteindex, -1);
	
	self.voteindex-=1;
	if (self.voteindex<0)
	self.voteindex = level.maps.size-1;
	
	changeVotes(self.voteindex, 1);
	
	wait 0.05;
	
	updateVotes();
	
	for (i=0; i<=level.mapitems; i++ ) {
	self.voteitem[i] prevIndex();
	}
}

changeVotes(index, dif) {
	if (index==-1)
	return;
	
	level.maps[index].votes += dif;
}

nextIndex() {
	self endon("death");
	
	if (self.index==0) {
		index = level.mapitems+1;
		self.voteIndex = getIndex(self.parent.voteindex+level.votesup);
		map = level.maps[self.voteIndex];
		self setText(map.visname);
		self.votes.value = map.votes;
		self.votes setValue(map.votes);
	
		self.fontScale = getFontSize(index);
		self.votes.fontScale = self.fontScale;
		self.alpha = getAlpha(index);
		self.votes.alpha = self.alpha;
		self.x = getX(index);
		self.y = getY(index);
		self.votes.x = self.x;
		self.votes.y = self.y*1.75;
		self.index = index;
	}
	self.index-=1;

	self MoveOverTime( level.voteswitchtime );
	self.votes MoveOverTime( level.voteswitchtime );
	
	self FadeOverTime(level.voteswitchtime);
	self.votes FadeOverTime(level.voteswitchtime);
	
	self thread scaleFont(getFontSize(self.index), level.voteswitchtime);
	self.votes thread scaleFont(getFontSize(self.index), level.voteswitchtime);
	
	self.alpha = getAlpha(self.index);
	self.votes.alpha = getAlpha(self.index);
	
	self.x = getX(self.index);
	self.y = getY(self.index);
	self.votes.x = self.x;
	self.votes.y = self.y*1.75;
}

prevIndex() {
	self endon("death");
	
	if (self.index>level.mapitems) {
		index = 0;
		self.voteIndex = getIndex(self.parent.voteindex-level.voteavg+1);
		map = level.maps[self.voteIndex];
		self setText(map.visname);
		self.votes.value = map.votes;
		self.votes setValue(map.votes);
	
		self.fontScale = getFontSize(index);
		self.votes.fontScale = self.fontScale;
		self.alpha = getAlpha(index);
		self.votes.alpha = self.alpha;
		self.x = getX(index);
		self.y = getY(index);
		self.votes.x = self.x;
		self.votes.y = self.y*1.75;
		self.index = index;
	} 

	self.index+=1;

	self MoveOverTime( level.voteswitchtime );
	self.votes MoveOverTime( level.voteswitchtime );
	
	self FadeOverTime(level.voteswitchtime);
	self.votes FadeOverTime(level.voteswitchtime);
	
	self thread scaleFont(getFontSize(self.index), level.voteswitchtime);
	self.votes thread scaleFont(getFontSize(self.index), level.voteswitchtime);
	
	self.alpha = getAlpha(self.index);
	self.votes.alpha = getAlpha(self.index);
	
	self.x = getX(self.index);
	self.y = getY(self.index);
	self.votes.x = self.x;
	self.votes.y = self.y*1.75;
	

}

scaleFont(new,time) {
	self endon("death");
	
	dif = (new-self.fontScale)/(20*time);
	for (i=0; i<time*20; i++) {
	self.fontScale += dif;
	wait 0.05;
	}
}

getFontSize(i) {
	return 3.5 - abs(i-level.voteavg)*4/(level.mapitems+1);
}

getAlpha(i) {
	return 1 - abs(i-level.voteavg)*(2*level.alphaintensity)/(level.mapitems+1);
}

getX(i) {
	return (480/(level.mapitems-1))*(i-level.voteavg);
}
getY(i) {
	return 64 - abs(i-level.voteavg)*56/(level.mapitems);
}


createVisuals() {
	level.blackbg = newHudElem();
	level.blackbg.x = 0;
	level.blackbg.y = 0;
	level.blackbg.width = 920;
	level.blackbg.height = 240;
	level.blackbg.alignX = "center";
	level.blackbg.alignY = "top";
	level.blackbg.horzAlign = "center";
	level.blackbg.vertAlign = "middle";
	level.blackbg.color = (0, 0, 0);
	level.blackbg.alpha = .7;
	level.blackbg.sort = -2;
	level.blackbg.foreground = false;
	level.blackbg setShader( "white", level.blackbg.width, level.blackbg.height );
	
	level.blackbgtop = newHudElem();
	level.blackbgtop.x = 0;
	level.blackbgtop.y = 0;
	level.blackbgtop.width = 920;
	level.blackbgtop.height = 64;
	level.blackbgtop.alignX = "center";
	level.blackbgtop.alignY = "top";
	level.blackbgtop.horzAlign = "center";
	level.blackbgtop.vertAlign = "top";
	level.blackbgtop.color = (0, 0, 0);
	level.blackbgtop.alpha = .7;
	level.blackbgtop.sort = -2;
	level.blackbgtop.foreground = false;
	level.blackbgtop setShader( "white", level.blackbgtop.width, level.blackbgtop.height );
	
	
	level.blackbar = newHudElem();
	level.blackbar.x = 0;
	level.blackbar.y = 0;
	level.blackbar.width =  920;
	level.blackbar.height =  2;
	level.blackbar.alignX = "center";
	level.blackbar.alignY = "middle";
	level.blackbar.horzAlign = "center";
	level.blackbar.vertAlign = "middle";
	level.blackbar.color = (.1, .1, .1);
	level.blackbar.alpha = 1;
	level.blackbar.sort = -2;
	level.blackbar.foreground = false;
	level.blackbar setShader( "white", level.blackbar.width, level.blackbar.height );
	
	
	level.blackbartop = newHudElem();
	level.blackbartop.x = 0;
	level.blackbartop.y = 64;
	level.blackbartop.width =  920;
	level.blackbartop.height =  2;
	level.blackbartop.alignX = "center";
	level.blackbartop.alignY = "middle";
	level.blackbartop.horzAlign = "center";
	level.blackbartop.vertAlign = "top";
	level.blackbartop.color = (.1, .1, .1);
	level.blackbartop.alpha = 1;
	level.blackbartop.sort = -2;
	level.blackbartop.foreground = false;
	level.blackbartop setShader( "white", level.blackbartop.width, level.blackbartop.height );
	
	
	level.winningtxt = newHudElem();
	level.winningtxt.x = 0;
	level.winningtxt.y = 96;
	level.winningtxt.elemType = "font";
	level.winningtxt.alignX = "center";
	level.winningtxt.alignY = "middle";
	level.winningtxt.horzAlign = "center";
	level.winningtxt.vertAlign = "top";
	level.winningtxt.color = (1, 1, 1);
	level.winningtxt.alpha = 1;
	level.winningtxt.sort = 0;
	level.winningtxt.font = "objective";
	level.winningtxt.fontScale = 2.5;
	level.winningtxt.foreground = true;
	level.winningtxt.glowcolor = (1,0,0);
	level.winningtxt.glowalpha = .7;
	level.winningtxt setText("Winning Map:");
	
	
	level.winningmap = newHudElem();
	level.winningmap.x = 0;
	level.winningmap.y = 128;
	level.winningmap.elemType = "font";
	level.winningmap.alignX = "center";
	level.winningmap.alignY = "middle";
	level.winningmap.horzAlign = "center";
	level.winningmap.vertAlign = "top";
	level.winningmap.color = (1, 1, 1);
	level.winningmap.alpha = 1;
	level.winningmap.sort = 0;
	level.winningmap.font = "objective";
	level.winningmap.fontScale = 2.5;
	level.winningmap.foreground = true;
	level.winningmap.glowcolor = (1,0,0);
	level.winningmap.glowalpha = .6;
	level.winningmap.label = &"MAPVOTE_WAIT4VOTES";
	level.winningmap setText("");
}

delVisuals() {
	for (i=0; i<level.votingplayers.size; i++) {
		if (isdefined(level.votingplayers[i])) {
			level.votingplayers[i] thread playerDelVisuals();
		}
	}

	level.blackbg fadeovertime(1);
	level.blackbgtop fadeovertime(1);
	level.blackbar fadeovertime(1);
	level.blackbartop fadeovertime(1);
	level.winningtxt fadeovertime(2);
	level.winningmap fadeovertime(2);

	level.blackbg.alpha = 0;
	level.blackbgtop.alpha = 0;
	level.blackbar.alpha = 0;
	level.blackbartop.alpha = 0;
	level.winningtxt.alpha = 0;
	level.winningmap.alpha = 0;
	
	wait 2;
	
	level.blackbg destroy();
	level.blackbgtop destroy();
	level.blackbar destroy();
	level.blackbartop destroy();
	level.winningtxt destroy();
	level.winningmap destroy();

}



updateWinningMap() {
	level endon("post_mapvote");
	while (1) {
		mostvotes = level.maps[0].votes;
		lastindex = 0;
		for (i=1; i<level.maps.size; i++) {
			if (level.maps[i].votes > mostvotes) {
				mostvotes = level.maps[i].votes;
				lastindex = i;
			}
		
		}
		
		if (mostvotes != 0) {
			level.winningmap.label = &"";
			level.winningmap setText(level.maps[lastindex].visname);	
		}
		
		
		wait 0.5;
	}
}

getWinningMap() {
	mostvotes = level.maps[0].votes;
	lastindex = 0;
	for (i=1; i<level.maps.size; i++) {
		if (level.maps[i].votes > mostvotes) {
			mostvotes = level.maps[i].votes;
		lastindex = i;
		}
	}
	return level.maps[lastindex];
}

