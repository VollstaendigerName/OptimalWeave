-- =============================================================================
-- === OptimalWeave Language File: Russian (ru.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/ru.lua
    Description:        Russian localization using ZO_CreateStringId
    Version:            1.8.0
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

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR", "Отключить функции на второй панели")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR_TOOLTIP", "Отключает большинство функций аддона на второй панели оружия.")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR", "Отключить ассистент плетения на второй панели")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR_TOOLTIP", "Отключает ассистент плетения (управление GCD) на второй панели оружия.")

ZO_CreateStringId("OW_MENU_DEACTIVATE_IN_PVP_HEADER", "Отключение в PvP")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_IN_PVP", "Отключить функции в PvP")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_IN_PVP_TOOLTIP", "Отключает большинство функций аддона в PvP-зонах")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP", "Отключить помощник плетения в PvP")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP_TOOLTIP", "Отключает помощник плетения (управление GCD) в PvP-зонах")

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
ZO_CreateStringId("OW_MENU_AUTO_EQUIP_WEAPONS_LABEL", "Автоматически доставать оружие")
ZO_CreateStringId("OW_MENU_AUTO_EQUIP_WEAPONS_TOOLTIP", "Автоматически доставать оружие в бою")

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
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM", "Порог HP (%)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP", "Отключить блокировку Fatecarver при HP ниже этого значения")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE", "Включить проверку HP для Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP", "Отключает блокировку Fatecarver при низком здоровье")

ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM", "Порог Выносливости (%)")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOLTIP", "Отключить блокировку Fatecarver при низкой выносливости")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE", "Включить проверку Выносливости для Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE_TOOLTIP", "Отключает блокировку Fatecarver при низкой выносливости")

-- == BLOCK CEPHALIARCH'S FLAIL SETTINGS =======================================
ZO_CreateStringId("OW_MENU_SUBCLASS_CEPHALIARCHSFLAIL", "Бич цефалиарха")
ZO_CreateStringId("OW_MENU_CEPHALIARCHSFLAIL", "Блокировать Бич цефалиарха")
ZO_CreateStringId("OW_MENU_CEPHALIARCHSFLAIL_TOOLTIP", "Блокирует Бич цефалиарха, когда у вас 3 стака Крукса")

-- == BLOCK TENTACULAR DREAD SETTINGS ==========================================
ZO_CreateStringId("OW_MENU_SUBCLASS_TENTACULAR", "Ужасное щупальце")
ZO_CreateStringId("OW_MENU_TENTACULAR", "Блокировать Ужасное щупальце")
ZO_CreateStringId("OW_MENU_TENTACULAR_TOOLTIP", "Блокирует способность Ужасное щупальце до выполнения условий.")

-- == Execute Check Settings ==========================================
ZO_CreateStringId("OW_MENU_EXECUTE_HEADER", "Проверка добивания")
ZO_CreateStringId("OW_MENU_EXECUTE_ENABLE", "Включить проверку добивания")
ZO_CreateStringId("OW_MENU_EXECUTE_ENABLE_TOOLTIP", "Включает или отключает функцию проверки добивания")
ZO_CreateStringId("OW_MENU_EXECUTE_THRESHOLD", "Порог добивания (%)")
ZO_CreateStringId("OW_MENU_EXECUTE_THRESHOLD_TOOLTIP", "Процент здоровья цели, ниже которого разрешены заклинания добивания")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELLS_HEADER", "Заклинания добивания")

-- == Grouped Execute Spells ==========================================
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_RADIANTMORPHS", "Сияющее разрушение, Сияющая слава, Сияющее угнетение")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_RADIANTMORPHS_TOOLTIP", "Блокирует морфы Сияющего разрушения, пока цель не достигнет порога добивания")

ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS", "Клинок ассасина, Пронзание, Клинок убийцы")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS_TOOLTIP", "Блокирует морфы Клинка ассасина, пока цель не достигнет порога добивания")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- == WEAPON SETTINGS ==========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEADER", "Отключение по типу оружия")

ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON", "Отключить ассистент плетения для типа оружия")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON_TOOLTIP", "Отключает только ассистент плетения (управление GCD) для выбранных типов оружия")

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON", "Отключить функции для типа оружия")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON_TOOLTIP", "Отключает большинство функций аддона для выбранных типов оружия")

-- Одноручное оружие
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE", "Топор")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE_TOOLTIP", "Отключать при экипировке топора")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER", "Молот")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER_TOOLTIP", "Отключать при экипировке молота")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD", "Меч")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD_TOOLTIP", "Отключать при экипировке меча")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER", "Кинжал")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER_TOOLTIP", "Отключать при экипировке кинжала")

-- Двуручное оружие
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD", "Двуручный меч")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD_TOOLTIP", "Отключать при экипировке двуручного меча")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE", "Двуручный топор")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE_TOOLTIP", "Отключать при экипировке двуручного топора")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER", "Двуручный молот")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER_TOOLTIP", "Отключать при экипировке двуручного молота")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW", "Лук")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW_TOOLTIP", "Отключать при экипировке лука")

-- Посохи
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF", "Огненный посох")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF_TOOLTIP", "Отключать при экипировке огненного посоха")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF", "Ледяной посох")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF_TOOLTIP", "Отключать при экипировке ледяного посоха")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF", "Посох молний")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF_TOOLTIP", "Отключать при экипировке посоха молний")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF", "Целительный посох")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF_TOOLTIP", "Отключать при экипировке целительного посоха")

-- Другое оружие
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD", "Щит")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD_TOOLTIP", "Отключать при экипировке щита")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE", "Руна")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE_TOOLTIP", "Отключать при экипировке руны")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE", "Без оружия")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE_TOOLTIP", "Отключать при отсутствии оружия")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED", "Резервное оружие")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED_TOOLTIP", "Отключать при экипировке резервного типа оружия")

-- =============================================================================
-- === END OF RUSSIAN LOCALIZATION ============================================
-- =============================================================================