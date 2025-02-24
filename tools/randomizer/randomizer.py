import os
from pathlib import Path
from random import randint, randrange, shuffle, choice
from typing import Dict, List, Tuple

import assets


class Randomize:
    path: str
    lines: List[str] = []

    assets: Dict[str, List[str]] = {}

    def __init__(self, path: str):
        """
        Initialize a new Randomize.
        """
        self.path = path
        self.assets = {
            "weapons": [],
            "ammos": [],
            "grenades": [],
            "specials": [],
        }
        self.read()
        self.randomize()
        self.save()

    def read(self):
        """
        Read the input file.
        """
        with open(self.path, "r") as input:
            lines = input.readlines()
            shuffle(lines)
            self.lines = lines

    def randomize(self):
        """
        Randomize the assets.
        """
        for line in self.lines:
            origin = line.strip().split("/")
            if len(origin) != 3:
                continue

            [type, asset] = self.getAsset()
            entry = (
                'battleroyale\game\_api::createEntity("{}", ({}, {}, {}));\n'.format(
                    asset, origin[0], origin[1], origin[2]
                )
            )
            self.assets[type].append(entry)

        self.assets = {k: sorted(v) for k, v in self.assets.items()}

    def getAssetsPercentage(self, type: str) -> int:
        """
        Get the assets percentage.
        """
        return (len(self.assets[type]) / len(self.lines)) * 100

    def getAssetType(self) -> str:
        """
        Get a random asset type.
        """
        if self.getAssetsPercentage("weapons") < 35:
            return "weapons"
        if self.getAssetsPercentage("ammos") < 30:
            return "ammos"
        if self.getAssetsPercentage("grenades") < 15:
            return "grenades"
        if self.getAssetsPercentage("specials") < 20:
            return "specials"
        keys = list(assets.list.keys())
        return keys[randrange(len(keys))]

    def getAsset(self) -> Tuple[str, str]:
        """
        Randomize the asset.
        """
        type = self.getAssetType()
        entries = assets.list[type]
        random = randint(assets.RNG_NONE, assets.RNG_RARE)
        items = [(item, chance) for [item, chance] in entries if random >= chance]
        items = entries if not len(items) else items
        [asset, _] = choice(items)
        return [type, asset]

    def save(self):
        """
        Save the randomized assets.
        """
        with open(Path("output") / os.path.basename(self.path), "w") as output:
            for entries in self.assets.values():
                if not len(entries):
                    continue
                output.writelines(entries)
                output.write("\n")


def main():
    """
    Program entry.
    """
    for filename in os.listdir("input"):
        Randomize("input/" + filename)


if __name__ == "__main__":
    main()
