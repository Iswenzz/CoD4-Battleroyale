# CoD4 SR BattleRoyale
<!-- Badges -->

Call of Duty 4 Battle Royale is a first-person shooter game that engages in survival, exploration and much more. It is a strong
last man standing gameplay that requires you to search for equipment and weaponary which will help you defeat enemies.
Call of Duty 4's battle royale is based off of many other games such as H1Z1, PlayerUnknown's Battlegrounds, and Fortnite!

![](https://i.imgur.com/UyDK7t6.jpg)

This mod comes with it's own custom map called, ``MP_BR_BLACKOUT`` (created by Iswenzz), which is designed for over 30 players. This map utilizes the entirety of 
the Call of Duty 4 game engine, and pushes the game to it's limits.

### **[MP_BR_BLACKOUT - Download](https://iswenzz.com:1337/fastdl/usermaps/mp_br_blackout/)**

# Callbacks
You can make a callback function that is triggered when one of the following events happens.

```c
/* 
===============CALLBACK LIST===============
game_started
br_started
plane_start
plane_stop
restricting_area
end_map
parachute_start
parachute_end
connected
disconnected
spawned
death
==========================================
*/
level.callback["br_started"] = ::callback_BrStarted;

callback_BrStarted()
{
    // code
}
```
### **[Map code example](https://github.com/Iswenzz/CoD4-Battleroyale/blob/master/maps/mp/mp_creek.gsc)**

## Functions

#### ``removeAllMapTriggers()``
Remove all triggers, used in stock maps to prevent trigger conflicts.

Usage Example:
```c
removeAllMapTriggers();
```
<hr>

#### ``createLobbyArea(ent)``
Add a brush/trigger to a list of entities that will be deleted when the game starts.

Usage Example:
```c
createLobbyArea(ent);
```
<hr>

#### ``removeAllSpawns()``
Remove all stock spawns, used in stock maps to control the lobby area.

Usage Example:
```c
removeAllSpawns();
```
<hr>

#### ``createSpawn(coord, angle)``
Create a master spawn for the lobby area.

Usage Example:
```c
createSpawn((0, 0, 0), 90);
```
<hr>

#### ``createDropTrigger(coord, radius)``
Create a trigger for the plane dropping area.

Usage Example:
```c
createDropTrigger((0, 0, 1000), 5000);
```
<hr>

#### ``createZone(coord)``
Add coords to the list of final zone areas.

Usage Example:
```c
createZone((0, 0, 0));
```
<hr>

#### ``setLastEjectCoord(coord)``
Set the default plane dropping coordinates, if someone afk or gets stuck.

Usage Example:
```c
setLastEjectCoord((0, 0, 1000));
```
<hr>

#### ``createPlanePath(start_coord, end_coord, angle)``
Add coordinates to the plane path list.

Usage Example:
```c
createPlanePath((-1000, 0, 1000), (1000, 0, 1000), 90);
```
<hr>

#### ``createAssetEntity(ent_name, model, coord)``
Spawn a BR asset entity at the specified coordinates. \
-model: xmodel id

Usage Example:
```c
createAssetEntity("mag_m16", "weapon_m16_mp", (0, 0, 0));
```
<hr>

#### ``createWeapon(ent, sound, hud_icon, weapon, rng)``
Create a weapon entity from a BR asset entity.

**Parameters:** 
* ent: BR asset id 
* sound: pickup sound allias. 
* hud_icon: weapon icon material. 
* weapon: weapon id 
* rng: integer from 1 to 10 (higher = rare)

Usage Example:
```c
createWeapon("mag_m16", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
```
<hr>

#### ``createAmmo(ent, sound, hud_icon, count, rng)``
Create a ammo entity from a BR asset entity.

**Parameters:**
* ent: BR asset id 
* sound: pickup sound allias. 
* hud_icon: ammo icon material.
* count: clip size.
* rng: integer from 1 to 10 (higher = rare)

Usage Example:
```c
createAmmo("mag_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
```
<hr>

#### ``createSpecial(ent, sound, hud_icon, weapon, rng)``
Create a special entity from a BR asset entity.

**Parameters:**
* ent: BR asset id
* sound: pickup sound allias.
* hud_icon: special icon material.
* weapon: weapon / special id
* rng: integer from 1 to 10 (higher = rare)

Usage Example:
```c
createSpecial("mag_frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
```

## Instructions
In order to use this mod, just download the archived file down below and extract it to the cod4's ``/mods/battleroyale`` directory. Then start the ``makeIWD.bat`` to build the IWDs and the ``makeMod.bat`` to build the mod.ff.

### **[Download](https://github.com/Iswenzz/CoD4-Battleroyale/releases)**

## Building (Windows)
_Pre-Requisites:_
1. [CoD4 Mod Tools](https://www.moddb.com/games/call-of-duty-4-modern-warfare/downloads/mod-tools-sdk)

## Contributors:
***Note:*** If you would like to contribute to this repository, feel free to send a pull request, and I will review your code. Also feel free to post about any problems that may arise in the issues section of the repository.

<a href="https://github.com/SheepWizard"><img src="https://avatars3.githubusercontent.com/u/8878844?s=100&v=4" height=64 style="border-radius: 50%"></a>
<a href="https://github.com/DavidMRyan"><img src="https://avatars2.githubusercontent.com/u/39206040?s=460&v=4" height=64 style="border-radius: 50%"></a>
<a href="https://github.com/CoteArthur"><img src="https://avatars3.githubusercontent.com/u/57949230?s=460&u=290da1b139e2acc823bbc6db0fc5f95a411cd60a&v=4" height=64 style="border-radius: 50%"></a>
<a href="https://github.com/BraXi"><img src="https://avatars1.githubusercontent.com/u/6434152?s=460&u=875493cee09d81c6ecbf1190e7c2a9a878b0b9d8&v=4" height=64 style="border-radius: 50%"></a>
