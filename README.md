# CoD4 SR BattleRoyale

The popular battle royale gamemode from other games such as Player Unknown's Battlegounds, Fortnite, H1Z1, recreated on Call of Duty 4!

![](https://i.imgur.com/UyDK7t6.jpg)

This mod comes with it's own custom map, called ``MP_BR_BLACKOUT``, designed for 30+ players. This map utilizes the entirety of the Call of Duty 4 game engine, and pushes the game to it's limits.

### [MP_BR_BLACKOUT - Download](https://iswenzz.com:1337/fastdl/usermaps/mp_br_blackout/)

# Callbacks

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
    // TODO
}
```

### [Map code example](https://github.com/Iswenzz/CoD4-Battleroyale/blob/master/maps/mp/mp_creek.gsc)

# Functions
```c
removeAllMapTriggers()
```
Remove all triggers, used in stock maps to prevent trigger conflicts.

```c
createLobbyArea(ent)
```
Add a brush/trigger to a list of entities that will be deleted when the game starts.

```c
removeAllSpawns()
```
Remove all stock spawns, used in stock maps to control the lobby area.

```c
// example: createSpawn((0, 0, 0), 90)
createSpawn(coord, angle)
```
Create a master spawn for the lobby area.

```c
// example: createDropTrigger((0, 0, 1000), 5000)
createDropTrigger(coord, radius)
```
Create a trigger for the plane dropping area.

```c
// example: createZone((0, 0, 0))
createZone(coord)
```
Add coords to the list of final zone areas.

```c
// example: setLastEjectCoord((0, 0, 1000))
setLastEjectCoord(coord)
```
Set the default plane dropping coordinates, if someone afk or gets stuck.

```c
// example: createPlanePath((-1000, 0, 1000), (1000, 0, 1000), 90)
createPlanePath(start_coord, end_coord, angle)
```
Add coordinates to the plane path list.

```c
// example: createAssetEntity("mag_m16", "weapon_m16_mp", (0, 0, 0))
createAssetEntity(ent_name, model, coord)
```
Spawn a BR asset entity at the specified coordinates. \
-model: xmodel id

```c
// example: createWeapon("mag_m16", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL)
createWeapon(ent, sound, hud_icon, weapon, rng)
```
Create a weapon entity from a BR asset entity. \
-ent: BR asset id \
-sound: pickup sound allias. \
-hud_icon: weapon icon material. \
-weapon: weapon id \
-rng: integer from 1 to 10 (higher = rare)

```c
// example: createAmmo("mag_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL)
createAmmo(ent, sound, hud_icon, count, rng)
```
Create a ammo entity from a BR asset entity. \
-ent: BR asset id \
-sound: pickup sound allias. \
-hud_icon: ammo icon material. \
-count: clip size. \
-rng: integer from 1 to 10 (higher = rare)

```c
// example: createSpecial("mag_frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL)
createSpecial(ent, sound, hud_icon, weapon, rng)
```
Create a special entity from a BR asset entity. \
-ent: BR asset id \
-sound: pickup sound allias. \
-hud_icon: special icon material. \
-weapon: weapon / special id \
-rng: integer from 1 to 10 (higher = rare)

# Credits
#### Mod & Map: Iswenzz

#### Additional Help: NitroFire, SuX AyPire, Easy, BraXi
