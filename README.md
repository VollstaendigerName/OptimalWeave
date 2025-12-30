<img src="https://github.com/VollstaendigerName/OptimalWeave/blob/main/Images/Optimal%20Weave%20Sword_small.png" alt="OptimalWeave Logo" width="1000" height="1000" />


OptimalWeave is a Light Attack helper and Weave helper that makes timing between Light Attacks and abilities more reliable. It uses a simple skill block system to stop abilities from firing when a Light Attack is still missing, which helps prevent early or repeated casts. The addon offers several modes that range from sequential blocking to no intervention. It also supports class‑specific rules, execute checks, and optional blocking features.

Dependencies
LibAddonMenu-2.0
LibCustomMenu


Features

Weaving Assistance Modes
Sequential Mode:Only allows one spell when a light attack has been performed (ideal for learning)
Strict Mode: Blocks all abilities during cooldown (Spells can still be cast)
Intelligent Mode: Allows ability queuing only when no Light Attack is pending
Disabled Mode: Disables weaving assistance while keeping other features active

Class-Specific Optimization
Nightblade: Blocks Grim Focus until 10 stacks are reached (Adjustable stacks)
Arcanist: Prevents Fatecarver casting before 3 Crux stacks, with HP-based deactivation (Adjustable stacks)
Dragonknight: Blocks Molten Whip to prevent stack loss
Arcanist: Tentacular Dread blocking with Crux stack requirements (Adjustable)
Arcanist: Cephaliarch's Flail blocking when 3 Crux stacks
Nightblade: Blocks Assassin's Blade morphs until the execute threshold is reached (Adjustable)
Templar: Blocks Radiant morphs until the execute threshold is reached (Adjustable)
Sorcerer: Blocks Mages' Wrath morphs until the execute threshold is reached (Adjustable)

Smart Combat Management
Prevents accidental double-casting of ground-targeted abilities
Automatic GCD reset on dodge, bar swap, swimming, death, and combat sprinting
Reset on interrupt, stun, fear, silence, knockback, and off-balance
Hunter/Light ability blocking automatically disabled in PvP areas

Custom Block List
To add a spell right-click on the spell in the action bar or paste ID
Custom block list: You can add any spell IDs to block them.

Custom Recast Block List
To add a spell right-click on the spell in the action bar or paste ID
Custom Recast Block List: Prevents spells from being recast until their effect duration has fallen below an adjustable threshold (in seconds).

Resource-based Block List
To add a spell right-click on the spell in the action bar or paste ID
Magicka or Stamina threshold can be set for each spell (experimental)

Role-Based Automation
Auto-disables when playing as Tank or Healer
Reactivates automatically when switching to Damage roles

Advanced Performance Controls
Latency compensation (0-200 ms) with automatic detection
Adjustable minimum cooldown detection threshold
Independent toggles for Dodge Roll and Bar Swap reset triggers

Automatic Weapon System
Reverse Slash: Blocks Reverse Slash morphs until the execute threshold is reached (Adjustable)
Automatically unsheathes weapons when leaving UI states (crafting, chatting, combat, etc.)
Configurable toggle in Advanced Controls menu

PvP Deactivation Options
Separate toggles to disable features in PvP areas (Battlegrounds and AvA worlds)
Independent control over core features and weaving assistance

Key bindings / Hotkeys
Mode (Strict/Intelligent/Disabled)
Custom block list
Recast block list
Backbar features
Execute check


Multi-Language Support
Official: English; German; French; Spanish; Russian; Simplified Chinese; Japanese
Community: Polish; Italian; Brazilian Portuguese; Ukrainian; Turkish; Korean
Installation:
1. Download the latest .zip from Releases.

2. Extract to:
text
.../Elder Scrolls Online/live/AddOns/OptimalWeave  
3. Enable in-game via AddOn Manager.

