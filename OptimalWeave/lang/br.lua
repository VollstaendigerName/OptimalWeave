-- =============================================================================
-- === OptimalWeave Language File: Brazilian Portuguese (br.lua)              ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/br.lua
    Description:        Brazilian Portuguese localization using ZO_CreateStringId
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Informações & LEIAME")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Recarga global (GCD) é 1000ms. OptimalWeave gerencia a fila de habilidades baseado no modo selecionado. Personalize o comportamento com as configurações.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Mecânicas principais")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Regras de ativação")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Controles avançados")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Configurações de desempenho")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon ativo")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inativo")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Esta opção está desativada")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Aviso: Alta latência pode causar atrasos!")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Aviso|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP", "|cFF0000Aviso legal:|r Este addon não é afiliado à ZeniMax Media Inc. The Elder Scrolls® é marca registrada da ZeniMax Media Inc. Todos os direitos reservados.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Configurações principais")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Modo de operação")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Rígido:|r Bloqueio total. Sem fila durante GCD.\n|cFFFF00Inteligente:|r Fila permitida apenas sem Ataque Leve.\n|c00FFFFNenhum:|r Desativado.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Rígido")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Inteligente")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Nenhum")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Ativo apenas em combate")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Gerencia fila apenas durante combate.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Requer alvo inimigo")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Requer um alvo inimigo selecionado.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignorar durante bloqueio")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Desativa controles durante bloqueio.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Bloquear duplo lançamento de AoE")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Previne lançamentos acidentais duplos.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Desativar como Tank")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Desativa automaticamente no papel de Tank")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Desativar como Healer")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Desativa automaticamente no papel de Healer")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Habilidades bloqueadas")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Bloquear novo ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Insira ID da habilidade (ex. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "IDs atualmente bloqueados")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Clique para remover")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Buffer instantâneo (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Margem de segurança para habilidades instantâneas (0-100ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Buffer canalizado (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Buffer para habilidades canalizadas (0-400ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Slot de detecção GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Slot da barra para detecção GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Limite mínimo GCD (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Duração mínima GCD para detecção (0-20ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Tempo base de fila (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Janela de fila padrão (100-2000ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Resetar ao trocar arma")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Reseta GCD ao trocar de arma")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Resetar ao esquivar")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Reseta GCD ao esquivar")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Compensação de latência")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Ajuste automático")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Ajusta automaticamente conforme latência. Recomendado para conexões estáveis.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Latência manual (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Valor fixo para conexões instáveis (0-200ms).")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Configurações de classe e guilda")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Foco Sombrio")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Stacks necessários")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Número de stacks para ativação (recomendado: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Bloquear todos os morphs")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Foco Incansável:|r Sempre bloqueado\n|cFFFF00• Foco Sombrio e Determinação Impiedosa:|r Usável apenas com 10 stacks\n|cAAAAAADesativar:|r Comportamento padrão")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Ativar stacks personalizados")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Ativado:|r Usa configuração de stacks \n|cAAAAAADesativado:|r Bloqueia sempre até 10 stacks\n")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Desativar em PvP")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Desativa bloqueio de habilidades Caçador/Luz em PvP")

ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Guildas")

ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Bloquear habilidades Guilda dos Guerreiros")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Bloqueia todos os morphs de habilidades da Guilda dos Guerreiros")

ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Bloquear habilidades luz Guilda dos Magos")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Bloqueia todos os morphs de habilidades luz da Guilda dos Magos")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Bloquear lançamento Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Bloqueia lançamento até condições serem atendidas.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Stacks Crux necessários")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Stacks Crux mínimos para lançar (recomendado: 3)")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF BRAZILIAN PORTUGUESE LOCALIZATION ===============================
-- =============================================================================