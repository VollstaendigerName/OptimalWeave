-- =============================================================================
-- === OptimalWeave Language File: Simplified Chinese (zh.lua)                ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/zh.lua
    Description:        Chinese localization using ZO_CreateStringId
    Version:            1.4.2
    Author:             Orollas & VollständigerName
--]]
-- =============================================================================

-- =============================================================================
-- == PANEL & AUTHOR INFORMATION ==============================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_PANEL_NAME", "|c6D6D6DOp|r|c8A8A8Atim|r|cA7A7A7al |r|cC4C4C4Wea|r|c6D6D6Dve|r")
ZO_CreateStringId("OW_MENU_AUTHORS", "|cEE82EEO|r|cDD74ECr|r|cCD65EAo|r|cBC57E8l|r|cAB48E6l|r|c9B3AE4a|r|c8A2BE2s|r & |cFFD700Vo|r|cF7D418l|r|cF3D324l|r|cEFD130s|r|cEBD03Ctä|r|cE3CD54n|r|cE0CC60d|r|cDCCA6Ci|r|cD8C978g|r|cD4C784e|r|cD0C690r|r|cCCC49CNa|r|cC4C1B4me|r")
ZO_CreateStringId("OW_MENU_WEBSITE", "https://github.com/VollstaendigerName")

-- =============================================================================
-- == INFORMATION SECTION ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_INFO_HEADER", "信息 & 说明")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "全局冷却 (GCD) 为1000毫秒。OptimalWeave根据所选模式管理技能队列以优化轻击。使用以下设置自定义行为。")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "核心机制")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "激活规则")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "高级控制")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "性能设置")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "插件已启用")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "插件已禁用")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "该选项当前已禁用")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "警告：高延迟值可能导致输入延迟！")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000注意|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000免责声明:|r 本插件与ZeniMax Media Inc.无关联。The Elder Scrolls®是ZeniMax Media Inc.的注册商标。版权所有。")

-- =============================================================================
-- == CORE SETTINGS ===========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "核心设置")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "操作模式")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000严格:|r 完全阻止。\n|cFFFF00智能:|r 无轻击时允许队列。\n|c00FFFF无:|r 禁用。")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "严格")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "智能")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "无")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "仅在战斗中激活")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "仅在战斗期间管理队列。")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "仅敌对目标时激活")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "需要选择敌对目标。")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "格挡时忽略")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "格挡时禁用控制。")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "阻止重复地面技能")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "防止意外重复施放。")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "禁用作为坦克")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "坦克角色时自动禁用")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "禁用作为治疗")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "治疗角色时自动禁用")

-- =============================================================================
-- == BLOCK ID SETTINGS =======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "已阻止技能")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "阻止新ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "输入技能ID（例如：134160）")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "当前已阻止ID")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "点击移除")

-- =============================================================================
-- == ADVANCED SETTINGS =======================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "瞬发缓冲（毫秒）")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "瞬发技能安全间隔（0-100毫秒）")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "引导缓冲（毫秒）")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "引导技能缓冲时间（0-400毫秒）")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "GCD跟踪栏位")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "用于GCD检测的动作栏位（1-8）")
ZO_CreateStringId("OW_MENU_MIN_GCD", "最小GCD阈值（毫秒）")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "识别最小GCD时长（0-20毫秒）")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "基础队列时间（毫秒）")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "默认输入队列窗口（100-2000毫秒）")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "武器切换时重置")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "武器切换时重置全局冷却")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "翻滚时重置")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "翻滚时重置全局冷却")

-- =============================================================================
-- == LATENCY COMPENSATION ====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "延迟补偿")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "自动延迟调整")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "根据延迟自动调整。")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "手动输入延迟（毫秒）")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "不稳定连接时使用固定值（0-200毫秒）。")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "职业和公会专属设置")

ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "严峻焦点")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "所需堆叠数")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "激活严峻焦点前所需的堆叠数 (推荐：10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "阻止所有严峻焦点变形")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• 不懈焦点：|r 始终阻断\n|cFFFF00• 严峻焦点和无情决心：|r 仅在10层堆叠时可用\n|cAAAAAA停用：|r 所有变形采用默认行为")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "启用自定义堆叠数")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700启用：|r 使用自定义堆叠设置 \n|cAAAAAA停用：|r 始终阻断严峻焦点和无情决心至10层堆叠，并始终阻断不懈焦点\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "公会")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "屏蔽战士公会猎人技能")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "屏蔽战士公会猎人技能的所有变体（专家猎人、伪装猎人 & 邪恶猎人）")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "屏蔽法师公会光之技能")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "屏蔽光之技能的所有变体（法师之光、心灵之光 & 炽热法师之光）")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "在PvP中禁用")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "在PvP区域禁用猎人/光明技能封锁")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "熔岩长鞭")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "屏蔽熔岩长鞭技能")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "屏蔽熔岩长鞭技能以防止失去三层效果")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "奥术师命运雕刻者")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "阻止命运雕刻者施放")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "满足条件前阻止施放命运雕刻者")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "需要核心堆叠")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "施放命运雕刻者所需的核心堆叠数（推荐：3）")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF CHINESE LOCALIZATION ============================================
-- =============================================================================