setupDvars()
{
	level.dvar = [];

	addDvar( "antiHackStat", "dr_antiHackStat_pass", 2900, 1, 3950, "int" );

	/* Syntax is:
	addDvar( "script_name", "var_name", 1, 0, 2, "int" );
	Reference addDvar's parameters for more info
	*/

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
//	return definition;
}
