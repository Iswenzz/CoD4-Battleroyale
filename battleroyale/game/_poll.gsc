#include battleroyale\sys\_events;
#include battleroyale\utils\_common;
#include battleroyale\utils\_hud;

initPoll()
{
	level.pollProgress = false;
	level.pollTimer = 18;
	level.pollTitle = "";
	level.pollEntries = [];
}

playerVote()
{
	self endon("disconnect");
	level endon("poll_ended");

	self thread huds();
	self.pollCursor = -1;
	self.pollVoting = false;
	wait 1;

	while (true)
	{
		wait 0.05;

		if (self attackButtonPressed())
		{
			if (self.pollVoting)
				level.pollEntries[self.pollCursor].votes--;
			self.pollCursor++;
			self updateCursor();
			level.pollEntries[self.pollCursor].votes++;
			level updateHud();
			wait 0.15;
		}
		else if (self aimButtonPressed())
		{
			if (self.pollVoting)
				level.pollEntries[self.pollCursor].votes--;
			self.pollCursor--;
			self updateCursor();
			level.pollEntries[self.pollCursor].votes++;
			level updateHud();
			wait 0.15;
		}
		while (self attackButtonPressed() || self aimButtonPressed())
			wait 0.05;
	}
}

updateCursor()
{
	self.pollVoting = true;

	if (self.pollCursor >= level.pollEntries.size)
		self.pollCursor = 0;
	else if (self.pollCursor < 0)
		self.pollCursor = level.pollEntries.size - 1;
}

poll(title, values)
{
	if (level.pollProgress || !isDefined(values) || values.size < 2)
		return undefined;

	level.pollEntries = [];
	for (i = 0; i < values.size; i++)
	{
		entry = spawnStruct();
		entry.label = values[i];
		entry.votes = 0;

		level.pollEntries[i] = entry;
	}

	level.pollTitle = title;
	level.pollProgress = true;
	level.pollTimer = 18;

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread playerVote();
	wait 1;
	level updateHud();

	wait 1;
	while (level.pollTimer > 0)
	{
		level.pollTimer--;
		wait 1;
	}
	level notify("poll_ended");

	result = level.pollEntries[0];
	for (i = 0; i < level.pollEntries.size; i++)
	{
		if (level.pollEntries[i].votes > result.votes)
			result = level.pollEntries[i];
	}
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] clean();
	level.pollProgress = false;
	return result;
}

huds()
{
	self endon("disconnect");
	level endon("poll_ended");

	self.huds["poll"] = [];
	self.huds["poll"]["background"] = addHud(self, 0, 50, 0.9, "center", "top", 1.4, 1000);
	self.huds["poll"]["background"].color = (0, 0, 0);
	self.huds["poll"]["background"] setShader("sr_bokeh", 260, (level.pollEntries.size + 1) * 18);
	self.huds["poll"]["background"] thread fadeIn(0, 1, "bottom", 0.6);
	self.huds["poll"]["header"] = addHud(self, 0, 50, 0.5, "center", "top", 1.4, 1000);
	self.huds["poll"]["header"] setShader("black", 260, 20);
	self.huds["poll"]["header"] thread fadeIn(0, 1, "bottom", 0.6);
	self.huds["poll"]["title"] = addHud(self, 0, 50, 1, "center", "top", 1.4, 1001);
	self.huds["poll"]["title"] setText(level.pollTitle);
	self.huds["poll"]["title"] thread fadeIn(0, 1, "bottom", 0.6);
	self.huds["poll"]["timer"] = addHud(self, 110, 50, 1, "center", "top", 1.4, 1001);
	self.huds["poll"]["timer"] setValue(level.pollTimer);
	self.huds["poll"]["timer"] thread fadeIn(0, 1, "bottom", 0.6);
	self.huds["poll"]["entries"] = addHud(self, -110, 70, 1, "center", "top", 1.4, 1001);
	self.huds["poll"]["entries"] thread fadeIn(1, 1);
	self.huds["poll"]["votes"] = addHud(self, 110, 70, 1, "center", "top", 1.4, 1001);
	self.huds["poll"]["votes"] thread fadeIn(1, 1);

	wait 1;
	while (true)
	{
		self.huds["poll"]["timer"] setValue(level.pollTimer);
		wait 0.5;
	}
}

updateHud()
{
	players = getAllPlayers();

	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		if (!isDefined(player.huds) || !isDefined(player.huds["poll"]))
			continue;

		biggestText = "";
		entries = "";
		votes = "";

		for (j = 0; j < level.pollEntries.size; j++)
		{
			entry = level.pollEntries[j];
			entries += Ternary(player.pollCursor == j, "^5", "^7") + entry.label + "\n";
			votes += Ternary(player.pollCursor == j, "^5", "^7") + entry.votes + "\n";

			if (entry.label.size > biggestText.size)
				biggestText = entry.label;
		}
		player.huds["poll"]["entries"] setText(entries);
		player.huds["poll"]["entries"].x = -110 + (getTextWidth(biggestText, 1.4) / 3);
		player.huds["poll"]["votes"] setText(votes);
		player.huds["poll"]["votes"].x = 110;
	}
}

clean()
{
	if (isDefined(self.huds["poll"]))
	{
		keys = getArrayKeys(self.huds["poll"]);
		for (i = 0; i < keys.size; i++)
		{
			if (isDefined(self.huds["poll"][keys[i]]))
				self.huds["poll"][keys[i]] thread fadeOut(0, 1, "top", 0.6);
		}
	}
}
