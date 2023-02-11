setupDvars()
{
	level.dvar = [];

	// addDvar( <script_name>, <var_name>, <default_value>, <min_value>, <max_value>, <var_type> );
	addDvar( "antiHackStat", "dr_antiHackStat_pass", 2900, 1, 3950, "int" );
	addDvar( "playerMaxHealth", "br_max_health", 200, 1, 1000, "int" );
	addDvar( "ZoneStartLevel", "br_zone_start_level", 0, 0, 4, "int" );
	addDvar( "debugMode", "br_debug", 0, 0, 1, "int" );
	addDvar( "lobbyCountdown", "br_lobby_countdown", 10, 0, 60, "int" );
	addDvar( "requiredPlayers", "br_required_players", 2, 0, 10, "int" );
	addDvar( "votemap", "br_votemap", 1, 0, 1, "int" );
}

// Originally from Bell's AWE mod for CoD 1
addDvar( scriptName, varname, vardefault, min, max, type )
{
	if(type == "int")
	{
		if(getdvar(varname) == "")
			definition = vardefault;
		else
			definition = getdvarint(varname);
	}
	else if(type == "float")
	{
		if(getdvar(varname) == "")
			definition = vardefault;
		else
			definition = getdvarfloat(varname);
	}
	else
	{
		if(getdvar(varname) == "")
			definition = vardefault;
		else
			definition = getdvar(varname);
	}

	if(getdvar( varname ) == "")
		setdvar( varname, definition );

	level.dvar[scriptName] = definition;
}
