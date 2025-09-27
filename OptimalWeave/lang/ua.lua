-- =============================================================================
-- === OptimalWeave Language File: Ukrainian (ua.lua)                        ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/ua.lua
    Description:        Ukrainian localization using ZO_CreateStringId
    Version:            1.5.0
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Інформація & ДОВІДКА")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Глобальна перезарядка (GCD) становить 1000 мс. OptimalWeave керує чергою здібностей відповідно до обраного режиму для оптимізації плетіння. Використовуйте налаштування для персоналізації поведінки.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Основні механіки")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Правила активації")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Розширені налаштування")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Налаштування продуктивності")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Аддон активний")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Аддон неактивний")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Ця опція зараз вимкнена")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Увага: Висока затримка може спричинити затримки введення!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Застереження|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Відмова від відповідальності:|r Цей додаток не створений, не пов'язаний і не підтримується ZeniMax Media Inc. The Elder Scrolls® та пов'язані логотипи є зареєстрованими торговими марками ZeniMax Media Inc. у США та/або інших країнах. Усі права захищені.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Основні налаштування")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Режим роботи")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Суворий:|r Повне блокування. Черга відсутня під час GCD.\n|cFFFF00Розумний:|r Черга дозволена лише без очікуваної легкої атаки.\n|c00FFFFВідсутній:|r Вимкнено.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Суворий")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Розумний")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Відсутній")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Активно лише в бою")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Керує чергою лише під час бою.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Потрібна ворожа ціль")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Працює лише з ворожими цілями.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ігнорувати при блокуванні")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Вимкнення контролю під час блокування.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Блокувати подвійне застосування по землі")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Запобігає випадковому подвійному застосуванню.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Вимкнути як Танк")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Автоматично вимикається в ролі Танка")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Вимкнути як Лікар")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Автоматично вимикається в ролі Лікаря")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Заблоковані здібності")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Заблокувати новий ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Введіть ID здібності (напр. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "Зараз заблоковані ID")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Клацніть для видалення")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Запас миттєвих (мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Запас безпеки для миттєвих здібностей (0-100 мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Запас канальних (мс)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Запас для канальних здібностей (0-400 мс)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Слот відстеження GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Слот панелі для виявлення GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Мінімальний поріг GCD (мс)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Мінімальна тривалість GCD для виявлення (0-20 мс)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Базовий час черги (мс)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Типове вікно черги (100-2000 мс)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Скидати при зміні зброї")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Скидає GCD при зміні зброї")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Скидати при ухиленні")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Скидає GCD при виконанні ухилення")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Компенсація затримки")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Авторегулювання")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Автоматично регулює відповідно до затримки. Рекомендується для стабільних з'єднань.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Ручна затримка (мс)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Фіксоване значення для нестабільних з'єднань (0-200 мс).")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Специфічні налаштування класів і гільдій")

ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Похмурий фокус")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Потрібні стаки")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Кількість стаків, необхідних перед активацією Похмурого фокусу (Рекомендовано: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Блокувати всі морфи Похмурого фокусу")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Невтомний фокус:|r Завжди заблоковано\n|cFFFF00• Похмурий фокус і Безжальна рішучість:|r Можна використовувати лише при 10 стаках\n|cAAAAAAВимкнено:|r Типова поведінка для всіх морфів")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Активувати користувацькі стаки")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Увімкнено:|r Використовує налаштування стаків \n|cAAAAAAВимкнено:|r Завжди блокує Похмурий фокус і Безжальну рішучість до 10 стаків, і завжди блокує Невтомний фокус\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Гільдії")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Блокувати навички мисливця Гільдії воїнів")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Блокує всі морфи навичок мисливця Гільдії воїнів (Експертний мисливець, Замаскований мисливець & Мисливець зла)")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Блокувати навички світла Гільдії магів")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Блокує всі морфи навичок світла (Магічне світло, Внутрішнє світло & Сяюче магічне світло)")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Вимкнути в PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Вимкає блокування навичок Мисливця/Світла в PvP-зонах")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "Розплавлений батіг")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "Блокувати навичку Розплавлений батіг")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "Блокує навичку Розплавлений батіг, щоб запобігти втраті трьох стаків")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Арканіст Різьблення долі")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Блокувати Різьблення долі")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Запобігає застосуванню Різьблення долі до виконання умов.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Потрібні стаки Крукс")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Мінімальні стаки Крукс для застосування Різьблення долі (Рекомендовано: 3)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM", "Поріг HP (%)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP", "Вимкає блокування Різьблення долі, коли HP нижче цього значення")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE", "Активувати перевірку HP для Різьблення долі")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP", "Вимкає блокування Різьблення долі при низькому здоров'ї")

-- == BLOCK TENTACULAR DREAD SETTINGS ==========================================
ZO_CreateStringId("OW_MENU_SUBCLASS_TENTACULAR", "Щупальцевий жах")
ZO_CreateStringId("OW_MENU_TENTACULAR", "Блокувати Щупальцевий жах")
ZO_CreateStringId("OW_MENU_TENTACULAR_TOOLTIP", "Блокує навичку Щупальцевий жах до виконання умов.")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "В розробці")

-- =============================================================================
-- === END OF UKRAINIAN LOCALIZATION ===========================================
-- =============================================================================