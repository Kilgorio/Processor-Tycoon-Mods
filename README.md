# Processor Tycoon — Mod Pack & Tutorial

A collection of **11 BepInEx 5 mods** for **Processor Tycoon** expanding hardware design, ISA evolution, silicon binning, fab tech, quality-of-life, performance, and desktop customization.

---

## Included Mods (11)

| Mod | Requires | What It Does |
| --- | --- | --- |
| **PTModdingAPI** | — | Core shared API (custom hardware menus, research tabs, save/load persistence, JSON custom tech loader). **Required** by `PTCoolerDesigner`, `PTMotherboardDesigner`, and `PTFabTech`. |
| **PTModMenu** | — | In-game Mod Manager & live config editor. Toggle mods on/off and tweak settings live without restarting. |
| **DynamicISA** | — | Design & evolve custom Instruction Set Architectures (ISAs), research the **ISA Tree**, manage licensing/royalties, and run a dynamic per-market ISA preference simulation. |
| **PTCoolerDesigner** | `PTModdingAPI` | Design custom CPU coolers, research the **Cooling** tech tree, and attach coolers to CPUs in CPU Creation. |
| **PTMotherboardDesigner** | `PTModdingAPI` | Design custom Reference Platforms / Motherboards (memory channels, VRM phases, chipset features), research the **Platform** tech tree, and pair them with CPUs. |
| **PTFabTech** | `PTModdingAPI` | Adds the **Fab Tech** research tree (lithography, cleanroom, wafer throughput, multi-die packaging, node yield upgrades). |
| **CPUBinning** | — | Enables silicon binning — harvest High-Bin or salvage defective dies into separate SKU variants. |
| **PTCopyCPU** | — | Adds a **Copy CPU** button in the Inspector window to clone any existing CPU's specs into CPU Creation. |
| **PTQuickRetire** | — | Adds a red **`X`** 1-click retire button next to the pencil icon on Production and Side Window CPU cards (with a 2-click safety guard if retiring would trigger contract fines). |
| **PTOptimizer** | — | Speeds up daily market/AI/UI ticks and adds a toggleable FPS & tick-time HUD in the top-right corner. |
| **PTLiquidWallpaper** | — | Interactive Navier-Stokes fluid simulation live wallpaper on the in-game PC desktop (with color presets, rainbow mode, and automatic 0% CPU idle sleep). |

---

## Part 1: How to Install (Players)

### Prerequisites
1. **Processor Tycoon** installed.
2. **BepInEx 5.x (x64)** installed in your Processor Tycoon folder:
   - Download **BepInEx 5.4.x (win_x64)** from [github.com/BepInEx/BepInEx/releases](https://github.com/BepInEx/BepInEx/releases).
   - Extract the BepInEx zip into your game root folder (the folder containing `Processor Tycoon Beta.exe` and `UnityPlayer.dll`).
   - Launch the game once and close it so BepInEx initializes its `BepInEx/plugins` and `BepInEx/config` folders.

### Installing the Mod Pack
1. Open **`ProcessorTycoon_ModPack_Mods.zip`**.
2. Drag and drop the **`BepInEx`** folder straight into your **Processor Tycoon** root folder (merge folders if prompted).
3. Launch the game!

> **Picking individual mods:** You can delete any mod subfolder under `BepInEx/plugins/` that you don't want. Just keep **`PTModdingAPI`** if you use `PTCoolerDesigner`, `PTMotherboardDesigner`, or `PTFabTech`.

---

## Part 2: How to Use Each Mod In-Game

### 1. In-Game Mod Menu (`PTModMenu`)
- Open the **Mod Menu** from the taskbar icon (or press **`F8`**).
- Every mod in this pack supports **live config editing** — you can enable/disable mods, change colors, toggle safety guards, and tune physics/balance while playing without restarting.

### 2. Research Trees (`DynamicISA`, `PTCoolerDesigner`, `PTFabTech`, `PTMotherboardDesigner`)
- Open the **Research** window on your desktop.
- Along the top bar, you'll see new tabs next to vanilla **CPU Tech**:
  - **ISA Tree:** Unlock microarchitecture & instruction set features (pipelining, superscalar, OoO, 64-bit, SIMD, virtualization, etc.) that you can build into custom ISAs.
  - **Cooling:** Unlock advanced thermal solutions (heatpipes, vapor chambers, AIO liquid cooling, etc.) for `PTCoolerDesigner`.
  - **Fab Tech:** Unlock wafer stepper/lithography, CMP, 300mm FOUP, immersion, interposers, and yield/throughput multipliers.
  - **Platform:** Unlock memory channels, VRM topologies, and motherboard technologies for `PTMotherboardDesigner`.
- All mod research progress, custom coolers, and reference platforms **automatically save and load** with your game save file.

### 3. Creating Custom Hardware
- Open **Create New Hardware**:
  - **New / Evolve ISA** (`DynamicISA`): Design a brand-new ISA or evolve an existing one with unlocked ISA Tree features, set licensing (Open / Licensed / Proprietary), and target markets.
  - **New Cooler** (`PTCoolerDesigner`): Design custom coolers and select them using the bottom bar in **CPU Creation**.
  - **New Reference Platform** (`PTMotherboardDesigner`): Design custom motherboards/platforms and select them using the bottom bar in **CPU Creation**.
  - **New CPU Variant** (`CPUBinning`): Create binned variants (High-Bin / Salvage) from existing CPUs.

### 4. Quality of Life (`PTCopyCPU`, `PTQuickRetire`, `PTOptimizer`)
- **Copy CPU:** Open **Inspector**, pick any CPU (yours or a competitor's), and click **Copy CPU** to load its specs directly into **CPU Creation**.
- **1-Click Retire:** Click the red **`X`** button next to the pencil icon on any of your CPU cards in **Production** or the right-hand **Side Window**.
  - If the CPU has **\$0** contract fines, it retires immediately in 1 click.
  - If the CPU has active contract fines, the **`X`** turns amber (**`!`**) and warns you — click again within 3.5 seconds to confirm.
- **Optimizer:** Runs automatically in the background. Configure the top-right FPS/tick HUD and optimization toggles in `PTModMenu`.

### 5. Liquid Desktop Wallpaper (`PTLiquidWallpaper`)
- Move your mouse or click on the in-game desktop to stir the live fluid simulation behind your icons and windows.
- Open **`PTModMenu` -> `PT Liquid Desktop Wallpaper`** to switch presets (`Cobalt`, `Cyan`, `Cyberpunk`, `Emerald`, `Sunset`, `Rainbow`), toggle `ReactThroughWindows` or `AmbientSwirl`, or tune viscosity/curl/intensity/resolution live.

---

## Part 3: Building from Source (`ProcessorTycoon_ModPack_Source.zip`)

### Requirements
- [.NET SDK](https://dotnet.microsoft.com/download) (supports building `net472` targets; .NET 6/7/8 SDK works).
- Processor Tycoon + BepInEx 5 installed locally.

### Build Steps
1. Extract **`ProcessorTycoon_ModPack_Source.zip`** into a `ModsSrc` folder (e.g., `<GameFolder>\ModsSrc\`).
2. **If your game is NOT installed at `E:\Games\Processor Tycoon`:**
   - Do a find-and-replace across all `.csproj` files in `ModsSrc/`, replacing `E:\Games\Processor Tycoon` with your actual Processor Tycoon installation path.
3. Build **`PTModdingAPI`** first (since `PTCoolerDesigner`, `PTMotherboardDesigner`, and `PTFabTech` reference `PTModdingAPI.dll`), then build any other mod:
   ```powershell
   dotnet build .\PTModdingAPI\PTModdingAPI.csproj -c Release
   dotnet build .\PTModMenu\PTModMenu.csproj -c Release
   dotnet build .\DynamicISA\DynamicISA.csproj -c Release
   dotnet build .\PTCoolerDesigner\PTCoolerDesigner.csproj -c Release
   dotnet build .\PTMotherboardDesigner\PTMotherboardDesigner.csproj -c Release
   dotnet build .\PTFabTech\PTFabTech.csproj -c Release
   dotnet build .\CPUBinning\CPUBinning.csproj -c Release
   dotnet build .\PTCopyCPU\PTCopyCPU.csproj -c Release
   dotnet build .\PTQuickRetire\PTQuickRetire.csproj -c Release
   dotnet build .\PTOptimizer\PTOptimizer.csproj -c Release
   dotnet build .\PTLiquidWallpaper\PTLiquidWallpaper.csproj -c Release
   ```
   Each `.csproj` outputs its compiled `.dll` directly into `BepInEx\plugins\<ModName>\`.

---

## Troubleshooting
- **Mods not loading?** Verify `BepInEx/LogOutput.log` exists after launching the game. If not, BepInEx 5 (x64) isn't installed in the same folder as `Processor Tycoon Beta.exe`.
- **Resetting a mod's config:** Delete its `.cfg` file in `BepInEx/config/` and restart the game to regenerate defaults.
- **Custom JSON Techs:** See `BepInEx/plugins/PTModdingAPI/CustomTech/EXAMPLE_CustomPlatformTech.json.txt` for an example of adding your own custom tech nodes without writing C#.
