from typing import Tuple, List, Dict

import sys
import random

weapons = [("mag_beretta", "weapon_beretta"), ("mag_colt45", "weapon_colt1911_black"), 
		   ("mag_deserteagle", "weapon_desert_eagle_silver"), ("mag_dragunov", "weapon_dragunov"), 
		   ("mag_m16", "weapon_m16_mp"), ("mag_ak47", "weapon_ak47"), ("mag_mp44", "weapon_mp44"), 
		   ("mag_mp5", "weapon_mp5"), ("mag_m1014", "weapon_benelli_super_90"), 
		   ("mag_winchester1200", "weapon_winchest1200")]

ammos = [("mag_45", "sr_45"), ("mag_9mm", "sr_9mm"), ("mag_7_62", "sr_7_62"), 
		 ("mag_5_45", "sr_5_45"), ("mag_12_gauge", "sr_gauge")]

specials = [("mag_flash_grenade", "weapon_m84_flashbang_grenade"), 
			("mag_smoke_grenade", "weapon_us_smoke_grenade"), ("mag_bandage", "sr_bandage"), 
			("mag_first_kit", "sr_first_kit"), ("mag_frag_grenade", "weapon_m67_grenade")]

asset_list = [weapons, ammos, specials]

def getCoords() -> List[str]:
	coords_path = sys.argv[1] if len(sys.argv) > 1 else "./coords.c"
	with open(coords_path, "r") as f:
		coord_lines = f.readlines()

	coords = []
	for coord in coord_lines:
		if not coord.startswith("("):
			continue
		elif coord not in coords:
			coords.append(coord.strip())
	return coords


def randomizeType():
	if random.randint(1, 100) <= 30:
		return 0
	elif random.randint(1, 100) <= 50:
		return 1
	else:
		return 2


def randomizeAssets(coords: List[str]) -> Dict[Tuple[str, str], str]:
	rng_coords = dict()
	for asset in asset_list:
		for tupl in asset:
			rng_coords[tupl] = []

	for coord in coords:
		asset = asset_list[randomizeType()]
		asset_tuple = asset[random.randint(0, len(asset) - 1)]
		rng_coords[asset_tuple].append("%s[%d] = %s" % (asset_tuple[0], len(rng_coords[asset_tuple]), coord))
	return rng_coords


def automateGsc() -> List[str]:
	rng_coords = randomizeAssets(getCoords())
	lines = []
	for key, value in rng_coords.items():
		lines.append("%s = [];" % key[0])
		for coord in value:
			lines.append(coord)
		lines.append("""for (i = 0; i < %s.size; i++)
	battleroyale\_auto::createAssetEntity("%s", "%s", %s[i]);
""" % (key[0], key[0], key[1], key[0]))
	return lines


def main():
	lines = automateGsc()
	for line in lines:
		print(line)
	
	output_path = sys.argv[2] if len(sys.argv) > 2 else "./coords_random.c"
	with open(output_path, "w") as f:
		for line in lines:
			f.write(line + "\n")
	

if __name__ == "__main__":
	main()
