from typing import Dict, List, Tuple


RNG_NONE = 0
RNG_SMALL = 1
RNG_NORMAL = 2
RNG_BIG = 3
RNG_RARE = 5

list: Dict[str, List[Tuple[str, int]]] = {
    "weapons": [
        ("beretta", RNG_SMALL),
        ("colt45", RNG_SMALL),
        ("usp", RNG_SMALL),
        ("deserteagle", RNG_SMALL),
        ("deserteaglegold", RNG_SMALL),
        ("dragunov", RNG_BIG),
        ("m16", RNG_NORMAL),
        ("ak47", RNG_NORMAL),
        ("mp44", RNG_NORMAL),
        ("mp5", RNG_NORMAL),
        ("m1014", RNG_NORMAL),
        ("winchester1200", RNG_NORMAL),
        ("m4", RNG_NORMAL),
        ("g3", RNG_NORMAL),
        ("g36c", RNG_NORMAL),
        ("m14", RNG_NORMAL),
        ("skorpion", RNG_NORMAL),
        ("uzi", RNG_NORMAL),
        ("ak74u", RNG_NORMAL),
        ("p90", RNG_NORMAL),
        ("saw", RNG_BIG),
        ("rpd", RNG_BIG),
        ("m60e4", RNG_BIG),
        ("m40a3", RNG_BIG),
        ("remington700", RNG_BIG),
        ("m21", RNG_BIG),
        ("rpg", RNG_BIG),
        ("at4", RNG_BIG),
    ],
    "ammos": [
        ("45", RNG_NORMAL),
        ("9mm", RNG_NORMAL),
        ("7_62", RNG_NORMAL),
        ("5_45", RNG_NORMAL),
        ("12_gauge", RNG_NORMAL),
        ("rocket", RNG_BIG),
    ],
    "grenades": [
        ("flash_grenade", RNG_NORMAL),
        ("smoke_grenade", RNG_SMALL),
        ("frag_grenade", RNG_SMALL),
    ],
    "specials": [("bandage", RNG_SMALL), ("first_kit", RNG_NORMAL)],
}
