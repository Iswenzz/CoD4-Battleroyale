#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

#include battleroyale\_common;
#include battleroyale\_dvar;

#include speedrun\_gsxcommon;

speedrunstart()
{
	level.voteInProgress = false;
	level.openFiles = 0;

	thread speedrun\_playercommands::init();
	thread speedrun\_playeroptions::init();
}

srOnConnect()
{
	self thread speedrun\_playerid::checkid();
	self thread speedrun\_playercommands::setGroup();
	self thread speedrun\_playeroptions::onConnectOptions();
}