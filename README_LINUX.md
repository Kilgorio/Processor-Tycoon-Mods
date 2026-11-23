# Processor Tycoon Mod Pack — Linux & Steam Deck Guide

All **11 mods** in this pack are compiled as platform-independent `.NET / Mono` (`net472` AnyCPU) assemblies and run identically on **Linux (Native & Proton)** and **Steam Deck**.

---

## Option A: Steam / Proton (including Steam Deck) — *Most Common*

1. **Install BepInEx 5 (x64 Windows build)** into your Processor Tycoon folder:
   - Download `BepInEx_win_x64_5.4.x.zip` from [github.com/BepInEx/BepInEx/releases](https://github.com/BepInEx/BepInEx/releases).
   - Extract it into your Processor Tycoon root folder (the folder containing `Processor Tycoon Beta.exe`, usually `~/.local/share/Steam/steamapps/common/Processor Tycoon/`).
2. **Set Steam Launch Options** (CRITICAL for Proton/Wine to load `winhttp.dll`):
   - In Steam: Right-click **Processor Tycoon** → **Properties** → **General** → **Launch Options**:
     ```bash
     WINEDLLOVERRIDES="winhttp=n,b" %command%
     ```
3. **Install the Mod Pack:**
   - **Automatic:** Extract this archive and run:
     ```bash
     chmod +x install_linux.sh
     ./install_linux.sh
     ```
     *(Or pass a custom path: `./install_linux.sh "/path/to/Processor Tycoon"`)*
   - **Manual:** Copy the `BepInEx` folder from this archive into your Processor Tycoon root folder (merging with `BepInEx/`).
4. **Launch the game!** Press **`F8`** (or click the Mod Menu taskbar icon) in-game to configure all mods live.

---

## Option B: Native Linux Build of Processor Tycoon

1. **Install BepInEx 5 (Linux x64 build):**
   - Download `BepInEx_linux_x64_5.4.x.zip` from [github.com/BepInEx/BepInEx/releases](https://github.com/BepInEx/BepInEx/releases).
   - Extract it into your Processor Tycoon root folder.
   - Make `run_bepinex.sh` executable:
     ```bash
     chmod +x run_bepinex.sh
     ```
   - Edit `run_bepinex.sh` and set `executable_name=""` to the Linux binary name (e.g. `executable_name="Processor Tycoon Beta.x86_64"`).
2. **Set Steam Launch Options (if launched via Steam):**
   ```bash
   ./run_bepinex.sh %command%
   ```
3. **Install the Mod Pack:** Run `./install_linux.sh` or copy `BepInEx/` into your game root folder.

---

## Notes & Troubleshooting on Linux
- **Mods not loading on Proton?** Make sure `WINEDLLOVERRIDES="winhttp=n,b" %command%` is set in Steam Launch Options and `winhttp.dll` is in the same folder as `Processor Tycoon Beta.exe`.
- **Check logs:** After launching, check `<GameFolder>/BepInEx/LogOutput.log` to verify all 11 plugins loaded.
- **Dependencies:** If you remove individual mods from `BepInEx/plugins/`, keep **`PTModdingAPI`** if you use `PTCoolerDesigner`, `PTMotherboardDesigner`, or `PTFabTech`.
- **Config files:** Stored in `<GameFolder>/BepInEx/config/` (and all editable live via `PTModMenu`).
