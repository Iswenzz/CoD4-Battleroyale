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
	
	Website: www.battleroyale.net
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

main()
{
	if( getDvar( "mapname" ) == "mp_background" )
		return; // this isn't required but i'm putting it here...

	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	level.callbackStartGameType = ::Callback_StartGameType;
	level.callbackPlayerConnect = ::Callback_PlayerConnect;
	level.callbackPlayerDisconnect = ::Callback_PlayerDisconnect;
	level.callbackPlayerDamage = ::Callback_PlayerDamage;
	level.callbackPlayerKilled = ::Callback_PlayerKilled;
	level.callbackPlayerLastStand = ::Callback_PlayerLastStand;
	level.callbackCommands = ::Callback_Commands;

	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );
	
	level.allies = ::allies;
	level.axis = ::axis;
	level.spectator = ::spectator;
}

Callback_StartGameType()
{
	if ( !isDefined( game["allies"] ) )
		game["allies"] = "marines";
	if ( !isDefined( game["axis"] ) )
		game["axis"] = "opfor";

	//speedrun\_speedrun::speedrunstart();
	battleroyale\_mod::main(); // START MOD

	allowed[0] = "war";
	maps\mp\gametypes\_gameobjects::main(allowed);	
}

dummy()
{
	waittillframeend;
	if(isdefined(self))
		level notify("connecting", self);
}


Callback_PlayerConnect()
{
	thread dummy();

	self.statusicon = "";
	self waittill("begin");
	//self speedrun\_speedrun::srOnConnect();
	self battleroyale\_mod::playerConnect();
}


Callback_PlayerDisconnect()
{
	iPrintln( self.name + " ^7disconnected." );
	self battleroyale\_mod::playerDisconnect();
}


Callback_PlayerLastStand( eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration )
{
	self battleroyale\_mod::PlayerLastStand( eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration );
}


Callback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	self battleroyale\_mod::PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}


Callback_PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self battleroyale\_mod::PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
}

Callback_Commands(command, arguments)
{
	//self thread speedrun\_playercommands::commands( command, arguments );
}

allies(){ self battleroyale\_teams::setTeam( "allies" ); }
axis(){ self battleroyale\_teams::setTeam( "axis" ); }
spectator(){ self battleroyale\_teams::setTeam( "spectator" ); }

