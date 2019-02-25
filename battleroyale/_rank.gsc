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

#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	level.scoreInfo = [];
	level.rankTable = [];

	precacheShader("white");

	precacheString( &"RANK_PLAYER_WAS_PROMOTED_N" );
	precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
	precacheString( &"RANK_PROMOTED" );
	precacheString( &"MP_PLUS" );
	precacheString( &"BRAXI_CHARACTER_NEW" );
	precacheString( &"BRAXI_SPRAY_NEW" );

	registerScoreInfo( "kill", 200 );
	registerScoreInfo( "headshot", 400 );
	registerScoreInfo( "melee", 150 );
	registerScoreInfo( "jumper_died", 100 );

	registerScoreInfo( "win", 0 );
	registerScoreInfo( "loss", 0 );
	registerScoreInfo( "tie", 0 );

	level.maxRank = int(tableLookup( "mp/rankTable.csv", 0, "maxrank", 1 ));
	level.maxPrestige = int(tableLookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ));
	
	pId = 0;
	rId = 0;
	for ( pId = 0; pId <= level.maxPrestige; pId++ )
	{
		for ( rId = 0; rId <= level.maxRank; rId++ )
			precacheShader( tableLookup( "mp/rankIconTable.csv", 0, rId, pId+1 ) );
	}

	rankId = 0;
	rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
	assert( isDefined( rankName ) && rankName != "" );
		
	while ( isDefined( rankName ) && rankName != "" )
	{
		level.rankTable[rankId][1] = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
		level.rankTable[rankId][2] = tableLookup( "mp/ranktable.csv", 0, rankId, 2 );
		level.rankTable[rankId][3] = tableLookup( "mp/ranktable.csv", 0, rankId, 3 );
		level.rankTable[rankId][7] = tableLookup( "mp/ranktable.csv", 0, rankId, 7 );

		precacheString( tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ) );

		rankId++;
		rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );		
	}

	level thread onPlayerConnect();
}

sr_reset()
{
	self resetEverything();
	updateRankStats( self, 0 );
	self updateAntiHackValues();
}

updateAntiHackValues()
{
	baseVal = level.dvar["antiHackStat"];

	// THESE MUST MATCH ORDER IN antiHack() !!!
	self setStatFromStat( 2326, baseVal );
	self setStatFromStat( 2350, baseVal+1 );
	self setStatFromStat( 2301, baseVal+2 );

	self setStatFromStat( 3200, baseVal+3 );
	self setStatFromStat( 3201, baseVal+4 );
	self setStatFromStat( 3202, baseVal+5 );
	self setStatFromStat( 3203, baseVal+6 );
	self setStatFromStat( 3204, baseVal+7 );
	self setStatFromStat( 3205, baseVal+8 );
	self setStatFromStat( 3206, baseVal+9 );
	self setStatFromStat( 3207, baseVal+10 );
}

setStatFromStat( stat2, stat1 )
{
	self setStat( stat1, self getStat( stat2 ) );
}

resetEverything()
{
	self.pers["prestige"] = 0;
	self.pers["rank"] = 0;
	self.pers["rankxp"] = 0;

	self setRank( self.pers["rank"], self.pers["prestige"] );

	self setStat( 2326, self.pers["prestige"] );
	self setStat( 2350, self.pers["rank"] );
	self setStat( 2301, self.pers["rankxp"] );

	for( stat = 3200; stat < 3208; stat++ ) // abilities
		self setStat( stat, 0 );

	for( stat = 979; stat < 983; stat++ ) // spray, character, weapon & ability
		self setStat( stat, 0 );
}


isRegisteredEvent( type )
{
	if ( isDefined( level.scoreInfo[type] ) )
		return true;
	else
		return false;
}

registerScoreInfo( type, value )
{
	level.scoreInfo[type]["value"] = value;
}

getScoreInfoValue( type )
{
	return ( level.scoreInfo[type]["value"] );
}

getScoreInfoLabel( type )
{
	return ( level.scoreInfo[type]["label"] );
}

getRankInfoMinXP( rankId )
{
	return int(level.rankTable[rankId][2]);
}

getRankInfoXPAmt( rankId )
{
	return int(level.rankTable[rankId][3]);
}

getRankInfoMaxXp( rankId )
{
	return int(level.rankTable[rankId][7]);
}

getRankInfoFull( rankId )
{
	return tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 );
}

getRankInfoFullInt( rankId )
{
	return int(tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ));
}

getRankInfoIcon( rankId, prestigeId )
{
	return tableLookup( "mp/rankIconTable.csv", 0, rankId, prestigeId+1 );
}

getRankInfoUnlockWeapon( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 8 );
}

getRankInfoUnlockPerk( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 9 );
}

getRankInfoUnlockChallenge( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 10 );
}

getRankInfoUnlockFeature( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 15 );
}

getRankInfoUnlockCamo( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 11 );
}

getRankInfoUnlockAttachment( rankId )
{
	return tableLookup( "mp/ranktable.csv", 0, rankId, 12 );
}

getRankInfoLevel( rankId )
{
	return int( tableLookup( "mp/ranktable.csv", 0, rankId, 13 ) );
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		player.pers["rankxp"] = player maps\mp\gametypes\_persistence::statGet( "rankxp" );
		rankId = player getRankForXp( player getRankXP() );
		prestige = player getPrestigeLevel();
		player.pers["rank"] = rankId;
		player.pers["participation"] = 0;
		player.pers["prestige"] = prestige;
		player.doingNotify = false;

		player.rankUpdateTotal = 0;
		
		// for keeping track of rank through stat#251 used by menu script
		// attempt to move logic out of menus as much as possible
		player.cur_rankNum = rankId;
		assertex( isdefined(player.cur_rankNum), "rank: "+ rankId + " does not have an index, check mp/ranktable.csv" );
		player setStat( 251, player.cur_rankNum );
		
		
		player setRank( rankId, int(prestige) );

		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();
		player initUnlockMessage();

	}
}


onJoinedTeam()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("joined_team");
		self thread removeRankHUD();
	}
}


onJoinedSpectators()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("joined_spectators");
		self thread removeRankHUD();
	}
}


onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned_player");

		if(!isdefined(self.hud_rankscroreupdate))
		{
			self.hud_rankscroreupdate = newClientHudElem(self);
			self.hud_rankscroreupdate.horzAlign = "center";
			self.hud_rankscroreupdate.vertAlign = "middle";
			self.hud_rankscroreupdate.alignX = "center";
			self.hud_rankscroreupdate.alignY = "middle";
	 		self.hud_rankscroreupdate.x = 0;
			self.hud_rankscroreupdate.y = -60;
			self.hud_rankscroreupdate.font = "default";
			self.hud_rankscroreupdate.fontscale = 2.0;
			self.hud_rankscroreupdate.archived = false;
			self.hud_rankscroreupdate.color = (0.5,0.5,0.5);
			self.hud_rankscroreupdate maps\mp\gametypes\_hud::fontPulseInit();
		}
	}
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
		return int( floatVal+1 );
	else
		return int( floatVal );
}

giveRankXP( type, value )
{
	self endon("disconnect");

	if ( !isDefined( value ) )
		value = getScoreInfoValue( type );

	if(getDvar("dedicated") == "listen server" )
		return;
	
	if(isDefined(value) && value > 3000)
	{
		self thread giveRankXP_setrank( type, value );
		return;
	}

	self.score += value;
	self.pers["score"] = self.score;

	score = self maps\mp\gametypes\_persistence::statGet( "score" );
	self maps\mp\gametypes\_persistence::statSet( "score", score+value );

	self incRankXP( value );
	self thread updateRankScoreHUD( value );
}

giveRankXP_setrank( type, value )
{
	self endon("disconnect");

	if(isDefined(type) && type != "setrank")
		return;

	self.score += value;
	self.pers["score"] = self.score;

	score = self maps\mp\gametypes\_persistence::statGet( "score" );
	self maps\mp\gametypes\_persistence::statSet( "score", score+value );

	self incRankXP( value );
	self thread updateRankScoreHUD( value );
}

prestigeSystem()
{
    if(!isdefined(self.pers["rank"])||!isdefined(self.pers["rankxp"])||!isdefined(self.pers["prestige"]))
        return;
    if(self.pers["prestige"]>=level.maxprestige||self.pers["rankxp"]<getrankinfomaxxp(level.maxrank))
    {
        self iprintlnbold("^1Prestige Mode^7 is unavailable!");
        return;
    }
    self.pers["rankxp"]=1;
    self.pers["rank"]=0;
    self.pers["prestige"]++;
    self setrank(0,self.pers["prestige"]);
    self maps\mp\gametypes\_persistence::statset("rankxp",1);
    
    updaterankstats(self,0);
    
    iprintln(self.name+" has entered Prestige "+self.pers["prestige"]+" of "+level.maxprestige);
    
    self setStat(979,0);
    self setStat(980,0);
    self setStat(981,0);
    self setStat(982,0);
}

updateRankScoreHUD( amount )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
		return;

	self notify( "update_score" );
	self endon( "update_score" );

	self.rankUpdateTotal += amount;

	wait ( 0.05 );

	if( isDefined( self.hud_rankscroreupdate ) )
	{			
		if ( self.rankUpdateTotal < 0 )
		{
			self.hud_rankscroreupdate.label = &"";
			self.hud_rankscroreupdate.color = (1,0,0);
		}
		else
		{
			self.hud_rankscroreupdate.label = &"MP_PLUS";
			self.hud_rankscroreupdate.color = (1,1,0.5);
		}

		self.hud_rankscroreupdate setValue(self.rankUpdateTotal);
		self.hud_rankscroreupdate.alpha = 0.85;
		self.hud_rankscroreupdate thread maps\mp\gametypes\_hud::fontPulse( self );

		wait 1;
		self.hud_rankscroreupdate fadeOverTime( 0.75 );
		self.hud_rankscroreupdate.alpha = 0;
		
		self.rankUpdateTotal = 0;
	}
}

removeRankHUD()
{
	if(isDefined(self.hud_rankscroreupdate))
		self.hud_rankscroreupdate.alpha = 0;
}

getRank()
{	
	rankXp = self.pers["rankxp"];
	rankId = self.pers["rank"];
	
	if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
		return rankId;
	else
		return self getRankForXp( rankXp );
}

getRankForXp( xpVal )
{
	rankId = 0;
	rankName = level.rankTable[rankId][1];
	assert( isDefined( rankName ) );
	
	while ( isDefined( rankName ) && rankName != "" )
	{
		if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
			return rankId;

		rankId++;
		if ( isDefined( level.rankTable[rankId] ) )
			rankName = level.rankTable[rankId][1];
		else
			rankName = undefined;
	}
	
	rankId--;
	return rankId;
}

getSPM()
{
	rankLevel = (self getRank() % 61) + 1;
	return 3 + (rankLevel * 0.5);
}

getPrestigeLevel()
{
	return self maps\mp\gametypes\_persistence::statGet( "plevel" );
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP( amount )
{	
	xp = self getRankXP();
	newXp = (xp + amount);

	if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
		newXp = getRankInfoMaxXP( level.maxRank );

	self.pers["rankxp"] = newXp;
	self maps\mp\gametypes\_persistence::statSet( "rankxp", newXp );

	rankId = self getRankForXp( self getRankXP() );
	self updateRank( rankId );
}


updateRank( rankId )
{
	if( getRankInfoMaxXP( self.pers["rank"] ) <= self getRankXP() && self.pers["rank"] < level.maxRank )
	{
		rankId = self getRankForXp( self getRankXP() );
		self setRank( rankId, self.pers["prestige"] );
		self.pers["rank"] = rankId;
		self updateRankAnnounceHUD();
	}
	updateRankStats( self, rankId );
}

updateRankStats( player, rankId )
{
	player setStat( 253, rankId );
	player setStat( 255, player.pers["prestige"] );
	player maps\mp\gametypes\_persistence::statSet( "rank", rankId );
	player maps\mp\gametypes\_persistence::statSet( "minxp", getRankInfoMinXp( rankId ) );
	player maps\mp\gametypes\_persistence::statSet( "maxxp", getRankInfoMaxXp( rankId ) );
	player maps\mp\gametypes\_persistence::statSet( "plevel", player.pers["prestige"] );
	
	player maps\mp\gametypes\_persistence::statSet( "vip", rankId );
	player maps\mp\gametypes\_persistence::statSet( "vipplus", player.pers["prestige"] );
	
	if( rankId > level.maxRank )
		player setStat( 252, level.maxRank );
	else
		player setStat( 252, rankId );
}


updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if ( !isdefined( team ) )
		return;	
	
	self notify("reset_outcome");
	self.pers["rankstring"] = self.pers["rank"];
	self.pers["rankstring"]++;
	
	notifyData = spawnStruct();
	notifyData.titleText = &"RANK_PROMOTED";
	notifyData.iconName = self getRankInfoIcon( self.pers["rank"], self.pers["prestige"] );
	notifyData.sound = "mp_level_up";
	notifyData.duration = 4.0;
	notifyData.notifyText = self.pers["rankstring"];
	thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}


processXpReward( sMeansOfDeath, attacker, victim )
{
	if( attacker.pers["team"] == victim.pers["team"] )
		return;

	kills = attacker maps\mp\gametypes\_persistence::statGet( "kills" );
	attacker maps\mp\gametypes\_persistence::statSet( "kills", kills+1 );

	if( victim.pers["team"] == "allies" )
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet( "KILLED_JUMPERS" );
		attacker maps\mp\gametypes\_persistence::statSet( "KILLED_JUMPERS", kills+1 );
	}	
	else
	{
		kills = attacker maps\mp\gametypes\_persistence::statGet( "KILLED_ACTIVATORS" );
		attacker maps\mp\gametypes\_persistence::statSet( "KILLED_ACTIVATORS", kills+1 );
	}	

	switch( sMeansOfDeath )
	{
		case "MOD_HEAD_SHOT":
			attacker.pers["headshots"]++;
			attacker giveRankXP( "headshot" );
			hs = attacker maps\mp\gametypes\_persistence::statGet( "headshots" );
			attacker maps\mp\gametypes\_persistence::statSet( "headshots", hs+1 );
			break;
		case "MOD_MELEE":
			attacker.pers["knifes"]++;
			attacker giveRankXP( "melee" );
			knife = attacker maps\mp\gametypes\_persistence::statGet( "MELEE_KILLS" );
			attacker maps\mp\gametypes\_persistence::statSet( "MELEE_KILLS", knife+1 );
			break;
		default:
			pistol = attacker maps\mp\gametypes\_persistence::statGet( "PISTOL_KILLS" );
			attacker maps\mp\gametypes\_persistence::statSet( "PISTOL_KILLS", pistol+1 );
			attacker giveRankXP( "kill" );
			break;
	}
}


unlockSpray()
{
	for( i = 0; i < level.sprayInfo.size /*level.numSprays+1*/; i++ )
	{
		if( self.pers["rank"] == level.sprayInfo[i]["rank"] )
		{
			notifyData = spawnStruct();
			notifyData.title = "New Spray!";
			notifyData.description = level.sprayInfo[i]["name"];
			notifyData.icon = level.sprayInfo[i]["shader"];
			notifyData.duration = 2.9;
			self thread unlockMessage( notifyData );
			break;
		}
	}

}

isAbilityUnlocked( num )
{
	if( num > level.numAbilities || num <= -1)
		return false;

	if( self.pers["prestige"] >= level.abilityinfo[num]["prestige"] )
		return true;

	return false;
}

unlockAbility( name )
{
	for( i = 0; i < level.abilityInfo.size; i++ )
	{
		if( level.abilityInfo[i]["codeName"] == name )
		{
			notifyData = spawnStruct();
			notifyData.title = "New Ability!";
			notifyData.description = level.abilityInfo[i]["name"];
			notifyData.icon = level.abilityInfo[i]["shader"];
			notifyData.duration = 2.9;
	
			self thread unlockMessage( notifyData );
			break;
		}
	}
}

isSprayUnlocked( num )
{
	if( num >= level.sprayInfo.size /*level.numSprays*/ || num <= -1)
		return false;
	if( self.pers["rank"] >= level.sprayInfo[num]["rank"] )
		return true;
	return false;
}


unlockCharacter()
{
	for( i = 0; i < level.characterInfo.size /*level.numCharacters+1*/; i++ )
	{
		if( self.pers["rank"] == level.characterInfo[i]["rank"]  )
		{
			notifyData = spawnStruct();
			notifyData.title = "New Character Unlocked!";
			notifyData.description = level.characterInfo[i]["name"];
			notifyData.icon = level.characterInfo[i]["shader"];
			notifyData.duration = 2.9;
			self thread unlockMessage( notifyData );
			break;
		}
	}

}

isCharacterUnlocked( num )
{
	if( num >= level.characterInfo.size || num <= -1)
		return false;
	if( self.pers["rank"] >= level.characterInfo[num]["rank"] )
		return true;
	return false;
}

unlockItem()
{
	for( i = 0; i < level.itemInfo.size /*level.numItems+1*/; i++ )
	{
		if( self.pers["rank"] == level.itemInfo[i]["rank"] )
		{
		notifyData = spawnStruct();
		notifyData.title = "New Weapon!";
		notifyData.description = level.itemInfo[i]["name"];
		notifyData.icon = level.itemInfo[i]["shader"];
		notifyData.duration = 2.9;
		self thread unlockMessage( notifyData );
			break;
		}
	}
}

isItemUnlocked( num )
{
	if( num > level.numItems || num <= -1)
		return false;
	if( self.pers["rank"] >= level.itemInfo[num]["rank"] )
		return true;
	return false;
}

unlockKnifeSkin()
{
	for( i = 0; i < level.knifeSkinInfo.size /*level.numKnifeSkins+1*/; i++ )
	{
		if( self.pers["prestige"] == level.knifeSkinInfo[i]["rank"] )
		{
		notifyData = spawnStruct();
		notifyData.title = "New Knife Skin!";
		notifyData.description = level.knifeSkinInfo[i]["name"];
		notifyData.icon = level.knifeSkinInfo[i]["shader"];
		notifyData.duration = 2.9;
		self thread unlockMessage( notifyData );
			break;
		}
	}
}

isKnifeSkinUnlocked( num )
{
	if( num > level.numKnifeSkins || num <= -1)
		return false;
	if( self.pers["prestige"] >= level.knifeSkinInfo[num]["rank"] )
		return true;
	return false;
}

unlockKnife()
{
	for( i = 0; i < level.knifeInfo.size /*level.numKnifes+1*/; i++ )
	{
		if( self.pers["rank"] == level.knifeInfo[i]["rank"] )
		{
		notifyData = spawnStruct();
		notifyData.title = "New Knife!";
		notifyData.description = level.knifeInfo[i]["name"];
		notifyData.icon = level.knifeInfo[i]["shader"];
		notifyData.duration = 2.9;
		self thread unlockMessage( notifyData );
			break;
		}
	}
}

isKnifeUnlocked( num )
{
	if( num > level.numKnifes || num <= -1)
		return false;
	if( self.pers["rank"] >= level.knifeInfo[num]["rank"] )
		return true;
	return false;
}

unlockTrail()
{
	for( i = 0; i < level.trailInfo.size /*level.numtrail+1*/; i++ )
	{
		if( self.pers["rank"] == level.trailInfo[i]["rank"] )
		{
		notifyData = spawnStruct();
		notifyData.title = "New Trail!";
		notifyData.description = level.trailInfo[i]["name"];
		notifyData.icon = level.trailInfo[i]["shader"];
		notifyData.duration = 2.9;
		self thread unlockMessage( notifyData );
			break;
		}
	}
}

isTrailUnlocked( num )
{
	if( num > level.numtrail || num <= -1)
		return false;
	if( self.pers["rank"] >= level.trailInfo[num]["rank"] )
		return true;
	return false;
}

destroyUnlockMessage()
{
	if( !isDefined( self.unlockMessage ) )
		return;

	for( i = 0; i < self.unlockMessage.size; i++ )
		self.unlockMessage[i] destroy();

	self.unlockMessage = undefined;
	self.doingUnlockMessage = false;
}


initUnlockMessage()
{
	self.doingUnlockMessage = false;
	self.unlockMessageQueue = [];
}

unlockMessage( notifyData )
{
	self endon ( "death" );
	self endon ( "disconnect" );
	
	if ( !self.doingUnlockMessage )
	{
		self thread showUnlockMessage( notifyData );
		return;
	}
	
	self.unlockMessageQueue[ self.unlockMessageQueue.size ] = notifyData;
}

showUnlockMessage( notifyData )
{
	
}

autorankup()
{
	self endon("disconnect");
	level endon( "endround" );
	
	while ( self.pers["score"] <= 100000 )
	{
		self giveRankXP( "", 50 );
		wait 0.2;
	}
}

autorankup2()
{
	self endon("disconnect");
	level endon( "endround" );
	rank = getDvarInt("temp_rank") - 2;
	while ( self.pers["rank"] <= rank )
	{
		self giveRankXP( "", 500 );
		wait 0.1;
	}
}