-- =============================================================================
-- === OptimalWeave Localization System (localization.lua)                   ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               localization.lua
    Description:        Core localization system providing string lookup
                        functionality via ZO_CreateStringId definitions.
                        MUST load after all language files in manifest.
    Dependencies:       lang/*.lua files
    Author:             Orollas & VollständigerName
    Version:            1.4.2
--]]
-- =============================================================================

-- =============================================================================
-- == INITIALIZATION & SAFETY CHECKS ===========================================
-- =============================================================================

-- Create fallback table if not exists -----------------------------------------
--if not OptimalWeave then OptimalWeave = {} end  -- Global namespace protection

-- Create local references -----------------------------------------------------
local OW = OptimalWeave                         -- Alias for global AddOn table
local NAME = OW.name or "OptimalWeave"          -- Fallback for AddOn name

-- =============================================================================
-- == CORE LOCALIZATION FUNCTIONALITY ==========================================
-- =============================================================================

--------------------------------------------------------------------------------
-- Localization master function with error handling and string formatting
-- @function OW.L
-- @description Primary localization access point handling:
--              - String ID validation
--              - Error reporting for missing keys
--              - Dynamic string formatting
-- @param key string - ZO_CreateStringId identifier (case-sensitive)
-- @param ... any - Optional format arguments (supports %s, %d, etc.)
-- @return string - Localized text or error placeholder
--------------------------------------------------------------------------------
OW.L = function(key, ...)
    -- Validate key existence --------------------------------------------------
    if _G[key] == nil then  -- Check global namespace for string ID registration
        -- Create error message with colored prefix
        local errorMsg = string.format(
            "|cFFFF00[%s]|r Warning: Missing localization key |cFF0000'%s'|r",
            NAME,
            tostring(key)
        )
        
        -- Print to chat console for debugging
        DEFAULT_CHAT_FRAME:AddMessage(errorMsg, 1.0, 0.82, 0.0)  -- Gold color
        
        -- Return visible placeholder for UI elements
        return string.format("|cFF0000[!%s!]|r", key)
    end

    -- Retrieve and format string ----------------------------------------------
    local stringId = _G[key]              -- Get registered string ID
    local formatArgs = { ... }            -- Capture variable arguments
    local formattedString = GetString(stringId, unpack(formatArgs))  -- ESO API call
    
    -- Return final processed string
    return formattedString
end

-- =============================================================================
-- == END OF LOCALIZATION SYSTEM ===============================================
-- =============================================================================