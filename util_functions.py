

from types import FunctionType
from typing import Iterable, List
import itertools as it


class UtilFunctions():

    def flatmap(self, f: FunctionType, items: Iterable) -> List:
        return list(it.chain.from_iterable(map(f, items)))
