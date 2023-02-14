#include battleroyale\utils\_common;
#include battleroyale\sys\_events;

main()
{
	if (!level.dvar["debug"])
		return;

	event("map", ::bots);
}

bots()
{
	waitMapLoad(1);
	spawnBots(1);
}
