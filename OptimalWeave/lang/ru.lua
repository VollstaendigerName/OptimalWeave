-- =============================================================================
-- === OptimalWeave Language File: Russian (ru.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/ru.lua
    Description:        Russian localization using ZO_CreateStringId
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Информация & Советы")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Глобальная перезарядка (GCD) 1000мс. OptimalWeave помогает управлять очередью способностей. Настройте поведение ниже.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Основные Настройки")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Правила Активации")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Расширенное Управление")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Настройки Производительности")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Аддон активен")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Аддон неактивен")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Эта опция отключена")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Внимание: Высокая задержка может замедлить ввод!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Примечание|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Отказ от ответственности:|r Данный аддон не связан с ZeniMax Media Inc. The Elder Scrolls® — зарегистрированная торговая марка ZeniMax Media Inc. Все права защищены.")

-- =============================================================================
-- == CORE SETTINGS ===========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Основные Настройки")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Режим Работы")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Строгий:|r Полная блокировка.\n|cFFFF00Умный:|r Очередь без легкой атаки.\n|c00FFFFНет:|r Отключено.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Строгий")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Умный")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Нет")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Только в Бою")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Активно только во время боя.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Только с Вражеской Целью")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Требует выбора вражеской цели.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Игнорировать Блокировку")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Отключает управление при блокировке.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Блокировать Двойные AoE")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Предотвращает двойное применение способностей.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Отключить как Танк")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Автоотключение в роли Танка")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Отключить как Лекарь")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Автоотключение в роли Лекаря")

-- =============================================================================
-- == BLOCK ID SETTINGS =======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Заблокированные Способности")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Заблокировать Новый ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Введите ID способности (напр. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "Текущие ID")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Кликните для удаления")

-- =============================================================================
-- == ADVANCED SETTINGS =======================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Буфер Мгновенных (мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Запас для мгновенных способностей (0-100мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Буфер Канальных (мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Запас для канальных способностей (0-400мс)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Слот Отслеживания GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Слот панели для GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Минимальный GCD (мс)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Минимальная длительность GCD (0-20мс)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Базовое Время Очереди (мс)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Окно очереди по умолчанию (100-2000мс)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Сброс при смене оружия")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Сбрасывает GCD при смене оружия")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Сброс при уклонении")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Сбрасывает GCD при выполнении переката")

-- =============================================================================
-- == LATENCY COMPENSATION ====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Компенсация Задержки")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Автонастройка")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Автоматическая регулировка задержки.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Ручная Задержка (мс)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Фиксированное значение (0-200мс).")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Настройки классов и гильдий")

ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Мрачный Фокус")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Необходимые стаки")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Количество стаков, необходимое для активации Мрачного Фокуса (Рекомендуется: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Блокировать все морфы Мрачного Фокуса")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Неутомимый Фокус:|r Всегда блокируется\n|cFFFF00• Мрачный Фокус и Безжалостная Решимость:|r Доступен только при 10 стаках\n|cAAAAAAОтключить:|r Поведение по умолчанию для всех морфов")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Активировать пользовательские стаки")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Включено:|r Использует настройку стака \n|cAAAAAAОтключено:|r Всегда блокирует Мрачный Фокус и Безжалостную Решимость до 10 стаков, а также всегда блокирует Неутомимый Фокус\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Гильдии")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Блокировать навыки охотника Гильдии воинов")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Блокирует все морфы навыков охотника Гильдии воинов (Опытный охотник, Замаскированный охотник & Свирепый охотник)")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Блокировать световые навыки Гильдии магов")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Блокирует все морфы световых навыков (Волшебный свет, Внутренний свет & Сияющий волшебный свет)")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Отключить в PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Отключает блокировку способностей Охотника/Света в PvP-зонах")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "Лавовый Хлыст")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "Блокировать навык Лавовый Хлыст")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "Блокирует навык Лавовый Хлыст, чтобы не потерять три стака")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Блокировать Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Блокирует применение Fatecarver до выполнения условий.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Необходимые стаки Crux")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Минимальные стаки Crux для применения Fatecarver (Рекомендуется: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF RUSSIAN LOCALIZATION ============================================
-- =============================================================================