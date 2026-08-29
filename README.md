# <img src="media/logo.png" width="25" height="25"> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #fff;">|</span> <span style="color: #231f20;">M</span><span style="color: #ffffff;">orrow</span><span style="color: #231f20;">i</span><span style="color: #ffffff;">nd </span><span style="color: #231f20;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #231f20;">U</span><span style="color: #ffffff;">p</span><span style="color: #231f20;">!</span>

![MRLU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #231f20;">🎯 Overview</span>

**Morrowind Level-Up! (MRLU)** replaces World of Warcraft's configured default level-up sound with a Morrowind-inspired chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Kwama forager! Bwwiiiee."</span>

***

## <span style="color: #231f20;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Morrowind sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #231f20;">✨ Behavior and Features</span>

- Plays the selected Morrowind-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while MRLU is enabled.
- Persists enablement and sound-variant choices in `MRLUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.

MRLU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #231f20;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `MorrowindLevelUp.toc` | `120007` |
| Wrath Classic | `MorrowindLevelUp_Wrath.toc` | `30403` |
| Burning Crusade Classic | `MorrowindLevelUp_TBC.toc` | `20504` |
| Classic Era | `MorrowindLevelUp_Vanilla.toc` | `11500` |

These values describe the preserved release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #231f20;">📥 Installation</span>

1. Download a packaged release of MorrowindLevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `MorrowindLevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Morrowind Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #231f20;">⌨️ Usage and Configuration</span>

MRLU works automatically once enabled. It has no graphical configuration panel; use `/mrlu` commands in chat:

| Command | Result |
|---|---|
| `/mrlu` or `/mrlu help` | List available commands. |
| `/mrlu test` | Play the selected sound variant. |
| `/mrlu enable` | Enable replacement playback. |
| `/mrlu disable` | Disable replacement playback. |
| `/mrlu high` | Select the high-quality file. |
| `/mrlu med` or `/mrlu medium` | Select the medium-quality file. |
| `/mrlu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `MRLUSettings`.

***

## <span style="color: #231f20;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/mrlu` command.
- `sounds/morrowind_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, MRLU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #231f20;">🛠️ Troubleshooting</span>

- If WoW marks MRLU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/mrlu test`, then `/mrlu enable` and select a variant again.
- If the default sound also plays, verify that MRLU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/MorrowindLevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #231f20;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/MorrowindLevelUp)
- [Releases](https://github.com/RGXMods/MorrowindLevelUp/releases)
- [Issues](https://github.com/RGXMods/MorrowindLevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
