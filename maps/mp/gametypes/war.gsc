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
	
	Website: www.braxi.net
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

main()
{
	if( getDvar( "mapname" ) == "mp_background" )
		return; // this isn't required but i'm putting it here...

	maps\mp\gametypes\_callbacksetup::SetupCallbacks();


	println( "Trying to load correct gametype!" );

	setDvar( "g_gametype", "battleroyale" );
	exitLevel(false);
}

Callback_StartGameType()
{
	if ( !isDefined( game["allies"] ) )
		game["allies"] = "marines";
	if ( !isDefined( game["axis"] ) )
		game["axis"] = "opfor";
}


