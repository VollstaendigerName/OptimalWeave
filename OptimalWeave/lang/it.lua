-- =============================================================================
-- === OptimalWeave Language File: Italian (it.lua)                           ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/it.lua
    Description:        Italian localization using ZO_CreateStringId
    Version:            1.4.0
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Informazioni & README")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Il cooldown globale (GCD) è di 1000ms. OptimalWeave gestisce la coda delle abilità in base alla modalità selezionata. Personalizza il comportamento con le impostazioni.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Meccaniche principali")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Regole di attivazione")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Controlli avanzati")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Impostazioni prestazioni")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon attivo")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inattivo")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Questa opzione è disabilitata")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Attenzione: Latenza alta può causare lag!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Disclaimer|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP", "|cFF0000Disclaimer:|r Questo addon non è affiliato con ZeniMax Media Inc. The Elder Scrolls® è un marchio registrato di ZeniMax Media Inc. Tutti i diritti riservati.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Impostazioni principali")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Modalità operativa")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Rigido:|r Blocco totale. Nessuna coda durante GCD.\n|cFFFF00Intelligente:|r Coda permessa solo senza Attacco Leggero.\n|c00FFFFNessuno:|r Disabilitato.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Rigido")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Intelligente")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Nessuno")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Attivo solo in combattimento")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Gestisce la coda solo durante il combattimento.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Richiede bersaglio nemico")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Richiede un bersaglio nemico selezionato.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignora durante blocco")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Disabilita i controlli durante il blocco.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Blocca doppio lancio AoE")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Previene doppi lanci accidentali di abilità a terra.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Disabilita come Tank")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Disabilita automaticamente nel ruolo Tank")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Disabilita come Healer")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Disabilita automaticamente nel ruolo Healer")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Abilità bloccate")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Blocca nuovo ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Inserisci ID abilità (es. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "ID attualmente bloccati")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Clicca per rimuovere")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Buffer istantaneo (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Margine di sicurezza per abilità istantanee (0-100ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Buffer incanalate (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Buffer per abilità incanalate (0-400ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Slot rilevamento GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Slot barra azioni per GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Soglia minima GCD (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Durata minima GCD per rilevamento (0-20ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Tempo base coda (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Finestra coda predefinita (100-2000ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Reset cambio arma")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Resetta GCD al cambio arma")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Reset schivata")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Resetta GCD durante la schivata")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Compensazione latenza")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Regolazione automatica")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Regola automaticamente in base alla latenza. Consigliato per connessioni stabili.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Latenza manuale (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Valore fisso per connessioni instabili (0-200ms).")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Impostazioni classe e gilda")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Bruco Focalizzazione")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Stack richiesti")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Numero di stack per l'attivazione (consigliato: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Blocca tutti i morph")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Focalizzazione Instancabile:|r Sempre bloccato\n|cFFFF00• Bruco Focalizzazione e Determinazione Spietata:|r Usabile solo a 10 stack\n|cAAAAAADisabilita:|r Comportamento predefinito")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Abilita stack personalizzati")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Abilitato:|r Usa impostazione stack \n|cAAAAAADisabilitato:|r Blocca sempre fino a 10 stack\n")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Disabilita in PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Disabilita il blocco abilità Cacciatore/Luce in PvP")

ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Gilde")

ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Blocca abilità Gilda Combattenti")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Blocca tutti i morph delle abilità Gilda Combattenti")

ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Blocca abilità luce Gilda Maghi")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Blocca tutti i morph delle abilità luce Gilda Maghi")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanista Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Blocca lancio Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Blocca il lancio fino al soddisfacimento delle condizioni.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Stack Crux richiesti")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Stack Crux minimi per il lancio (consigliato: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF ITALIAN LOCALIZATION ============================================
-- =============================================================================