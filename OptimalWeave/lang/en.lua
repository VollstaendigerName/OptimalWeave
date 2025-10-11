-- =============================================================================
-- === OptimalWeave Language File: English (en.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/en.lua
    Description:        English localization using ZO_CreateStringId
    Version:            1.6.0
    Author:             Orollas & VollständigerName
--]]
-- =============================================================================

-- =============================================================================
-- == PANEL & AUTHOR INFORMATION ===============================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_PANEL_NAME", "|c6D6D6DOp|r|c8A8A8Atim|r|cA7A7A7al |r|cC4C4C4Wea|r|c6D6D6Dve|r")
ZO_CreateStringId("OW_MENU_AUTHORS", "|cEE82EEO|r|cDD74ECr|r|cCD65EAo|r|cBC57E8l|r|cAB48E6l|r|c9B3AE4a|r|c8A2BE2s|r & |cFFD700Vo|r|cF7D418l|r|cF3D324l|r|cEFD130s|r|cEBD03Ctä|r|cE3CD54n|r|cE0CC60d|r|cDCCA6Ci|r|cD8C978g|r|cD4C784e|r|cD0C690r|r|cCCC49CNa|r|cC4C1B4me|r")
ZO_CreateStringId("OW_MENU_WEBSITE", "https://github.com/VollstaendigerName")

-- =============================================================================
-- == INFORMATION SECTION ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Information & README")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Global cooldown (GCD) is 1000ms. OptimalWeave helps manage ability queuing based on the selected mode to optimize weaving. Use the settings below to customize its behavior.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Core Mechanics")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Activation Rules")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Advanced Controls")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Performance Settings")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon active")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inactive")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "This option is currently disabled")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Warning: High latency values may cause input lag!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Disclaimer|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Disclaimer:|r This add-on is not created by, affiliated with, or supported by ZeniMax Media Inc. The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the United States and/or other countries. All rights reserved.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Core Settings")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Operating Mode")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Hard:|r Strict blocking. No skill queuing during GCD.\n|cFFFF00Soft:|r Smart blocking. Skill queuing allowed only if no Light Attack is queued.\n|c00FFFFNone:|r Disabled.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Hard")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Soft")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "None")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Active Only in Combat")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "If checked, OptimalWeave will only manage ability queuing while in combat.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Active Only with Hostile Target")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Requires a hostile target to manage queuing.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignore While Blocking")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Disables controls during blocking.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Block Ground Ability Double Cast")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Prevents accidental double-casting of ground-targeted abilities.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Disable as Tank")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Auto-disable when Tank role is active")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Disable as Healer")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Auto-disable when Healer role is active")

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR", "Disable features on backbar")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR_TOOLTIP", "Disables most addon features on the backbar.")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR", "Disable weave assist on backbar")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR_TOOLTIP", "Disables the weave assist (GCD management) on the backbar.")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Blocked Abilities")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Block New ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Enter an Ability ID (e.g., 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "Currently Blocked IDs")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Click to remove")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Instant Cast Buffer (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Safety margin for instant abilities (0-100ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Channeled Buffer (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Buffer for channeled skills (0-400ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "GCD Tracking Slot")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Action bar slot for GCD detection (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Min GCD Threshold (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Minimum GCD duration to recognize (0-20ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Base Queue Time (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Default input queue window (100-2000ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Reset on bar swap")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Resets the GCD on bar swap")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Reset on dodge roll")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Resets the GCD on Dodge roll")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Latency Compensation")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Automatic Latency Adjustment")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Automatically adjust timing based on current latency. Recommended for stable connections.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Manual Input Latency (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Fixed latency value (0-200ms). Only used when automatic mode is disabled.")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

-- == Grim Focus SETTINGS ======================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Class and Guild Specific Settings")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Grim Focus")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Required Stacks")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Number of stacks required before Grim Focus becomes activatable (recommended: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Block All Grim Focus Morphs")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Relentless Focus:|r Always blocked\n|cFFFF00• Grim Focus and Merciless Resolve:|r Only usable at 10 stacks\n|cAAAAAADisable:|r Default behavior for all morphs")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Enable Custom Stacks")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Enabled:|r Uses custom stack setting \n" ..
                  "|cAAAAAADisabled:|r Always blocks Grim Focus and Merciless Resolve up to 10 stacks, and always blocks Relentless Focus\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Guilds")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Block Fighter's Guild Hunter Skills")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Blocks all morphs of Fighter's Guild hunter skills (Expert Hunter, Camouflaged Hunter & Evil Hunter)")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Block Mage's Guild Light Skills")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Blocks all morphs of Light skills (Magelight, Inner Light & Radiant Magelight)")   

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Disable in PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Disables Hunter/Light ability blocking in PvP areas")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "Molten Whip")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "Block Molten Whip Skill")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "Blocks the Molten Whip skill to prevent losing the three stacks")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Block Fatecarver Casting")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Prevent casting Fatecarver until conditions are met.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Required Crux Stacks")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Minimum Crux stacks before Fatecarver can be cast (Recommended: 3)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM", "HP Threshold (%)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP", "Disable Fatecarver blocking when HP is below this value")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE", "Enable HP check for Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP", "Disables Fatecarver blocking when your health is low")

ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM", "Stamina Threshold (%)")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOLTIP", "Disable Fatecarver blocking when Stamina is below this value")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE", "Enable Stamina check for Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE_TOOLTIP", "Disables Fatecarver blocking when your stamina is low")

-- == BLOCK TENTACULAR DREAD SETTINGS ==========================================
ZO_CreateStringId("OW_MENU_SUBCLASS_TENTACULAR", "Tentacular Dread")
ZO_CreateStringId("OW_MENU_TENTACULAR", "Block Tentacular Dread")
ZO_CreateStringId("OW_MENU_TENTACULAR_TOOLTIP", "Blocks the Tentacular Dread skill until conditions are met.")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- == WEAPON SETTINGS ==========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEADER", "Deactivate Based on Weapon Type")

ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON", "Disable Weave Assist on Weapon Type")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON_TOOLTIP", "Disables only the weave assist (GCD management) for selected weapon types")

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON", "Disable Features on Weapon Type")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON_TOOLTIP", "Disables most addon features for selected weapon types")

-- One-handed weapons
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE", "Axe")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE_TOOLTIP", "Deactivate when axe is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER", "Hammer")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER_TOOLTIP", "Deactivate when hammer is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD", "Sword")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD_TOOLTIP", "Deactivate when sword is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER", "Dagger")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER_TOOLTIP", "Deactivate when dagger is equipped")

-- Two-handed weapons
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD", "Two-Handed Sword")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD_TOOLTIP", "Deactivate when two-handed sword is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE", "Two-Handed Axe")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE_TOOLTIP", "Deactivate when two-handed axe is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER", "Two-Handed Hammer")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER_TOOLTIP", "Deactivate when two-handed hammer is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW", "Bow")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW_TOOLTIP", "Deactivate when bow is equipped")

-- Staves
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF", "Fire Staff")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF_TOOLTIP", "Deactivate when fire staff is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF", "Frost Staff")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF_TOOLTIP", "Deactivate when frost staff is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF", "Lightning Staff")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF_TOOLTIP", "Deactivate when lightning staff is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF", "Healing Staff")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF_TOOLTIP", "Deactivate when healing staff is equipped")

-- Other weapons
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD", "Shield")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD_TOOLTIP", "Deactivate when shield is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE", "Rune")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE_TOOLTIP", "Deactivate when rune is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE", "No Weapon")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE_TOOLTIP", "Deactivate when no weapon is equipped")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED", "Reserved Weapon")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED_TOOLTIP", "Deactivate when reserved weapon type is equipped")

-- =============================================================================
-- === END OF ENGLISH LOCALIZATION =============================================
-- =============================================================================