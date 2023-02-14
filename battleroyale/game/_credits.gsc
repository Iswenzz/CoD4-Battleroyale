#include battleroyale\utils\_common;
#include battleroyale\utils\_hud;

start()
{
	level.creditTime = 20;
	cleanScreen();

	thread showCredit("SR BattleRoyale 2019-2023", 2, 40, 16, 0);
	thread showCredit("SuX Lolz", 1.8, 80, 15.5, 2);

	if (isDefined(level.mapCredits))
	{
		thread showCredit("Map credits:", 2, 140, 13, 4);
		thread showCredit(level.mapCredits, 1.8, 180, 13, 5);
	}

	thread showCredit("Additional Help", 2, 240, 13, 7);
	thread showCredit("VC' Erik   FAMOUS Nitrofire   SuX AyPire   Easy", 1.8, 280, 13, 8);

	wait level.creditTime;
}

showCredit(text, scale, y, duration, startTime)
{
	hud = newHudElem();
	hud.font = "objective";
	hud.fontScale = scale;
	hud SetText(text);
	hud.alignX = "center";
	hud.alignY = "top";
	hud.horzAlign = "center";
	hud.vertAlign = "top";
	hud.x = 0;
	hud.y = y;
	hud.sort = 1000;
	hud.glowColor = (1, 0, 0);
	hud.glowAlpha = 1;
	hud fade(duration, startTime);
}

fade(duration, startTime)
{
	self.alpha = 0;
	wait startTime;
	self.alpha = 1;

	self fadeIn(0, 1);
	wait duration - startTime;
	self fadeOut(0, 1);
}
