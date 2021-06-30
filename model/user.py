from dataclasses import dataclass, fields


@dataclass
class RUser():
    username: str
    password: str

    def __post_init__(self):
        for field in fields(self):
            if getattr(self, field.name) is None:
                raise ValueError(f'field {field.name} cannot be None')
