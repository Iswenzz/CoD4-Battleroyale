/*

 /##   /## /##   /##                         /######## /##
| ### | ##|__/  | ##                        | ##_____/|__/
| ####| ## /## /######    /######   /###### | ##       /##  /######   /######
| ## ## ##| ##|_  ##_/   /##__  ## /##__  ##| #####   | ## /##__  ## /##__  ##
| ##  ####| ##  | ##    | ##  \__/| ##  \ ##| ##__/   | ##| ##  \__/| ########
| ##\  ###| ##  | ## /##| ##      | ##  | ##| ##      | ##| ##      | ##_____/
| ## \  ##| ##  |  ####/| ##      |  ######/| ##      | ##| ##      |  #######
|__/  \__/|__/   \___/  |__/       \______/ |__/      |__/|__/       \_______/

   Name : NitroFire
   Scripts by : NitroFire
   Steam : david1205red
   [If you plan to use this script in any way, please give credit where it is due.]

*/
#include battleroyale\_dvar;

init() 
{
    addDvar("healthbar", "plugin_healthbar_enable", 1, 0, 1, "int");

    if(!level.dvar["healthbar"])
      return;

    addDvar("health_show", "plugin_healthbar_show", 2, 0, 2, "int");

    precacheShader("white");

    while(1) 
    {
        level waittill("player_spawn", player);

        if(level.dvar["health_show"] == 0 && player.pers["team"] != "allies")
            continue;

        player thread createHealthBar();
        player thread removeHealthbarOn("death");
        player thread removeHealthbarOn("disconnect");
    }
}

createHealthBar() 
{
    wait 0.5;
    self RemoveHealthBar();

    self.healthbar_background = NewClientHudElem(self);
    self.healthbar_background.alignX = "center";
    self.healthbar_background.alignY = "bottom";
    self.healthbar_background.horzalign = "center";
    self.healthbar_background.vertalign = "bottom";
    self.healthbar_background.x = 0;
    self.healthbar_background.y = 2;
    self.healthbar_background.sort = 1001;
    self.healthbar_background.alpha = 0.6;
    self.healthbar_background.color = (0.4, 0.4, 0.4);
    self.healthbar_background.foreground = false;
    self.healthbar_background.hideWhenInMenu = true;
    self.healthbar_background setShader("white", 250, 10);

    self.healthbar_foreground = NewClientHudElem(self);
    self.healthbar_foreground.alignX = "center";
    self.healthbar_foreground.alignY = "bottom";
    self.healthbar_foreground.horzalign = "center";
    self.healthbar_foreground.vertalign = "bottom";
    self.healthbar_foreground.x = 0;
    self.healthbar_foreground.y = 0;
    self.healthbar_foreground.sort = 1002;
    self.healthbar_foreground.alpha = 0.8;
    self.healthbar_foreground.color = (0.9, 0.9, 0.9);
    self.healthbar_foreground.foreground = true;
    self.healthbar_foreground.hideWhenInMenu = true;
    self.healthbar_foreground setShader("white", 250, 10);

    while(1) 
    {
        wait 0.2;

        if(!isDefined( self.healthbar_foreground )) 
            return;

        self.healthbar_foreground ScaleOverTime(0.2, int(self.health / self.maxhealth * 250), 8);
        self.healthbar_foreground.color = (0.9, 0.9, 0.9);
    }
}

removeHealthbarOn(until) 
{
    if(!isDefined(until) || until == "" || until == " " || !isDefined(self) || !isPlayer(self))
      return;

    self waittill(until);
    self thread RemoveHealthbar();
}

removeHealthBar() 
{
    if(!isDefined(self) || !isPlayer(self))
      return;

    if(isDefined(self.healthbar_background))
      self.healthbar_background destroy();

    if(isDefined(self.healthbar_foreground))
      self.healthbar_foreground destroy();

    if(isDefined(self.healthbar_value))
      self.healthbar_value destroy();
}
