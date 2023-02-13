main()
{
	precache();
	precacheText();
	precacheFx();

	maps\mp\gametypes\_hud::init();
	maps\mp\gametypes\_hud_message::init();
	maps\mp\gametypes\_damagefeedback::init();
	maps\mp\gametypes\_clientids::init();
	maps\mp\gametypes\_gameobjects::init();
	maps\mp\gametypes\_spawnlogic::init();
	maps\mp\gametypes\_oldschool::deletePickups();
	maps\mp\gametypes\_quickmessages::init();
	maps\mp\_weapons::init();
	maps\mp\_killcam::init();

	battleroyale\sys\_dvar::initDvars();
	battleroyale\sys\_events::initEvents();

	battleroyale\game\_match::main();
	battleroyale\game\_zone::main();
	battleroyale\game\_map::main();
	battleroyale\game\_menus::main();
	battleroyale\game\_plane::main();
	battleroyale\game\_scoreboard::main();
	battleroyale\game\_rank::initRank();
	battleroyale\game\_teams::main();
	battleroyale\game\_poll::initPoll();
	battleroyale\game\_hitmarker::main();

	battleroyale\player\_weapons::main();
	battleroyale\player\huds\_health::main();
	battleroyale\player\huds\_hint::main();
	battleroyale\player\huds\_inventory::main();
	battleroyale\player\huds\_loading::main();
	battleroyale\player\huds\_players::main();
}

precache()
{
	level.items = [];
	level.assets = [];
	level.texts = [];
	level.gfx = [];

	level.RNG_EMPTY = 0;
	level.RNG_SMALL = 1;
	level.RNG_NORMAL = 3;
	level.RNG_BIG = 5;
	level.RNG_RARE = 6;

	precacheModel("german_sheperd_dog");
	precacheModel("vehicle_ac130_low");
	precacheModel("viewmodel_hands_zombie");
	precacheModel("tag_origin");
	precacheModel("body_mp_usmc_cqb");
	precacheModel("collision_sphere");
	precacheModel("mil_frame_charge");
	precacheModel("sr_parachute");
	precacheModel("sr_zonetrig_40k");
	precacheModel("sr_zonetrig_20k");
	precacheModel("sr_zonetrig_10k");
	precacheModel("sr_zonetrig_5k");
	precacheModel("sr_zonetrig_2k5");
	precacheModel("sr_zonetrig_250_red");
	precacheModel("sr_5_45");
	precacheModel("sr_7_62");
	precacheModel("sr_45");
	precacheModel("sr_gauge");
	precacheModel("sr_9mm");
	precacheModel("sr_bandage");
	precacheModel("sr_first_kit");

	precacheShader("black");
	precacheShader("white");
	precacheShader("killiconsuicide");
	precacheShader("killiconmelee");
	precacheShader("killiconheadshot");
	precacheShader("killiconfalling");
	precacheShader("stance_stand");
	precacheShader("hudstopwatch");
	precacheShader("score_icon");
	precacheShader("vip_status");
	precacheShader("vip_gold");
	precacheShader("sr_dead");
	precacheShader("sr_grenade");
	precacheShader("sr_flash");
	precacheShader("sr_smoke");
	precacheShader("sr_kit");
	precacheShader("sr_band");
	precacheShader("sr_mag_5_56");
	precacheShader("sr_mag_7_62");
	precacheShader("sr_mag_12_gauge");
	precacheShader("sr_mag_45");
	precacheShader("sr_mag_9mm");
	precacheShader("hud_icon_grenade");
	precacheShader("hud_icon_flash");
	precacheShader("hud_icon_smoke");
	precacheShader("hud_icon_kit");
	precacheShader("hud_icon_band");
	precacheShader("hud_icon_mag_5_56");
	precacheShader("hud_icon_mag_7_62");
	precacheShader("hud_icon_mag_12_gauge");
	precacheShader("hud_icon_mag_45");
	precacheShader("hud_icon_mag_9mm");
	precacheShader("hud_icon_30cal");
	precacheShader("hud_icon_357");
	precacheShader("hud_icon_40mm_grenade");
	precacheShader("hud_icon_40mm_grenade_mp");
	precacheShader("hud_icon_44");
	precacheShader("hud_icon_ak47");
	precacheShader("hud_icon_ak47_gp25");
	precacheShader("hud_icon_ak74u");
	precacheShader("hud_icon_artillery");
	precacheShader("hud_icon_at4");
	precacheShader("hud_icon_barrett50cal");
	precacheShader("hud_icon_benelli_m4");
	precacheShader("hud_icon_c4");
	precacheShader("hud_icon_claymore");
	precacheShader("hud_icon_cobra");
	precacheShader("hud_icon_colt_45");
	precacheShader("hud_icon_desert_eagle");
	precacheShader("hud_icon_desert_eagle_gold");
	precacheShader("hud_icon_dragunov");
	precacheShader("hud_icon_g3");
	precacheShader("hud_icon_g36c");
	precacheShader("hud_icon_g36c_mp");
	precacheShader("hud_icon_javelin");
	precacheShader("hud_icon_m14");
	precacheShader("hud_icon_m14_scoped");
	precacheShader("hud_icon_m16a4");
	precacheShader("hud_icon_m16a4_grenade");
	precacheShader("hud_icon_m249saw");
	precacheShader("hud_icon_m249saw_mounted");
	precacheShader("hud_icon_m40a3");
	precacheShader("hud_icon_m4carbine");
	precacheShader("hud_icon_m4m203_silencer");
	precacheShader("hud_icon_m4_grenadier");
	precacheShader("hud_icon_m4_grunt");
	precacheShader("hud_icon_m4_silencer");
	precacheShader("hud_icon_m60e4");
	precacheShader("hud_icon_m9beretta");
	precacheShader("hud_icon_minigun");
	precacheShader("hud_icon_mini_uzi");
	precacheShader("hud_icon_mp44");
	precacheShader("hud_icon_mp5");
	precacheShader("hud_icon_mp5_silencer");
	precacheShader("hud_icon_nvg");
	precacheShader("hud_icon_p90");
	precacheShader("hud_icon_pistol");
	precacheShader("hud_icon_remington700");
	precacheShader("hud_icon_rpd");
	precacheShader("hud_icon_rpg");
	precacheShader("hud_icon_rpg_dpad");
	precacheShader("hud_icon_shotgun");
	precacheShader("hud_icon_skorpian");
	precacheShader("hud_icon_sniperrifle");
	precacheShader("hud_icon_stinger");
	precacheShader("hud_icon_usp_45");
	precacheShader("hud_icon_winchester_1200");

	precacheShellShock("flashbang");
	precacheShellShock("death");

	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");
	precacheHeadIcon("headicon_admin");

	precacheModel("weapon_beretta");
	precacheModel("weapon_colt45");
	precacheModel("weapon_deserteagle");
	precacheModel("weapon_dragunov");
	precacheModel("weapon_m16");
	precacheModel("weapon_ak47");
	precacheModel("weapon_mp44");
	precacheModel("weapon_mp5");
	precacheModel("weapon_m1014");
	precacheModel("weapon_winchester1200");
	precacheModel("weapon_m84_flashbang_grenade");
	precacheModel("weapon_us_smoke_grenade");
	precacheModel("weapon_m67_grenade");

	precacheItem("dog_mp");
	precacheItem("beretta_mp");
	precacheItem("colt45_mp");
	precacheItem("deserteagle_mp");
	precacheItem("dragunov_mp");
	precacheItem("m16_mp");
	precacheItem("ak47_mp");
	precacheItem("mp44_mp");
	precacheItem("mp5_mp");
	precacheItem("m1014_mp");
	precacheItem("winchester1200_mp");
	precacheItem("flash_grenade_mp");
	precacheItem("smoke_grenade_mp");
	precacheItem("frag_grenade_mp");
}

precacheText()
{
	level.texts["empty"] 				= &"";
	level.texts["round_begins_in"] 		= &"ROUND_BEGINS_IN";
	level.texts["waiting_for_players"] 	= &"WAITING_FOR_PLAYERS";
	level.texts["time"] 				= &"^2&&1";
	level.texts["ended_game"]			= &"MP_HOST_ENDED_GAME";
	level.texts["endgame"]				= &"MP_HOST_ENDGAME_RESPONSE";
}

precacheFx()
{
	level.gfx["endgame"] = loadFx("battleroyale/endgame_fx");
	level.gfx["gib_splat"] = loadFx("battleroyale/gib_splat");
}
