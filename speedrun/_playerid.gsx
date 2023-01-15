#include speedrun\_gsxcommon;


checkid()
{
	if(self getstat(995) == 0 || self getstat(996) == 0 || self getstat(997) == 0)
	{
		newid = createid();
		self setstat(995, newid[0]);
		self setstat(996, newid[1]);
		self setstat(997, newid[2]);
	}

	self.playerID = self getstat(995) +""+self getstat(996)+""+self getstat(997);
	//wait 1;
	//IPrintLn("Player "+self.name+" joined the game. ID: " + self.playerID);
}

createid()
{
	self IPrintLn("creating ID");
	path = "./playerID/IDlist.txt";
	file_exists = checkfile(path);
	if(!file_exists)
	{
		checkQueue();
		new = FS_Fopen(path, "write");
		FS_FClose(new);
	}
	a = readAll(path);
	check = false;
	id = [];
	string = "";
	while(!check)
	{
		id[0] = RandomIntRange(1, 255);
		id[1] = RandomIntRange(1, 255);
		id[2] = RandomIntRange(1, 255);
		string = id[0] +""+id[1]+""+id[2];
		for(i = 0; i<a.size; i++)
			if(string == a[i])
				continue;
		check = true;
	}
	WriteToFile(path, string);
	return id;
}