-- =============================================================================
-- === OptimalWeave Core Logic (main.lua)                                    ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    Description:        Advanced GCD management system for perfect light attack weaving
    Version:            1.8.1
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
    version = "1.8.1",
    
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
        [36514] = false  -- Soul Harvest
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

    tentacularDread = {
        [185823] = false -- Tentacular Dread
    },

    cephaliarchsFlail = {
        [183006] = false -- Cephaliarch's Flail
    },
    useCruxStacksCephaliarch = false,  -- Cephaliarch's Flail Crux Check

    deactivateArcaBeamBlockAtHpUnder = 20, -- limit value of HP
    checkHpForArcaBeam = true, -- Check HP before beam

    deactivateArcaBeamBlockAtStamUnder = 20, -- limit value of Stam
    checkStamForArcaBeam = true, -- Check Stam before beam

    cruxId = 184220,    
    useCruxStacks = false,
    cruxStacks = 3,
    usecruxStacksTentacular = false,
    cruxStacksTentacular = 3,

    -- Mages guild
    lightMorphs = {
        [30920] = true, -- Magelight
        [40478] = true, -- Inner light
        [40483] = true  -- Radiant Magelight
    },

    -- Fighters guild
    hunterMorphs = {
        [35762] = true, -- Expert Hunter
        [40195] = true, -- Camouflaged Hunter
        [40194] = true -- Evil Hunter
    },

    dawnbreakerMorphs = {
        [35713] = false, -- Dawnbreaker
        [40161] = false, -- Flawless Dawnbreaker
        [40158] = false  -- Dawnbreaker of Smiting
    },

    useExecuteCheck = false,          -- Enable/disable Execute Check
    executeThreshold = 30,            -- Percentage threshold value for execute

    executeCheckSpells = {
        [63029] = false, -- Radiant Destruction
        [63044] = false, -- Radiant Glory
        [63046] = false, -- Radiant Oppression
        [34851] = false, -- Impale
        [34843] = false, -- Killer's Blade
        [33386] = false, -- Assassin's Blade
    },

    MoltenWhip = {
        [20805] = false -- Molten Whip
    },

    channelBufferNormal = 50,       -- Default: 50ms
    channelBufferChanneled = 200,   -- Default: 200ms
    gcdTrackingSlot = 3,            -- Default: Slot 3
    minGcdThreshold = 10,           -- Default: 10ms
    baseQueueTime = 1050,           -- Default: 1050ms

    disableTank = true,
    disableHeal = true,
    originalMode = 0, 

    resetOnDodge = true,
    resetOnBarswap = true,
    deactivateHunterLightInPvP = true,

    deactivateOnBackbar = {
        features = false, -- Deactivating other features on Backbar
        weaveAssist = false  -- Deactivate weave Assist on Backbar
    },

    deactivateOnWeaponType = {
        none = false, -- Int. = 0
        axe = false,  -- Int. = 1
        hammer = false,  -- Int. = 2
        sword = false,  -- Int. = 3
        twoHandedSword = false,  -- Int. = 4
        twoHandedAxe = false,  -- Int. = 5
        twoHandedHammer = false,  -- Int. = 6
        reservedWeapon = false, -- Int. 7
        bow = false,  -- Int. = 8
        healingStaff = false,  -- Int. = 9
        rune = false,  -- Int. = 10
        dagger = false,  -- Int. = 11
        fireStaff = false,  -- Int. = 12
        frostStaff = false,  -- Int. = 13
        shield = false,  -- Int. = 14
        lightningStaff = false -- Int. 15
    },

    deactivateOnWeapon = {
        features = false, -- Deactivating other features 
        weaveAssist = false  -- Deactivate weave Assist
    },

    deactivateInPvP = {
        features = false, -- Deactivating other features in PVP
        weaveAssist = false  -- Deactivate weave Assist in PVP
    },

    autoEquipWeapons = false, -- Enable/disable automatic weapon activation
}

local LFG_ROLE_TANK = 2
local LFG_ROLE_HEAL = 4
local LFG_ROLE_DPS = 1
local weaponTypeToKey = {
    [WEAPONTYPE_NONE] = "none",
    [WEAPONTYPE_AXE] = "axe",
    [WEAPONTYPE_HAMMER] = "hammer",
    [WEAPONTYPE_SWORD] = "sword",
    [WEAPONTYPE_TWO_HANDED_SWORD] = "twoHandedSword",
    [WEAPONTYPE_TWO_HANDED_AXE] = "twoHandedAxe",
    [WEAPONTYPE_TWO_HANDED_HAMMER] = "twoHandedHammer",
    [WEAPONTYPE_BOW] = "bow",
    [WEAPONTYPE_HEALING_STAFF] = "healingStaff",
    [WEAPONTYPE_RUNE] = "rune",
    [WEAPONTYPE_DAGGER] = "dagger",
    [WEAPONTYPE_FIRE_STAFF] = "fireStaff",
    [WEAPONTYPE_FROST_STAFF] = "frostStaff",
    [WEAPONTYPE_SHIELD] = "shield",
    [WEAPONTYPE_LIGHTNING_STAFF] = "lightningStaff"
}

-- =============================================================================
-- == DEBUG SYSTEM =============================================================
-- =============================================================================
--[[
    Debug Modes:
    - "block": GCD blocking decisions
    - "condition": Ability condition checks  
    - "info": General state information
--]]

local DEBUG_MODES = {
    block = false,      -- GCD blocking decisions
    condition = false,  -- Ability condition checks
    info = false        -- General state information
}

--------------------------------------------------------------------------------
-- Debug Print Function
-- @param mode: Debug category ("block", "condition", "info")
-- @param ...: Messages to print
--------------------------------------------------------------------------------
local function DebugPrint(mode, ...)
    if DEBUG_MODES[mode] then
        d(...)
    end
end

-- =============================================================================
-- == AUTOMATIC WEAPON EQUIPPING ===============================================
-- =============================================================================
--[[
    Function: EquipWeaponsStateChange
    Purpose: Automatically unsheathe weapons when leaving various UI states
    Events: Combat, crafting, chatting, shopping, etc.
--]]

local function EquipWeaponsStateChange()
    if not OWSV.autoEquipWeapons then return end
    
    if ArePlayerWeaponsSheathed() and (IsPlayerInRaid() or IsUnitInDungeon('player') or IsUnitInCombat('player'))  then
        DebugPrint("info", "Draw weapon")
        TogglePlayerWield()
    end
end

-- =============================================================================
-- == DEACTIVATE BASED ON WEAPON ===============================================
-- =============================================================================
--[[
Function: deactivateBasedOnWeapon
    Purpose:
      Determines whether addon features should be deactivated based on the currently
      equipped weapon types. Checks both main hand and off-hand weapons (or backup
      weapons) against the user's configured weapon type blocklist.

    Process Flow:
      1. Identify active weapon pair (main bar or backbar)
      2. Select corresponding equipment slots for checking
      3. Iterate through each weapon slot in the active pair
      4. Retrieve weapon type and map to configuration key
      5. Check if weapon type is in user's deactivation list
      6. Return true if any weapon matches deactivation criteria

    Weapon Handling:
      - Main Bar: EQUIP_SLOT_MAIN_HAND, EQUIP_SLOT_OFF_HAND
      - Backbar: EQUIP_SLOT_BACKUP_MAIN, EQUIP_SLOT_BACKUP_OFF
      - Uses weaponTypeToKey mapping table for configuration lookup
--]]

--------------------------------------------------------------------------------
-- Weapon-Based Deactivation Check
-- @return: Boolean indicating if features should be deactivated for current weapons
--------------------------------------------------------------------------------
function deactivateBasedOnWeapon()
    local ActiveWeaponPair, _ = GetActiveWeaponPairInfo()
    local slots
    
    if ActiveWeaponPair == 1 then
        -- Main Hand
        slots = {EQUIP_SLOT_MAIN_HAND, EQUIP_SLOT_OFF_HAND}
    else
        -- Backbar
        slots = {EQUIP_SLOT_BACKUP_MAIN, EQUIP_SLOT_BACKUP_OFF}
    end
    
    for _, slot in ipairs(slots) do
        local weaponType = GetItemWeaponType(BAG_WORN, slot)
        local key = weaponTypeToKey[weaponType]
        if key and OWSV.deactivateOnWeaponType[key] then
            return true
        end
    end
    
    return false
end

-- =============================================================================
-- == EXECUTE CHECK SYSTEM =====================================================
-- =============================================================================
--[[
Function: checkExecuteReady
    Purpose:
      Evaluates the current target health to determine whether
      an ability should remain active or be blocked. Specifically, if the target health
      is below the specified threshold (OWSV.executeThreshold),
      the ability is allowed (active = true).

    Process Flow:
      1. Check if target exists and is not dead
      2. Get current and maximum health of target
      3. Calculate health percentage
      4. Check if health percentage is below threshold
      5. Return true if ability should be allowed, false if blocked
--]]

--------------------------------------------------------------------------------
-- Execute Check Function
-- @param id: Ability ID being checked
-- @return: Boolean indicating if ability should be allowed
--------------------------------------------------------------------------------
local function checkExecuteReady(id)
    local active = false  -- Default: block the ability
    
    -- Check if target exists and is not dead
    if not DoesUnitExist('reticleover') or IsUnitDead('reticleover') then
        DebugPrint("condition", "Execute Check: Target does not exist or is dead")
        return active
    end
    
    -- Get current and maximum health values of target
    local currentHealth, maxHealth = GetUnitPower('reticleover', POWERTYPE_HEALTH)
    DebugPrint("condition", string.format("Execute Check: Target Health - Current: %d, Maximum: %d", currentHealth, maxHealth))
    
    -- Validate health values to avoid division by zero
    if currentHealth == 0 or maxHealth == 0 then
        DebugPrint("condition", "Execute Check: Invalid health values")
        return active
    end
    
    -- Calculate health percentage
    local percentHP = (currentHealth / maxHealth) * 100
    DebugPrint("condition", string.format("Execute Check: Health Percentage: %.1f%%, Threshold: %.1f%%", percentHP, OWSV.executeThreshold))
    
    -- Check if health is below execute threshold
    if percentHP <= OWSV.executeThreshold then
        active = true  -- Allow ability in execute phase
        DebugPrint("condition", "Execute Check: EXECUTE PHASE ACTIVE - Ability allowed")
    else
        DebugPrint("condition", "Execute Check: Target not in execute phase - Ability blocked")
    end
    
    return active
end

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
--[[
Function: CheckRoleOverride
    Purpose:
      Manages automatic mode switching based on the player's selected role.
      Disables the addon for Tank and Healer roles when configured, while
      preserving the original mode for DPS roles.

    Process Flow:
      1. Retrieve the player's currently selected LFG role
      2. Check if role is Tank/Healer with corresponding disable setting active:
            - If conditions met, save current mode and set addon to disabled (mode 3)
      3. For DPS roles or when restrictions are inactive:
            - Restore the previously saved mode if available
      4. Maintains state tracking to seamlessly transition between role changes

    State Management:
      - originalMode: Stores the previous mode when switching to Tank/Healer
      - mode: Current operational mode (1=Hard, 2=Soft, 3=Disabled)
--]]

--------------------------------------------------------------------------------
-- Role-Based Mode Management
-- @return: None (modifies OWSV state directly)
--------------------------------------------------------------------------------
function CheckRoleOverride()
    local role = GetSelectedLFGRole()

    if (role == LFG_ROLE_TANK and OWSV.disableTank) or
       (role == LFG_ROLE_HEAL and OWSV.disableHeal) then
        -- Just note when we were in DD and not yet saved
        if OWSV.mode ~= 3 and OWSV.originalMode == 0 then
            OWSV.originalMode = OWSV.mode
        end
        -- Tank or Healer on Mode set to None
        OWSV.mode = 3

    else
        -- DD or disabled restriction -> restore saved mode
        if OWSV.originalMode ~= 0 then
            OWSV.mode = OWSV.originalMode
        end
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
    DebugPrint("condition", "Check Crux stacks block in checkCruxStacks(")
    DebugPrint("condition", "OWSV.CruxId ".. tostring(OWSV.CruxId))
    local currentHealth, maxHealth, effHealth = GetUnitPower('player', COMBAT_MECHANIC_FLAGS_HEALTH)
    local pecentHealth = currentHealth / effHealth * 100
    DebugPrint("info", string.format("HP: current: %d / max.: %d / eff. max. %d / Percent %d ", currentHealth, maxHealth, effHealth, pecentHealth))

    local currentStam, maxStam, effStam = GetUnitPower('player', COMBAT_MECHANIC_FLAGS_STAMINA)
    local pecentStam = currentStam / effStam * 100
    DebugPrint("info", string.format("Stamina: current: %d / max.: %d / eff. max. %d / Percent %d ", currentStam, maxStam, effStam, pecentStam))

    if (OWSV.checkHpForArcaBeam and pecentHealth <= OWSV.deactivateArcaBeamBlockAtHpUnder) or (OWSV.checkStamForArcaBeam and pecentStam <= OWSV.deactivateArcaBeamBlockAtStamUnder) then
        active = false
        DebugPrint("condition", "active = false")
    else    
        for buffIndex = 1, GetNumBuffs('player') do
            local _, _, timeEnding, _, stackCount, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)
            DebugPrint("condition", "Buff"..abilityId)
            if OWSV.cruxId == abilityId then
                DebugPrint("condition", "Check Crux stacks block in OWSV.CruxId == abilityId")
                if stackCount >= OWSV.cruxStacks then
                    active = false
                    DebugPrint("condition", "active = false")
                    break
                else 
                    active = true
                    DebugPrint("condition", "active = true")
                    break
                end
            end
        end    
    end
    return active
end

-- =============================================================================
-- == CHECK CRUX STACK STATUS FOR CEPHALIARCH'S FLAIL ==========================
-- =============================================================================
--[[
Function: checkCruxStacksCephaliarch
    Purpose:
      Evaluates the current Crux buff status on the player to determine whether
      Cephaliarch's Flail should be allowed or blocked. Specifically, if the number of
      Crux stacks reaches or exceeds 3, the ability is allowed (active = true).

    Process Flow:
      1. Iterate through all active buffs on the player.
      2. Identify the buff that matches the Crux ability by comparing the buff's abilityId
         with the configured OWSV.CruxId.
      3. Check the stack count of the identified Crux buff:
            - If the stack count is equal to or greater than 3,
              set 'active' to true (i.e., allow the ability) and exit the loop.
            - Otherwise, set 'active' to false and exit the loop.
      4. Return the final status, where 'true' indicates the ability is allowed and 'false'
         indicates it is blocked.
--]]

--------------------------------------------------------------------------------
-- Crux Stack Validation for Cephaliarch's Flail
-- @param id: Ability ID being checked
-- @return: Boolean indicating if ability should be allowed
--------------------------------------------------------------------------------
local function checkCruxStacksCephaliarch(id)
    local active = false 
    DebugPrint("condition", "Check Crux stacks block in checkCruxStacksCephaliarch")
    DebugPrint("condition", "OWSV.CruxId ".. tostring(OWSV.CruxId))
    
    for buffIndex = 1, GetNumBuffs('player') do
        local _, _, timeEnding, _, stackCount, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)
        DebugPrint("condition", "Buff "..abilityId)
        if OWSV.cruxId == abilityId then
            DebugPrint("condition", "Check Crux stacks block in OWSV.CruxId == abilityId")
            if stackCount >= 3 then  -- Always block at 3 stacks
                active = true
                DebugPrint("condition", "active = true due to 3+ Crux stacks")
                break
            else 
                active = false
                DebugPrint("condition", "active = false - less than 3 Crux stacks")
                break
            end
        end
    end    
    return active
end

-- =============================================================================
-- == CHECK CRUX STACK STATUS FOR TENTACULAR DREAD =============================
-- =============================================================================
--[[
Function: checkCruxStacksTentacular
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
local function checkcruxStacksTentacular(id)
    local active = true 
    DebugPrint("condition", "Check Crux stacks block in checkcruxStacks(")
    DebugPrint("condition", "OWSV.CruxId ".. tostring(OWSV.CruxId))
    
    for buffIndex = 1, GetNumBuffs('player') do
        local _, _, timeEnding, _, stackCount, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)
        DebugPrint("condition", "Buff"..abilityId)
        if OWSV.cruxId == abilityId then
            DebugPrint("condition", "Check Crux stacks block in OWSV.CruxId == abilityId")
            if stackCount >= OWSV.cruxStacksTentacular then
                active = false
                DebugPrint("condition", "active = false")
                break
            else 
                active = true
                DebugPrint("condition", "active = true")
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
-- == RESET GCD ================================================================
-- =============================================================================
--[[
    Function: ResetGCDOnDodge / ResetGCDOnBarswap / ResetGCD / OnPlayerStunned
    Purpose: Reset state 
    Features:
    - Full state reset on stun
    - Channel cancellation
    - Memory clearing
--]]

local function ResetGCDOnDodge()
    if OWSV.resetOnDodge  then
        GCD_STAGE = 0
        CHANNEL = 0
        LAST_ABILITY = 0
        DebugPrint("block", "Reset because of Dodge")
    end   
end

local function ResetGCDOnBarswap()
    if OWSV.resetOnBarswap  then
        GCD_STAGE = 0
        CHANNEL = 0
        LAST_ABILITY = 0
        DebugPrint("block", "Reset because of Barswap")
    end   
end

local function ResetGCD()
    GCD_STAGE = 0
    CHANNEL = 0
    LAST_ABILITY = 0
    DebugPrint("block", "Reset because everything else")
end

local function OnPlayerStunned()
    GCD_STAGE = 0    -- Reset state machine
    CHANNEL = 0      -- Cancel active channels
    LAST_ABILITY = 0 -- Clear ability memory
    DebugPrint("block", "Stunned/Silenced etc.")
end

local function CastCanceled() -- Check if 
    if IsBlockActive() then
        DebugPrint("block", "Block")
        GCD_STAGE = 0    -- Reset state machine
        CHANNEL = 0      -- Cancel active channels
        LAST_ABILITY = 0 -- Clear ability memory
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

    -- Global block conditions
    local ignore = (OWSV.block and IsBlockActive()) or 
                   (OWSV.combat and not IsUnitInCombat('player')) or 
                   (OWSV.checkTarget and not IsUnitAttackable('reticleover'))
    
    -- Extract action details
    local slot = GetActionSlot()
    local id = GetSlotBoundId(slot)
    local isGround = CheckGroundAbility(id)
    local _, _, _, _, _, _, _, _, _, _, abilityId = GetUnitBuffInfo('player', buffIndex)
    
    DebugPrint("info", "Buff"..abilityId)
    DebugPrint("info", "id "..id)
    -- Hard block exit
    if ignore and not OWSV.blockGroundAbilities then
        return false
    end

    -- PvP Deactivation Check
    local inPvPWorld = IsPlayerInAvAWorld() or IsActiveWorldBattleground()
    if OWSV.deactivateInPvP.features and inPvPWorld then
        DebugPrint("block", "disable features in PvP")
        return false
    end

    -- disable on backbar
    local ActiveWeaponPair, _ = GetActiveWeaponPairInfo()
    --d("ActiveWeaponPair"..ActiveWeaponPair)
    if (OWSV.deactivateOnBackbar.features  and (ActiveWeaponPair == 2)) or (OWSV.deactivateOnWeapon.features  and deactivateBasedOnWeapon()) then
        DebugPrint("block", "disable features")
        return false
    end

    -- Grim Focus block
    if (OWSV.grimFocusSkillIds[id] or OWSV.useGrimFocusStacks) and checkGrimFocus(id) then
        DebugPrint("condition", "Grim Focus block in CanUseActionSlots")
        return true
    end 

    -- Arca Beam
    -- d(OWSV.arcaBeamSkillIds[id] )
    -- Check Crux stacks
    if OWSV.arcaBeamSkillIds[id] and OWSV.useCruxStacks and checkCruxStacks(id) then
        DebugPrint("condition", "Check Crux stacks block in CanUseActionSlots")
        return true
    end 

    -- Cephaliarch's Flail
    if OWSV.cephaliarchsFlail[id] and OWSV.useCruxStacksCephaliarch and checkCruxStacksCephaliarch(id) then
        DebugPrint("condition", "Cephaliarch's Flail block in CanUseActionSlots")
        return true
    end

    -- Tentacular Dread
    if OWSV.tentacularDread[id] and OWSV.usecruxStacksTentacular and checkcruxStacksTentacular(id) then
        DebugPrint("condition", "Check Crux stacks block in CanUseActionSlots")
        return true
    end 

    -- Execute Check: Block spell until execute phase is reached
    if OWSV.useExecuteCheck and OWSV.executeCheckSpells[id] then
        DebugPrint("condition", string.format("Execute Check: Checking spell ID %d", id))
        if checkExecuteReady(id) then
            DebugPrint("condition", "Execute Check: Spell blocked by Execute Check")
            return false
        else
            DebugPrint("condition", "Execute Check: Spell permitted by Execute Check")
            return true
        end
    end

    --local inPvPWorld = IsPlayerInAvAWorld() or IsActiveWorldBattleground() -- Helper variable
    -- Light Morphs & Hunter Morphs block in non-PvP areas
    if not (OWSV.deactivateHunterLightInPvP and inPvPWorld) then
        -- Mages Guild Light morphs block
        if OWSV.lightMorphs[id] or OWSV.hunterMorphs[id] then
            DebugPrint("condition", "Light/Hunter block")
            -- ResetGCD()
            return true
        end
    end

    if OWSV.MoltenWhip[id] then
        DebugPrint("condition", "MoltenWhip block")
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

    -- PvP Deactivation Check
    local inPvPWorld = IsPlayerInAvAWorld() or IsActiveWorldBattleground()
    if OWSV.deactivateInPvP.weaveAssist and inPvPWorld then
        DebugPrint("block", "disable Weave Assist in PvP")
        return
    end

    local ActiveWeaponPair, _ = GetActiveWeaponPairInfo()
    if (OWSV.deactivateOnBackbar.weaveAssist and (ActiveWeaponPair == 2)) or (OWSV.deactivateOnWeapon.weaveAssist and deactivateBasedOnWeapon()) then
        DebugPrint("block", "disable Weave Assist")
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

    -- Reset tracking
	if OWSV.resetOnBarswap then
		EM:RegisterForEvent(NAME, EVENT_ACTIVE_WEAPON_PAIR_CHANGED, ResetGCDOnBarswap) -- changed bar
	end

	if OWSV.resetOnDodge then
		EM:RegisterForEvent(NAME, EVENT_COMBAT_EVENT, ResetGCDOnDodge)
		EM:AddFilterForEvent(NAME, EVENT_COMBAT_EVENT, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)
		EM:AddFilterForEvent(NAME, EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, 28549)
	end

    EM:RegisterForEvent(NAME, EVENT_PLAYER_SWIMMING, ResetGCD)
    EM:RegisterForEvent(NAME, EVENT_PLAYER_DEAD, ResetGCD)
    EM:RegisterForEvent(NAME .."BLOCK", EVENT_COMBAT_EVENT, CastCanceled)

    -- Combat state tracking
    EM:RegisterForEvent(NAME .. "_INTERRUPT", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_INTERRUPT", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_INTERRUPT)
    EM:AddFilterForEvent(NAME .. "_INTERRUPT", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_STUNNED", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_STUNNED", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_STUNNED)
    EM:AddFilterForEvent(NAME .. "_STUNNED", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_FEARED", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_FEARED", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_FEARED)
    EM:AddFilterForEvent(NAME .. "_FEARED", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_SILENCED", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_SILENCED", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_SILENCED)
    EM:AddFilterForEvent(NAME .. "_SILENCED", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_KNOCKBACK", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_KNOCKBACK", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_KNOCKBACK)
    EM:AddFilterForEvent(NAME .. "_KNOCKBACK", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_OFFBALANCE", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_OFFBALANCE", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_OFFBALANCE)
    EM:AddFilterForEvent(NAME .. "_OFFBALANCE", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_CHARMED", EVENT_COMBAT_EVENT, OnPlayerStunned)
    EM:AddFilterForEvent(NAME .. "_CHARMED", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_CHARMED)
    EM:AddFilterForEvent(NAME .. "_CHARMED", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME .. "_SPRINTING", EVENT_COMBAT_EVENT, ResetGCD)
    EM:AddFilterForEvent(NAME .. "_SPRINTING", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_SPRINTING)
    EM:AddFilterForEvent(NAME .. "_SPRINTING", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TAG, COMBAT_UNIT_TYPE_PLAYER)

    EM:RegisterForEvent(NAME, EVENT_PLAYER_ACTIVATED, CheckRoleOverride)

    if OWSV.autoEquipWeapons then
        EM:RegisterForEvent(NAME .. "_EquipCombat", EVENT_PLAYER_COMBAT_STATE, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipBook", EVENT_HIDE_BOOK, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipCrafting", EVENT_END_CRAFTING_STATION_INTERACT, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipChat", EVENT_CHATTER_END, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipStore", EVENT_CLOSE_STORE, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipAlive", EVENT_PLAYER_ALIVE, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipLoot", EVENT_LOOT_CLOSED, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipActivated", EVENT_PLAYER_ACTIVATED, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipSwimming", EVENT_PLAYER_NOT_SWIMMING, EquipWeaponsStateChange)
        EM:RegisterForEvent(NAME .. "_EquipInteraction", EVENT_INTERACTION_ENDED, EquipWeaponsStateChange)
    end    

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