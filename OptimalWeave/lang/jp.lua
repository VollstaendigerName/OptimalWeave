-- =============================================================================
-- === OptimalWeave Language File: Japanese (jp.lua)                          ===
-- =============================================================================
--[[
    AddOn Name:         OptimalWeave
    File:               lang/jp.lua
    Description:        Japanese localization using ZO_CreateStringId
    Version:            1.4.3
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

ZO_CreateStringId("OW_MENU_INFO_HEADER", "情報 & 説明書")
ZO_CreateStringId("OW_MENU_INFO_TEXT", "グローバルクールダウン (GCD) は1000msです。OptimalWeaveは選択したモードに基づいてスキルのキューを管理します。以下の設定で動作をカスタマイズできます。")
ZO_CreateStringId("OW_MENU_MODE_HEADER", "基本メカニズム")
ZO_CreateStringId("OW_MENU_CONDITIONS_HEADER", "起動ルール")
ZO_CreateStringId("OW_MENU_ADVANCED_HEADER", "高度な制御")
ZO_CreateStringId("OW_MENU_PERFORMANCE_HEADER", "パフォーマンス設定")
ZO_CreateStringId("OW_MENU_MODE_ACTIVE", "アドオン有効")
ZO_CreateStringId("OW_MENU_MODE_INACTIVE", "アドオン無効")
ZO_CreateStringId("OW_MENU_DISABLED_TOOLTIP", "このオプションは現在無効です")
ZO_CreateStringId("OW_MENU_LATENCY_WARNING", "警告：高いレイテンシは入力遅延を引き起こす可能性があります！")

ZO_CreateStringId("OW_MENU_DISCLAIMER_LABEL", "|cFF0000免責事項|r") 
ZO_CreateStringId("OW_MENU_DISCLAIMER_TOOLTIP", "|cFF0000免責事項:|r 本アドオンはZeniMax Media Inc.と関係ありません。The Elder Scrolls®はZeniMax Media Inc.の登録商標です。")

-- =============================================================================
-- == CORE SETTINGS ============================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SETTINGS_HEADER", "基本設定")
ZO_CreateStringId("OW_MENU_MODE_LABEL", "動作モード")
ZO_CreateStringId("OW_MENU_MODE_TOOLTIP", "|cFF0000厳格:|r 完全ブロック。GCD中キュー不可\n|cFFFF00スマート:|r 軽攻撃がない場合のみキュー許可\n|c00FFFFなし:|r 無効")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_HARD", "厳格")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_SOFT", "スマート")
ZO_CreateStringId("OW_MENU_MODE_CHOICE_NONE", "なし")
ZO_CreateStringId("OW_MENU_COMBAT_LABEL", "戦闘中のみ有効")
ZO_CreateStringId("OW_MENU_COMBAT_TOOLTIP", "戦闘中のみキューを管理")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_LABEL", "敵ターゲット必須")
ZO_CreateStringId("OW_MENU_ENEMYTARGET_TOOLTIP", "敵ターゲット選択が必要")
ZO_CreateStringId("OW_MENU_BLOCKING_LABEL", "ブロック中無視")
ZO_CreateStringId("OW_MENU_BLOCKING_TOOLTIP", "ブロック中は制御を無効化")
ZO_CreateStringId("OW_MENU_GROUNDAOE_LABEL", "AoE二重発動防止")
ZO_CreateStringId("OW_MENU_GROUNDAOE_TOOLTIP", "エリアスキルの誤った二重発動を防止")
ZO_CreateStringId("OW_MENU_DISABLE_TANK", "タンク時無効")
ZO_CreateStringId("OW_MENU_DISABLE_TANK_TOOLTIP", "タンクロール時に自動無効")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL", "ヒーラー時無効")
ZO_CreateStringId("OW_MENU_DISABLE_HEAL_TOOLTIP", "ヒーラーロール時に自動無効")

-- =============================================================================
-- == BLOCK ID SETTINGS ========================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_BLOCKED_HEADER", "ブロック済みスキル")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_LABEL", "新規IDブロック")
ZO_CreateStringId("OW_MENU_BLOCKED_ADD_TOOLTIP", "スキルIDを入力 (例: 134160)")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_LABEL", "現在ブロック中ID")
ZO_CreateStringId("OW_MENU_BLOCKED_LIST_TOOLTIP", "クリックで削除")

-- =============================================================================
-- == ADVANCED SETTINGS ========================================================
-- =============================================================================
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL", "瞬発バッファ (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_NORMAL_TOOLTIP", "瞬発スキルの安全マージン (0-100ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED", "チャネリングバッファ (ms)")
ZO_CreateStringId("OW_MENU_CHANNEL_CHANNELED_TOOLTIP", "チャネリングスキルのバッファ (0-400ms)")
ZO_CreateStringId("OW_MENU_GCD_SLOT", "GCD検知スロット")
ZO_CreateStringId("OW_MENU_GCD_SLOT_TOOLTIP", "GCD検知用アクションバースロット (1-8)")
ZO_CreateStringId("OW_MENU_MIN_GCD", "最小GCD閾値 (ms)")
ZO_CreateStringId("OW_MENU_MIN_GCD_TOOLTIP", "検知する最小GCD時間 (0-20ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME", "基本キュー時間 (ms)")
ZO_CreateStringId("OW_MENU_QUEUE_TIME_TOOLTIP", "デフォルト入力キュー窓 (100-2000ms)")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_LABEL", "武器切り替え時リセット")
ZO_CreateStringId("OW_MENU_RESETONBARSWAP_TOOLTIP", "武器切り替え時にGCDをリセット")
ZO_CreateStringId("OW_MENU_RESETONDODGE_LABEL", "回避時リセット")
ZO_CreateStringId("OW_MENU_RESETONDODGE_TOOLTIP", "回避時にGCDをリセット")

-- =============================================================================
-- == LATENCY COMPENSATION =====================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_LATENCY_HEADER", "レイテンシ補正")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_LABEL", "自動調整")
ZO_CreateStringId("OW_MENU_AUTOLATENCY_TOOLTIP", "レイテンシに基づき自動調整。安定接続時推奨")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_LABEL", "手動レイテンシ (ms)")
ZO_CreateStringId("OW_MENU_MANUALLATENCY_TOOLTIP", "不安定接続時は固定値使用 (0-200ms)")

-- =============================================================================
-- == (SUB)CLASS SETTINGS ======================================================
-- =============================================================================

ZO_CreateStringId("OW_MENU_SUBCLASS_HEADER", "クラス/ギルド固有設定")
ZO_CreateStringId("OW_MENU_SUBCLASS_GRIMFOCUS", "グリムフォーカス")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS", "必要スタック数")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_STACKS_TOOLTIP", "起動に必要なスタック数 (推奨: 10)")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS", "全モーフをブロック")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_ALL_MORPHS_TOOLTIP", "|cFF5555• レントレスフォーカス:|r 常時ブロック\n|cFFFF00• グリムフォーカス/マーシレスレゾルブ:|r 10スタック時のみ使用可能\n|cAAAAAA無効:|r デフォルト動作")

ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE", "カスタムスタックを有効化")
ZO_CreateStringId("OW_MENU_GRIMFOCUS_GRIMFOCUSSTACKS_TOOGLE_TOOLTIP", "|cFFD700有効:|r スタック設定を使用 \n|cAAAAAA無効:|r 10スタックまで常時ブロック\n")

-- == BLOCK GUILDS SETTINGS ===================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_GUILDS", "ギルド")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS", "戦士ギルドのハンタースキルをブロック")
ZO_CreateStringId("OW_MENU_HUNTER_ALL_MORPHS_TOOLTIP", "戦士ギルドのハンタースキル（エキスパートハンター、カモフラージドハンター、イビルハンター）の全モーフをブロック")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS", "魔術師ギルドの光スキルをブロック")
ZO_CreateStringId("OW_MENU_LIGHT_ALL_MORPHS_TOOLTIP", "光スキル（メイジライト、インナーライト、レディアントメイジライト）の全モーフをブロック")

ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS", "PvPで無効")
ZO_CreateStringId("OW_MENU_DEACTIVATEHUNTERLIGHTINPVP_ALL_MORPHS_TOOLTIP", "PvPエリアでハンター/ライトスキルブロックを無効化")

-- == BLOCK MOLTEN WHIP SETTINGS ===============================================
ZO_CreateStringId("OW_MENU_SUBCLASS_MOLTENWHIP", "モルテンホイップ")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK", "モルテンホイップスキルをブロック")
ZO_CreateStringId("OW_MENU_MOLTENWHIP_BLOCK_TOOLTIP", "3スタックを失わないようにモルテンホイップスキルをブロックします")

-- == BLOCK FATECARVER SETTINGS ================================================
ZO_CreateStringId("OW_MENU_SUBCLASS_FATECARVER", "アルカニスト フェイトカーバー")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS", "フェイトカーバー発動ブロック")
ZO_CreateStringId("OW_MENU_FATECARVER_ALL_MORPHS_TOOLTIP", "条件満了まで発動をブロック")
ZO_CreateStringId("OW_MENU_CRUX_STACKS", "必要クラックススタック")
ZO_CreateStringId("OW_MENU_CRUX_STACKS_TOOLTIP", "発動に必要な最小クラックス数 (推奨: 3)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM", "HPしきい値 (%)")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOLTIP", "HPがこの値を下回るとフェイトカーバーのブロックを無効化")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE", "フェイトカーバーのHPチェックを有効化")
ZO_CreateStringId("OW_MENU_CHECK_HP_FOR_BEAM_TOOGLE_TOOLTIP", "HPが低い場合にフェイトカーバーのブロックを無効化")

-- == Work in progress ================================================
ZO_CreateStringId("OW_WIP", "WIP")

-- =============================================================================
-- === END OF JAPANESE LOCALIZATION ===========================================
-- =============================================================================