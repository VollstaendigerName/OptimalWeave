-- =============================================================================
-- === OptimalWeave Language File: French (fr.lua)                           ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/fr.lua
    Description:        French localization using ZO_CreateStringId
    Version:            1.8.0
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "Information & LISEZMOI")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "Le temps de recharge global (GCD) est de 1000 ms. OptimalWeave gère la file d'attente des compétences selon le mode sélectionné. Personnalisez son comportement ci-dessous.")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "Mécanismes Principaux")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "Règles d'Activation")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "Contrôles Avancés")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "Paramètres de Performance")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "Addon actif")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "Addon inactif")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "Cette option est désactivée actuellement")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "Attention : Une latence élevée peut causer des retards !")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000Avertissement|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP",  "|cFF0000Avis de non-responsabilité:|r Cette extension n'est ni créée, ni affiliée, ni soutenue par ZeniMax Media Inc. The Elder Scrolls® et les logos associés sont des marques déposées de ZeniMax Media Inc. aux États-Unis et/ou d'autres pays. Tous droits réservés.")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "Paramètres Principaux")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "Mode de Fonctionnement")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000Strict:|r Blocage total. Aucune file pendant GCD.\n|cFFFF00Intelligent:|r File autorisée sans attaque légère en attente.\n|c00FFFFAucun:|r Désactivé.")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "Strict")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "Intelligent")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "Aucun")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "Actif en Combat Seulement")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "Gère la file uniquement pendant les combats.")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "Cible Ennemie Requise")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "Nécessite une cible ennemie sélectionnée.")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "Ignorer le Blocage")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "Désactive les contrôles pendant le blocage.")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "Bloquer les Doubles Sorts au Sol")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "Empêche les doubles lancements accidentels.")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "Désactiver en Tank")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "Désactive automatiquement en rôle Tank")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "Désactiver en Soigneur")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "Désactive automatiquement en rôle Soigneur")

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR", "Désactiver les fonctions sur la barre secondaire")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_BACKBAR_TOOLTIP", "Désactive la plupart des fonctions de l'addon sur la barre secondaire.")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR", "Désactiver l'assistant de tissage sur la barre secondaire")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_BACKBAR_TOOLTIP", "Désactive l'assistant de tissage (gestion GCD) sur la barre secondaire.")

ZO_CreateStringId("OW_MENU_DEACTIVATE_IN_PVP_HEADER", "Désactivation en JcJ")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_IN_PVP", "Désactiver les fonctions en JcJ")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_IN_PVP_TOOLTIP", "Désactive la plupart des fonctions de l'addon dans les zones JcJ")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP", "Désactiver l'assistant de tissage en JcJ")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_IN_PVP_TOOLTIP", "Désactive l'assistant de tissage (gestion du GCD) dans les zones JcJ")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "Compétences Bloquées")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "Bloquer Nouvel ID")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "Entrez un ID de compétence (ex. 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "IDs Actuellement Bloquées")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "Cliquer pour supprimer")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "Marge Instantanée (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "Marge de sécurité pour compétences instantanées (0-100 ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "Marge Canalisation (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "Marge pour compétences canalisées (0-400 ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "Slot de Suivi GCD")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "Slot de la barre d'action pour GCD (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "Seuil Minimal GCD (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "Durée minimale GCD à détecter (0-20 ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "Temps de Base de File (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "Fenêtre de file par défaut (100-2000 ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "Réinitialiser au changement d'arme")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "Réinitialise le GCD lors du changement d'arme")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "Réinitialiser au roulade")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "Réinitialise le GCD lors d'une roulade d'esquive")
ZO_CreateStringId("OW_MENU_AUTO_EQUIP_WEAPONS_LABEL", "Dégainer automatiquement")
ZO_CreateStringId("OW_MENU_AUTO_EQUIP_WEAPONS_TOOLTIP", "Dégainer automatiquement les armes en combat")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "Compensation de Latence")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "Ajustement Automatique")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "Ajuste automatiquement selon la latence. Recommandé pour connexions stables.")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "Latence Manuel (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "Valeur fixe pour connexions instables (0-200 ms).")


-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "Paramètres spécifiques à la classe et à la guilde")

ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "Focalisation Sombre")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "Empilements requis")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "Nombre d'empilements requis avant que la focalisation sombre puisse être activée (Recommandé : 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "Bloquer tous les morphs de Focalisation Sombre")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• Focalisation implacable :|r Toujours bloqué\n|cFFFF00• Focalisation sombre et Détermination impitoyable :|r Utilisable uniquement à 10 empilements\n|cAAAAAADésactiver :|r Comportement par défaut pour tous les morphs")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "Activer les empilements personnalisés")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700Activé :|r Utilise la configuration des empilements \n|cAAAAAADésactivé :|r Bloque toujours la focalisation sombre et la détermination impitoyable jusqu'à 10 empilements, et bloque toujours la focalisation implacable\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "Guilde")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "Bloquer les compétences de chasseur de la Guilde des guerriers")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "Bloque tous les morphs des compétences de chasseur de la Guilde des guerriers (Expertise de la chasse, Chasseur camouflé & Chasse aux maléfices)")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "Bloquer les compétences de lumière de la Guilde des mages")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "Bloque tous les morphs des compétences de lumière (Lumière magique, Lumière intérieure & Lumière magique rayonnante)")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "Désactiver en JcJ")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "Désactive le blocage des compétences Chasseur/Lumière dans les zones JcJ")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "Fouet en Fusion")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "Bloquer la compétence Fouet en Fusion")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "Bloque la compétence Fouet en Fusion pour éviter de perdre les trois charges")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "Arcanist Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "Bloquer Fatecarver")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "Empêche le lancement de Fatecarver jusqu'à ce que les conditions soient remplies.")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "Stacks de Crux requis")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "Stacks de Crux minimum avant de pouvoir lancer Fatecarver (Recommandé : 3)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM", "Seuil de PV (%)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP", "Désactiver le blocage de Fatecarver lorsque les PV sont inférieurs à cette valeur")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE", "Activer la vérification des PV pour Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP", "Désactive le blocage de Fatecarver lorsque votre santé est faible")

ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM", "Seuil d'Endurance (%)")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOLTIP", "Désactiver le blocage de Fatecarver lorsque l'endurance est faible")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE", "Activer la vérification d'endurance pour Fatecarver")
ZO_CreateStringId("OW_MENU_CHECK_STAMINA_FOR_BEAM_TOOGLE_TOOLTIP", "Désactive le blocage de Fatecarver lorsque votre endurance est faible")

-- == BLOCK CEPHALIARCH'S FLAIL SETTINGS =======================================
ZO_CreateStringId("OW_MENU_SUBCLASS_CEPHALIARCHSFLAIL", "Fléau de céphaliarque")
ZO_CreateStringId("OW_MENU_CEPHALIARCHSFLAIL", "Bloquer Fléau de céphaliarque")
ZO_CreateStringId("OW_MENU_CEPHALIARCHSFLAIL_TOOLTIP", "Bloque Fléau de céphaliarque lorsque vous avez 3 piles de Crux")

-- == BLOCK TENTACULAR DREAD SETTINGS ==========================================
ZO_CreateStringId("OW_MENU_SUBCLASS_TENTACULAR", "Effroi tentaculaire")
ZO_CreateStringId("OW_MENU_TENTACULAR", "Bloquer Effroi tentaculaire")
ZO_CreateStringId("OW_MENU_TENTACULAR_TOOLTIP", "Bloque la compétence Effroi tentaculaire jusqu'à ce que les conditions soient remplies.")

-- == Execute Check Settings ==========================================
ZO_CreateStringId("OW_MENU_EXECUTE_HEADER", "Vérification d'Exécution")
ZO_CreateStringId("OW_MENU_EXECUTE_ENABLE", "Activer la vérification d'exécution")
ZO_CreateStringId("OW_MENU_EXECUTE_ENABLE_TOOLTIP", "Active ou désactive la fonction de vérification d'exécution")
ZO_CreateStringId("OW_MENU_EXECUTE_THRESHOLD", "Seuil d'Exécution (%)")
ZO_CreateStringId("OW_MENU_EXECUTE_THRESHOLD_TOOLTIP", "Pourcentage de santé de la cible en dessous duquel les sorts d'exécution sont autorisés")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELLS_HEADER", "Sorts d'Exécution")

-- == Grouped Execute Spells ==========================================
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_RADIANTMORPHS", "Destruction Radieuse, Gloire Radieuse, Oppression Radieuse")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_RADIANTMORPHS_TOOLTIP", "Bloque les morphs de Destruction Radieuse jusqu'à ce que la cible soit en phase d'exécution")

ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS", "Lame de l'Assassin, Empaler, Lame du Tueur")
ZO_CreateStringId("OW_MENU_EXECUTE_SPELL_ASSASSINSBLADEMORPHS_TOOLTIP", "Bloque les morphs de Lame de l'Assassin jusqu'à ce que la cible soit en phase d'exécution")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- == WEAPON SETTINGS ==========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEADER", "Désactiver selon le type d'arme")

ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON", "Désactiver l'assistant de tissage sur le type d'arme")
ZO_CreateStringId("OW_MENU_DISABLE_WEAVE_ASSIST_ON_WEAPON_TOOLTIP", "Désactive uniquement l'assistant de tissage (gestion GCD) pour les types d'arme sélectionnés")

ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON", "Désactiver les fonctions sur le type d'arme")
ZO_CreateStringId("OW_MENU_DISABLE_FEATURES_ON_WEAPON_TOOLTIP", "Désactive la plupart des fonctions de l'addon pour les types d'arme sélectionnés")

-- Armes à une main
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE", "Hache")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_AXE_TOOLTIP", "Désactiver lorsqu'une hache est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER", "Marteau")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HAMMER_TOOLTIP", "Désactiver lorsqu'un marteau est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD", "Épée")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SWORD_TOOLTIP", "Désactiver lorsqu'une épée est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER", "Dague")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_DAGGER_TOOLTIP", "Désactiver lorsqu'une dague est équipée")

-- Armes à deux mains
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD", "Épée à deux mains")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_SWORD_TOOLTIP", "Désactiver lorsqu'une épée à deux mains est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE", "Hache à deux mains")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_AXE_TOOLTIP", "Désactiver lorsqu'une hache à deux mains est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER", "Marteau à deux mains")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_TWOHANDED_HAMMER_TOOLTIP", "Désactiver lorsqu'un marteau à deux mains est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW", "Arc")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_BOW_TOOLTIP", "Désactiver lorsqu'un arc est équipé")

-- Bâtons
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF", "Bâton de feu")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FIRE_STAFF_TOOLTIP", "Désactiver lorsqu'un bâton de feu est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF", "Bâton de givre")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_FROST_STAFF_TOOLTIP", "Désactiver lorsqu'un bâton de givre est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF", "Bâton de foudre")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_LIGHTNING_STAFF_TOOLTIP", "Désactiver lorsqu'un bâton de foudre est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF", "Bâton de soins")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_HEALING_STAFF_TOOLTIP", "Désactiver lorsqu'un bâton de soins est équipé")

-- Autres armes
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD", "Bouclier")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_SHIELD_TOOLTIP", "Désactiver lorsqu'un bouclier est équipé")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE", "Rune")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RUNE_TOOLTIP", "Désactiver lorsqu'une rune est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE", "Aucune arme")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_NONE_TOOLTIP", "Désactiver lorsqu'aucune arme n'est équipée")

ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED", "Arme réservée")
ZO_CreateStringId("OW_MENU_DEACTIVATE_ON_WEAPON_RESERVED_TOOLTIP", "Désactiver lorsqu'un type d'arme réservé est équipé")

-- =============================================================================
-- === END OF FRENCH LOCALIZATION ==============================================
-- =============================================================================