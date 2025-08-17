--------------------------------------------------------------------------------
-- OptimalWeave menu.lua 
-- =============================================================================
-- AddOn Name:        OptimalWeave
-- Description:       Advanced configuration menu system for OptimalWeave AddOn
-- Authors:           Orollas & VollständigerName
-- Version:           1.4.2
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

-- =============================================================================
-- == COLOR SCHEMA =============================================================
-- =============================================================================
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

local function CreateCheckbox(nameKey, tooltipKey, OWgetFunc, OWsetFunc, disabledFunc)
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
        disabled = disabledFunc
    }
end

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
        choicesValues = {1, 2, 3}
    }
end

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
-- == MENU STRUCTURE ===========================================================
-- =============================================================================

local function CreateSectionHeader(text)
    return {
        type = "divider",
        alpha = 0.3
    }, {
        type = "description",
        text = COLOR.ACCENT..text,
        fontSize = "medium"
    }
end

function OW.BuildMenu(OWSV, defaults)
    local panel = {
        type = "panel",
        name = OW.name,
        displayName = COLOR.ACCENT..OW.L("OW_MENU_PANEL_NAME"),
        author = COLOR.SECONDARY..OW.L("OW_MENU_AUTHORS"),
        version = COLOR.PRIMARY..OW.version,
        website = OW.L("OW_MENU_WEBSITE"),
        registerForRefresh = true,
        -- registerForDefaults = true
    }

    LAM:RegisterAddonPanel(OW.name.."Menu", panel)

    local options = {
        -- Information Section (flat, no submenu)
        {
            type = "description",
            text = COLOR.SECONDARY..OW.L("OW_MENU_INFO_TEXT"),
            fontSize = "medium",
            width = "full"
        },

        -- Core Mechanics
        {
            type = "submenu",
            name = COLOR.ACCENT..OW.L("OW_MENU_MODE_HEADER"),
            controls = {
                CreateSectionHeader(OW.L("OW_MENU_MODE_HEADER")),
                CreateDropdown(
                    "OW_MENU_MODE_LABEL",
                    "OW_MENU_MODE_TOOLTIP",
                    {"OW_MENU_MODE_CHOICE_HARD", "OW_MENU_MODE_CHOICE_SOFT", "OW_MENU_MODE_CHOICE_NONE"},
                    function() return OWSV.mode end,
                    -- function(value)
                    --     if tostring(value) == COLOR.SECONDARY .. OW.L("OW_MENU_MODE_CHOICE_NONE") then
                    --         valueMode = 3
                    --     elseif tostring(value) == COLOR.SECONDARY .. OW.L("OW_MENU_MODE_CHOICE_SOFT") then
                    --         valueMode = 2
                    --     elseif tostring(value) == COLOR.SECONDARY .. OW.L("OW_MENU_MODE_CHOICE_HARD") then
                    --         valueMode = 1
                    --     else
                    --         valueMode = 0
                    --     end
                        
                    function(value) -- Tmp fix, fix later
                        if value == 3 then
                            valueMode = 3
                        elseif value == 2 then
                            valueMode = 2
                        elseif value == 1 then
                            valueMode = 1
                        else
                            valueMode = 0
                        end

                        -- d("ValueMode "..valueMode)
                        -- d("Value " ..value)
                        -- d("OWSV.mode "..tostring(OWSV.mode))
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

        -- Activation Conditions
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
                CreateCheckbox(
                    "OW_MENU_DISABLE_TANK",
                    "OW_MENU_DISABLE_TANK_TOOLTIP",
                    function() return OWSV.disableTank end,
                    function(value) 
                        OWSV.disableTank = value
                        CheckRoleOverride()
                    end
                ),
                CreateCheckbox(
                    "OW_MENU_DISABLE_HEAL",
                    "OW_MENU_DISABLE_HEAL_TOOLTIP",
                    function() return OWSV.disableHeal end,
                    function(value) 
                        OWSV.disableHeal = value
                        CheckRoleOverride()
                    end
                ),
            }
        },

        -- Advanced Controls
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
                )
            }
        },

         -- (Sub)class Settings
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
                
                {   
                    type = "divider",
                    alpha = 0.3
                },
                
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

                {   
                    type = "divider",
                    alpha = 0.3
                },

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

                {   
                    type = "divider",
                    alpha = 0.3
                },
                
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
    
        -- Performance Settings
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

    LAM:RegisterOptionControls(OW.name.."_LAM", optionsTable)
    LAM:RegisterOptionControls(OW.name.."Menu", options)
end

-- =============================================================================
-- === END OF MENU SYSTEM ======================================================
-- =============================================================================