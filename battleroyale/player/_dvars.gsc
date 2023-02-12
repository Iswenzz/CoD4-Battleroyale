#include battleroyale\sys\_events;

main()
{
	event("connect", ::dvars);
}

dvars()
{
	self endon("connected");
	self endon("disconnected");

	wait 1;
	self setClientDvar("cg_drawfriendlynames", 1);
	self setClientDvar("cg_friendlyNameFadeIn", 1);
	self setClientDvar("cg_friendlyNameFadeOut", 1);
	self setClientDvar("hud_enable", 1);
	wait 0.05;
	self setClientDvar("ui_hud_hardcore", 1);
	self setClientDvar("ui_uav_client", 0);
	self setClientDvar("cg_drawThroughWalls", 0);
	self setClientDvar("g_teamcolor_myteam", "1 0 0 1");

	level waittill("br_started");

	self setClientDvar("cg_drawfriendlynames", 0);
	self setClientDvar("cg_friendlyNameFadeIn", 0);
	self setClientDvar("cg_friendlyNameFadeOut", 0);
}
