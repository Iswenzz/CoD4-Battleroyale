# CoD4 SR BattleRoyale
<!-- Badges -->

Call of Duty 4 Battle Royale is a first-person shooter game that engages in survival, exploration and much more. It is a strong
last man standing gameplay that requires you to search for equipment and weaponary which will help you defeat enemies.
Call of Duty 4's battle royale is based off of many other games such as H1Z1, PlayerUnknown's Battlegrounds, and Fortnite!

![](https://i.imgur.com/UyDK7t6.jpg)

This mod comes with it's own custom map called, ``MP_BR_BLACKOUT``, which is designed for over 30 players. This map utilizes the entirety of the Call of Duty 4 game engine, and pushes the game to it's limits.

### **[MP_BR_BLACKOUT - Download](https://iswenzz.com:1337/fastdl/usermaps/mp_br_blackout/)**
### **[Example](https://github.com/Iswenzz/CoD4-Battleroyale/blob/master/maps/mp/mp_creek.gsc)**

## Functions

#### ``removeAllMapTriggers()``
Remove all triggers, used in stock maps to prevent trigger conflicts.

Usage Example:
```c
removeAllMapTriggers();
```
<hr>


#### ``removeAllSpawns()``
Remove all stock spawns, used in stock maps to control the lobby area.

Usage Example:
```c
removeAllSpawns();
```
<hr>

#### ``createSpawn(origin, angle)``
Create a spawn for the lobby area.

Usage Example:
```c
createSpawn((0, 0, 0), 90);
```
<hr>

#### ``createLobbyBlocker(origin, width, height)``
Add a blocker that will be deleted when the game starts.

Usage Example:
```c
createLobbyBlocker((100, 200, 300), 200, 300);
```
<hr>

#### ``createPlanePath(start, end, angle)``
Add a path to the plane paths.

Usage Example:
```c
createPlanePath((-1000, 0, 1000), (1000, 0, 1000), 90);
```
<hr>

#### ``createPlaneDrop(origin)``
Add the default plane dropping origin, if someone afk or gets stuck.

Usage Example:
```c
createPlaneDrop((0, 0, 1000));
```
<hr>

#### ``createPlaneDropTrigger(origin, radius)``
Add a trigger for the plane dropping area where you can press F to drop.

Usage Example:
```c
createPlaneDropTrigger((0, 0, 1000), 5000);
```
<hr>

#### ``createPlaneDuration(seconds)``
Sets the plane path duration.

Usage Example:
```c
createPlaneDuration(60);
```
<hr>

#### ``createZone(origin)``
Add origins to the list of final zones.

Usage Example:
```c
createZone((0, 0, 0));
```
<hr>

#### ``createZoneLevels(levels)``
Defines the level size for the current map.

Usage Example:
```c
createZoneLevels(4);
```
<hr>

#### ``createEntity(id, origin)``
Spawn a battleroyale entity at the specified origin.

Usage Example:
```c
createEntity("m16", (0, 0, 0));
```
<hr>

#### ``createWeapon(id, mag, model, sound, icon, weapon, rng)``
Create a weapon.

**Parameters:**
* id: Weapon id.
* mag: Weapon mag id.
* model: Weapon model.
* sound: Pickup sound allias.
* icon: Icon material.
* weapon: Weapon item id.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
createWeapon("m16", "5_45", "weapon_m16_mp", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
```
<hr>

#### ``createAmmo(id, model, sound, icon, count, rng)``
Create ammo.

**Parameters:**
* id: Ammo id.
* model: Ammo model.
* sound: Pickup sound allias.
* icon: Icon material.
* count: Clip size.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
createAmmo("5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
```
<hr>

#### ``createGrenade(id, model, sound, icon, weapon, rng)``
Create a grenade.

**Parameters:**
* id: Grenade id.
* model: Grenade model.
* sound: Pickup sound allias.
* icon: Icon material.
* weapon: Weapon item id.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
createGrenade("frag_grenade", "weapon_m67_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
```

#### ``createSpecial(id, model, sound, icon, rng)``
Create a special.

**Parameters:**
* id: Special id.
* model: Special model.
* sound: Pickup sound allias.
* icon: Icon material.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", level.RNG_NORMAL);
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
