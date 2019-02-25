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

setPlayerModel()
{
	self detachAll();
	if( self.pers["team"] == "allies" )
	{
		self setModel( "body_mp_usmc_cqb" );
		self setViewModel( "viewmodel_hands_zombie" );
	}
	else
	{
		self setModel( "body_mp_usmc_cqb" );
		self setViewModel( "viewmodel_hands_zombie" );
	}
}

setHealth()
{
	self.maxhealth = 10;
	switch( self.pers["team"] )
	{
	case "allies":
		self.maxhealth = level.dvar["allies_health"];
		break;
	case "axis":
		self.maxhealth = level.dvar["axis_health"];
		break;
	}
	self.health = self.maxhealth;
}

setSpeed()
{
	speed = 1.0;
	switch( self.pers["team"] )
	{
	case "allies":
		speed = level.dvar["allies_speed"];
		break;
	case "axis":
		speed = level.dvar["axis_speed"];
		break;
	}
	self setMoveSpeedScale( speed );
}

setTeam( team )
{
	if( self.pers["team"] == team )
		return;

	if( isAlive( self ) )
		self suicide();
	
	self.pers["weapon"] = "none";
	self.pers["team"] = team;
	self.team = team;
	self.sessionteam = team;

	menu = game["menu_team"];
	if( team == "allies" )
	{
		self.pers["weapon"] = "colt45_mp";
	}
	else if( team == "axis" )
	{
		self.pers["weapon"] = "knife_mp";
	}
	self setClientDvars( "g_scriptMainMenu", menu );
}

setSpectatePermissions()
{
	self allowSpectateTeam( "allies", true );
	self allowSpectateTeam( "axis", true );
	self allowSpectateTeam( "none", false );
}
