-- =============================================================================
-- === OptimalWeave Language File: Spanish (es.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/es.lua
    Description:        Spanish localization using ZO_CreateStringId
    Version:            1.4.2
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Información & LÉAME")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "El tiempo de reutilización global (GCD) es de 1000 ms. OptimalWeave gestiona la cola de habilidades según el modo seleccionado para optimizar el weaving. Usa los ajustes para personalizar su comportamiento.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Mecánicas Principales")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Reglas de Activación")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Controles Avanzados")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Ajustes de Rendimiento")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon activo")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inactivo")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Esta opción está desactivada actualmente")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "¡Advertencia: Alta latencia puede causar retrasos!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Aviso|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Descargo de responsabilidad:|r Este complemento no está creado, afiliado ni respaldado por ZeniMax Media Inc. The Elder Scrolls® y los logotipos relacionados son marcas registradas de ZeniMax Media Inc. en EE. UU. y/o otros países. Todos los derechos reservados.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Ajustes Principales")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Modo de Operación")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Estricto:|r Bloqueo total. Sin cola durante GCD.\n|cFFFF00Inteligente:|r Cola permitida solo sin ataque ligero pendiente.\n|c00FFFFNinguno:|r Desactivado.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Estricto")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Inteligente")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Ninguno")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Activo Solo en Combate")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Gestiona la cola solo durante combates.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Requiere Objetivo Enemigo")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Funciona solo con objetivos enemigos.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignorar al Bloquear")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Desactiva controles durante bloqueos.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Bloquear Doble Lanzamiento en Área")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Previene lanzamientos accidentales dobles.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Desactivar como Tanque")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Desactiva automáticamente en rol de Tanque")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Desactivar como Sanador")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Desactiva automáticamente en rol de Sanador")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Habilidades Bloqueadas")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Bloquear Nueva ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Ingresa un ID de habilidad (ej. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "IDs Bloqueadas Actualmente")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Clic para eliminar")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Margen Instantáneo (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Margen de seguridad para habilidades instantáneas (0-100 ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Margen Canalizado (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Margen para habilidades canalizadas (0-400 ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Slot de Seguimiento GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Slot de la barra para detectar GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Umbral Mínimo GCD (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Duración mínima del GCD para detectar (0-20 ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Tiempo Base de Cola (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Ventana predeterminada de cola (100-2000 ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Reiniciar al cambiar de arma")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Reinicia el GCD al cambiar de arma")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Reiniciar al esquivar")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Reinicia el GCD al realizar una esquivada")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Compensación de Latencia")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Ajuste Automático")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Ajusta automáticamente según la latencia. Recomendado para conexiones estables.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Latencia Manual (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Valor fijo para conexiones inestables (0-200 ms).")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Configuraciones específicas de clase y gremio")

ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Enfoque Sombrío")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Stacks necesarios")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Número de stacks requeridos antes de que se active el Enfoque Sombrío (Recomendado: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Bloquear todos los morphs de Enfoque Sombrío")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Enfoque Incansable:|r Siempre bloqueado\n|cFFFF00• Enfoque Sombrío y Determinación Despiadada:|r Sólo se puede usar a 10 stacks\n|cAAAAAADesactivar:|r Comportamiento predeterminado para todos los morphs")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Activar stacks personalizados")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Activado:|r Usa la configuración de stacks \n|cAAAAAADesactivado:|r Bloquea siempre el Enfoque Sombrío y la Determinación Despiadada hasta 10 stacks, y bloquea siempre el Enfoque Incansable\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Gremios")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Bloquear habilidades de cazador del Gremio de Guerreros")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Bloquea todos los morphs de habilidades de cazador del Gremio de Guerreros (Cazador experto, Cazador camuflado & Cazador del mal)")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Bloquear habilidades de luz del Gremio de Magos")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Bloquea todos los morphs de habilidades de luz (Luz mágica, Luz interior & Luz mágica radiante)")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Desactivar en PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Desactiva el bloqueo de habilidades de Cazador/Luz en áreas PvP")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "Latigazo Fulminante")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "Bloquear habilidad Latigazo Fulminante")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "Bloquea la habilidad Latigazo Fulminante para evitar perder las tres acumulaciones")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Bloquear Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Evita lanzar Fatecarver hasta cumplir condiciones.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Stacks de Crux requeridos")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Stacks de Crux mínimos para lanzar Fatecarver (Recomendado: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF SPANISH LOCALIZATION =============================================
-- =============================================================================