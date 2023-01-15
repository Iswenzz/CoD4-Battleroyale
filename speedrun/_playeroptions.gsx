#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

#include battleroyale\_common;
#include battleroyale\_dvar;

#include speedrun\_gsxcommon;

init()
{
	game["player_settings_menu"] = "player_settings_menu";
	precacheMenu(game["player_settings_menu"]);
}

onConnectOptions()
{
	wait 0.05;
	
	path = "./player_options/" + self.playerID +".txt";
	file_exists = checkfile(path);
	if(!file_exists)
	{
		checkQueue();
		new = FS_Fopen(path, "write");
		FS_FClose(new);
		self.pers["crosshair"] = 1;
		self.pers["draw_fps"] = 1;
		self.pers["fullbright"] = 0;
		self.pers["draw_distance"] = 0;
		self.pers["fovscale"] = 1000;
		self.pers["xp_bar"] = 0;
		self.pers["spec_hud"] = 1;
		self.pers["fps_hud"] = 0;
	}
	else
	{
		self thread readOptions();
	}
			
	
	self thread func();
	////////////////////////////////////////////////////////////////////////////////////////////
		
	self thread menuRes();
}

saveOptions()
{
	fov = self.pers["fovscale"]; // !fov 1.2 = 1200
	
	a = undefined; b = undefined; c = undefined; d = undefined; e = undefined; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;
	
	z = 1;
	
	for(x=0;x<fov;x++)
	{
		if(z <= 200){
			a = z; b = undefined; c = undefined; d = undefined; e = undefined; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;}
		
		if(z <= 400 && isDefined(a) && a == 200){
			a = 200; b = z-a; c = undefined; d = undefined; e = undefined; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;}
			
		if(z <= 600 && isDefined(a) && a == 200 && isDefined(b) && b == 200){
			a = 200; b = 200; c = z-a-b; d = undefined; e = undefined; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;}
			
		if(z <= 800 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200){
			a = 200; b = 200; c = 200; d = z-a-b-c; e = undefined; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;}
			
		if(z <= 1000 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200){
			a = 200; b = 200; c = 200; d = 200; e = z-a-b-c-d; f = undefined; g = undefined; h = undefined; i = undefined; j = undefined;}
			
		if(z <= 1200 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200 && isDefined(e) && e == 200){
			a = 200; b = 200; c = 200; d = 200; e = 200; f = z-a-b-c-d-e; g = undefined; h = undefined; i = undefined; j = undefined;}
		
		if(z <= 1400 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200 && isDefined(e) && e == 200 && isDefined(f) && f == 200){
			a = 200; b = 200; c = 200; d = 200; e = 200; f = 200; g = z-a-b-c-d-e-f; h = undefined; i = undefined; j = undefined;}
			
		if(z <= 1600 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200 && isDefined(e) && e == 200 && isDefined(f) && f == 200 && isDefined(g) && g == 200){
			a = 200; b = 200; c = 200; d = 200; e = 200; f = 200; g = 200; h = z-a-b-c-d-e-f-g; i = undefined; j = undefined;}
			
		if(z <= 1800 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200 && isDefined(e) && e == 200 && isDefined(f) && f == 200 && isDefined(g) && g == 200 && isDefined(h) && h == 200){
			a = 200; b = 200; c = 200; d = 200; e = 200; f = 200; g = 200; h = 200; i = z-a-b-c-d-e-f-g-h; j = undefined;}
			
		if(z <= 2000 && isDefined(a) && a == 200 && isDefined(b) && b == 200 && isDefined(c) && c == 200 && isDefined(d) && d == 200 && isDefined(e) && e == 200 && isDefined(f) && f == 200 && isDefined(g) && g == 200 && isDefined(h) && h == 200 && isDefined(i) && i == 200){
			a = 200; b = 200; c = 200; d = 200; e = 200; f = 200; g = 200; h = 200; i = 200; j = z-a-b-c-d-e-f-g-h-i;}
		
		z++;
	}
	
	wait 0.5;
	
	if(!isDefined(a) && !isDefined(b) && !isDefined(c) && !isDefined(d) && !isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && !isDefined(b) && !isDefined(c) && !isDefined(d) && !isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		b=0;c=0;d=0;e=0;f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && !isDefined(c) && !isDefined(d) && !isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		c=0;d=0;e=0;f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && !isDefined(d) && !isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		d=0;e=0;f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && !isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		e=0;f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && !isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		f=0;g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && isDefined(f) && !isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		g=0;h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && isDefined(f) && isDefined(g) && !isDefined(h) && !isDefined(i) && !isDefined(j)){
		h=0;i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && isDefined(f) && isDefined(g) && isDefined(h) && !isDefined(i) && !isDefined(j)){
		i=0;j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && isDefined(f) && isDefined(g) && isDefined(h) && isDefined(i) && !isDefined(j)){
		j=0;self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
		
	if(isDefined(a) && isDefined(b) && isDefined(c) && isDefined(d) && isDefined(e) && isDefined(f) && isDefined(g) && isDefined(h) && isDefined(i) && isDefined(j)){
		self setStat(1630,a);self setStat(1631,b);self setStat(1632,c);self setStat(1633,d);self setStat(1634,e);self setStat(1635,f);self setStat(1636,g);self setStat(1637,h);self setStat(1638,i);self setStat(1639,j);}
	
	wait 0.5;
	
	self setStat(1600,self.pers["crosshair"]);
	self setStat(1601,self.pers["draw_fps"]);
	self setStat(1602,self.pers["fullbright"]);
	self setStat(1603,self.pers["draw_distance"]);
	self setStat(1605,self.pers["xp_bar"]);
	self setStat(1606,self.pers["spec_hud"]);
	self setStat(1607,self.pers["fps_hud"]);
}

readOptions()
{
	self.pers["fovscale"] = (self getStat(1630)+self getStat(1631)+self getStat(1632)+self getStat(1633)+self getStat(1634)+self getStat(1635)+self getStat(1636)+self getStat(1637)+self getStat(1638)+self getStat(1639));
	self.pers["crosshair"] = self getStat(1600);
	self.pers["draw_fps"] = self getStat(1601);
	self.pers["fullbright"] = self getStat(1602);
	self.pers["draw_distance"] = self getStat(1603);
	self.pers["xp_bar"] = self getStat(1605);
	self.pers["spec_hud"] = self getStat(1606);
	self.pers["fps_hud"] = self getStat(1607);
}

func()
{
	self endon("disconnect");
	
///////////////////////////////////////////////////////////////////////////
		if(self.pers["crosshair"] == 0 )
		{
			self setClientDvar( "dr_crosshair", "                                            ^9OFF");
			self setClientDvar( "cg_drawcrosshair", 0 );
		}
		if(self.pers["crosshair"] == 1 )
		{
			self setClientDvar( "dr_crosshair", "                                            ^5ON");
			self setClientDvar( "cg_drawcrosshair", 1 );
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["draw_fps"] == 0 )
		{
			self setClientDvar( "dr_draw_fps", "                                            ^9OFF");
			self setClientDvar( "cg_drawfps", 0 );
		}
		if(self.pers["draw_fps"] == 1 )
		{
			self setClientDvar( "dr_draw_fps", "                                            ^5ON");
			self setClientDvar( "cg_drawfps", 1 );
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["fullbright"] == 0 )
		{
			self setClientDvar( "dr_fullbright", "^9OFF                                            ");
			self setClientDvar( "r_fullbright", 0 );
		}
		if(self.pers["fullbright"] == 1 )
		{
			self setClientDvar( "dr_fullbright", "^5ON                                            ");
			self setClientDvar( "r_fullbright", 1 );
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["draw_distance"] == 0 )
		{
			value = 0;
			self setClientDvar( "dr_draw_distance", "^5MAX                                            ");
			self setClientDvar( "r_zfar", value );
		}
		if(self.pers["draw_distance"] == 1 )
		{
			value = 5000;
			self setClientDvar( "dr_draw_distance", "^5" + value + "                                            ");
			self setClientDvar( "r_zfar", value );
		}
		if(self.pers["draw_distance"] == 2 )
		{
			value = 2500;
			self setClientDvar( "dr_draw_distance", "^5" + value + "                                            ");
			self setClientDvar( "r_zfar", value );
		}
		if(self.pers["draw_distance"] == 3 )
		{
			value = 1250;
			self setClientDvar( "dr_draw_distance", "^5" + value + "                                            ");
			self setClientDvar( "r_zfar", value );
		}
///////////////////////////////////////////////////////////////////////////
		if(isDefined(self.pers["fovscale"]) && isDefined(self.fovscale))
		{
			value = self.fovscale / 1000;
			self setClientDvar( "dr_fov_scale", "^5" + value + "                                            ");
			self setClientDvar("cg_fovscale", value);
		}
		if(isDefined(self.pers["fovscale"]) && !isDefined(self.fovscale))
		{
			value = self.pers["fovscale"] / 1000;
			self setClientDvar( "dr_fov_scale", "^5" + value + "                                            ");
			self setClientDvar("cg_fovscale", value);
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["xp_bar"] == 0 )
		{
			self setClientDvar( "dr_xp_bar", "^9OFF                                            ");
			self setClientDvar("sr_xp_bar", 0);
		}
		if(self.pers["xp_bar"] == 1 )
		{
			self setClientDvar( "dr_xp_bar", "^5ON                                            ");
			self setClientDvar("sr_xp_bar", 1);
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["spec_hud"] == 0 )
		{
			self setClientDvar( "dr_spec_hud", "                                            ^9OFF");
		}
		if(self.pers["spec_hud"] == 1 )
		{
			self setClientDvar( "dr_spec_hud", "                                            ^5ON");
		}
///////////////////////////////////////////////////////////////////////////
		if(self.pers["fps_hud"] == 0 )
		{
			self setClientDvar( "dr_fps_hud", "                                            ^9OFF");
			self thread hide_fps_hud();
		}
		if(self.pers["fps_hud"] == 1 )
		{
			self setClientDvar( "dr_fps_hud", "                                            ^5ON");
			self thread show_fps_hud();
		}
		self thread saveOptions();
///////////////////////////////////////////////////////////////////////////
}

menuRes()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if( menu == game["player_settings_menu"] )
		{
			switch(response)
			{
///////////////////////////////////////////////////////////////////////////
			case "crosshair":
				if(self.pers["crosshair"] == 0 )
				{
					self.pers["crosshair"] = 1;
					self thread func();
				}
				else
				{
					self.pers["crosshair"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "draw_fps":
				if(self.pers["draw_fps"] == 0 )
				{
					self.pers["draw_fps"] = 1;
					self thread func();
				}
				else
				{
					self.pers["draw_fps"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "fullbright":
				if(self.pers["fullbright"] == 0 )
				{
					self.pers["fullbright"] = 1;
					self thread func();
				}
				else
				{
					self.pers["fullbright"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "draw_distance":
				if(self.pers["draw_distance"] == 0 )
				{
					self.pers["draw_distance"] = 1;
					self thread func();
				}
				else if(self.pers["draw_distance"] == 1 )
				{
					self.pers["draw_distance"] = 2;
					self thread func();
				}
				else if(self.pers["draw_distance"] == 2 )
				{
					self.pers["draw_distance"] = 3;
					self thread func();
				}	
				else if(self.pers["draw_distance"] == 3 )
				{
					self.pers["draw_distance"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "fov_scale":
				self closeMenu();
				self closeInGameMenu();
				self iprintlnbold("Use ^5!fov ^7<1.0-2.0>");
				break;
///////////////////////////////////////////////////////////////////////////
			case "xp_bar":
				if(self.pers["xp_bar"] == 0 )
				{
					self.pers["xp_bar"] = 1;
					self thread func();
				}
				else
				{
					self.pers["xp_bar"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "spec_hud":
				if(self.pers["spec_hud"] == 0 )
				{
					self.pers["spec_hud"] = 1;
					self thread func();
				}
				else
				{
					self.pers["spec_hud"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			case "fps_hud":
				if(self.pers["fps_hud"] == 0 )
				{
					self.pers["fps_hud"] = 1;
					self thread func();
				}
				else
				{
					self.pers["fps_hud"] = 0;
					self thread func();
				}	
				break;
///////////////////////////////////////////////////////////////////////////
			}
		}
	}
}

//FPS HUD
show_fps_hud()
{
	self endon("disconnect");
	self notify("fpshud_end");
	self endon("fpshud_end");

	wait 0.05;
	
	while(1)
	{
		if(isDefined(self.pers["team"]) && self.pers["team"] == "spectator")
		{
			self thread hide_fps_hud();
			self on_spawn_show_fps_hud();
			break;
		}
		
		if(self.pers["fps_hud"] == 0)
			break;
		
		if(!isDefined(self.fpshud))
			self thread fpsHud_playing();

		fps = self getuserinfo("com_maxfps");

		if(!isDefined(fps))
			continue;
		
		if(fps == "20" || fps == "30" || fps == "125" || fps == "142" || fps == "166" || fps == "250" || fps == "333" || fps == "500" || fps == "1000")
			self.fpshud SetShader("fps_"+fps, 90,60);
		
		wait 0.1;
	}
}

on_spawn_show_fps_hud()
{
	self waittill("spawned_player");
	
	if(self.pers["fps_hud"] == 1)
		self thread show_fps_hud();
}

hide_fps_hud()
{
	if(isDefined(self.fpshud))
		self.fpshud Destroy();
	self.fpshud = undefined;
}	

fpsHud_playing()
{
	self.fpshud = addhud(self, -15, -26, 1, "right", "bottom", 1.8 );
	self.fpshud.archived = false;
	self.fpshud.horzAlign = "right";
    self.fpshud.vertAlign = "bottom";
	self.fpshud.hidewheninmenu = true;
}
//FPS HUD

hide_players()
{
	self endon("disconnect");
	
	for(;;)
	{
		if(self.pers["hide_player"] == 0 )
			break;
		
		
		p=getentarray("player","classname");
		
		for(i=0;i<p.size;i++)
			p[i] hide();

		for(j=0;j<p.size;j++)
		{
			if(distance(p[j].origin,self.origin) > 500 && p[j] != self && p[j].sessionstate != "spectator")
				p[j] showtoplayer(self);
		}
	wait 0.05;
	}
}

show_players()
{
	self endon("disconnect");
	
	p=getentarray("player","classname");
        
        for(i=0;i<p.size;i++)
            p[i] show();
}

