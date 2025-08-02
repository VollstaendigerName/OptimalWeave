-- =============================================================================
-- === OptimalWeave Language File: German (de.lua)                           ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/de.lua
    Description:        German localization using ZO_CreateStringId
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Information & LIESMICH")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "OptimalWeave optimiert das Weaving durch intelligente Fähigkeitssteuerung basierend auf deinem gewählten Modus.\n\n"..
"Passe die Einstellungen in den Untermenüs an, um das Blockverhalten deinen Vorlieben und deinem Spielstil anzupassen.")

ZO_CreateStringId("OW_MENU_MODE_HEADER", "Grundlegende Einstellungen")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Aktivierungsregeln")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Erweiterte Steuerung")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Leistungseinstellungen")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon aktiv")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inaktiv")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Diese Option ist aktuell deaktiviert")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Warnung: Hohe Latenzwerte können Eingabeverzögerungen verursachen!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Hinweis|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Hinweis:|rDiese Erweiterung wird von der ZeniMax Media Inc. und deren verbundenen Unternehmen weder hergestellt noch unterstützt. The Elder Scrolls® und zugehörige Logos sind registrierte Markenzeichen oder Markenzeichen der ZeniMax Media Inc. in den Vereinigten Staaten und/oder anderen Ländern. Alle Rechte vorbehalten.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Haupteinstellungen")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Betriebsmodus")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Hart:|r Strikte Blockade. Kein Skill-Queuing während GCD.\n|cFFFF00Sanft:|r Smarte Blockade. Skill-Queuing nur erlaubt, wenn kein Leichter Angriff in der Queue ist.\n|c00FFFFKein:|r Deaktiviert.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Hart")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Sanft")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Kein")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Nur im Kampf aktiv")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Wenn aktiviert, verwaltet OptimalWeave das Queuing nur während des Kampfes.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Nur mit feindlichem Ziel")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Wenn aktiviert, verwaltet OptimalWeave das Queuing nur bei ausgewähltem feindlichem Ziel.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignorieren beim Blocken")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Wenn aktiviert, beeinflusst OptimalWeave das Queuing nicht während aktiver Blockierung.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Boden-Fähigkeiten-Doppelcast blockieren")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Verhindert versehentliches doppeltes Queuen derselben bodengezielten Fähigkeit in kurzer Folge.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Deaktivieren als Tank")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Automatisch abschalten wenn Tank-Rolle aktiv")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Deaktivieren als Heiler")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Automatisch abschalten wenn Heiler-Rolle aktiv")

-- =============================================================================
-- == BLOCK ID SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Blockierte Fähigkeiten")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Neue ID blockieren")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Gib eine Ability-ID ein (z.B. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "Aktuell blockierte IDs")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Klicke zum Entfernen")

-- =============================================================================
-- == Advanced SETTINGS ========================================================
-- =============================================================================    
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Instant-Zauber Puffer (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Sicherheitsabstand für Instant-Fähigkeiten (0-100ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Kanalisierungs-Puffer (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Pufferzeit für kanalisierte Fähigkeiten (0-400ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "GCD-Tracking Slot")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Aktionsleisten-Slot für GCD-Erkennung (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Minimale GCD-Dauer (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Minimale GCD-Dauer zur Erkennung (0-20ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Basis-Warteschlangenzeit (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Standard-Input-Warteschlange (100-2000ms)")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Latenzkompensation")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Automatische Latenzanpassung")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Automatische Timing-Anpassung basierend auf aktueller Latenz. Empfohlen bei stabiler Verbindung.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Manuelle Eingabelatenz (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Fester Latenzwert (0-200ms). Nur bei deaktivierter Automatik wirksam.")


-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

-- == Grim Focus SETTINGS ======================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Klassenspezifische Einstellungen")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Grimmiger Fokus")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Benötigte Stacks")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Anzahl Stacks bevor Grimmiger Fokus aktivierbar wird (Empfohlen: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Alle Grimmiger Fokus-Morphs blockieren")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Unermüdlicher Fokus:|r Immer blockiert\n|cFFFF00• Grimmiger Fokus und Gnadenlose Entschlossenheit:|r Nur bei 10 Stacks nutzbar\n|cAAAAAADeaktivieren:|r Standardverhalten für alle Morphs")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Benutzerdefinierte Stacks aktivieren")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Aktiviert:|r Verwendet Stack-Einstellung \n"..
                  "|cAAAAAADeaktiviert:|r Grimmiger Fokus und Gnadenlose Entschlossenheit immer bis 10 Stacks blockieren, Unermüdlicher Fokus immer blockieren\n")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Schicksalsschnitzer")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Schicksalsschnitzer blockieren")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Verhindert das Wirken von Schicksalsschnitzer, bis Bedingungen erfüllt sind.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Benötigte Crux-Stacks")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Minimale Anzahl an Crux-Stacks, bevor Schicksalsschnitzer gewirkt werden kann (Empfohlen: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF GERMAN LOCALIZATION ==============================================
-- =============================================================================