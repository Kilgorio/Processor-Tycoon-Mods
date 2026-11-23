#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_PLUGINS="$SCRIPT_DIR/BepInEx/plugins"

if [[ ! -d "$SRC_PLUGINS" ]]; then
  echo "Error: Could not find '$SRC_PLUGINS'. Run this script from the extracted mod pack folder."
  exit 1
fi

GAME_DIR="${1:-}"

if [[ -z "$GAME_DIR" ]]; then
  CANDIDATES=(
    "$HOME/.local/share/Steam/steamapps/common/Processor Tycoon"
    "$HOME/.steam/steam/steamapps/common/Processor Tycoon"
    "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Processor Tycoon"
    "$HOME/Games/Processor Tycoon"
  )
  for dir in "${CANDIDATES[@]}"; do
    if [[ -d "$dir" ]]; then
      GAME_DIR="$dir"
      break
    fi
  done
fi

if [[ -z "$GAME_DIR" || ! -d "$GAME_DIR" ]]; then
  echo "Could not auto-detect your Processor Tycoon folder."
  read -r -p "Enter full path to your Processor Tycoon game folder: " GAME_DIR
  GAME_DIR="${GAME_DIR/#\~/$HOME}"
fi

if [[ ! -d "$GAME_DIR" ]]; then
  echo "Error: Directory does not exist: $GAME_DIR"
  exit 1
fi

echo "Installing 11 Processor Tycoon mods into: $GAME_DIR/BepInEx/plugins"
mkdir -p "$GAME_DIR/BepInEx/plugins"
cp -r "$SRC_PLUGINS"/. "$GAME_DIR/BepInEx/plugins/"

echo ""
echo "Installed mods:"
ls -1 "$SRC_PLUGINS"

echo ""
if [[ -f "$GAME_DIR/winhttp.dll" ]]; then
  echo "[OK] BepInEx (Windows/Proton) detected."
  echo "Make sure your Steam Launch Options are set to:"
  echo '  WINEDLLOVERRIDES="winhttp=n,b" %command%'
elif [[ -f "$GAME_DIR/run_bepinex.sh" ]]; then
  echo "[OK] BepInEx (Native Linux) detected."
  chmod +x "$GAME_DIR/run_bepinex.sh" || true
  echo "Make sure your Steam Launch Options are set to:"
  echo '  ./run_bepinex.sh %command%'
else
  echo "[WARNING] BepInEx 5 was not detected in '$GAME_DIR'."
  echo "Download BepInEx 5.4.x from https://github.com/BepInEx/BepInEx/releases"
  echo "and extract it into '$GAME_DIR' before launching the game."
  echo "See README_LINUX.md for full Proton / Native Linux instructions."
fi

echo ""
echo "Done!"
