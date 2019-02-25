///////////////////////////////////////////////////////////////
////|         |///|        |///|       |/\  \/////  ///|  |////
////|  |////  |///|  |//|  |///|  |/|  |//\  \///  ////|__|////
////|  |////  |///|  |//|  |///|  |/|  |///\  \/  /////////////
////|          |//|  |//|  |///|       |////\    //////|  |////
////|  |////|  |//|         |//|  |/|  |/////    \/////|  |////
////|  |////|  |//|  |///|  |//|  |/|  |////  /\  \////|  |////
////|  |////|  |//|  | //|  |//|  |/|  |///  ///\  \///|  |////
////|__________|//|__|///|__|//|__|/|__|//__/////\__\//|__|////
///////////////////////////////////////////////////////////////
/*
	BraXi's Death Run Mod
	
	Website: www.braxi.org
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]

	showCredit() written by Bipo.
*/

main()
{
	level.creditTime = 6;

	battleroyale\_common::cleanScreen();

	thread showCredit( "Mod & Map Created by:", 2, 80, 9 );
	wait 1;
	thread showCredit( "SuX Lolz", 1.8, 120, 8 );
	wait 3;
	thread showCredit( "Additional Help", 2, 300, 5 );
	wait 1;
	thread showCredit( "VC' Erik, FAMOUS Nitrofire, SuX AyPire", 1.8, 320, 4 );
	wait 0.1;

	wait level.creditTime + 2;
}


showCredit( text, scale, y, time )
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text SetText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = 0;
	end_text.y = y;
	end_text.sort = -1; //-3
	end_text.glowColor = (255/255, 0/255, 50/255);
	end_text.glowAlpha = 1;
	end_text.alpha = 0;
	end_text fadeOverTime(0.9);
	end_text.alpha = 1;
	end_text.foreground = true;
	wait time;
	wait level.creditTime;
	end_text fadeOverTime(0.9);
	end_text.alpha = 0;
	wait 0.9;
	end_text destroy();
}


neon()
{
	neon = addNeon( "", 1.4 );
	while( 1 )
	{
		neon moveOverTime( 12 );
		neon.x = 800;
		wait 15;
		neon moveOverTime( 12 );
		neon.x = -800;
		wait 15;
	}
}

addNeon( text, scale )
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text SetText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = -200;
	end_text.y = 8;
	end_text.sort = -1; //-3
	end_text.alpha = 1;
	//end_text.glowColor = (1,0,0.1);
	//end_text.glowAlpha = 1;
	end_text.foreground = true;
	return end_text;
}