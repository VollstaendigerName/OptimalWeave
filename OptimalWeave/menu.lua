--------------------------------------------------------------------------------
-- OptimalWeave menu.lua 
-- =============================================================================
-- AddOn Name:        OptimalWeave
-- Description:       Advanced configuration menu system for OptimalWeave AddOn
-- Authors:           Orollas & VollständigerName
-- Version:           1.12.0
-- Dependencies:      LibAddonMenu-2.0
-- =============================================================================
-- =============================================================================
-- === OPTIMALWEAVE CONFIGURATION MENU (menu.lua) =============================
-- =============================================================================
--[[
    Features:
    - Gold-themed color scheme
    - Flat information section
    - Divider-based layout
    - Simplified dropdown structure
--]]
-- =============================================================================

local OW = OptimalWeave
local LAM = LibAddonMenu2
local OWColoredName = " |c6D6D6DOp|r|c8A8A8Atim|r|cA7A7A7al |r|cC4C4C4Wea|r|c6D6D6Dve|r "
local valueMode
-- =============================================================================
-- == COLOR SCHEMA DEFINITION ==================================================
-- =============================================================================
--[[
    Purpose: Centralized color management for UI consistency
    Color Codes:
    - PRIMARY: Main text (Light Gray |cD4D4D4)
    - SECONDARY: Secondary text (Medium Gray |cA6A6A6)
    - ACCENT: Gold accent (Gold |c948159)
    - WARNING: Error/alert text (Red |cFF5555)
    - DISABLED: Disabled state (Dark Gray |c666666)
    - BORDER: UI borders (Very Dark Gray |c3C3C3C)
--]]
local COLOR = {
    PRIMARY    = "|cD4D4D4",   -- Main text
    SECONDARY  = "|cA6A6A6",   -- Secondary text
    ACCENT     = "|c948159",   -- Gold accent
    WARNING    = "|cFF5555",   -- Warnings
    DISABLED   = "|c666666",   -- Disabled
    BORDER     = "|c3C3C3C"    -- Borders
}

-- =============================================================================
-- == UI COMPONENT FACTORIES ===================================================
-- =============================================================================
--[[
    Purpose: Reusable component generators for menu consistency
    Features:
    - Standardized styling across all controls
    - Automatic color application
    - Localization integration
    - Dynamic enable/disable states
--]]

--------------------------------------------------------------------------------
-- Checkbox Control Factory
-- @param nameKey: Localization key for display name
-- @param tooltipKey: Localization key for tooltip text
-- @param OWgetFunc: Function to retrieve current value
-- @param OWsetFunc: Function to set new value
-- @param disabledFunc: Optional function to determine disabled state
-- @return: Fully configured checkbox table
--------------------------------------------------------------------------------
local function CreateCheckbox(nameKey, tooltipKey, OWgetFunc, OWsetFunc, disabledFunc, reloadUICheck)
    return {
        type = "checkbox",
        name = COLOR.PRIMARY..OW.L(nameKey),
        tooltip = COLOR.SECONDARY..OW.L(tooltipKey),
        getFunc = OWgetFunc,
        setFunc = OWsetFunc,
        width = "full",
        style = {
            paddingTop = 8,
            paddingBottom = 8,
            labelBeforeCheckbox = true
        },
        disabled = disabledFunc,
        requiresReload = reloadUICheck or false, 
    }
end

--------------------------------------------------------------------------------
-- Dropdown Control Factory
-- @param nameKey: Localization key for display name
-- @param tooltipKey: Localization key for tooltip text
-- @param choicesKeys: Table of localization keys for dropdown options
-- @param OWgetFunc: Function to retrieve current value
-- @param OWsetFunc: Function to set new value
-- @return: Fully configured dropdown table
--------------------------------------------------------------------------------
local function CreateDropdown(nameKey, tooltipKey, choicesKeys, OWgetFunc, OWsetFunc)
    local choices = {}
    for _, key in ipairs(choicesKeys) do
        table.insert(choices, COLOR.SECONDARY..OW.L(key))
    end
    
    return {
        type = "dropdown",
        name = COLOR.PRIMARY..OW.L(nameKey),
        tooltip = COLOR.SECONDARY..OW.L(tooltipKey),
        choices = choices,
        getFunc = OWgetFunc,
        setFunc = OWsetFunc,
        scrollable = true,
        width = "full",
        choicesValues = {4 ,1, 2, 3}
    }
end

--------------------------------------------------------------------------------
-- Slider Control Factory
-- @param nameKey: Localization key for display name
-- @param tooltipKey: Localization key for tooltip text
-- @param min: Minimum slider value
-- @param max: Maximum slider value
-- @param OWgetFunc: Function to retrieve current value
-- @param OWsetFunc: Function to set new value
-- @param disabledFunc: Optional function to determine disabled state
-- @return: Fully configured slider table
--------------------------------------------------------------------------------
local function CreateSlider(nameKey, tooltipKey, min, max, OWgetFunc, OWsetFunc, disabledFunc)
    return {
        type = "slider",
        name = COLOR.PRIMARY..OW.L(nameKey),
        tooltip = COLOR.SECONDARY..OW.L(tooltipKey),
        min = min,
        max = max,
        getFunc = OWgetFunc,
        setFunc = OWsetFunc,
        disabled = disabledFunc,
        width = "full",
        decimals = 0,
        clampInput = false
    }
end

-- =============================================================================
-- == MENU STRUCTURE COMPONENTS ================================================
-- =============================================================================
--[[
    Purpose: Visual organization elements for menu layout
    Features:
    - Consistent section headers
    - Themed dividers
    - Proper spacing and alignment
--]]

--------------------------------------------------------------------------------
-- Section Header Generator
-- @param text: Display text for section header
-- @return: Divider and description control pair
--------------------------------------------------------------------------------
local function CreateSectionHeader(text)
    return {
    --     type = "divider",
    --     alpha = 0.2
    -- }, {
        type = "description",
        --text = COLOR.ACCENT..text,
        fontSize = "medium"
    }
end

-- =============================================================================
-- == CREATE RELOAD CONFIRMATION DIALOG ========================================
-- =============================================================================
-- Create Reload Confirmation Dialog
-- Purpose: Registers a standardized UI dialog for requesting player confirmation
--          before performing a UI reload after settings changes.
-- Features:
-- - Reusable dialog system for consistent UX
-- - Localization support for all text elements
-- - Queue-aware to prevent dialog stacking
-- Architecture:
-- - Checks if dialog already registered to avoid duplicates
-- - Uses addon's color scheme for visual consistency
-- - Provides clear Yes/No options with appropriate callbacks
--------------------------------------------------------------------------------
ZO_Dialogs_RegisterCustomDialog("OW_RELOAD_DIALOG", {
    canQueue = true,
    title = {
        text = OWColoredName
    },
    mainText = {
        text = COLOR.PRIMARY .. OW.L("OW_MENU_RELOAD_DIALOG_MAIN_TEXT")
    },
    buttons = {
        {
            text = COLOR.ACCENT .. OW.L("OW_MENU_RELOAD_DIALOG_BUTTON_YES"),
            callback = function()
                ReloadUI() 
            end
        },
        {
            text = COLOR.SECONDARY .. OW.L("OW_MENU_RELOAD_DIALOG_BUTTON_LATER"),
            callback = function()
            end
        }
    }
})

-- =============================================================================
-- == CREATE ERROR CONFIRMATION DIALOG =========================================
-- =============================================================================


ZO_Dialogs_RegisterCustomDialog("OW_INVALID_ID_DIALOG", {
    canQueue = true,
    title = {
        text = OWColoredName
    },
    mainText = {
        text = COLOR.WARNING .. OW.L("OW_MENU_INVALID_ID_DIALOG_MAIN_TEXT")
    },
    buttons = {
        {
            text = COLOR.ACCENT .. OW.L("OW_MENU_DIALOG_BUTTON_OK"),
            callback = function()
            end
        }
    }
})

ZO_Dialogs_RegisterCustomDialog("OW_ID_NOT_EXIST_DIALOG", {
    canQueue = true,
    title = {
        text = OWColoredName
    },
    mainText = {
        text = COLOR.WARNING .. OW.L("OW_MENU_ID_NOT_EXIST_DIALOG_MAIN_TEXT")
    },
    buttons = {
        {
            text = COLOR.ACCENT .. OW.L("OW_MENU_DIALOG_BUTTON_OK"),
            callback = function()
            end
        }
    }
})

ZO_Dialogs_RegisterCustomDialog("OW_ID_IS_IN_SV_DIALOG", {
    canQueue = true,
    title = {
        text = OWColoredName
    },
    mainText = {
        text = COLOR.WARNING .. OW.L("OW_MENU_ID_IS_IN_SV_DIALOG_MAIN_TEXT")
    },
    buttons = {
        {
            text = COLOR.ACCENT .. OW.L("OW_MENU_DIALOG_BUTTON_OK"),
            callback = function()
            end
        }
    }
})

-- =============================================================================
-- == MAIN MENU CONSTRUCTION ===================================================
-- =============================================================================
--[[
    Function: OW.BuildMenu
    Purpose: Construct complete configuration interface
    Process Flow:
    1. Create main panel definition
    2. Register panel with LibAddonMenu
    3. Build hierarchical options structure
    4. Register all control elements
    
    Architecture:
    - Flat information section
    - Core mechanics submenu
    - Activation conditions submenu
    - Advanced controls submenu
    - Subclass-specific settings submenu
    - Performance settings submenu
    - Legal disclaimer
--]]
-- Main panel definition
local function BuildMenu(OWSV, defaults)
    local panel = {
        type = "panel",
        name = OW.name,
        displayName = COLOR.ACCENT..OW.L("OW_MENU_PANEL_NAME"),
        author = COLOR.SECONDARY..OW.L("OW_MENU_AUTHORS"),
        version = COLOR.PRIMARY..OW.version,
        website = OW.L("OW_MENU_WEBSITE"),
        registerForRefresh = true,
        --registerForDefaults = true,
        slashCommand = "/optimalweave",
    }

    -- =============================================================================
    -- == BLOCK LIST MENU ==========================================================
    -- =============================================================================
    --[[
        Function: AddSpellToBlockList
        Purpose: Adds a spell to the block list.
        Features:
        - Checks whether spell exists
        - Prevents duplicates.
        - Saves directly to OWSV.customBlockList.
    --]]
    local function AddSpellToBlockList()
        --local spellId = tonumber(_G["OW_TEMP_SPELL_ID"])
        local spellId = tonumber(OW.TEMP_SPELL_ID) 
        
        -- Check whether a valid ID has been entered
        if not spellId or spellId <= 1000 or spellId >= 500000 then
            ZO_Dialogs_ShowDialog("OW_INVALID_ID_DIALOG")
            return
        end
        
        -- Check if Spell exists 
        local AbilityName = GetAbilityName(spellId)
        if AbilityName == nil or AbilityName == "" then
            ZO_Dialogs_ShowDialog("OW_ID_NOT_EXIST_DIALOG")
            --d(OWColoredName.."Error: Spell-ID " .. spellId .. " does not exist")
            return
        end
        
        -- Prevent duplicates
        if OWSV.customBlockList[spellId] ~= nil then
            ZO_Dialogs_ShowDialog("OW_ID_IS_IN_SV_DIALOG")
            --d(OWColoredName.."Note: Spell ID  " ..  spellId .. ", Spell " .. zo_strformat("<<1>>", AbilityName) .. " is already in the block list")
            return
        end
        
        -- Add Spell to block list
        OWSV.customBlockList[spellId] = false  -- Default: not blocked
        --_G["OW_TEMP_SPELL_ID"] = ""  -- Clear input field
        OW.TEMP_SPELL_ID = ""
        ZO_Dialogs_ShowDialog("OW_RELOAD_DIALOG")
        --d(OWColoredName.."Spell-ID " .. spellId .. ", Spell " .. zo_strformat("<<1>>", AbilityName) .. " has been added to the block list")
    end

    -- =============================================================================
    -- == RECAST BLOCK LIST MENU ===================================================
    -- =============================================================================
    --[[
        Function: AddSpellToRecastBlockList
        Purpose: Adds a spell to the recast block list.
        Features:
        - Checks whether spell exists
        - Prevents duplicates
        - Saves directly to OWSV.customRecastBlockList
    --]]
    local function AddSpellToRecastBlockList()
        --local spellId = tonumber(_G["OW_TEMP_RECAST_SPELL_ID"])
        local spellId = tonumber(OW.TEMP_RECAST_SPELL_ID)
        
        -- Check whether a valid ID has been entered
        if not spellId or spellId <= 1000 or spellId >= 500000 then
            ZO_Dialogs_ShowDialog("OW_INVALID_ID_DIALOG")
            return
        end
        
        -- Check if Spell exists 
        local AbilityName = GetAbilityName(spellId)
        if AbilityName == nil or AbilityName == "" then
            ZO_Dialogs_ShowDialog("OW_ID_NOT_EXIST_DIALOG")
            --d(OWColoredName.."Error: Spell-ID " .. spellId .. " does not exist")
            return
        end
        
        -- Prevent duplicates
        if OWSV.customRecastBlockList[spellId] ~= nil then
            ZO_Dialogs_ShowDialog("OW_ID_IS_IN_SV_DIALOG")
            --d(OWColoredName.."Note: Spell ID  " ..  spellId .. ", Spell " .. zo_strformat("<<1>>", AbilityName) .. " is already in the block list")
            return
        end
        
        -- Add Spell to block list
        OWSV.customRecastBlockList[spellId] = false  -- Default: not blocked
        OW.TEMP_RECAST_SPELL_ID = ""--_G["OW_TEMP_RECAST_SPELL_ID"] = ""  -- Clear input field
        ZO_Dialogs_ShowDialog("OW_RELOAD_DIALOG")
        --d(OWColoredName.."Spell-ID " .. spellId .. ", Spell " .. zo_strformat("<<1>>", AbilityName) .. " has been added to the block list")
    end

    -- =============================================================================
    -- == RESOURCE BLOCK LIST MENU =================================================
    -- =============================================================================
    --[[
        Function: AddSpellToResourceBlockList
        Purpose: Adds a spell to the block list.
        Features:
        - Checks whether spell exists
        - Prevents duplicates.
        - Saves directly to OWSV.customResourceBlockList.
    --]]
local function AddSpellToResourceBlockList()
    local spellId = tonumber(OW.TEMP_RESOURCE_SPELL_ID) 
    
    -- Check whether a valid ID has been entered
    if not spellId or spellId <= 1000 or spellId >= 500000 then
        ZO_Dialogs_ShowDialog("OW_INVALID_ID_DIALOG")
        return
    end
    
    -- Check if Spell exists 
    local AbilityName = GetAbilityName(spellId)
    if AbilityName == nil or AbilityName == "" then
        ZO_Dialogs_ShowDialog("OW_ID_NOT_EXIST_DIALOG")
        return
    end
    
    -- Prevent duplicates
    if OWSV.customResourceBlockList[spellId] ~= nil then
        ZO_Dialogs_ShowDialog("OW_ID_IS_IN_SV_DIALOG")
        return
    end
    
    -- Add Spell to block list with new structure
    OWSV.customResourceBlockList[spellId] = {
        blocked = false,           -- Complete blocked
        magickaCheck = false,      -- If Magicka check is used
        magickaBlock = false,      -- Block when magicka below threshold (true=block, false=allow only)
        magickaPercent = 0,        -- Magicka percentage threshold
        staminaCheck = false,      -- If Stamina check is used
        staminaBlock = false,      -- Block when stamina below threshold (true=block, false=allow only)
        staminaPercent = 0,        -- Stamina percentage threshold
    }
    
    OW.TEMP_RESOURCE_SPELL_ID = "" -- Clear input field
    ZO_Dialogs_ShowDialog("OW_RELOAD_DIALOG")
end

    -- =============================================================================
    -- == MENU =====================================================================
    -- =============================================================================
    -- Register main panel with LibAddonMenu
    LAM:RegisterAddonPanel(OW.name.."Menu", panel)

    -- Complete menu structure definition
    local options = {
        -- Information Section (flat, no submenu)
        {
            type = "description",
            text = COLOR.SECONDARY..OW.L("OW_MENU_INFO_TEXT"),
            fontSize = "medium",
            width = "full"
        },

        -- ====================================================================================================================================================
        -- Core Mechanics Submenu =============================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_MODE_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_MODE_HEADER")),
                CreateDropdown(
                    "OW_MENU_MODE_LABEL",
                    "OW_MENU_MODE_TOOLTIP",
                    {"OW_MENU_MODE_CHOICE_COND", "OW_MENU_MODE_CHOICE_HARD", "OW_MENU_MODE_CHOICE_SOFT", "OW_MENU_MODE_CHOICE_NONE"},
                    function() return OWSV.mode end,
   
                    function(value) -- Tmp fix, fix later
                        if value == 4 then
                            valueMode = 4  -- Sequential
                        elseif value == 1 then
                            valueMode = 1  -- Strict
                        elseif value == 2 then
                            valueMode = 2  -- Intelligent
                        elseif value == 3 then
                            valueMode = 3  -- Disabled
                        else    
                            valueMode = 0
                        end

                        -- d("ValueMode "..valueMode)
                        -- d("Value " ..value)
                        
                        OWSV.originalMode = 0
                        OWSV.mode = tonumber(valueMode) 
                    end
                ),
                CreateCheckbox(
                    "OW_MENU_GROUNDAOE_LABEL",
                    "OW_MENU_GROUNDAOE_TOOLTIP",
                    function() return OWSV.blockGroundAbilities end,
                    function(value) OWSV.blockGroundAbilities = value end
                )
            }
        },

        -- ====================================================================================================================================================
        -- Activation Conditions Submenu ======================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_CONDITIONS_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_CONDITIONS_HEADER")),
                CreateCheckbox(
                    "OW_MENU_COMBAT_LABEL",
                    "OW_MENU_COMBAT_TOOLTIP",
                    function() return OWSV.combat end,
                    function(value) OWSV.combat = value end
                ),
                CreateCheckbox(
                    "OW_MENU_ENEMYTARGET_LABEL",
                    "OW_MENU_ENEMYTARGET_TOOLTIP",
                    function() return OWSV.checkTarget end,
                    function(value) OWSV.checkTarget = value end
                ),
                CreateCheckbox(
                    "OW_MENU_BLOCKING_LABEL",
                    "OW_MENU_BLOCKING_TOOLTIP",
                    function() return OWSV.block end,
                    function(value) OWSV.block = value end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                CreateCheckbox(
                    "OW_MENU_DISABLE_TANK",
                    "OW_MENU_DISABLE_TANK_TOOLTIP",
                    function() return OWSV.disableTank end,
                    function(value) 
                        OWSV.disableTank = value
                        OW.CheckRoleOverride()
                    end
                ),
                CreateCheckbox(
                    "OW_MENU_DISABLE_HEAL",
                    "OW_MENU_DISABLE_HEAL_TOOLTIP",
                    function() return OWSV.disableHeal end,
                    function(value) 
                        OWSV.disableHeal = value
                        OW.CheckRoleOverride()
                    end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                CreateCheckbox(
                    "OW_MENU_DISABLE_FEATURES_ON_BACKBAR",
                    "OW_MENU_DISABLE_FEATURES_ON_BACKBAR_TOOLTIP",
                    function() return OWSV.deactivateOnBackbar.features end,
                    function(value) 
                        OWSV.deactivateOnBackbar.features = value
                    end
                ),
                CreateCheckbox(
                    "OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR",
                    "OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR_TOOLTIP",
                    function() return OWSV.deactivateOnBackbar.weaveAssist end,
                    function(value) 
                        OWSV.deactivateOnBackbar.weaveAssist = value
                    end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                CreateCheckbox(
                    "OW_MENU_DISABLE_FEATURES_IN_PVP",
                    "OW_MENU_DISABLE_FEATURES_IN_PVP_TOOLTIP",
                    function() return OWSV.deactivateInPvP.features end,
                    function(value) OWSV.deactivateInPvP.features = value end
                ),

                CreateCheckbox(
                    "OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP",
                    "OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP_TOOLTIP",
                    function() return OWSV.deactivateInPvP.weaveAssist end,
                    function(value) OWSV.deactivateInPvP.weaveAssist = value end
                ),

                -- { type = "divider", alpha = 0.2 }, -- ===================================================================================== 

                -- CreateCheckbox( -- Dosen´t work!, will fix it later (Wish from kalitva) =================================================== 
                --     "OW_MENU_BLOCKAOEIFNOTARGET_LABEL",
                --     "OW_MENU_BLOCKAOEIFNOTARGET_TOOLTIP",
                --     function() return OWSV.blockAoEIfNoTarget end,
                --     function(value) OWSV.blockAoEIfNoTarget = value end
                -- ),
            }
        },

        -- ====================================================================================================================================================
        -- Advanced Controls Submenu ==========================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_ADVANCED_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_ADVANCED_HEADER")),
                CreateCheckbox(
                    "OW_MENU_RESETONDODGE_LABEL",
                    "OW_MENU_RESETONDODGE_TOOLTIP",
                    function() return OWSV.resetOnDodge end,
                    function(value) OWSV.resetOnDodge = value end
                ),

                CreateCheckbox(
                    "OW_MENU_RESETONBARSWAP_LABEL",
                    "OW_MENU_RESETONBARSWAP_TOOLTIP",
                    function() return OWSV.resetOnBarswap end,
                    function(value) OWSV.resetOnBarswap = value end
                ),
                
                -- Channel Buffer Settings
                CreateSlider(
                    "OW_MENU_CHANNEL_NORMAL", 
                    "OW_MENU_CHANNEL_NORMAL_TOOLTIP", 
                    0, 100, -- 0-100ms (Default 50)
                    function() return OWSV.channelBufferNormal end,
                    function(value) OWSV.channelBufferNormal = value end
                ),
                CreateSlider(
                    "OW_MENU_CHANNEL_CHANNELED", 
                    "OW_MENU_CHANNEL_CHANNELED_TOOLTIP", 
                    0, 400, -- 0-400ms (Default 200)
                    function() return OWSV.channelBufferChanneled end,
                    function(value) OWSV.channelBufferChanneled = value end
                ),
                                
                -- GCD Thresholds
                CreateSlider(
                    "OW_MENU_MIN_GCD", 
                    "OW_MENU_MIN_GCD_TOOLTIP", 
                    0, 20, -- 0-20ms (Default 10)
                    function() return OWSV.minGcdThreshold end,
                    function(value) OWSV.minGcdThreshold = value end
                ),
                CreateSlider(
                    "OW_MENU_QUEUE_TIME", 
                    "OW_MENU_QUEUE_TIME_TOOLTIP", 
                    100, 2000, -- 100-2000ms (Default 1050)
                    function() return OWSV.baseQueueTime end,
                    function(value) OWSV.baseQueueTime = value end
                ),

                CreateCheckbox(
                    "OW_MENU_AUTO_GCD_SLOT_LABEL",
                    "OW_MENU_AUTO_GCD_SLOT_TOOLTIP",
                    function() return OWSV.autoGcdTrackingSlot end,
                    function(value) OWSV.autoGcdTrackingSlot = value end
                ),

                CreateSlider(
                    "OW_MENU_GCD_SLOT",
                    "OW_MENU_GCD_SLOT_TOOLTIP", 
                    3, 8, -- GCD tracking slot (Spells between 3 to 8), Light Attack 1
                    function() return OWSV.gcdTrackingSlot end,
                    function(value) OWSV.gcdTrackingSlot = value end,
                    function() return OWSV.autoGcdTrackingSlot end
                ),

                CreateSlider(
                    "OW_MENU_RESET_TIME_LABEL",
                    "OW_MENU_RESET_TIME_TOOLTIP", 
                    1, 60, -- Min: 1 seconds, Max: 60 seconds
                    function() return OWSV.resetAfterSeconds end,
                    function(value) OWSV.resetAfterSeconds = value end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                -- Automatic Weapon Equipping
                CreateCheckbox(
                    "OW_MENU_AUTO_EQUIP_WEAPONS_LABEL",
                    "OW_MENU_AUTO_EQUIP_WEAPONS_TOOLTIP",
                    function() return OWSV.autoEquipWeapons end,
                    function(value) OWSV.autoEquipWeapons = value end,
                    nil,
                    true
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                -- Reset Settings Button
                {
                    type = "button",
                    name = COLOR.WARNING..OW.L("OW_MENU_RESET_SETTINGS_LABEL"),
                    tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESET_SETTINGS_TOOLTIP"),
                    width = "full",
                    isDangerous = true,
                    func = function()
                        -- Overwrite savedvariables (OWSV) with defaults
                        for key, value in pairs(defaults) do
                            if type(value) == "table" then
                                OWSV[key] = {}
                                for subkey, subvalue in pairs(value) do
                                    OWSV[key][subkey] = subvalue
                                end
                            else
                                OWSV[key] = value
                            end
                        end
                    end
                }

            }
        },

        -- ====================================================================================================================================================
        -- (Sub)Class Settings Submenu ========================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_SUBCLASS_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_GRIMFOCUS"),
                    width = "full"
                },
                
                -- Grim Focus (and Morphs)
                CreateCheckbox(
                    "OW_MENU_GRIMFOCUS_ALL_MORPHS",
                    "OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP",
                    function() return OWSV.grimFocusSkillIds[61919] and OWSV.grimFocusSkillIds[61927] and OWSV.grimFocusSkillIds[61902] end,
                    function(value) 
                        OWSV.grimFocusSkillIds[61919] = value
                        OWSV.grimFocusSkillIds[61927] = value
                        OWSV.grimFocusSkillIds[61902] = value
                        OWSV.useGrimFocusStacks = false
                    end
                ),

                CreateCheckbox(
                    "OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE",
                    "OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP",
                    function() return OWSV.useGrimFocusStacks end,
                    function(value) 
                        OWSV.useGrimFocusStacks = value
                    end,
                    function() return OWSV.grimFocusSkillIds[61919] end
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Grim Focus Stacks Slider
                CreateSlider(
                    "OW_MENU_GRIMFOCUS_STACKS",
                    "OW_MENU_GRIMFOCUS_STACKS_TOOLTIP",
                    5, 10, -- Min:5, Max:10 Stacks
                    function() return OWSV.grimFocusStacks end,
                    function(value) OWSV.grimFocusStacks = value end,
                    function() return not OWSV.useGrimFocusStacks end
                ),
                
                -- Arcanist Fatecarver
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_FATECARVER"),
                    width = "full"
                },
                
                -- Fatecarver (and Morphs)
                CreateCheckbox(
                    "OW_MENU_FATECARVER_ALL_MORPHS",
                    "OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP",
                    function() return OWSV.arcaBeamSkillIds[186366] and OWSV.arcaBeamSkillIds[186366] and OWSV.arcaBeamSkillIds[186366] end,
                    function(value) 
                        OWSV.arcaBeamSkillIds[185805] = value -- Base Mag
                        OWSV.arcaBeamSkillIds[183122] = value -- Exhausting Fatecarver Mag
                        OWSV.arcaBeamSkillIds[186366] = value -- Pragmatic Fatecarver Mag
                        OWSV.arcaBeamSkillIds[193397] = value -- Base
                        OWSV.arcaBeamSkillIds[193398] = value -- Exhausting Fatecarver
                        OWSV.arcaBeamSkillIds[193331] = value -- Pragmatic Fatecarver
                        OWSV.useCruxStacks = value
                        --d(tostring(value))
                    end
                ),

                -- Crux Stack Slider
                CreateSlider(
                    "OW_MENU_CRUX_STACKS",
                    "OW_MENU_CRUX_STACKS_TOOLTIP",
                    1, 3, -- Min:1, Max:3 Stacks
                    function() return OWSV.cruxStacks end,
                    function(value) OWSV.cruxStacks = value end,
                    function() return not OWSV.useCruxStacks end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                -- Deactivate under certain HP toggle
                CreateCheckbox(
                    "OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE",
                    "OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP",
                    function() return OWSV.checkHpForArcaBeam end,
                    function(value) 
                        OWSV.checkHpForArcaBeam = value
                    end
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Deactivate under certain HP Slider
                CreateSlider(
                    "OW_MENU_CHECK_HP_FOR_BEAM",
                    "OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP",
                    0, 100, -- Min:0, Max:100 % HP
                    function() return OWSV.deactivateArcaBeamBlockAtHpUnder end,
                    function(value) OWSV.deactivateArcaBeamBlockAtHpUnder = value end,
                    function() return not OWSV.checkHpForArcaBeam end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================

                -- Deactivate under certain Stam toggle
                CreateCheckbox(
                    "OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE",
                    "OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE_TOOLTIP",
                    function() return OWSV.checkStamForArcaBeam end,
                    function(value) 
                        OWSV.checkStamForArcaBeam = value
                    end
                ),
                
                
                -- Deactivate under certain HP Slider
                CreateSlider(
                    "OW_MENU_CHECK_STAMINA_FOR_BEAM",
                    "OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOLTIP",
                    0, 100, -- Min:0, Max:100 % Stam
                    function() return OWSV.deactivateArcaBeamBlockAtStamUnder end,
                    function(value) OWSV.deactivateArcaBeamBlockAtStamUnder = value end,
                    function() return not OWSV.checkStamForArcaBeam end
                ),

                -- Arcanist Cephaliarch's Flail
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_CEPHALIARCHSFLAIL"),
                    width = "full"
                },

                -- Cephaliarch's Flail
                CreateCheckbox(
                    "OW_MENU_CEPHALIARCHSFLAIL",
                    "OW_MENU_CEPHALIARCHSFLAIL_TOOLTIP",
                    function() return OWSV.cephaliarchsFlail[183006] end,
                    function(value) 
                        OWSV.cephaliarchsFlail[183006] = value
                        OWSV.useCruxStacksCephaliarch = value
                    end
                ),

                -- Arcanist Tentacular Dread
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_TENTACULAR"),
                    width = "full"
                },
                
                -- Tentacular
                CreateCheckbox(
                    "OW_MENU_TENTACULAR",
                    "OW_MENU_TENTACULAR_TOOLTIP",
                    function() return OWSV.tentacularDread[185823] end,
                    function(value) 
                        OWSV.tentacularDread[185823] = value -- Tentacular Dread
                        OWSV.usecruxStacksTentacular = value
                        --d(tostring(value))
                    end
                ),
                
                -- Crux Stack Slider
                CreateSlider(
                    "OW_MENU_CRUX_STACKS",
                    "OW_MENU_TENTACULAR_TOOLTIP",
                    1, 3, -- Min:1, Max:3 Stacks
                    function() return OWSV.cruxStacksTentacular end,
                    function(value) OWSV.cruxStacksTentacular = value end,
                    function() return not OWSV.usecruxStacksTentacular end
                ),

                -- Dragonknight Molten Whip
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_MOLTENWHIP"),
                    width = "full"
                },

                -- Molten Whip
                CreateCheckbox(
                    "OW_MENU_MOLTENWHIP_BLOCK",
                    "OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP",
                    function() return OWSV.MoltenWhip[20805] end,
                    function(value) 
                        OWSV.MoltenWhip[20805] = value
                    end
                ),

                -- Execute Check 
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_EXECUTE_HEADER"),
                    width = "full"
                },
                
                -- Enable/Disable Execute Check
                CreateCheckbox(
                    "OW_MENU_EXECUTE_ENABLE",
                    "OW_MENU_EXECUTE_ENABLE_TOOLTIP",
                    function() return OWSV.useExecuteCheck end,
                    function(value) OWSV.useExecuteCheck = value end
                ),
                
                -- Execute Threshold Slider
                CreateSlider(
                    "OW_MENU_EXECUTE_THRESHOLD",
                    "OW_MENU_EXECUTE_THRESHOLD_TOOLTIP",
                    0, 100, -- 0-100%
                    function() return OWSV.executeThreshold end,
                    function(value) OWSV.executeThreshold = value end,
                    function() return not OWSV.useExecuteCheck end
                ),
                                
                -- Execute Spells Header
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_EXECUTE_SPELLS_HEADER"),
                    width = "full"
                },
                
                -- Radiant Destruction and Morphs 
                CreateCheckbox(
                    "OW_MENU_EXECUTE_SPELL_RADIANTMORPHS",
                    "OW_MENU_EXECUTE_SPELL_RADIANTMORPHS_TOOLTIP",
                    function() return OWSV.executeCheckSpells[63029] end,
                    function(value) 
                        OWSV.executeCheckSpells[63029] = value
                        OWSV.executeCheckSpells[63044] = value
                        OWSV.executeCheckSpells[63046] = value
                    end,
                    function() return not OWSV.useExecuteCheck end
                ),
                
                -- Assassin's Blade and Morphs
                CreateCheckbox(
                    "OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS",
                    "OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS_TOOLTIP",
                    function() return OWSV.executeCheckSpells[33386] end,
                    function(value) 
                        OWSV.executeCheckSpells[33386] = value
                        OWSV.executeCheckSpells[34851] = value
                        OWSV.executeCheckSpells[34843] = value
                    end,
                    function() return not OWSV.useExecuteCheck end
                ),

                 -- Mages' Fury and Morphs 
                CreateCheckbox(
                    "OW_MENU_EXECUTE_SPELL_MAGESFURYMORPHS",
                    "OW_MENU_EXECUTE_SPELL_MAGESFURYMORPHS_TOOLTIP",
                    function() return OWSV.executeCheckSpells[19123] end,
                    function(value) 
                        OWSV.executeCheckSpells[19123] = value
                        OWSV.executeCheckSpells[18718] = value
                        OWSV.executeCheckSpells[19109] = value
                    end,
                    function() return not OWSV.useExecuteCheck end
                ),

                -- Reverse Slash and Morphs
                CreateCheckbox(
                    "OW_MENU_EXECUTE_SPELL_REVERSESLASHMORPHS",
                    "OW_MENU_EXECUTE_SPELL_REVERSESLASHMORPHS_TOOLTIP",
                    function() return OWSV.executeCheckSpells[28302] end,
                    function(value) 
                        OWSV.executeCheckSpells[28302] = value
                        OWSV.executeCheckSpells[38823] = value
                        OWSV.executeCheckSpells[38819] = value
                    end,
                    function() return not OWSV.useExecuteCheck end
                ),

                -- guild
                CreateSectionHeader(OW.L("OW_MENU_SUBCLASS_HEADER")),
                {
                    type = "header",
                    name = COLOR.PRIMARY..OW.L("OW_MENU_SUBCLASS_GUILDS"),
                    width = "full"
                },
                -- Mages guild
                CreateCheckbox(
                    "OW_MENU_LIGHT_ALL_MORPHS",
                    "OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP",
                    function() return OWSV.lightMorphs[30920] and OWSV.lightMorphs[40478] and OWSV.lightMorphs[40483] end,
                    function(value) 
                        OWSV.lightMorphs[30920] = value
                        OWSV.lightMorphs[40478] = value
                        OWSV.lightMorphs[40483] = value
                    end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Fighter guild
                CreateCheckbox(
                    "OW_MENU_HUNTER_ALL_MORPHS",
                    "OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP",
                    function() return OWSV.hunterMorphs[35762] and OWSV.hunterMorphs[40195] and OWSV.hunterMorphs[40194] end,
                    function(value) 
                        OWSV.hunterMorphs[35762] = value
                        OWSV.hunterMorphs[40195] = value
                        OWSV.hunterMorphs[40194] = value
                    end
                ),

                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Deactivate Hunter and light block in PvP
                CreateCheckbox(
                    "OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS",
                    "OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP",
                    function() return OWSV.deactivateHunterLightInPvP end,
                    function(value) 
                        OWSV.deactivateHunterLightInPvP = value
                    end
                ),
            }
        },

        -- ====================================================================================================================================================
        -- Weapon Type Deactivation Submenu ===================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_DEACTIVATE_ON_WEAPON_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_DEACTIVATE_ON_WEAPON_HEADER")),

                CreateCheckbox(
                    "OW_MENU_DISABLE_FEATURES_ON_WEAPON",
                    "OW_MENU_DISABLE_FEATURES_ON_WEAPON_TOOLTIP",
                    function() return OWSV.deactivateOnWeapon.features end,
                    function(value) 
                        OWSV.deactivateOnWeapon.features = value
                    end
                ),
                CreateCheckbox(
                    "OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON",
                    "OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON_TOOLTIP",
                    function() return OWSV.deactivateOnWeapon.weaveAssist end,
                    function(value) 
                        OWSV.deactivateOnWeapon.weaveAssist = value
                    end
                ),
                
                { type = "divider", alpha = 1.0 }, -- =====================================================================================

                -- One-handed weapons
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_AXE",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_AXE_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.axe end,
                    function(value) OWSV.deactivateOnWeaponType.axe = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.hammer end,
                    function(value) OWSV.deactivateOnWeaponType.hammer = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_SWORD",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_SWORD_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.sword end,
                    function(value) OWSV.deactivateOnWeaponType.sword = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.dagger end,
                    function(value) OWSV.deactivateOnWeaponType.dagger = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Two-handed weapons
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.twoHandedSword end,
                    function(value) OWSV.deactivateOnWeaponType.twoHandedSword = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.twoHandedAxe end,
                    function(value) OWSV.deactivateOnWeaponType.twoHandedAxe = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.twoHandedHammer end,
                    function(value) OWSV.deactivateOnWeaponType.twoHandedHammer = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_BOW",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_BOW_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.bow end,
                    function(value) OWSV.deactivateOnWeaponType.bow = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Staves
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.fireStaff end,
                    function(value) OWSV.deactivateOnWeaponType.fireStaff = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.frostStaff end,
                    function(value) OWSV.deactivateOnWeaponType.frostStaff = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.lightningStaff end,
                    function(value) OWSV.deactivateOnWeaponType.lightningStaff = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.healingStaff end,
                    function(value) OWSV.deactivateOnWeaponType.healingStaff = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                
                { type = "divider", alpha = 0.2 }, -- =====================================================================================
                
                -- Other weapons
                CreateCheckbox(
                    "OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD",
                    "OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD_TOOLTIP",
                    function() return OWSV.deactivateOnWeaponType.shield end,
                    function(value) OWSV.deactivateOnWeaponType.shield = value end,
                    function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                ),
                -- CreateCheckbox(
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_RUNE",
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_RUNE_TOOLTIP",
                --     function() return OWSV.deactivateOnWeaponType.rune end,
                --     function(value) OWSV.deactivateOnWeaponType.rune = value end,
                --     function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                -- ),
                -- CreateCheckbox(
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_NONE",
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_NONE_TOOLTIP",
                --     function() return OWSV.deactivateOnWeaponType.none end,
                --     function(value) OWSV.deactivateOnWeaponType.none = value end,
                --     function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                -- ),
                -- CreateCheckbox(
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED",
                --     "OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED_TOOLTIP",
                --     function() return OWSV.deactivateOnWeaponType.reservedWeapon end,
                --     function(value) OWSV.deactivateOnWeaponType.reservedWeapon = value end,
                --     function() return not (OWSV.deactivateOnWeapon.features or OWSV.deactivateOnWeapon.weaveAssist) end
                -- )
            }
        },

        -- ====================================================================================================================================================
        -- Performance Settings ===============================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_PERFORMANCE_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_PERFORMANCE_HEADER")),
                CreateCheckbox(
                    "OW_MENU_AUTOLATENCY_LABEL",
                    "OW_MENU_AUTOLATENCY_TOOLTIP",
                    function() return OWSV.autoLag end,
                    function(value) OWSV.autoLag = value end
                ),
                CreateSlider(
                    "OW_MENU_MANUALLATENCY_LABEL",
                    "OW_MENU_MANUALLATENCY_TOOLTIP",
                    0,
                    200,
                    function() return OWSV.inputLag end,
                    function(value) OWSV.inputLag = value end,
                    function() return OWSV.autoLag end
                )
            }
        },

        -- ====================================================================================================================================================
        -- USER-CONFIGURABLE BLOCK LIST =======================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_CONFIGURABLEBLOCK_HEADER"),
            controls = (function()
                local controls = {
                    CreateSectionHeader(OW.L("OW_MENU_CONFIGURABLEBLOCK_HEADER")),
                    {
                        type = "description",
                        text = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMBLOCK_DESC"),
                        width = "full"
                    },

                    CreateCheckbox(
                        "OW_MENU_USE_CUSTOM_BLOCK_LIST",
                        "OW_MENU_USE_CUSTOM_BLOCK_LIST_TOOLTIP",
                        function() return OWSV.useCustomBlockList end,
                        function(value) OWSV.useCustomBlockList = value end
                    ),

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    -- Health Check for Block List
                    CreateCheckbox(
                        "OW_MENU_USE_CUSTOM_BLOCK_LIST_HEALTH_CHECK",
                        "OW_MENU_USE_CUSTOM_BLOCK_LIST_HEALTH_CHECK_TOOLTIP",
                        function() return OWSV.useCustomBlockListHealthCheck end,
                        function(value) OWSV.useCustomBlockListHealthCheck = value end,
                        function() return not OWSV.useCustomBlockList end
                    ),

                    -- Health Percent Slider for Block List
                    CreateSlider(
                        "OW_MENU_CUSTOM_BLOCK_LIST_HEALTH_PERCENT",
                        "OW_MENU_CUSTOM_BLOCK_LIST_HEALTH_PERCENT_TOOLTIP",
                        0, 100, -- 0-100%
                        function() return OWSV.useCustomBlockListHealthPercent end,
                        function(value) OWSV.useCustomBlockListHealthPercent = value end,
                        function() return not (OWSV.useCustomBlockList and OWSV.useCustomBlockListHealthCheck) end
                    ),

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    {
                        type = "editbox",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMBLOCK_SPELLID_LABEL"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMBLOCK_SPELLID_TOOLTIP"),
                        getFunc = function() return OW.TEMP_SPELL_ID or "" end,--_G["OW_TEMP_SPELL_ID"] or "" end,
                        setFunc = function(value) 
                            --_G["OW_TEMP_SPELL_ID"] = value
                            OW.TEMP_SPELL_ID = value 
                        end,
                        width = "full"
                    },
                    {
                        type = "button",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMBLOCK_ADD_BUTTON"),
                        func = function()
                            AddSpellToBlockList()
                            --ZO_Dialogs_ShowDialog("OW_RELOAD_DIALOG")
                        end,
                        --requiresReload = true,
                        width = "full"
                    },

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================
                    
                    {
                        type = "description",
                        text = COLOR.ACCENT..OW.L("OW_MENU_CUSTOMBLOCK_LIST_HEADER"),
                        width = "full"
                    },
                }
                
                -- Dynamically generated checkboxes for each spell ID in customRecastBlockList
                local spellIds = {}
                for spellId, _ in pairs(OWSV.customBlockList) do
                    table.insert(spellIds, spellId)
                end
                table.sort(spellIds)
                
                for _, spellId in ipairs(spellIds) do
                    local spellName = GetAbilityName(spellId) or ("Unknown Spell ("..spellId..")")
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.PRIMARY..zo_strformat("<<1>>", spellName),
                        tooltip = COLOR.SECONDARY.."Spell ID: "..spellId,
                        getFunc = function() 
                            return OWSV.customBlockList[spellId] 
                        end,
                        setFunc = function(value) 
                            OWSV.customBlockList[spellId] = value
                        end,
                        width = "full"
                    })
                end
                
                return controls
            end)()
        },

        -- ====================================================================================================================================================
        -- USER-CONFIGURABLE RECAST BLOCK LIST ================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_CONFIGURABLERECASTBLOCK_HEADER"),
            controls = (function()
                local controls = {
                    CreateSectionHeader(OW.L("OW_MENU_CONFIGURABLERECASTBLOCK_HEADER")),
                    {
                        type = "description",
                        text = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMRECASTBLOCK_DESC"),
                        width = "full"
                    },

                    CreateCheckbox(
                        "OW_MENU_USE_CUSTOM_RECAST_BLOCK_LIST",
                        "OW_MENU_USE_CUSTOM_RECAST_BLOCK_LIST_TOOLTIP",
                        function() return OWSV.useCustomRecastBlockList end,
                        function(value) OWSV.useCustomRecastBlockList = value end
                    ),

                    CreateSlider(
                        "OW_MENU_RECAST_BLOCK_TIME",
                        "OW_MENU_RECAST_BLOCK_TIME_TOOLTIP",
                        0, 120, -- 0-120s (Default 1)
                        function() return OWSV.recastBlockTime end,
                        function(value) OWSV.recastBlockTime = value end,
                        function() return not OWSV.useCustomRecastBlockList end
                    ),
                    
                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    -- Health Check for Recast Block List
                    CreateCheckbox(
                        "OW_MENU_USE_CUSTOM_RECAST_BLOCK_LIST_HEALTH_CHECK",
                        "OW_MENU_USE_CUSTOM_RECAST_BLOCK_LIST_HEALTH_CHECK_TOOLTIP",
                        function() return OWSV.useCustomRecastBlockListHealthCheck end,
                        function(value) OWSV.useCustomRecastBlockListHealthCheck = value end,
                        function() return not OWSV.useCustomRecastBlockList end
                    ),

                    -- Health Percent Slider for Recast Block List
                    CreateSlider(
                        "OW_MENU_CUSTOM_RECAST_BLOCK_LIST_HEALTH_PERCENT",
                        "OW_MENU_CUSTOM_RECAST_BLOCK_LIST_HEALTH_PERCENT_TOOLTIP",
                        0, 100, -- 0-100%
                        function() return OWSV.useCustomRecastBlockListHealthPercent end,
                        function(value) OWSV.useCustomRecastBlockListHealthPercent = value end,
                        function() return not (OWSV.useCustomRecastBlockList and OWSV.useCustomRecastBlockListHealthCheck) end
                    ),

                    CreateSlider(
                        "OW_MENU_RECAST_BLOCK_TIME",
                        "OW_MENU_RECAST_BLOCK_TIME_TOOLTIP",
                        0, 120, -- 0-120s (Default 1)
                        function() return OWSV.recastBlockTime end,
                        function(value) OWSV.recastBlockTime = value end,
                        function() return not OWSV.useCustomRecastBlockList end
                    ),
                    
                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    {
                        type = "editbox",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMRECASTBLOCK_SPELLID_LABEL"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMRECASTBLOCK_SPELLID_TOOLTIP"),
                        getFunc = function() return OW.TEMP_RECAST_SPELL_ID or "" end,--_G["OW_TEMP_RECAST_SPELL_ID"] or "" end,
                        setFunc = function(value) 
                            OW.TEMP_RECAST_SPELL_ID = value--_G["OW_TEMP_RECAST_SPELL_ID"] = value
                        end,
                        width = "full"
                    },
                    {
                        type = "button",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMRECASTBLOCK_ADD_BUTTON"),
                        func = function()
                            AddSpellToRecastBlockList()
                            --ZO_Dialogs_ShowDialog("OW_RELOAD_DIALOG")  
                        end,
                        --requiresReload = true,
                        width = "full"
                    },

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    {
                        type = "description",
                        text = COLOR.ACCENT..OW.L("OW_MENU_CUSTOMRECASTBLOCK_LIST_HEADER"),
                        width = "full"
                    },
                }
                
                -- Dynamically generated checkboxes for each spell ID in customRecastBlockList
                local spellIds = {}
                for spellId, _ in pairs(OWSV.customRecastBlockList) do
                    table.insert(spellIds, spellId)
                end
                table.sort(spellIds)
                
                for _, spellId in ipairs(spellIds) do
                    local spellName = GetAbilityName(spellId) or ("Unknown Spell ("..spellId..")")
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.PRIMARY..zo_strformat("<<1>>", spellName),
                        tooltip = COLOR.SECONDARY.."Spell ID: "..spellId,
                        getFunc = function() 
                            return OWSV.customRecastBlockList[spellId] 
                        end,
                        setFunc = function(value) 
                            OWSV.customRecastBlockList[spellId] = value
                        end,
                        width = "full"
                    })
                end
                
                return controls
            end)()
        },

        -- ====================================================================================================================================================
        -- USER-CONFIGURABLE RESOURCE-BASED BLOCK LIST ========================================================================================================
        -- ====================================================================================================================================================
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_CONFIGURABLEBLOCK_RESOURCE_HEADER").." Experimental",
            controls = (function()
                local controls = {
                    CreateSectionHeader(OW.L("OW_MENU_CONFIGURABLEBLOCK_RESOURCE_HEADER").." Experimental"),
                    {
                        type = "description",
                        text = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMBLOCK_RESOURCE_DESC"),
                        width = "full"
                    },

                    CreateCheckbox(
                        "OW_MENU_USE_CUSTOM_RESOURCE_BLOCK_LIST",
                        "OW_MENU_USE_CUSTOM_RESOURCE_BLOCK_LIST_TOOLTIP",
                        function() return OWSV.useCustomResourceBlockList end,
                        function(value) OWSV.useCustomResourceBlockList = value end
                    ),

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================

                    {
                        type = "editbox",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMBLOCK_SPELLID_LABEL"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_CUSTOMBLOCK_SPELLID_TOOLTIP"),
                        getFunc = function() return OW.TEMP_RESOURCE_SPELL_ID or "" end,
                        setFunc = function(value) 
                            OW.TEMP_RESOURCE_SPELL_ID = value
                        end,
                        width = "full"
                    },
                    {
                        type = "button",
                        name = COLOR.PRIMARY..OW.L("OW_MENU_CUSTOMBLOCK_ADD_BUTTON"),
                        func = function()
                            AddSpellToResourceBlockList()
                        end,
                        width = "full"
                    },

                    { type = "divider", alpha = 0.2 }, -- =====================================================================================
                    
                    {
                        type = "description",
                        text = COLOR.ACCENT..OW.L("OW_MENU_CUSTOMBLOCK_LIST_HEADER"),
                        width = "full"
                    },
                }
                
                -- Dynamically generated controls for each spell ID in customResourceBlockList
                local spellIds = {}
                for spellId, _ in pairs(OWSV.customResourceBlockList) do
                    table.insert(spellIds, spellId)
                end
                table.sort(spellIds)
                
                for _, spellId in ipairs(spellIds) do
                    local spellData = OWSV.customResourceBlockList[spellId]
                    local spellName = GetAbilityName(spellId) or ("Unknown Spell ("..spellId..")")
                    
                    -- Base blocked checkbox
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.PRIMARY..zo_strformat("<<1>>", spellName),
                        tooltip = COLOR.SECONDARY.."Spell ID: "..spellId,
                        getFunc = function() 
                            return spellData.blocked 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].blocked = value
                        end,
                        width = "full"
                    })
                    
                    -- Magicka check section
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_CHECK"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_CHECK_TOOLTIP"),
                        getFunc = function() 
                            return spellData.magickaCheck 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].magickaCheck = value
                        end,
                        width = "full",
                        disabled = function() return not OWSV.useCustomResourceBlockList end
                    })
                    
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_BLOCK_MODE"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_BLOCK_MODE_TOOLTIP"),
                        getFunc = function() 
                            return spellData.magickaBlock 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].magickaBlock = value
                        end,
                        width = "full",
                        disabled = function() return not (OWSV.useCustomResourceBlockList and spellData.magickaCheck) end
                    })
                    
                    table.insert(controls, {
                        type = "slider",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_THRESHOLD"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_MAGICKA_THRESHOLD_TOOLTIP"),
                        min = 0,
                        max = 100,
                        getFunc = function() 
                            return spellData.magickaPercent 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].magickaPercent = value
                        end,
                        width = "full",
                        disabled = function() return not (OWSV.useCustomResourceBlockList and spellData.magickaCheck) end
                    })
                    
                    -- Stamina check section
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_CHECK"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_CHECK_TOOLTIP"),
                        getFunc = function() 
                            return spellData.staminaCheck 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].staminaCheck = value
                        end,
                        width = "full",
                        disabled = function() return not OWSV.useCustomResourceBlockList end
                    })
                    
                    table.insert(controls, {
                        type = "checkbox",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_BLOCK_MODE"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_BLOCK_MODE_TOOLTIP"),
                        getFunc = function() 
                            return spellData.staminaBlock 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].staminaBlock = value
                        end,
                        width = "full",
                        disabled = function() return not (OWSV.useCustomResourceBlockList and spellData.staminaCheck) end
                    })
                    
                    table.insert(controls, {
                        type = "slider",
                        name = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_THRESHOLD"),
                        tooltip = COLOR.SECONDARY..OW.L("OW_MENU_RESOURCE_STAMINA_THRESHOLD_TOOLTIP"),
                        min = 0,
                        max = 100,
                        getFunc = function() 
                            return spellData.staminaPercent 
                        end,
                        setFunc = function(value) 
                            OWSV.customResourceBlockList[spellId].staminaPercent = value
                        end,
                        width = "full",
                        disabled = function() return not (OWSV.useCustomResourceBlockList and spellData.staminaCheck) end
                    })
                    
                    -- Divider between spells
                    table.insert(controls, { type = "divider", alpha = 1.0 })
                end
                
                return controls
            end)()
        },

        -- ====================================================================================================================================================
        -- LICENSE ============================================================================================================================================
        -- ====================================================================================================================================================
        {
            type = "button",
            name = OW.L("OW_MENU_DISCLAIMER_LABEL"),
            tooltip = OW.L("OW_MENU_DISCLAIMER_TOOLTIP"),
            width = "full",
            func = function() end, 
            enabled = false, 
            style = {
                paddingTop = 40,
                labelFont = "ZoFontGameSmall",
                labelColor = ZO_SELECTED_TEXT,
                labelHorizontalAlignment = TEXT_ALIGN_LEFT,
                highlightColor = ZO_ERROR_COLOR,
            }
        }
    }

    --LAM:RegisterOptionControls(OW.name.."_LAM", optionsTable)
    LAM:RegisterOptionControls(OW.name.."Menu", options)
end


-- =============================================================================
-- === MENU TO GLOBAL FOR INITIALIZATION IN MAIN ===============================
-- =============================================================================

OptimalWeave.BuildMenu = BuildMenu

-- =============================================================================
-- === END OF MENU SYSTEM ======================================================
-- =============================================================================