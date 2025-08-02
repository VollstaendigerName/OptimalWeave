-- =============================================================================
-- === OptimalWeave Core Logic (main.lua) - Version 1.3.1                    ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    Description:        Advanced GCD management system for perfect light attack weaving
    Version:            1.3.5
    Author:             Orollas & VollständigerName
    Dependencies:       LibAddonMenu-2.0
--]]
-- =============================================================================
--[[
    SYSTEM ARCHITECTURE:
    - GCD State Machine Manager
    - Input Validation Engine
    - Combat Rhythm Controller
    - Multi-Layer Safety System
--]]
-- =============================================================================

-- =============================================================================
-- == GLOBAL ADDON DEFINITION & VERSION CONTROL ================================
-- =============================================================================
--[[
    Purpose: Establishes fundamental addon identity and version tracking
    Contains:
    - Addon metadata for ESO client recognition
    - Version control using semantic versioning (SemVer)
    - Localization system placeholder
--]]

OptimalWeave = {
    -- Internal namespace identifier (must match folder name)
    name = "OptimalWeave",
    
    -- Semantic version (Major=breaking, Minor=features, Patch=fixes)
    version = "1.3.5",
    
    -- Localization proxy (overridden in localization.lua)
    --L = function() return "" end
}


-- =============================================================================
-- == LOCALIZED ALIASES & RUNTIME REFERENCES ===================================
-- =============================================================================
--[[
    Purpose: Optimize frequent access patterns
    Contains:
    - Localized addon namespace reference
    - Cached event manager reference
    - SavedVariables placeholder initialization
--]]

local OW = OptimalWeave              -- Local namespace alias
local NAME = OW.name                 -- Immutable addon name
local OWSV                           -- Will hold SavedVariables reference
local EM = EVENT_MANAGER             -- Event system shortcut

-- =============================================================================
-- == DEFAULT CONFIGURATION SETTINGS ===========================================
-- =============================================================================
--[[
    Purpose: Fallback settings for first-time users
    Structure:
    - Mode: 1=Hard, 2=Soft, 3=Disabled
    - Technical: Latency compensation values
    - Safety: Input blocking conditions
    - Lists: Custom ability management
--]]

defaults = {
    mode = 1,                        -- Operating mode selector
    autoLag = true,                  -- Dynamic latency detection toggle
    inputLag = 50,                   -- Manual latency override (ms)
    block = true,                    -- Global input blocking enabled
    combat = true,                   -- Combat-only restriction
    blockGroundAbilities = true,     -- Ground AOE protection
    checkTarget = true,              -- Target requirement
    neverBlockedAbilityIDs = {},


    -- Nightblade
    grimFocusSkillIds = {
        [61919] = false, -- Merciless
        [61927] = false, -- Relentless
        [61902] = false  -- Grim
    },

    grimFocusStackIds = {
        [122586] = true, --Merciless
        [122585] = true, --Grim
        [122587] = true  -- Relentless
    },

    useGrimFocusStacks = false,
    grimFocusStacks = 10, -- How many grim focus stacks

    deathStrokeMorphs = {
                         -- Death Stroke
        [36514] = false -- Soul Harvest
                         -- Incapacitating Strike
    },
    
    incapacitatingStrikeStacks = 120,

    -- Arcanist
    arcaBeamSkillIds = {
        [185805] = false, -- Base Mag
        [183122] = false, -- Exhausting Fatecarver Mag
        [186366] = false,  -- Pragmatic Fatecarver Mag
        [193397] = false, -- Base Stam
        [193398] = false, -- Exhausting Fatecarver Stam
        [193331] = false  -- Pragmatic Fatecarver Stam

    },

    cruxId = 184220,    
    useCruxStacks = false,
    cruxStacks = 3,

    -- Mages guild
    lightMorphs = {
                         -- Magelight
        [40478] = false -- Inner light
                         -- Radiant Magelight
    },

    -- Fighters guild
    hunterMorphs = {
                         -- Expert Hunter
        [61927] = false -- Camouflaged Hunter
                         -- Evil Hunter

    },

    dawnbreakerMorphs = {
                         -- Dawnbreaker
        [40161] = false -- Flawless Dawnbreaker
                         -- Dawnbreaker of Smiting

    },

    channelBufferNormal = 50,       -- Default: 50ms
    channelBufferChanneled = 200,   -- Default: 200ms
    gcdTrackingSlot = 3,            -- Default: Slot 3
    minGcdThreshold = 10,           -- Default: 10ms
    baseQueueTime = 1050,           -- Default: 1050ms

    disableTank = true,
    disableHeal = true,
    originalMode = 0 
}

local LFG_ROLE_TANK = 2
local LFG_ROLE_HEAL = 4
local LFG_ROLE_DPS = 1
  

-- =============================================================================
-- == ABILITY VALIDATION SUBSYSTEM =============================================
-- =============================================================================
--[[
    Function: IsBlockedAbilityID
    Purpose: Check against hardcoded blocklist
    Logic:
    1. Iterate through BlockedAbilityIDs table
    2. Return true on first match
    3. Fallback to false if no match
    - Bypasses all configuration settings
--]]

--------------------------------------------------------------------------------
-- Hardcoded Ability Blocklist Check
-- @param id: AbilityID to validate
-- @return: Boolean blocking status
--------------------------------------------------------------------------------
local function IsBlockedAbilityID(id)
    return OWSV.neverBlockedAbilityIDs and OWSV.neverBlockedAbilityIDs[id] or false
end

-- =============================================================================
-- == ROLE VALIDATION SUBSYSTEM ================================================
-- =============================================================================

function CheckRoleOverride()
    role = GetSelectedLFGRole()
    if not (OWSV.disableTank and role == LFG_ROLE_TANK) and 
       not (OWSV.disableHeal and role == LFG_ROLE_HEAL) and
       (OWSV.originalMode == 0) then
        OWSV.originalMode = OWSV.Mode
    elseif (OWSV.disableTank and role == LFG_ROLE_TANK) or 
       (OWSV.disableHeal and role == LFG_ROLE_HEAL) then

        OWSV.mode = 3
    else
        OWSV.mode = 1 --OWSV.originalMode
    end    
end

-- =============================================================================
-- == CHECK IF GRIM FOCUS STATUS ===============================================
-- =============================================================================
--[[
     Function: checkGrimFocus
    Purpose:
      Determines whether an ability should be blocked based on the current Grim Focus
      stacks. Specifically:
        - For "Relentless Focus": completely blocks the ability when conditions are met.
        - For "Merciless" and "Grim": blocks the ability once the defined number of Grim Focus
          stacks has been reached.
          
    Process Flow:
      1. Initialization:
         - Sets the default 'active' value to false, meaning the ability is blocked by default.
         - Establishes the stack limit (stackLimit) from configuration; if Grim Focus stacks are not in use,
           it falls back to a default value of 10.
          
      2. Iteration Through Buffs:
         - Loops over all active buffs on the player.
         - Retrieves key parameters for each buff (e.g., end time, stack count, abilityId) for evaluation.
          
      3. Buff Condition Evaluation:
         A. For the buff corresponding to the Grim Focus skill at index 2 (used for a specific Grim Focus morph)
            and identified as a relevant Grim Focus stack:
               - If using Grim Focus stacks and the current stack count is equal to or exceeds the stack limit,
                 while ensuring that buff ID 61927 is not active, then the ability remains blocked (active = false).
               - Otherwise, the block is lifted (active = true) and the loop exits.
               
         B. For buffs matching the other Grim Focus morphs (grimFocusSkillIds at index 1 or 3) and qualifying as
            a Grim Focus stack:
               - If either Grim Focus stacking is enabled or the respective skill is active, and the stack count 
                 meets or exceeds the threshold, then the ability is blocked (active = false).
               - Otherwise, the block is not applied (active = true).
          
      4. Return:
         - Returns the 'active' state which indicates whether the ability should be allowed (true) or blocked (false).
--]]

--------------------------------------------------------------------------------
-- Input Validation Master Function
-- @return: Boolean input permission
--------------------------------------------------------------------------------
local function checkGrimFocus(id)
    local active = false -- Initialization of default for block of grim focus
    local stackLimit = OWSV.grimFocusStacks

    if not OWSV.useGrimFocusStacks then
        stackLimit = 10
    end

    for buffIndex = 1, GetNumBuffs('player') do
        local _, _, timeEnding, _, stackCount, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)
        if 61927 == id and OWSV.grimFocusStackIds[abilityId] then
           if OWSV.useGrimFocusStacks and stackCount >= stackLimit and not OWSV.grimFocusSkillIds[61927] then
                active = false
            else 
                active = true
                break
            end

        elseif OWSV.grimFocusStackIds[abilityId] then
            if (OWSV.useGrimFocusStacks or OWSV.grimFocusSkillIds[id]) and stackCount >= stackLimit then
                active = false
            else 
                active = true
            end
        end
    end
    return active
end

-- =============================================================================
-- == CHECK CRUX STACK STATUS ==================================================
-- =============================================================================
--[[
Function: checkCruxStacks
    Purpose:
      Evaluates the current Crux buff status on the player to determine whether
      an ability should remain active or be blocked. Specifically, if the number of
      Crux stacks reaches or exceeds the specified threshold (OWSV.cruxStacks),
      the ability is blocked (active = false).

    Process Flow:
      1. Iterate through all active buffs on the player.
      2. Identify the buff that matches the Crux ability by comparing the buff's abilityId
         with the configured OWSV.CruxId.
      3. Check the stack count of the identified Crux buff:
            - If the stack count is equal to or greater than the defined threshold (OWSV.cruxStacks),
              set 'active' to false (i.e., block the ability) and exit the loop.
            - Otherwise, set 'active' to true and exit the loop.
      4. Return the final status, where 'true' indicates the ability is allowed and 'false'
         indicates it is blocked.
--]]

--------------------------------------------------------------------------------
-- Input Validation Master Function
-- @return: Boolean input permission
--------------------------------------------------------------------------------
local function checkCruxStacks(id)
    local active = true 
    -- d("Check Crux stacks block in checkCruxStacks(")
    -- d("OWSV.CruxId ".. tostring(OWSV.CruxId))
    for buffIndex = 1, GetNumBuffs('player') do
        local _, _, timeEnding, _, stackCount, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)

        if OWSV.cruxId == abilityId then
            --d("Check Crux stacks block in OWSV.CruxId == abilityId")
           if stackCount >= OWSV.cruxStacks then
                active = false
                --d("active = false")
                break
            else 
                active = true
                --d("active = true")
                break
            end
        end
    end
    return active
end

-- =============================================================================
-- == GROUND ABILITY DETECTION SYSTEM ==========================================
-- =============================================================================
--[[
    Function: CheckGroundAbility
    Purpose: Identify ground-targeted abilities with caching
    Features:
    - Uses ESO's localized string comparison
    - Implements memoization pattern
    - Auto-detects ground AOEs dynamically
--]]

-- Cache localized ground target description
local groundString = GetString(SI_ABILITY_TOOLTIP_TARGET_TYPE_GROUND)
local groundAbilities = {}  -- AbilityID:isGround cache

--------------------------------------------------------------------------------
-- Ground Ability Detection with Memoization
-- @param id: AbilityID to check
-- @return: Boolean ground-target status
--------------------------------------------------------------------------------
local function CheckGroundAbility(id)
    -- Cache miss handling
    if groundAbilities[id] == nil then
        -- Execute string comparison once per ability
        groundAbilities[id] = (GetAbilityTargetDescription(id) == groundString)
    end
    return groundAbilities[id]  -- Return cached value
end

-- =============================================================================
-- == COMBAT STATE MANAGEMENT ==================================================
-- =============================================================================
--[[
    State Machine Definition:
    0 = Inactive: No GCD restrictions
    1 = Locked: GCD active, no inputs
    2 = QueueWindow: Valid LA window
    3 = LAQueued: Light Attack pending
    4 = SkillQueued: Ability queued
--]]

local GCD_STAGE = 0  -- Current state machine position
local CHANNEL = 0    -- Channel expiration timestamp
local LAST_ABILITY = 0  -- Last used ability ID tracker

-- =============================================================================
-- == STUN HANDLING SYSTEM =====================================================
-- =============================================================================
--[[
    Function: OnPlayerStunned
    Purpose: Reset state on crowd control
    Trigger: EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED
    Features:
    - Full state reset on stun
    - Channel cancellation
    - Memory clearing
--]]

--------------------------------------------------------------------------------
-- Stun Event Handler
-- @param eventCode: ESO event ID
-- @param unitTag: Affected unit ("player")
-- @param isStunned: New stun state
--------------------------------------------------------------------------------
local function OnPlayerStunned(eventCode, unitTag, isStunned)
    -- Validate player stun event
    if unitTag == 'player' and isStunned then
        GCD_STAGE = 0    -- Reset state machine
        CHANNEL = 0      -- Cancel active channels
        LAST_ABILITY = 0 -- Clear ability memory
    end
end

--------------------------------------------------------------------------------
-- Stun Recovery Handler
-- @param eventCode: ESO event ID
-- @param unitTag: Affected unit ("player")
-- @param isStunned: New stun state
--------------------------------------------------------------------------------
local function OnStunEnded(eventCode, unitTag, isStunned)
    -- Detect stun removal
    if unitTag == 'player' and not isStunned then
        GCD_STAGE = 0  -- Full state reset
    end
end

-- =============================================================================
-- == ACTION SLOT PROCESSING ===================================================
-- =============================================================================
--[[
    Function: GetActionSlot
    Purpose: Extract slot from debug stack
    Methodology:
    - Parses debug.traceback() output
    - Matches ACTION_BUTTON_X pattern
    - Converts to numeric slot ID
--]]

--------------------------------------------------------------------------------
-- Debug-Based Slot Detection
-- @return: Action slot number (0-8)
--------------------------------------------------------------------------------
local function GetActionSlot()
    -- Extract slot from call stack trace
    return tonumber(debug.traceback():match('ACTION_BUTTON_(%d)')) or 0
end

-- =============================================================================
-- == CORE INPUT VALIDATION LOGIC ==============================================
-- =============================================================================
--[[
    Function: CanUseActionSlots
    Purpose: Main decision gatekeeper
    Process Flow:
    1. Check global blocking conditions
    2. Validate ability type
    3. Calculate latency compensationr
    4. Update state machine
    5. Make final allow/block decision
--]]

--------------------------------------------------------------------------------
-- Input Validation Master Function
-- @return: Boolean input permission
--------------------------------------------------------------------------------
local function CanUseActionSlots()

    if OWSV.mode == 3 then 
        return false 
    end
    
    -- Global block conditions
    local ignore = (OWSV.block and IsBlockActive()) or 
                   (OWSV.combat and not IsUnitInCombat('player')) or 
                   (OWSV.checkTarget and not IsUnitAttackable('reticleover'))
    
    -- Extract action details
    local slot = GetActionSlot()
    local id = GetSlotBoundId(slot)
    local isGround = CheckGroundAbility(id)
    --d("id "..id)
    -- Hard block exit
    if ignore and not OWSV.blockGroundAbilities then
        return false
    end

    -- Grim Focus block
    if (OWSV.grimFocusSkillIds[id] or OWSV.useGrimFocusStacks) and checkGrimFocus(id) then
        --d("Grim Focus block in  CanUseActionSlots")
        return true
    end 

    -- d(OWSV.arcaBeamSkillIds[id] )
    -- Check Crux stacks
    if OWSV.arcaBeamSkillIds[id] and OWSV.useCruxStacks and checkCruxStacks(id) then
       -- d("Check Crux stacks block in  CanUseActionSlots")
        return true
    end 

    -- Special case blocking
    if (ignore and not isGround) or IsBlockedAbilityID(id) then
        return false
    end

    -- Latency calculations
    local cd = GetSlotCooldownInfo(OWSV.gcdTrackingSlot)
    local inputLag = OWSV.autoLag and zo_min(GetLatency() / 2 - 1, 300) or OWSV.inputLag
    local currentTime = GetGameTimeMilliseconds()

    -- State machine transitions
    if cd <= inputLag and currentTime > CHANNEL - inputLag then
        GCD_STAGE = (cd < 1 or GCD_STAGE < 4) and 0 or GCD_STAGE
    elseif cd > 0 and GCD_STAGE == 0 then
        GCD_STAGE = 1
    end

    -- Final decision matrix
    local allow = GCD_STAGE > 0 and 
                 slot >= 3 and slot <= 8 and 
                 (isGround or (not IsBlockedAbilityID(id))) and 
                 (GCD_STAGE >= 3 or OWSV.mode == 1 or isGround)
    
    -- Hard mode queuing
    if not allow and cd > 0 and OWSV.mode == 1 then
        GCD_STAGE = 4
    end
    
    return allow
end

-- =============================================================================
-- == ABILITY USAGE HANDLER ====================================================
-- =============================================================================
--[[
    Function: AbilityUsed
    Purpose: Track ability activations
    Features:
    - Light Attack detection
    - Channel time calculation
    - Ability queuing states
--]]

--------------------------------------------------------------------------------
-- Ability Activation Handler
-- @param _: Unused event parameter
-- @param slot: Activated action slot
--------------------------------------------------------------------------------
local function AbilityUsed(_, slot)
    if OWSV.mode == 3 then 
        return
    end
    -- Light Attack handling
    if slot == 1 then
        GCD_STAGE = 3  -- Set LA queued state
    -- Skill slot handling (3-8)
    elseif slot >= 3 and slot <= 8 then
        local cd = GetSlotCooldownInfo(OWSV.gcdTrackingSlot)
        GCD_STAGE = (cd < (OWSV.minGcdThreshold)) and 2 or 1
        
        local id = GetSlotBoundId(slot)
        local isChanneled, castTime = GetAbilityCastInfo(id)
        
        -- Channel time calculation
        if isChanneled or castTime > 0 then
            local buffer = isChanneled and OWSV.channelBufferChanneled 
                          or OWSV.channelBufferNormal
            CHANNEL = GetGameTimeMilliseconds() + 
                     zo_max(OWSV.baseQueueTime, castTime + buffer)
        else
            CHANNEL = 0  -- No channel time
        end
        
        LAST_ABILITY = id  -- Update ability memory
    end
end

-- =============================================================================
-- == SYSTEM INITIALIZATION ====================================================
-- =============================================================================
--[[
    Function: Initialize
    Purpose: Addon bootstrap process
    Execution Flow:
    1. Load SavedVariables
    2. Register event handlers
    3. Hook into action system
    4. Build configuration menu
--]]

--------------------------------------------------------------------------------
-- Addon Initialization Routine
--------------------------------------------------------------------------------
local function Initialize()
    -- Load persistent settings
    OWSV = ZO_SavedVars:NewAccountWide('OptimalWeaveSV', 1, nil, defaults)

    -- Combat state tracking
    EM:RegisterForEvent(NAME, EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED, OnPlayerStunned)
    EM:RegisterForEvent(NAME, EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED, OnStunEnded)
    EM:RegisterForEvent(NAME, EVENT_PLAYER_ACTIVATED, CheckRoleOverride)
    
    -- Action system integration
    EM:RegisterForEvent(NAME, EVENT_ACTION_SLOT_ABILITY_USED, AbilityUsed)
    ZO_PreHook("ZO_ActionBar_CanUseActionSlots", CanUseActionSlots)

    -- Menu system initialization
    OW.BuildMenu(OWSV, defaults)
   
end

-- =============================================================================
-- == EVENT REGISTRATION & BOOTSTRAPPING =======================================
-- =============================================================================
--[[
    Event: EVENT_ADD_ON_LOADED
    Purpose: Safe addon initialization
    Features:
    - Self-unregistering after load
    - Namespace validation
--]]
EM:RegisterForEvent(NAME, EVENT_ADD_ON_LOADED, function(event, addonName)
    -- Validate addon load
    if addonName == NAME then
        EM:UnregisterForEvent(NAME, EVENT_ADD_ON_LOADED)
        Initialize()  -- Start addon
    end
end)

-- =============================================================================
-- === END OF OPTIMALWEAVE CORE ================================================
-- =============================================================================