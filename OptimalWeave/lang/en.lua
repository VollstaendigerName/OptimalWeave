-- =============================================================================
-- === OptimalWeave Language File: English (en.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/en.lua
    Description:        English localization using ZO_CreateStringId
    Version:            1.3.1
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
ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Class-specific Settings")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Grim Focus")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Required Stacks")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Number of stacks required before Grim Focus becomes activatable (recommended: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Block All Grim Focus Morphs")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Relentless Focus:|r Always blocked\n|cFFFF00• Grim Focus and Merciless Resolve:|r Only usable at 10 stacks\n|cAAAAAADisable:|r Default behavior for all morphs")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Enable Custom Stacks")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Enabled:|r Uses custom stack setting \n" ..
                  "|cAAAAAADisabled:|r Always blocks Grim Focus and Merciless Resolve up to 10 stacks, and always blocks Relentless Focus\n")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Block Fatecarver Casting")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Prevent casting Fatecarver until conditions are met.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Required Crux Stacks")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Minimum Crux stacks before Fatecarver can be cast (Recommended: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF ENGLISH LOCALIZATION =============================================
-- =============================================================================