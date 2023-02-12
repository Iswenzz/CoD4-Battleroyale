#include battleroyale\utils\_common;
#include battleroyale\utils\_hud;

start()
{
	level.creditTime = 4;
	cleanScreen();

	thread showCredit("SR BattleRoyale", 2, 40, 17.5, 0);
	thread showCredit("SuX Lolz", 1.8, 80, 17, 2);

	if (isDefined(level.mapCredits))
	{
		thread showCredit("Map credits:", 2, 200, 14, 3);
		thread showCredit(level.mapCredits, 1.8, 220, 14.5, 3.5);
	}

	thread showCredit("Additional Help", 2, 300, 15, 4);
	thread showCredit("VC' Erik   FAMOUS Nitrofire   SuX AyPire   Easy", 1.8, 320, 15.5, 4.5);

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
	hud.glowColor = ToRGB(120, 0, 255);
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
