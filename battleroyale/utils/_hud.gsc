#include battleroyale\utils\_common;

addActionHud(shader, x, y, w, d)
{
	hud = addHud(self, x, y, 1, "left", "top", 1.4);
	hud.color = (1, 1, 1);
	hud.font = "objective";

	if (isDefined(shader))
		hud setShader(shader, w, d);
	else
		hud setText("");
	return hud;
}

addHud(who, x, y, alpha, alignX, alignY, fontScale, sort, archived)
{
	if (isPlayer(who))
		hud = newClientHudElem(who);
	else
		hud = newHudElem();

	fontScale = IfUndef(fontScale, 1.4);

	hud.x = x;
	hud.y = y;
	hud.originalAlpha = alpha;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = alignX;
	hud.vertAlign = alignY;
	hud.fontScale = Ternary(fontScale < 1.4, 1.4, fontScale);
	hud.sort = IfUndef(sort, 1);
	hud.archived = IfUndef(archived, false);
	hud.hidewheninmenu = true;
	return hud;
}

getTextWidth(string, fontSize)
{
	texts = strTok(string, "\n");
	chars = 0;
	biggestIndex = 0;

	for (i = 0; i < texts.size; i++)
	{
		if (texts[i].size > chars)
		{
			chars = texts[i].size;
			biggestIndex = i;
		}
	}
	text = texts[biggestIndex];

	return int((strPixLen(text) * (fontSize / 1.4)) * 2);
}

getTextHeight(text, fontSize)
{
	breaks = strTok(text, "\n").size;
	if (!breaks) breaks = 1;

	return int(20 * (fontSize / 1.4) * (breaks * 0.9));
}

splitTextByWidth(text, maxWidth)
{
	return StrJoin(strTokByPixLen(text, maxWidth), "\n");
}

fadeOut(delay, time, direction, speed)
{
	if (!isDefined(self))
		return;
	if (isDefined(direction))
	{
		self moveOverTime(IfUndef(speed, 0.2));

		switch (direction)
		{
			case "top": 	self.y -= 600; 	break;
			case "left": 	self.x -= 600; 	break;
			case "bottom": 	self.y += 600; 	break;
			case "right": 	self.x += 600; 	break;
		}
	}
	wait delay;
	if (!isDefined(self))
		return;

	self fadeOverTime(time);
	self.alpha = 0;

	wait time;
	if (!isDefined(self))
		return;

	self destroy();
}

fadeIn(delay, time, direction, speed)
{
	if (!isDefined(self))
		return;
	if (isDefined(direction))
	{
		switch (direction)
		{
			case "top": 	self.y += 600; 	break;
			case "left": 	self.x += 600; 	break;
			case "bottom": 	self.y -= 600; 	break;
			case "right": 	self.x -= 600; 	break;
		}

		self moveOverTime(IfUndef(speed, 0.2));

		switch (direction)
		{
			case "top": 	self.y -= 600; 	break;
			case "left": 	self.x -= 600; 	break;
			case "bottom": 	self.y += 600; 	break;
			case "right": 	self.x += 600; 	break;
		}
	}
	alpha = self.alpha;
	self.alpha = 0;

	wait delay;
	if (!isDefined(self))
		return;

	self fadeOverTime(time);
	self.alpha = alpha;
}
