from dataclasses import dataclass, fields
from typing import List


@dataclass
class RCharacter():
    name: str
    race: str
    cclass: str
    server: str
    spec: str
    level: int
    ilvl: int
    user: int

    def __repr__(self) -> str:
        return {
            "name": self.name,
            "race": self.race,
            "class": self.cclass,
            "server": self.server,
            "spec": self.spec,
            "level": self.level,
            "ilvl": self.ilvl,
            "user": self.user,
        }

    def __post_init__(self):
        for field in fields(self):
            if getattr(self, field.name) is None:
                raise ValueError(f'field {field.name} cannot be None')
