#!/usr/bin/env python3
from pathlib import Path
import re

mods = {
    "no_more_dead_dogs": 2901970561,
    "guinea_pigs": 2903102268,
    "cavia": 2903304786,
}

dev_path = Path.cwd().resolve()
downloaded_mods_path = dev_path.parent

version_path = dev_path / "version.txt"
version_int = int(version_path.read_text())
version_int += 1
version_path.write_text(str(version_int))

version_major = version_int // 10000
version_minor = (version_int // 100) % 100
version_revision = version_int % 10000

version_str = f"v{version_major}"
if version_minor > 0 or version_revision > 0:
    version_str += f".{version_minor}"
if version_revision > 0:
    version_str += f".{version_revision}"

for (local_id, steam_id) in mods.items():
    mod_dev_path = dev_path / local_id
    mod_dev_info_path = mod_dev_path / "info.txt"
    mod_dev_info = mod_dev_info_path.read_text()
    mod_dev_info = re.sub(
        r"NUMERIC_VERSION:\d+\]", f"NUMERIC_VERSION:{version_int}]", mod_dev_info
    )
    mod_dev_info = re.sub(
        r"DISPLAYED_VERSION:\d+\]", f"DISPLAYED_VERSION:{version_str}]", mod_dev_info
    )
    mod_dev_info = re.sub(
        r"STEAM_CHANGELOG:\d+\]", f"STEAM_CHANGELOG:{version_str}]", mod_dev_info
    )
    mod_dev_info_path.write_text(mod_dev_info)
