"""Location-independent launcher for Cube Physics Engine."""

from __future__ import annotations

import sys
from pathlib import Path


PROJECT_DIRECTORY = Path(__file__).resolve().parent
if str(PROJECT_DIRECTORY) not in sys.path:
    sys.path.insert(0, str(PROJECT_DIRECTORY))

from cpe.demo import main


if __name__ == "__main__":
    raise SystemExit(main())
