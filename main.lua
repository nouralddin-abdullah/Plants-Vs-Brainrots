-- ################################################ --
-- ##   Plants Vs Brainrots GUI - ToastyxDD Hub  ## --
-- ##           Powered by WindUI                ## --
-- ################################################ --

-- Prevent multiple script loads
if getgenv().PlantsVsBrainrotsLoaded then
    warn("Script is already loaded! Skipping execution.")
    return
end
getgenv().PlantsVsBrainrotsLoaded = true

-- Load WindUI Library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local defaultLanguageCode = "en"

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
local BuyGearRemote = Remotes and Remotes:FindFirstChild("BuyGear")
local BuyItemRemote = Remotes and Remotes:FindFirstChild("BuyItem")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")

local translations = {
    ["en"] = {
        ["TITLE"] = "Plants Vs Brainrots",
        ["SUBTITLE"] = "ToastyxDD Hub",
        ["WELCOME"] = "Welcome to Plants Vs Brainrots!",
        ["LOADED"] = "GUI loaded successfully!",
        ["MAIN_TAB"] = "Information",
        ["PLAYER_TAB"] = "Player",
        ["VISUAL_TAB"] = "Visual",
        ["MISC_TAB"] = "Misc",
        ["SETTINGS_TAB"] = "Settings",
        ["THEME_TAB"] = "Themes",
        ["CONFIG_TAB"] = "Config",
        ["COMING_SOON"] = "Coming Soon",
        ["FEATURES_SOON"] = "Features are in development.",
        ["MAIN_AUTO_TITLE"] = "Game Information",
        ["MAIN_AUTO_DESC"] = "View information about your items, map, and game stats.",
        ["MAIN_AUTO_SECTION_TITLE"] = "General Info",
        ["PLAYER_PARAGRAPH_TITLE"] = "Player Modifications",
        ["PLAYER_PARAGRAPH_DESC"] = "Modify your player's abilities and movement.",
        ["PLAYER_SECTION_TITLE"] = "Movement",
        ["PLAYER_SECTION_DESC"] = "Walk speed, jump power, and fly features coming soon.",
        ["VISUAL_PARAGRAPH_TITLE"] = "Visual Features",
        ["VISUAL_PARAGRAPH_DESC"] = "ESP, tracers, and other visual enhancements.",
        ["VISUAL_SECTION_TITLE"] = "ESP & Tracers",
        ["MISC_PARAGRAPH_TITLE"] = "Miscellaneous",
        ["MISC_PARAGRAPH_DESC"] = "Additional utilities aSlidernd settings.",
        ["MISC_CREDITS_TITLE"] = "Credits",
        ["MISC_CREDITS_DESC"] = "Created with love by ToastyxDD",
        ["DISCORD_BUTTON_TITLE"] = "Join Discord",
        ["DISCORD_BUTTON_DESC"] = "Click to copy Discord invite link",
        ["DISCORD_COPIED_TITLE"] = "Discord Link Copied!",
        ["DISCORD_COPIED_CONTENT"] = "Discord invite link copied to clipboard.",
        ["DISCORD_ERROR_TITLE"] = "Error",
        ["DISCORD_ERROR_CONTENT"] = "Clipboard not supported on your executor.",
        ["SETTINGS_PARAGRAPH_TITLE"] = "UI Settings",
        ["SETTINGS_PARAGRAPH_DESC"] = "Customize your GUI experience.",
        ["LANGUAGE_LABEL"] = "Language",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ Important Warning",
        ["LANGUAGE_WARNING_DESC"] = "You can only change the language ONCE after loading the GUI. Changing it again will freeze the GUI!",
        ["THEME_PARAGRAPH_TITLE"] = "Theme Options",
        ["THEME_PARAGRAPH_DESC"] = "Choose your preferred WindUI theme.",
        ["THEME_DROPDOWN_TITLE"] = "Theme",
        ["THEME_DROPDOWN_DESC"] = "Select a theme for the GUI",
        ["THEME_CHANGED_TITLE"] = "Theme Changed",
        ["THEME_CHANGED_CONTENT"] = "Theme set to: %s",
        ["THEME_ERROR_TITLE"] = "Theme Error",
        ["THEME_ERROR_CONTENT"] = "Selected theme is no longer available.",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "Window Transparency",
        ["TRANSPARENCY_TOGGLE_DESC"] = "Enable transparent window background",
        ["TRANSPARENCY_ENABLED_TITLE"] = "Transparency Enabled",
        ["TRANSPARENCY_DISABLED_TITLE"] = "Transparency Disabled",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "Window transparency updated.",
        ["WINDOW_CONTROLS_TITLE"] = "Window Controls",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "Toggle Key",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "Press this key to open or close the GUI.",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "Toggle Key Updated",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "Window toggle key set to: %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "Invalid Key",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "That key can't be used as a toggle. Please choose a keyboard key.",
        ["LANGUAGE_DROPDOWN_TITLE"] = "Language",
        ["LANGUAGE_DROPDOWN_DESC"] = "Change GUI language",
        ["LANGUAGE_CHANGED_TITLE"] = "Language Changed",
        ["LANGUAGE_CHANGED_CONTENT"] = "GUI language updated to: %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "Configuration",
        ["CONFIG_PARAGRAPH_DESC"] = "Your settings are automatically saved and loaded on next launch.",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "Save Configuration",
        ["CONFIG_SAVE_BUTTON_DESC"] = "Manually save current settings",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "Config Saved!",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "Your settings have been saved successfully.",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "Load Configuration",
        ["CONFIG_LOAD_BUTTON_DESC"] = "Reload saved settings",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "Config Loaded!",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "Your saved settings have been restored.",
        ["CONFIG_RESET_BUTTON_TITLE"] = "Reset to Defaults",
        ["CONFIG_RESET_BUTTON_DESC"] = "Reset all settings to default values",
        ["CONFIG_RESET_DIALOG_TITLE"] = "Reset Configuration",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "Are you sure you want to reset all settings to default?",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "Cancel",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "Reset",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "Settings Reset",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "All settings reset to defaults.",
        ["CONFIG_ABOUT_TITLE"] = "About",
        ["CONFIG_ABOUT_DESC"] = "Plants Vs Brainrots GUI v1.0\nCreated by ToastyxDD",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "Check for Updates",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "Check if there's a new version available",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "Up to Date",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "You are using the latest version.",
        
        -- Player Stats
        ["PLAYER_STATS_SECTION"] = "Player Statistics",
        ["REBIRTH_TITLE"] = "🔄 Rebirth",
        ["REBIRTH_DESC"] = "Loading...",
        ["CPS_TITLE"] = "💰 Cash Per Second",
        ["CPS_DESC"] = "Loading...",
        ["ROWS_TITLE"] = "🌾 Unlocked Rows",
        ["ROWS_DESC"] = "Loading...",
        ["ROWS_UNLOCKED"] = "Unlocked: %d/%d rows",
        
        -- Shop Stats
        ["SHOP_STATS_SECTION"] = "Shop Statistics",
        ["RESTOCK_TITLE"] = "🏪 Shop Restock Timer",
        ["RESTOCK_DESC"] = "Loading...",
        
        -- Auto Shopping
        ["AUTO_SHOPPING_SECTION"] = "Auto Shopping",
        ["GEAR_SELECTION_TITLE"] = "Gear Selection",
        ["GEAR_SELECTION_DESC"] = "Choose gear items to auto buy on restock",
        ["AUTO_BUY_GEAR_TITLE"] = "Auto Buy Gear",
        ["AUTO_BUY_GEAR_DESC"] = "Automatically purchase selected gear",
        ["PLANT_SELECTION_TITLE"] = "Plant Selection",
        ["PLANT_SELECTION_DESC"] = "Choose plants to auto buy on restock",
        ["AUTO_BUY_PLANTS_TITLE"] = "Auto Buy Plants",
        ["AUTO_BUY_PLANTS_DESC"] = "Automatically purchase selected plants",
        
        -- Notifications
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "Restock Notifications",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "Enable Notifications",
        ["ENABLE_NOTIFICATIONS_DESC"] = "Get notified when items restock",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "Notifications Enabled",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "You will be notified when selected rarities restock",
        ["NOTIFY_RARITIES_TITLE"] = "Notify Rarities",
        ["NOTIFY_RARITIES_DESC"] = "Select which rarities to notify about",
        
        -- Player Movement
        ["WALK_SPEED_TITLE"] = "Walk Speed",
        ["WALK_SPEED_DESC"] = "Adjust your walking speed",
        ["JUMP_POWER_TITLE"] = "Jump Power",
        ["JUMP_POWER_DESC"] = "Adjust your jump height",
        ["MULTI_JUMP_TITLE"] = "Multi Jump",
        ["MULTI_JUMP_DESC"] = "Jump multiple times in the air",
        ["FLY_TITLE"] = "Fly",
        ["FLY_DESC"] = "Enable flying (works on mobile and PC)",
        
        -- Row Statistics
        ["ROW_STATS_SECTION"] = "Row Statistics",
        ["ROW_STATS_OVERLAY_TITLE"] = "Overlay",
        ["ROW_STATS_OVERLAY_DESC"] = "MAKE SURE TO BE NEAR THE WHEELBARROW",
        ["SHOW_ROW_STATS_TITLE"] = "Show Row Statistics",
        ["SHOW_ROW_STATS_DESC"] = "Display per-row plant info directly over lawn mowers",
        ["SHOW_ROW_HEADER_TITLE"] = "Show Row Header",
        ["SHOW_ROW_HEADER_DESC"] = "Include the row name at the top of each overlay",
        ["SHOW_PLANT_COUNT_TITLE"] = "Show Plant Count",
        ["SHOW_PLANT_COUNT_DESC"] = "Add the plant count to the header line",
        ["SHOW_PLANT_DETAILS_TITLE"] = "Show Plant Details",
        ["SHOW_PLANT_DETAILS_DESC"] = "List each plant with rarity and damage",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "Show Total Damage",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "Display the combined damage per row",
        ["SHOW_EMPTY_ROW_TITLE"] = "Show Empty Row Message",
        ["SHOW_EMPTY_ROW_DESC"] = "Show a reminder when a row has no plants placed",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "Highlight Weakest Plant",
        ["HIGHLIGHT_WEAKEST_DESC"] = "Color the lowest-damage plant in red",
        
        -- Auto Freeze
        ["AUTO_FREEZE_SECTION"] = "Auto Freeze Brainrots",
        ["FREEZE_GEAR_TITLE"] = "Freeze Gear",
        ["FREEZE_GEAR_DESC"] = "Select one or more freeze gears; they'll be used in selected order",
        ["TARGET_PRIORITY_TITLE"] = "Target Priority",
        ["TARGET_PRIORITY_DESC"] = "Choose which brainrots to target",
        ["TARGET_RARITY_TITLE"] = "Target Rarity",
        ["TARGET_RARITY_DESC"] = "Select one or more rarities when the priority is set to Rarity",
        ["MINIMUM_HEALTH_TITLE"] = "Minimum Health",
        ["MINIMUM_HEALTH_DESC"] = "Target brainrots with health >= this value (only for Health priority)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "Enable Auto Freeze",
        ["ENABLE_AUTO_FREEZE_DESC"] = "Automatically freeze brainrots based on priority",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "Auto Freeze Enabled",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "Using %s on %s targets",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "Auto Freeze Disabled",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "Stopped freezing brainrots",
        
        -- Auto Attack
        ["AUTO_ATTACK_SECTION"] = "Auto Attack Brainrots",
        ["WARNING_TITLE"] = "Warning",
        ["WARNING_AUTO_ATTACK_DESC"] = "Avoid running Auto Attack together with Auto Freeze to prevent conflicts.",
        ["AUTO_ATTACK_WARNING_TITLE"] = "Warning",
        ["AUTO_ATTACK_WARNING_DESC"] = "Avoid running Auto Attack together with Auto Freeze to prevent conflicts.",
        ["TELEPORT_POSITION_TITLE"] = "Teleport Position",
        ["TELEPORT_POSITION_DESC"] = "Choose where to teleport relative to the brainrot",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "Enable Auto Attack",
        ["ENABLE_AUTO_ATTACK_DESC"] = "Continuously swing your bat at qualifying brainrots",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "Auto Attack Enabled",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "Swinging at targets every 0.2s",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "Auto Attack Disabled",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "Stopped swinging the bat",
        ["CONFLICT_WARNING_TITLE"] = "Conflict Warning",
        ["CONFLICT_WARNING_CONTENT"] = "Turn off Auto Freeze while Auto Attack is active to avoid issues.",
        
        -- Misc Features
        ["AUTO_EQUIP_COLLECT_TITLE"] = "Auto Equip Best & Collect Cash",
        ["AUTO_EQUIP_COLLECT_DESC"] = "Automatically equip best brainrots and collect cash",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "Auto Brainrots Enabled",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "Equipping best brainrots",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "Auto Brainrots Disabled",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "Stopped auto-equipping",
        ["AUTO_REBIRTH_TITLE"] = "Auto Rebirth",
        ["AUTO_REBIRTH_DESC"] = "Automatically rebirth",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "Auto Rebirth Enabled",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "Sending rebirth request",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "Auto Rebirth Disabled",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "Stopped auto rebirth",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "Auto Buy Platforms",
        ["AUTO_BUY_PLATFORMS_DESC"] = "Automatically purchase platforms",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "Auto Buy Platforms Enabled",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "Trying to purchase platforms",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "Auto Buy Platforms Disabled",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "Stopped buying platforms",
        ["ANTI_AFK_TITLE"] = "Anti AFK",
        ["ANTI_AFK_DESC"] = "Jump every 5 minutes to avoid AFK",
        ["ANTI_AFK_ENABLED_TITLE"] = "Anti AFK Enabled",
        ["ANTI_AFK_ENABLED_CONTENT"] = "Jumping every 5 minutes",
        ["ANTI_AFK_DISABLED_TITLE"] = "Anti AFK Disabled",
        ["ANTI_AFK_DISABLED_CONTENT"] = "Stopped auto jumping",
        
        -- Session Safety
        ["SESSION_SAFETY_SECTION"] = "Session Safety",
        ["AUTO_REJOIN_TITLE"] = "Auto Rejoin",
        ["AUTO_REJOIN_DESC"] = "Automatically try to rejoin if you get disconnected",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "Auto Rejoin Enabled",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "We'll try to reconnect you if you disconnect.",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "Auto Rejoin Disabled",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "Automatic reconnection has been turned off.",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "Auto Rejoin",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "Attempting to rejoin the server...",
        
        -- Script Automation
        ["SCRIPT_AUTOMATION_SECTION"] = "Script Automation",
        ["AUTO_EXECUTE_TITLE"] = "Auto Execute",
        ["AUTO_EXECUTE_DESC"] = "Queue this hub with your executor whenever you teleport",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "Auto Execute Enabled",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "Loader queued for your next teleport.",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "Auto Execute Disabled",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "Teleport queue cleared.",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "Auto Execute Error",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "Teleport Queue Info",
        
        -- Background Image
        ["BACKGROUND_IMAGE_TITLE"] = "Enable Background Image",
        ["BACKGROUND_IMAGE_DESC"] = "Toggle a preset window background",
        ["BACKGROUND_PRESET_TITLE"] = "Background Preset",
        ["BACKGROUND_PRESET_DESC"] = "Select a background image",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "Auto Egg Opening",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "How it works",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "Equips and opens the selected eggs while respecting the in-game cooldown.",
        ["INV_EGG_SELECTION_TITLE"] = "Egg selection",
        ["INV_EGG_SELECTION_DESC"] = "Choose which eggs to open automatically",
        ["INV_EGG_INTERVAL_TITLE"] = "Egg open interval (s)",
        ["INV_EGG_INTERVAL_DESC"] = "Delay between each auto-open attempt",
        ["INV_EGG_ENABLE_TITLE"] = "Enable auto egg opening",
        ["INV_EGG_ENABLE_DESC"] = "Automatically equips and opens the chosen eggs",
        
        ["INV_SELL_SECTION_TITLE"] = "Auto Sell",
        ["INV_SELL_SAFETY_TITLE"] = "Safety first",
        ["INV_SELL_SAFETY_DESC"] = "Favorites are refreshed before every sell cycle so marked items stay in your inventory.",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "Brainrot sell interval (s)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "How often brainrots are sold",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "Enable auto sell brainrots",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "Sell non-favorited brainrots on the chosen interval",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "Plant sell interval (s)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "How often plants are sold",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "Enable auto sell plants",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "Sell non-favorited plants on the chosen interval",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "Brainrot Favorites",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "Select rarities or specific brainrots to keep favorited automatically.",
        ["INV_BRAINROT_RARITY_TITLE"] = "Rarity filter",
        ["INV_BRAINROT_RARITY_DESC"] = "Brainrot rarities to favorite",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "Specific brainrots",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "Always favorite the selected names",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "Minimum cash per second",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "Ignore brainrots below this cash-per-second value",
        ["INV_BRAINROT_ENABLE_TITLE"] = "Enable auto favorite brainrots",
        ["INV_BRAINROT_ENABLE_DESC"] = "Keep matching brainrots favorited before selling",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "Plant Favorites",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "Select rarities or specific plants to keep favorited automatically.",
        ["INV_PLANT_RARITY_TITLE"] = "Rarity filter",
        ["INV_PLANT_RARITY_DESC"] = "Plant rarities to favorite",
        ["INV_PLANT_SPECIFIC_TITLE"] = "Specific plants",
        ["INV_PLANT_SPECIFIC_DESC"] = "Always favorite the selected plants",
        ["INV_PLANT_ENABLE_TITLE"] = "Enable auto favorite plants",
        ["INV_PLANT_ENABLE_DESC"] = "Keep matching plants favorited before selling",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "Unfavorite All",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "Unfavorite All Items",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "Remove favorite from all brainrots and plants",
    },
    ["ar"] = {
        ["TITLE"] = "النباتات ضد البرينروتس",
        ["SUBTITLE"] = "هاب توستيxDD",
        ["WELCOME"] = "مرحباً في النباتات ضد البرينروتس!",
        ["LOADED"] = "تم تحميل الواجهة بنجاح!",
        ["MAIN_TAB"] = "المعلومات",
        ["PLAYER_TAB"] = "اللاعب",
        ["VISUAL_TAB"] = "المرئيات",
        ["MISC_TAB"] = "متنوع",
        ["SETTINGS_TAB"] = "الإعدادات",
        ["THEME_TAB"] = "السمات",
        ["CONFIG_TAB"] = "التكوين",
        ["COMING_SOON"] = "قريباً",
        ["FEATURES_SOON"] = "الميزات قيد التطوير.",
        ["MAIN_AUTO_TITLE"] = "معلومات اللعبة",
        ["MAIN_AUTO_DESC"] = "اعرض معلومات حول عناصرك والخريطة وإحصائيات اللعبة.",
        ["MAIN_AUTO_SECTION_TITLE"] = "معلومات عامة",
        ["PLAYER_PARAGRAPH_TITLE"] = "تعديلات اللاعب",
        ["PLAYER_PARAGRAPH_DESC"] = "قم بتعديل قدرات وحركة لاعبك.",
        ["PLAYER_SECTION_TITLE"] = "الحركة",
        ["PLAYER_SECTION_DESC"] = "ميزات سرعة المشي، قوة القفز، والطيران قادمة قريباً.",
        ["VISUAL_PARAGRAPH_TITLE"] = "ميزات مرئية",
        ["VISUAL_PARAGRAPH_DESC"] = "ميزات ESP والمتتبعات والتحسينات المرئية الأخرى.",
        ["VISUAL_SECTION_TITLE"] = "ESP والمتتبعات",
        ["MISC_PARAGRAPH_TITLE"] = "متفرقات",
        ["MISC_PARAGRAPH_DESC"] = "أدوات وإعدادات إضافية.",
        ["MISC_CREDITS_TITLE"] = "الشكر والتقدير",
        ["MISC_CREDITS_DESC"] = "صُنع بمحبة بواسطة ToastyxDD",
        ["DISCORD_BUTTON_TITLE"] = "انضم إلى ديسكورد",
        ["DISCORD_BUTTON_DESC"] = "انقر لنسخ رابط دعوة ديسكورد",
        ["DISCORD_COPIED_TITLE"] = "تم نسخ رابط ديسكورد!",
        ["DISCORD_COPIED_CONTENT"] = "تم نسخ رابط دعوة ديسكورد إلى الحافظة.",
        ["DISCORD_ERROR_TITLE"] = "خطأ",
        ["DISCORD_ERROR_CONTENT"] = "الحافظة غير مدعومة على المشغل الخاص بك.",
        ["SETTINGS_PARAGRAPH_TITLE"] = "إعدادات الواجهة",
        ["SETTINGS_PARAGRAPH_DESC"] = "خصص تجربتك في الواجهة الرسومية.",
        ["LANGUAGE_LABEL"] = "اللغة",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ تحذير مهم",
        ["LANGUAGE_WARNING_DESC"] = "يمكنك تغيير اللغة مرة واحدة فقط بعد تحميل الواجهة. تغييرها مرة أخرى سيؤدي إلى تجميد الواجهة!",
        ["THEME_PARAGRAPH_TITLE"] = "خيارات السمة",
        ["THEME_PARAGRAPH_DESC"] = "اختر سمة WindUI المفضلة لديك.",
        ["THEME_DROPDOWN_TITLE"] = "السمة",
        ["THEME_DROPDOWN_DESC"] = "اختر سمة للواجهة",
        ["THEME_CHANGED_TITLE"] = "تم تغيير السمة",
        ["THEME_CHANGED_CONTENT"] = "تم تعيين السمة إلى: %s",
        ["THEME_ERROR_TITLE"] = "خطأ في السمة",
        ["THEME_ERROR_CONTENT"] = "السمة المحددة لم تعد متاحة.",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "شفافية النافذة",
        ["TRANSPARENCY_TOGGLE_DESC"] = "تفعيل خلفية نافذة شفافة",
        ["TRANSPARENCY_ENABLED_TITLE"] = "تم تفعيل الشفافية",
        ["TRANSPARENCY_DISABLED_TITLE"] = "تم إيقاف الشفافية",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "تم تحديث شفافية النافذة.",
        ["WINDOW_CONTROLS_TITLE"] = "تحكم النافذة",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "مفتاح التبديل",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "اضغط هذا المفتاح لفتح أو إغلاق الواجهة.",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "تم تحديث مفتاح التبديل",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "تم تعيين مفتاح التبديل إلى: %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "مفتاح غير صالح",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "لا يمكن استخدام هذا المفتاح للتبديل. الرجاء اختيار مفتاح لوحة مفاتيح.",
        ["LANGUAGE_DROPDOWN_TITLE"] = "اللغة",
        ["LANGUAGE_DROPDOWN_DESC"] = "غيّر لغة الواجهة",
        ["LANGUAGE_CHANGED_TITLE"] = "تم تغيير اللغة",
        ["LANGUAGE_CHANGED_CONTENT"] = "تم تحديث لغة الواجهة إلى: %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "التكوين",
        ["CONFIG_PARAGRAPH_DESC"] = "سيتم حفظ إعداداتك وتحميلها تلقائياً عند التشغيل التالي.",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "حفظ التكوين",
        ["CONFIG_SAVE_BUTTON_DESC"] = "احفظ الإعدادات الحالية يدوياً",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "تم حفظ التكوين!",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "تم حفظ إعداداتك بنجاح.",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "تحميل التكوين",
        ["CONFIG_LOAD_BUTTON_DESC"] = "أعد تحميل الإعدادات المحفوظة",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "تم تحميل التكوين!",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "تمت استعادة إعداداتك المحفوظة.",
        ["CONFIG_RESET_BUTTON_TITLE"] = "إعادة التعيين إلى الإعدادات الافتراضية",
        ["CONFIG_RESET_BUTTON_DESC"] = "أعد تعيين جميع الإعدادات إلى القيم الافتراضية",
        ["CONFIG_RESET_DIALOG_TITLE"] = "إعادة تعيين التكوين",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "هل أنت متأكد أنك تريد إعادة تعيين جميع الإعدادات إلى الافتراضيات؟",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "إلغاء",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "إعادة تعيين",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "تمت إعادة الإعدادات",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "تمت إعادة جميع الإعدادات إلى الافتراضيات.",
        ["CONFIG_ABOUT_TITLE"] = "نبذة",
        ["CONFIG_ABOUT_DESC"] = "واجهة Plants Vs Brainrots الإصدار 1.0\nمن إنشاء ToastyxDD",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "تحقق من التحديثات",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "تحقق مما إذا كان هناك إصدار جديد متوفر",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "أحدث إصدار",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "أنت تستخدم أحدث إصدار.",
        
        -- Player Stats
        ["PLAYER_STATS_SECTION"] = "إحصائيات اللاعب",
        ["REBIRTH_TITLE"] = "🔄 إعادة الميلاد",
        ["REBIRTH_DESC"] = "جارٍ التحميل...",
        ["CPS_TITLE"] = "💰 الأموال في الثانية",
        ["CPS_DESC"] = "جارٍ التحميل...",
        ["ROWS_TITLE"] = "🌾 الصفوف المفتوحة",
        ["ROWS_DESC"] = "جارٍ التحميل...",
        ["ROWS_UNLOCKED"] = "Unlocked: %d/%d rows",
        
        -- Shop Stats
        ["SHOP_STATS_SECTION"] = "إحصائيات المتجر",
        ["RESTOCK_TITLE"] = "🏪 مؤقت إعادة تعبئة المتجر",
        ["RESTOCK_DESC"] = "جارٍ التحميل...",
        
        -- Auto Shopping
        ["AUTO_SHOPPING_SECTION"] = "الشراء التلقائي",
        ["GEAR_SELECTION_TITLE"] = "اختيار المعدات",
        ["GEAR_SELECTION_DESC"] = "اختر المعدات للشراء التلقائي عند إعادة التعبئة",
        ["AUTO_BUY_GEAR_TITLE"] = "شراء المعدات تلقائياً",
        ["AUTO_BUY_GEAR_DESC"] = "شراء المعدات المحددة تلقائياً",
        ["PLANT_SELECTION_TITLE"] = "اختيار النباتات",
        ["PLANT_SELECTION_DESC"] = "اختر النباتات للشراء التلقائي عند إعادة التعبئة",
        ["AUTO_BUY_PLANTS_TITLE"] = "شراء النباتات تلقائياً",
        ["AUTO_BUY_PLANTS_DESC"] = "شراء النباتات المحددة تلقائياً",
        
        -- Notifications
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "إشعارات إعادة التعبئة",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "تفعيل الإشعارات",
        ["ENABLE_NOTIFICATIONS_DESC"] = "احصل على إشعار عند إعادة تعبئة العناصر",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "تم تفعيل الإشعارات",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "ستحصل على إشعار عند إعادة تعبئة الندرة المحددة",
        ["NOTIFY_RARITIES_TITLE"] = "إشعار الندرة",
        ["NOTIFY_RARITIES_DESC"] = "اختر الندرة التي تريد الحصول على إشعار عنها",
        
        -- Player Movement
        ["WALK_SPEED_TITLE"] = "سرعة المشي",
        ["WALK_SPEED_DESC"] = "اضبط سرعة مشيك",
        ["JUMP_POWER_TITLE"] = "قوة القفز",
        ["JUMP_POWER_DESC"] = "اضبط ارتفاع قفزك",
        ["MULTI_JUMP_TITLE"] = "القفز المتعدد",
        ["MULTI_JUMP_DESC"] = "اقفز عدة مرات في الهواء",
        ["FLY_TITLE"] = "الطيران",
        ["FLY_DESC"] = "تفعيل الطيران (يعمل على الهاتف والكمبيوتر)",
        
        -- Row Statistics
        ["ROW_STATS_SECTION"] = "إحصائيات الصفوف",
        ["ROW_STATS_OVERLAY_TITLE"] = "التراكب",
        ["ROW_STATS_OVERLAY_DESC"] = "تأكد من أنك قريب من العربة",
        ["SHOW_ROW_STATS_TITLE"] = "عرض إحصائيات الصفوف",
        ["SHOW_ROW_STATS_DESC"] = "عرض معلومات النبات لكل صف مباشرة فوق جزازات العشب",
        ["SHOW_ROW_HEADER_TITLE"] = "عرض رأس الصف",
        ["SHOW_ROW_HEADER_DESC"] = "أضف اسم الصف في أعلى كل تراكب",
        ["SHOW_PLANT_COUNT_TITLE"] = "عرض عدد النباتات",
        ["SHOW_PLANT_COUNT_DESC"] = "أضف عدد النباتات إلى سطر الرأس",
        ["SHOW_PLANT_DETAILS_TITLE"] = "عرض تفاصيل النباتات",
        ["SHOW_PLANT_DETAILS_DESC"] = "عرض قائمة كل نبات مع الندرة والضرر",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "عرض إجمالي الضرر",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "عرض الضرر المشترك لكل صف",
        ["SHOW_EMPTY_ROW_TITLE"] = "عرض رسالة صف فارغ",
        ["SHOW_EMPTY_ROW_DESC"] = "عرض تذكير عندما لا يحتوي الصف على نباتات",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "تمييز أضعف نبات",
        ["HIGHLIGHT_WEAKEST_DESC"] = "تلوين النبات ذو الضرر الأقل باللون الأحمر",
        
        -- Auto Freeze
        ["AUTO_FREEZE_SECTION"] = "تجميد البرينروتس تلقائياً",
        ["FREEZE_GEAR_TITLE"] = "معدات التجميد",
        ["FREEZE_GEAR_DESC"] = "اختر معدات تجميد واحدة أو أكثر؛ سيتم استخدامها بالترتيب المحدد",
        ["TARGET_PRIORITY_TITLE"] = "أولوية الهدف",
        ["TARGET_PRIORITY_DESC"] = "اختر أي برينروتس تريد استهدافه",
        ["TARGET_RARITY_TITLE"] = "ندرة الهدف",
        ["TARGET_RARITY_DESC"] = "اختر ندرة واحدة أو أكثر عند تعيين الأولوية على الندرة",
        ["MINIMUM_HEALTH_TITLE"] = "الحد الأدنى للصحة",
        ["MINIMUM_HEALTH_DESC"] = "استهدف البرينروتس بصحة >= هذه القيمة (فقط لأولوية الصحة)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "تفعيل التجميد التلقائي",
        ["ENABLE_AUTO_FREEZE_DESC"] = "تجميد البرينروتس تلقائياً بناءً على الأولوية",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "تم تفعيل التجميد التلقائي",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "استخدام %s على أهداف %s",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "تم إيقاف التجميد التلقائي",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "توقف تجميد البرينروتس",
        
        -- Auto Attack
        ["AUTO_ATTACK_SECTION"] = "مهاجمة البرينروتس تلقائياً",
        ["WARNING_TITLE"] = "تحذير",
        ["WARNING_AUTO_ATTACK_DESC"] = "تجنب تشغيل المهاجمة التلقائية مع التجميد التلقائي لمنع التعارضات.",
        ["AUTO_ATTACK_WARNING_TITLE"] = "تحذير",
        ["AUTO_ATTACK_WARNING_DESC"] = "تجنب تشغيل المهاجمة التلقائية مع التجميد التلقائي لمنع التعارضات.",
        ["TELEPORT_POSITION_TITLE"] = "موضع النقل الفوري",
        ["TELEPORT_POSITION_DESC"] = "اختر المكان الذي تريد الانتقال إليه بالنسبة للبرينروتس",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "تفعيل المهاجمة التلقائية",
        ["ENABLE_AUTO_ATTACK_DESC"] = "تأرجح المضرب باستمرار على البرينروتس المؤهل",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "تم تفعيل المهاجمة التلقائية",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "يتأرجح على الأهداف كل 0.2 ثانية",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "تم إيقاف المهاجمة التلقائية",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "توقف تأرجح المضرب",
        ["CONFLICT_WARNING_TITLE"] = "تحذير التعارض",
        ["CONFLICT_WARNING_CONTENT"] = "أوقف التجميد التلقائي أثناء تشغيل المهاجمة التلقائية لتجنب المشاكل.",
        
        -- Misc Features
        ["AUTO_EQUIP_COLLECT_TITLE"] = "تجهيز الأفضل وجمع الأموال تلقائياً",
        ["AUTO_EQUIP_COLLECT_DESC"] = "تجهيز أفضل البرينروتس وجمع الأموال تلقائياً",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "تم تفعيل البرينروتس التلقائي",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "تجهيز أفضل البرينروتس",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "تم إيقاف البرينروتس التلقائي",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "توقف التجهيز التلقائي",
        ["AUTO_REBIRTH_TITLE"] = "إعادة الميلاد التلقائية",
        ["AUTO_REBIRTH_DESC"] = "إعادة الميلاد تلقائياً",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "تم تفعيل إعادة الميلاد التلقائية",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "إرسال طلب إعادة الميلاد",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "تم إيقاف إعادة الميلاد التلقائية",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "توقف إعادة الميلاد التلقائية",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "شراء المنصات تلقائياً",
        ["AUTO_BUY_PLATFORMS_DESC"] = "شراء المنصات تلقائياً",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "تم تفعيل شراء المنصات تلقائياً",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "محاولة شراء المنصات",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "تم إيقاف شراء المنصات تلقائياً",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "توقف شراء المنصات",
        ["ANTI_AFK_TITLE"] = "مضاد AFK",
        ["ANTI_AFK_DESC"] = "القفز كل 5 دقائق لتجنب AFK",
        ["ANTI_AFK_ENABLED_TITLE"] = "تم تفعيل مضاد AFK",
        ["ANTI_AFK_ENABLED_CONTENT"] = "القفز كل 5 دقائق",
        ["ANTI_AFK_DISABLED_TITLE"] = "تم إيقاف مضاد AFK",
        ["ANTI_AFK_DISABLED_CONTENT"] = "توقف القفز التلقائي",
        
        -- Session Safety
        ["SESSION_SAFETY_SECTION"] = "أمان الجلسة",
        ["AUTO_REJOIN_TITLE"] = "إعادة الانضمام التلقائي",
        ["AUTO_REJOIN_DESC"] = "محاولة إعادة الانضمام تلقائياً إذا انقطع الاتصال",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "تم تفعيل إعادة الانضمام التلقائي",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "سنحاول إعادة اتصالك إذا انقطع الاتصال.",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "تم إيقاف إعادة الانضمام التلقائي",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "تم إيقاف إعادة الاتصال التلقائي.",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "إعادة الانضمام التلقائي",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "محاولة إعادة الانضمام إلى الخادم...",
        
        -- Script Automation
        ["SCRIPT_AUTOMATION_SECTION"] = "أتمتة البرنامج النصي",
        ["AUTO_EXECUTE_TITLE"] = "التنفيذ التلقائي",
        ["AUTO_EXECUTE_DESC"] = "ضع هذا الهاب في قائمة الانتظار عند النقل الفوري",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "تم تفعيل التنفيذ التلقائي",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "تم وضع المحمل في قائمة الانتظار للنقل الفوري التالي.",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "تم إيقاف التنفيذ التلقائي",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "تم مسح قائمة انتظار النقل الفوري.",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "خطأ في التنفيذ التلقائي",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "معلومات قائمة انتظار النقل الفوري",
        
        -- Background Image
        ["BACKGROUND_IMAGE_TITLE"] = "تفعيل صورة الخلفية",
        ["BACKGROUND_IMAGE_DESC"] = "تبديل خلفية النافذة المسبقة",
        ["BACKGROUND_PRESET_TITLE"] = "خلفية مسبقة",
        ["BACKGROUND_PRESET_DESC"] = "اختر صورة خلفية",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "فتح البيض تلقائياً",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "كيف يعمل",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "يجهز ويفتح البيض المحدد مع احترام فترة الانتظار في اللعبة.",
        ["INV_EGG_SELECTION_TITLE"] = "اختيار البيض",
        ["INV_EGG_SELECTION_DESC"] = "اختر أي بيض تريد فتحه تلقائياً",
        ["INV_EGG_INTERVAL_TITLE"] = "فترة فتح البيض (ثانية)",
        ["INV_EGG_INTERVAL_DESC"] = "التأخير بين كل محاولة فتح تلقائي",
        ["INV_EGG_ENABLE_TITLE"] = "تفعيل فتح البيض تلقائياً",
        ["INV_EGG_ENABLE_DESC"] = "تجهيز وفتح البيض المختار تلقائياً",
        
        ["INV_SELL_SECTION_TITLE"] = "البيع التلقائي",
        ["INV_SELL_SAFETY_TITLE"] = "الأمان أولاً",
        ["INV_SELL_SAFETY_DESC"] = "يتم تحديث المفضلات قبل كل دورة بيع حتى تبقى العناصر المحددة في مخزونك.",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "فترة بيع البرينروتس (ثانية)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "كم مرة يتم بيع البرينروتس",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "تفعيل بيع البرينروتس تلقائياً",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "بيع البرينروتس غير المفضلة في الفترة المحددة",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "فترة بيع النباتات (ثانية)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "كم مرة يتم بيع النباتات",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "تفعيل بيع النباتات تلقائياً",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "بيع النباتات غير المفضلة في الفترة المحددة",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "البرينروتس المفضلة",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "التكوين",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "اختر الندرة أو البرينروتس المحددة للحفاظ عليها مفضلة تلقائياً.",
        ["INV_BRAINROT_RARITY_TITLE"] = "فلتر الندرة",
        ["INV_BRAINROT_RARITY_DESC"] = "ندرة البرينروتس للتفضيل",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "برينروتس محددة",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "تفضيل الأسماء المحددة دائماً",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "الحد الأدنى للأموال في الثانية",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "تجاهل البرينروتس تحت هذه القيمة من الأموال في الثانية",
        ["INV_BRAINROT_ENABLE_TITLE"] = "تفعيل تفضيل البرينروتس تلقائياً",
        ["INV_BRAINROT_ENABLE_DESC"] = "الحفاظ على البرينروتس المطابقة مفضلة قبل البيع",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "النباتات المفضلة",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "التكوين",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "اختر الندرة أو النباتات المحددة للحفاظ عليها مفضلة تلقائياً.",
        ["INV_PLANT_RARITY_TITLE"] = "فلتر الندرة",
        ["INV_PLANT_RARITY_DESC"] = "ندرة النباتات للتفضيل",
        ["INV_PLANT_SPECIFIC_TITLE"] = "نباتات محددة",
        ["INV_PLANT_SPECIFIC_DESC"] = "تفضيل النباتات المحددة دائماً",
        ["INV_PLANT_ENABLE_TITLE"] = "تفعيل تفضيل النباتات تلقائياً",
        ["INV_PLANT_ENABLE_DESC"] = "الحفاظ على النباتات المطابقة مفضلة قبل البيع",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "إلغاء تفضيل الكل",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "إلغاء تفضيل جميع العناصر",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "إزالة التفضيل من جميع البرينروتس والنباتات",
    },
    ["hi"] = {
        ["TITLE"] = "पौधे बनाम ब्रेनरोट्स",
        ["SUBTITLE"] = "ToastyxDD हब",
        ["WELCOME"] = "पौधे बनाम ब्रेनरोट्स में आपका स्वागत है!",
        ["LOADED"] = "GUI सफलतापूर्वक लोड हो गया!",
        ["MAIN_TAB"] = "जानकारी",
        ["PLAYER_TAB"] = "खिलाड़ी",
        ["VISUAL_TAB"] = "दृश्य",
        ["MISC_TAB"] = "अन्य",
        ["SETTINGS_TAB"] = "सेटिंग्स",
        ["THEME_TAB"] = "थीम्स",
        ["CONFIG_TAB"] = "कॉन्फ़िग",
        ["COMING_SOON"] = "जल्द आ रहा है",
        ["FEATURES_SOON"] = "फीचर्स विकास में हैं।",
        ["MAIN_AUTO_TITLE"] = "खेल की जानकारी",
        ["MAIN_AUTO_DESC"] = "अपनी वस्तुओं, मानचित्र और खेल की जानकारी देखें।",
        ["MAIN_AUTO_SECTION_TITLE"] = "सामान्य जानकारी",
        ["PLAYER_PARAGRAPH_TITLE"] = "खिलाड़ी संशोधन",
        ["PLAYER_PARAGRAPH_DESC"] = "अपने खिलाड़ी की क्षमताओं और गति को संशोधित करें।",
        ["PLAYER_SECTION_TITLE"] = "गति",
        ["PLAYER_SECTION_DESC"] = "चलने की गति, कूदने की शक्ति, और उड़ने की सुविधाएं जल्द आ रही हैं।",
        ["VISUAL_PARAGRAPH_TITLE"] = "दृश्य सुविधाएं",
        ["VISUAL_PARAGRAPH_DESC"] = "ESP, ट्रेसर्स, और अन्य दृश्य सुधार।",
        ["VISUAL_SECTION_TITLE"] = "ESP और ट्रेसर्स",
        ["MISC_PARAGRAPH_TITLE"] = "विविध",
        ["MISC_PARAGRAPH_DESC"] = "अतिरिक्त उपकरण और सेटिंग्स।",
        ["MISC_CREDITS_TITLE"] = "श्रेय",
        ["MISC_CREDITS_DESC"] = "ToastyxDD द्वारा प्यार से बनाया गया",
        ["DISCORD_BUTTON_TITLE"] = "Discord में शामिल हों",
        ["DISCORD_BUTTON_DESC"] = "Discord आमंत्रण लिंक कॉपी करने के लिए क्लिक करें",
        ["DISCORD_COPIED_TITLE"] = "Discord लिंक कॉपी हो गया!",
        ["DISCORD_COPIED_CONTENT"] = "Discord आमंत्रण लिंक क्लिपबोर्ड में कॉपी हो गया।",
        ["DISCORD_ERROR_TITLE"] = "त्रुटि",
        ["DISCORD_ERROR_CONTENT"] = "आपके executor पर क्लिपबोर्ड समर्थित नहीं है।",
        ["SETTINGS_PARAGRAPH_TITLE"] = "UI सेटिंग्स",
        ["SETTINGS_PARAGRAPH_DESC"] = "अपने GUI अनुभव को अनुकूलित करें।",
        ["LANGUAGE_LABEL"] = "भाषा",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ महत्वपूर्ण चेतावनी",
        ["LANGUAGE_WARNING_DESC"] = "आप GUI लोड करने के बाद केवल एक बार भाषा बदल सकते हैं। इसे फिर से बदलने से GUI फ्रीज हो जाएगा!",
        ["THEME_PARAGRAPH_TITLE"] = "थीम विकल्प",
        ["THEME_PARAGRAPH_DESC"] = "अपनी पसंदीदा WindUI थीम चुनें।",
        ["THEME_DROPDOWN_TITLE"] = "थीम",
        ["THEME_DROPDOWN_DESC"] = "GUI के लिए एक थीम चुनें",
        ["THEME_CHANGED_TITLE"] = "थीम बदल गई",
        ["THEME_CHANGED_CONTENT"] = "थीम सेट की गई: %s",
        ["THEME_ERROR_TITLE"] = "थीम त्रुटि",
        ["THEME_ERROR_CONTENT"] = "चयनित थीम अब उपलब्ध नहीं है।",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "विंडो पारदर्शिता",
        ["TRANSPARENCY_TOGGLE_DESC"] = "पारदर्शी विंडो पृष्ठभूमि सक्षम करें",
        ["TRANSPARENCY_ENABLED_TITLE"] = "पारदर्शिता सक्षम",
        ["TRANSPARENCY_DISABLED_TITLE"] = "पारदर्शिता अक्षम",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "विंडो पारदर्शिता अपडेट हो गई।",
        ["WINDOW_CONTROLS_TITLE"] = "विंडो नियंत्रण",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "टॉगल कुंजी",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "GUI खोलने या बंद करने के लिए इस कुंजी को दबाएं।",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "टॉगल कुंजी अपडेट हुई",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "विंडो टॉगल कुंजी सेट की गई: %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "अमान्य कुंजी",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "वह कुंजी टॉगल के रूप में उपयोग नहीं की जा सकती। कृपया कीबोर्ड कुंजी चुनें।",
        ["LANGUAGE_DROPDOWN_TITLE"] = "भाषा",
        ["LANGUAGE_DROPDOWN_DESC"] = "GUI भाषा बदलें",
        ["LANGUAGE_CHANGED_TITLE"] = "भाषा बदल गई",
        ["LANGUAGE_CHANGED_CONTENT"] = "GUI भाषा अपडेट हुई: %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "कॉन्फ़िगरेशन",
        ["CONFIG_PARAGRAPH_DESC"] = "आपकी सेटिंग्स स्वचालित रूप से सहेजी और अगली बार लोड की जाएंगी।",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "कॉन्फ़िगरेशन सहेजें",
        ["CONFIG_SAVE_BUTTON_DESC"] = "मैन्युअल रूप से वर्तमान सेटिंग्स सहेजें",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "कॉन्फ़िग सहेजा गया!",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "आपकी सेटिंग्स सफलतापूर्वक सहेजी गई हैं।",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "कॉन्फ़िगरेशन लोड करें",
        ["CONFIG_LOAD_BUTTON_DESC"] = "सहेजी गई सेटिंग्स पुनः लोड करें",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "कॉन्फ़िग लोड हुआ!",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "आपकी सहेजी गई सेटिंग्स पुनर्स्थापित की गई हैं।",
        ["CONFIG_RESET_BUTTON_TITLE"] = "डिफ़ॉल्ट पर रीसेट करें",
        ["CONFIG_RESET_BUTTON_DESC"] = "सभी सेटिंग्स को डिफ़ॉल्ट मान पर रीसेट करें",
        ["CONFIG_RESET_DIALOG_TITLE"] = "कॉन्फ़िगरेशन रीसेट करें",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "क्या आप वाकई सभी सेटिंग्स को डिफ़ॉल्ट पर रीसेट करना चाहते हैं?",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "रद्द करें",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "रीसेट करें",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "सेटिंग्स रीसेट हुईं",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "सभी सेटिंग्स डिफ़ॉल्ट पर रीसेट हो गई हैं।",
        ["CONFIG_ABOUT_TITLE"] = "परिचय",
        ["CONFIG_ABOUT_DESC"] = "Plants Vs Brainrots GUI v1.0\nToastyxDD द्वारा बनाया गया",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "अपडेट जांचें",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "जांचें कि क्या नया संस्करण उपलब्ध है",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "अपडेट है",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "आप नवीनतम संस्करण का उपयोग कर रहे हैं।",
        
        ["PLAYER_STATS_SECTION"] = "खिलाड़ी के आंकड़े",
        ["REBIRTH_TITLE"] = "🔄 पुनर्जन्म",
        ["REBIRTH_DESC"] = "लोड हो रहा है...",
        ["CPS_TITLE"] = "💰 प्रति सेकंड पैसे",
        ["CPS_DESC"] = "लोड हो रहा है...",
        ["ROWS_TITLE"] = "🌾 खुली पंक्तियां",
        ["ROWS_DESC"] = "लोड हो रहा है...",
        ["ROWS_UNLOCKED"] = "Unlocked: %d/%d rows",
        ["SHOP_STATS_SECTION"] = "दुकान के आंकड़े",
        ["RESTOCK_TITLE"] = "🏪 दुकान रीस्टॉक टाइमर",
        ["RESTOCK_DESC"] = "लोड हो रहा है...",
        ["AUTO_SHOPPING_SECTION"] = "ऑटो शॉपिंग",
        ["GEAR_SELECTION_TITLE"] = "गियर चयन",
        ["GEAR_SELECTION_DESC"] = "रीस्टॉक पर ऑटो खरीदने के लिए गियर चुनें",
        ["AUTO_BUY_GEAR_TITLE"] = "ऑटो खरीदें गियर",
        ["AUTO_BUY_GEAR_DESC"] = "चयनित गियर स्वचालित रूप से खरीदें",
        ["PLANT_SELECTION_TITLE"] = "पौधा चयन",
        ["PLANT_SELECTION_DESC"] = "रीस्टॉक पर ऑटो खरीदने के लिए पौधे चुनें",
        ["AUTO_BUY_PLANTS_TITLE"] = "ऑटो खरीदें पौधे",
        ["AUTO_BUY_PLANTS_DESC"] = "चयनित पौधे स्वचालित रूप से खरीदें",
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "रीस्टॉक सूचनाएं",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "सूचनाएं सक्षम करें",
        ["ENABLE_NOTIFICATIONS_DESC"] = "आइटम रीस्टॉक होने पर सूचना प्राप्त करें",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "सूचनाएं सक्षम",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "चयनित दुर्लभता रीस्टॉक होने पर आपको सूचित किया जाएगा",
        ["NOTIFY_RARITIES_TITLE"] = "दुर्लभता सूचित करें",
        ["NOTIFY_RARITIES_DESC"] = "किस दुर्लभता के बारे में सूचित करना है चुनें",
        ["WALK_SPEED_TITLE"] = "चलने की गति",
        ["WALK_SPEED_DESC"] = "अपनी चलने की गति समायोजित करें",
        ["JUMP_POWER_TITLE"] = "कूदने की शक्ति",
        ["JUMP_POWER_DESC"] = "अपनी कूद की ऊंचाई समायोजित करें",
        ["MULTI_JUMP_TITLE"] = "मल्टी जंप",
        ["MULTI_JUMP_DESC"] = "हवा में कई बार कूदें",
        ["FLY_TITLE"] = "उड़ें",
        ["FLY_DESC"] = "उड़ना सक्षम करें (मोबाइल और PC पर काम करता है)",
        ["ROW_STATS_SECTION"] = "पंक्ति आंकड़े",
        ["ROW_STATS_OVERLAY_TITLE"] = "ओवरले",
        ["ROW_STATS_OVERLAY_DESC"] = "सुनिश्चित करें कि आप व्हीलबैरो के पास हैं",
        ["SHOW_ROW_STATS_TITLE"] = "पंक्ति आंकड़े दिखाएं",
        ["SHOW_ROW_STATS_DESC"] = "लॉन मोवर्स के ऊपर प्रति-पंक्ति पौधे की जानकारी प्रदर्शित करें",
        ["SHOW_ROW_HEADER_TITLE"] = "पंक्ति हेडर दिखाएं",
        ["SHOW_ROW_HEADER_DESC"] = "प्रत्येक ओवरले के शीर्ष पर पंक्ति का नाम शामिल करें",
        ["SHOW_PLANT_COUNT_TITLE"] = "पौधों की संख्या दिखाएं",
        ["SHOW_PLANT_COUNT_DESC"] = "हेडर लाइन में पौधों की संख्या जोड़ें",
        ["SHOW_PLANT_DETAILS_TITLE"] = "पौधे का विवरण दिखाएं",
        ["SHOW_PLANT_DETAILS_DESC"] = "प्रत्येक पौधे को दुर्लभता और क्षति के साथ सूचीबद्ध करें",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "कुल क्षति दिखाएं",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "प्रति पंक्ति संयुक्त क्षति प्रदर्शित करें",
        ["SHOW_EMPTY_ROW_TITLE"] = "खाली पंक्ति संदेश दिखाएं",
        ["SHOW_EMPTY_ROW_DESC"] = "जब पंक्ति में कोई पौधा न हो तो अनुस्मारक दिखाएं",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "सबसे कमजोर पौधा हाइलाइट करें",
        ["HIGHLIGHT_WEAKEST_DESC"] = "सबसे कम क्षति वाले पौधे को लाल रंग में रंगें",
        ["AUTO_FREEZE_SECTION"] = "ऑटो फ्रीज ब्रेनरोट्स",
        ["FREEZE_GEAR_TITLE"] = "फ्रीज गियर",
        ["FREEZE_GEAR_DESC"] = "एक या अधिक फ्रीज गियर चुनें; उन्हें चयनित क्रम में उपयोग किया जाएगा",
        ["TARGET_PRIORITY_TITLE"] = "लक्ष्य प्राथमिकता",
        ["TARGET_PRIORITY_DESC"] = "कौन से ब्रेनरोट्स को लक्षित करना है चुनें",
        ["TARGET_RARITY_TITLE"] = "लक्ष्य दुर्लभता",
        ["TARGET_RARITY_DESC"] = "जब प्राथमिकता दुर्लभता पर सेट हो तो एक या अधिक दुर्लभता चुनें",
        ["MINIMUM_HEALTH_TITLE"] = "न्यूनतम स्वास्थ्य",
        ["MINIMUM_HEALTH_DESC"] = "स्वास्थ्य >= इस मान वाले ब्रेनरोट्स को लक्षित करें (केवल स्वास्थ्य प्राथमिकता के लिए)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "ऑटो फ्रीज सक्षम करें",
        ["ENABLE_AUTO_FREEZE_DESC"] = "प्राथमिकता के आधार पर ब्रेनरोट्स को स्वचालित रूप से फ्रीज करें",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "ऑटो फ्रीज सक्षम",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "%s लक्ष्यों पर %s का उपयोग",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "ऑटो फ्रीज अक्षम",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "ब्रेनरोट्स फ्रीज करना बंद",
        ["AUTO_ATTACK_SECTION"] = "ऑटो अटैक ब्रेनरोट्स",
        ["WARNING_TITLE"] = "चेतावनी",
        ["WARNING_AUTO_ATTACK_DESC"] = "संघर्ष से बचने के लिए ऑटो अटैक को ऑटो फ्रीज के साथ चलाने से बचें।",
        ["AUTO_ATTACK_WARNING_TITLE"] = "चेतावनी",
        ["AUTO_ATTACK_WARNING_DESC"] = "संघर्ष से बचने के लिए ऑटो अटैक को ऑटो फ्रीज के साथ चलाने से बचें।",
        ["TELEPORT_POSITION_TITLE"] = "टेलीपोर्ट स्थिति",
        ["TELEPORT_POSITION_DESC"] = "ब्रेनरोट के सापेक्ष कहां टेलीपोर्ट करना है चुनें",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "ऑटो अटैक सक्षम करें",
        ["ENABLE_AUTO_ATTACK_DESC"] = "योग्य ब्रेनरोट्स पर लगातार अपना बैट स्विंग करें",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "ऑटो अटैक सक्षम",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "हर 0.2 सेकंड में लक्ष्यों पर स्विंग",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "ऑटो अटैक अक्षम",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "बैट स्विंग करना बंद",
        ["CONFLICT_WARNING_TITLE"] = "संघर्ष चेतावनी",
        ["CONFLICT_WARNING_CONTENT"] = "समस्याओं से बचने के लिए ऑटो अटैक सक्रिय होने पर ऑटो फ्रीज बंद करें।",
        ["AUTO_EQUIP_COLLECT_TITLE"] = "सर्वश्रेष्ठ लैस करें और नकद एकत्र करें",
        ["AUTO_EQUIP_COLLECT_DESC"] = "सर्वश्रेष्ठ ब्रेनरोट्स को स्वचालित रूप से लैस करें और नकद एकत्र करें",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "ऑटो ब्रेनरोट्स सक्षम",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "सर्वश्रेष्ठ ब्रेनरोट्स लैस कर रहे हैं",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "ऑटो ब्रेनरोट्स अक्षम",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "ऑटो-लैस करना बंद",
        ["AUTO_REBIRTH_TITLE"] = "ऑटो पुनर्जन्म",
        ["AUTO_REBIRTH_DESC"] = "स्वचालित रूप से पुनर्जन्म",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "ऑटो पुनर्जन्म सक्षम",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "पुनर्जन्म अनुरोध भेज रहे हैं",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "ऑटो पुनर्जन्म अक्षम",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "ऑटो पुनर्जन्म बंद",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "ऑटो खरीदें प्लेटफॉर्म",
        ["AUTO_BUY_PLATFORMS_DESC"] = "स्वचालित रूप से प्लेटफॉर्म खरीदें",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "ऑटो खरीदें प्लेटफॉर्म सक्षम",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "प्लेटफॉर्म खरीदने का प्रयास",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "ऑटो खरीदें प्लेटफॉर्म अक्षम",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "प्लेटफॉर्म खरीदना बंद",
        ["ANTI_AFK_TITLE"] = "एंटी AFK",
        ["ANTI_AFK_DESC"] = "AFK से बचने के लिए हर 5 मिनट में कूदें",
        ["ANTI_AFK_ENABLED_TITLE"] = "एंटी AFK सक्षम",
        ["ANTI_AFK_ENABLED_CONTENT"] = "हर 5 मिनट में कूद रहे हैं",
        ["ANTI_AFK_DISABLED_TITLE"] = "एंटी AFK अक्षम",
        ["ANTI_AFK_DISABLED_CONTENT"] = "ऑटो कूदना बंद",
        ["SESSION_SAFETY_SECTION"] = "सत्र सुरक्षा",
        ["AUTO_REJOIN_TITLE"] = "ऑटो पुनः जुड़ें",
        ["AUTO_REJOIN_DESC"] = "यदि आप डिस्कनेक्ट हो जाते हैं तो स्वचालित रूप से पुनः जुड़ने का प्रयास करें",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "ऑटो पुनः जुड़ें सक्षम",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "यदि आप डिस्कनेक्ट हो जाते हैं तो हम आपको पुनः कनेक्ट करने का प्रयास करेंगे।",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "ऑटो पुनः जुड़ें अक्षम",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "स्वचालित पुनर्कनेक्शन बंद कर दिया गया है।",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "ऑटो पुनः जुड़ें",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "सर्वर में पुनः जुड़ने का प्रयास...",
        ["SCRIPT_AUTOMATION_SECTION"] = "स्क्रिप्ट स्वचालन",
        ["AUTO_EXECUTE_TITLE"] = "ऑटो एक्सीक्यूट",
        ["AUTO_EXECUTE_DESC"] = "जब भी आप टेलीपोर्ट करें तो इस हब को अपने एक्जीक्यूटर के साथ कतारबद्ध करें",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "ऑटो एक्सीक्यूट सक्षम",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "आपके अगले टेलीपोर्ट के लिए लोडर कतारबद्ध।",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "ऑटो एक्सीक्यूट अक्षम",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "टेलीपोर्ट कतार साफ़।",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "ऑटो एक्सीक्यूट त्रुटि",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "टेलीपोर्ट कतार जानकारी",
        ["BACKGROUND_IMAGE_TITLE"] = "पृष्ठभूमि छवि सक्षम करें",
        ["BACKGROUND_IMAGE_DESC"] = "प्रीसेट विंडो पृष्ठभूमि टॉगल करें",
        ["BACKGROUND_PRESET_TITLE"] = "पृष्ठभूमि प्रीसेट",
        ["BACKGROUND_PRESET_DESC"] = "एक पृष्ठभूमि छवि चुनें",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "ऑटो अंडा खोलना",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "यह कैसे काम करता है",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "खेल के कूलडाउन का सम्मान करते हुए चयनित अंडे लैस और खोलता है।",
        ["INV_EGG_SELECTION_TITLE"] = "अंडा चयन",
        ["INV_EGG_SELECTION_DESC"] = "स्वचालित रूप से खोलने के लिए अंडे चुनें",
        ["INV_EGG_INTERVAL_TITLE"] = "अंडा खोलने का अंतराल (सेकंड)",
        ["INV_EGG_INTERVAL_DESC"] = "प्रत्येक ऑटो-ओपन प्रयास के बीच की देरी",
        ["INV_EGG_ENABLE_TITLE"] = "ऑटो अंडा खोलना सक्षम करें",
        ["INV_EGG_ENABLE_DESC"] = "चुने गए अंडे स्वचालित रूप से लैस और खोलता है",
        
        ["INV_SELL_SECTION_TITLE"] = "ऑटो बिक्री",
        ["INV_SELL_SAFETY_TITLE"] = "सुरक्षा पहले",
        ["INV_SELL_SAFETY_DESC"] = "हर बिक्री चक्र से पहले पसंदीदा रिफ्रेश किए जाते हैं ताकि चिह्नित आइटम आपकी इन्वेंटरी में रहें।",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "ब्रेनरोट बिक्री अंतराल (सेकंड)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "ब्रेनरोट कितनी बार बेचे जाते हैं",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "ऑटो बेचें ब्रेनरोट सक्षम करें",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "चुने गए अंतराल पर गैर-पसंदीदा ब्रेनरोट बेचें",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "पौधे बिक्री अंतराल (सेकंड)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "पौधे कितनी बार बेचे जाते हैं",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "ऑटो बेचें पौधे सक्षम करें",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "चुने गए अंतराल पर गैर-पसंदीदा पौधे बेचें",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "ब्रेनरोट पसंदीदा",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "कॉन्फ़िगरेशन",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "स्वचालित रूप से पसंदीदा रखने के लिए दुर्लभता या विशिष्ट ब्रेनरोट चुनें।",
        ["INV_BRAINROT_RARITY_TITLE"] = "दुर्लभता फ़िल्टर",
        ["INV_BRAINROT_RARITY_DESC"] = "पसंदीदा करने के लिए ब्रेनरोट दुर्लभता",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "विशिष्ट ब्रेनरोट",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "चयनित नाम हमेशा पसंदीदा करें",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "न्यूनतम नकद प्रति सेकंड",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "इस नकद-प्रति-सेकंड मूल्य से नीचे ब्रेनरोट अनदेखा करें",
        ["INV_BRAINROT_ENABLE_TITLE"] = "ऑटो पसंदीदा ब्रेनरोट सक्षम करें",
        ["INV_BRAINROT_ENABLE_DESC"] = "बिक्री से पहले मिलान करने वाले ब्रेनरोट को पसंदीदा रखें",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "पौधे पसंदीदा",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "कॉन्फ़िगरेशन",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "स्वचालित रूप से पसंदीदा रखने के लिए दुर्लभता या विशिष्ट पौधे चुनें।",
        ["INV_PLANT_RARITY_TITLE"] = "दुर्लभता फ़िल्टर",
        ["INV_PLANT_RARITY_DESC"] = "पसंदीदा करने के लिए पौधे दुर्लभता",
        ["INV_PLANT_SPECIFIC_TITLE"] = "विशिष्ट पौधे",
        ["INV_PLANT_SPECIFIC_DESC"] = "चयनित पौधे हमेशा पसंदीदा करें",
        ["INV_PLANT_ENABLE_TITLE"] = "ऑटो पसंदीदा पौधे सक्षम करें",
        ["INV_PLANT_ENABLE_DESC"] = "बिक्री से पहले मिलान करने वाले पौधों को पसंदीदा रखें",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "सभी अनपसंदीदा करें",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "सभी आइटम अनपसंदीदा करें",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "सभी ब्रेनरोट और पौधों से पसंदीदा हटाएं",
    },
    ["fr"] = {
        ["TITLE"] = "Plantes Vs Brainrots",
        ["SUBTITLE"] = "Hub ToastyxDD",
        ["WELCOME"] = "Bienvenue dans Plantes Vs Brainrots !",
        ["LOADED"] = "Interface chargée avec succès !",
        ["MAIN_TAB"] = "Informations",
        ["PLAYER_TAB"] = "Joueur",
        ["VISUAL_TAB"] = "Visuel",
        ["MISC_TAB"] = "Divers",
        ["SETTINGS_TAB"] = "Paramètres",
        ["THEME_TAB"] = "Thèmes",
        ["CONFIG_TAB"] = "Configuration",
        ["COMING_SOON"] = "Bientôt disponible",
        ["FEATURES_SOON"] = "Les fonctionnalités sont en développement.",
        ["MAIN_AUTO_TITLE"] = "Informations du jeu",
        ["MAIN_AUTO_DESC"] = "Consultez vos objets, la carte et les statistiques du jeu.",
        ["MAIN_AUTO_SECTION_TITLE"] = "Infos générales",
        ["PLAYER_PARAGRAPH_TITLE"] = "Modifications du joueur",
        ["PLAYER_PARAGRAPH_DESC"] = "Modifiez les capacités et les mouvements de votre joueur.",
        ["PLAYER_SECTION_TITLE"] = "Mouvement",
        ["PLAYER_SECTION_DESC"] = "Vitesse de marche, puissance de saut et vol bientôt disponibles.",
        ["VISUAL_PARAGRAPH_TITLE"] = "Fonctions visuelles",
        ["VISUAL_PARAGRAPH_DESC"] = "ESP, traceurs et autres améliorations visuelles.",
        ["VISUAL_SECTION_TITLE"] = "ESP et Traceurs",
        ["MISC_PARAGRAPH_TITLE"] = "Divers",
        ["MISC_PARAGRAPH_DESC"] = "Utilitaires et paramètres supplémentaires.",
        ["MISC_CREDITS_TITLE"] = "Crédits",
        ["MISC_CREDITS_DESC"] = "Créé avec amour par ToastyxDD",
        ["DISCORD_BUTTON_TITLE"] = "Rejoindre Discord",
        ["DISCORD_BUTTON_DESC"] = "Cliquez pour copier le lien d'invitation Discord",
        ["DISCORD_COPIED_TITLE"] = "Lien Discord copié !",
        ["DISCORD_COPIED_CONTENT"] = "Lien d'invitation Discord copié dans le presse-papiers.",
        ["DISCORD_ERROR_TITLE"] = "Erreur",
        ["DISCORD_ERROR_CONTENT"] = "Presse-papiers non pris en charge sur votre exécuteur.",
        ["SETTINGS_PARAGRAPH_TITLE"] = "Paramètres de l'interface",
        ["SETTINGS_PARAGRAPH_DESC"] = "Personnalisez votre expérience GUI.",
        ["LANGUAGE_LABEL"] = "Langue",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ Avertissement Important",
        ["LANGUAGE_WARNING_DESC"] = "Vous ne pouvez changer la langue qu'UNE SEULE FOIS après le chargement de l'interface. La changer à nouveau figera l'interface !",
        ["THEME_PARAGRAPH_TITLE"] = "Options de thème",
        ["THEME_PARAGRAPH_DESC"] = "Choisissez votre thème WindUI préféré.",
        ["THEME_DROPDOWN_TITLE"] = "Thème",
        ["THEME_DROPDOWN_DESC"] = "Sélectionnez un thème pour l'interface",
        ["THEME_CHANGED_TITLE"] = "Thème modifié",
        ["THEME_CHANGED_CONTENT"] = "Thème défini sur : %s",
        ["THEME_ERROR_TITLE"] = "Erreur de thème",
        ["THEME_ERROR_CONTENT"] = "Le thème sélectionné n'est plus disponible.",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "Transparence de la fenêtre",
        ["TRANSPARENCY_TOGGLE_DESC"] = "Activer l'arrière-plan transparent de la fenêtre",
        ["TRANSPARENCY_ENABLED_TITLE"] = "Transparence activée",
        ["TRANSPARENCY_DISABLED_TITLE"] = "Transparence désactivée",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "Transparence de la fenêtre mise à jour.",
        ["WINDOW_CONTROLS_TITLE"] = "Contrôles de fenêtre",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "Touche de basculement",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "Appuyez sur cette touche pour ouvrir ou fermer l'interface.",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "Touche de basculement mise à jour",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "Touche de basculement définie sur : %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "Touche invalide",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "Cette touche ne peut pas être utilisée. Veuillez choisir une touche du clavier.",
        ["LANGUAGE_DROPDOWN_TITLE"] = "Langue",
        ["LANGUAGE_DROPDOWN_DESC"] = "Changer la langue de l'interface",
        ["LANGUAGE_CHANGED_TITLE"] = "Langue modifiée",
        ["LANGUAGE_CHANGED_CONTENT"] = "Langue de l'interface mise à jour : %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "Configuration",
        ["CONFIG_PARAGRAPH_DESC"] = "Vos paramètres sont automatiquement sauvegardés et chargés au prochain lancement.",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "Sauvegarder la configuration",
        ["CONFIG_SAVE_BUTTON_DESC"] = "Sauvegarder manuellement les paramètres actuels",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "Configuration sauvegardée !",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "Vos paramètres ont été sauvegardés avec succès.",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "Charger la configuration",
        ["CONFIG_LOAD_BUTTON_DESC"] = "Recharger les paramètres sauvegardés",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "Configuration chargée !",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "Vos paramètres sauvegardés ont été restaurés.",
        ["CONFIG_RESET_BUTTON_TITLE"] = "Réinitialiser par défaut",
        ["CONFIG_RESET_BUTTON_DESC"] = "Réinitialiser tous les paramètres aux valeurs par défaut",
        ["CONFIG_RESET_DIALOG_TITLE"] = "Réinitialiser la configuration",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "Voulez-vous vraiment réinitialiser tous les paramètres par défaut ?",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "Annuler",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "Réinitialiser",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "Paramètres réinitialisés",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "Tous les paramètres ont été réinitialisés par défaut.",
        ["CONFIG_ABOUT_TITLE"] = "À propos",
        ["CONFIG_ABOUT_DESC"] = "Plants Vs Brainrots GUI v1.0\nCréé par ToastyxDD",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "Vérifier les mises à jour",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "Vérifier si une nouvelle version est disponible",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "À jour",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "Vous utilisez la dernière version.",
        
        ["PLAYER_STATS_SECTION"] = "Statistiques du joueur",
        ["REBIRTH_TITLE"] = "🔄 Renaissance",
        ["REBIRTH_DESC"] = "Chargement...",
        ["CPS_TITLE"] = "💰 Argent par seconde",
        ["CPS_DESC"] = "Chargement...",
        ["ROWS_TITLE"] = "🌾 Rangées débloquées",
        ["ROWS_DESC"] = "Chargement...",
        ["ROWS_UNLOCKED"] = "Débloqué: %d/%d rangées",
        ["SHOP_STATS_SECTION"] = "Statistiques de la boutique",
        ["RESTOCK_TITLE"] = "🏪 Minuteur de réapprovisionnement",
        ["RESTOCK_DESC"] = "Chargement...",
        ["AUTO_SHOPPING_SECTION"] = "Achat automatique",
        ["GEAR_SELECTION_TITLE"] = "Sélection d'équipement",
        ["GEAR_SELECTION_DESC"] = "Choisissez les équipements à acheter automatiquement lors du réapprovisionnement",
        ["AUTO_BUY_GEAR_TITLE"] = "Achat automatique d'équipement",
        ["AUTO_BUY_GEAR_DESC"] = "Acheter automatiquement l'équipement sélectionné",
        ["PLANT_SELECTION_TITLE"] = "Sélection de plantes",
        ["PLANT_SELECTION_DESC"] = "Choisissez les plantes à acheter automatiquement lors du réapprovisionnement",
        ["AUTO_BUY_PLANTS_TITLE"] = "Achat automatique de plantes",
        ["AUTO_BUY_PLANTS_DESC"] = "Acheter automatiquement les plantes sélectionnées",
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "Notifications de réapprovisionnement",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "Activer les notifications",
        ["ENABLE_NOTIFICATIONS_DESC"] = "Recevoir une notification lors du réapprovisionnement",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "Notifications activées",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "Vous serez notifié lorsque les raretés sélectionnées seront réapprovisionnées",
        ["NOTIFY_RARITIES_TITLE"] = "Raretés à notifier",
        ["NOTIFY_RARITIES_DESC"] = "Sélectionnez les raretés pour lesquelles vous souhaitez être notifié",
        ["WALK_SPEED_TITLE"] = "Vitesse de marche",
        ["WALK_SPEED_DESC"] = "Ajustez votre vitesse de marche",
        ["JUMP_POWER_TITLE"] = "Puissance de saut",
        ["JUMP_POWER_DESC"] = "Ajustez la hauteur de votre saut",
        ["MULTI_JUMP_TITLE"] = "Multi-saut",
        ["MULTI_JUMP_DESC"] = "Sauter plusieurs fois dans les airs",
        ["FLY_TITLE"] = "Voler",
        ["FLY_DESC"] = "Activer le vol (fonctionne sur mobile et PC)",
        ["ROW_STATS_SECTION"] = "Statistiques des rangées",
        ["ROW_STATS_OVERLAY_TITLE"] = "Superposition",
        ["ROW_STATS_OVERLAY_DESC"] = "ASSUREZ-VOUS D'ÊTRE PRÈS DE LA BROUETTE",
        ["SHOW_ROW_STATS_TITLE"] = "Afficher les statistiques des rangées",
        ["SHOW_ROW_STATS_DESC"] = "Afficher les infos des plantes par rangée directement sur les tondeuses",
        ["SHOW_ROW_HEADER_TITLE"] = "Afficher l'en-tête de rangée",
        ["SHOW_ROW_HEADER_DESC"] = "Inclure le nom de la rangée en haut de chaque superposition",
        ["SHOW_PLANT_COUNT_TITLE"] = "Afficher le nombre de plantes",
        ["SHOW_PLANT_COUNT_DESC"] = "Ajouter le nombre de plantes à la ligne d'en-tête",
        ["SHOW_PLANT_DETAILS_TITLE"] = "Afficher les détails des plantes",
        ["SHOW_PLANT_DETAILS_DESC"] = "Lister chaque plante avec sa rareté et ses dégâts",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "Afficher les dégâts totaux",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "Afficher les dégâts combinés par rangée",
        ["SHOW_EMPTY_ROW_TITLE"] = "Afficher le message de rangée vide",
        ["SHOW_EMPTY_ROW_DESC"] = "Afficher un rappel quand une rangée n'a pas de plantes",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "Surbriller la plante la plus faible",
        ["HIGHLIGHT_WEAKEST_DESC"] = "Colorer en rouge la plante avec le moins de dégâts",
        ["AUTO_FREEZE_SECTION"] = "Gel automatique des Brainrots",
        ["FREEZE_GEAR_TITLE"] = "Équipement de gel",
        ["FREEZE_GEAR_DESC"] = "Sélectionnez un ou plusieurs équipements de gel; ils seront utilisés dans l'ordre sélectionné",
        ["TARGET_PRIORITY_TITLE"] = "Priorité de cible",
        ["TARGET_PRIORITY_DESC"] = "Choisissez quels brainrots cibler",
        ["TARGET_RARITY_TITLE"] = "Rareté cible",
        ["TARGET_RARITY_DESC"] = "Sélectionnez une ou plusieurs raretés lorsque la priorité est définie sur Rareté",
        ["MINIMUM_HEALTH_TITLE"] = "Santé minimale",
        ["MINIMUM_HEALTH_DESC"] = "Cibler les brainrots avec santé >= cette valeur (seulement pour priorité Santé)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "Activer le gel automatique",
        ["ENABLE_AUTO_FREEZE_DESC"] = "Geler automatiquement les brainrots selon la priorité",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "Gel automatique activé",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "Utilisation de %s sur les cibles %s",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "Gel automatique désactivé",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "Arrêt du gel des brainrots",
        ["AUTO_ATTACK_SECTION"] = "Attaque automatique des Brainrots",
        ["WARNING_TITLE"] = "Avertissement",
        ["WARNING_AUTO_ATTACK_DESC"] = "Évitez d'exécuter l'attaque automatique avec le gel automatique pour éviter les conflits.",
        ["AUTO_ATTACK_WARNING_TITLE"] = "Avertissement",
        ["AUTO_ATTACK_WARNING_DESC"] = "Évitez d'exécuter l'attaque automatique avec le gel automatique pour éviter les conflits.",
        ["TELEPORT_POSITION_TITLE"] = "Position de téléportation",
        ["TELEPORT_POSITION_DESC"] = "Choisissez où vous téléporter par rapport au brainrot",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "Activer l'attaque automatique",
        ["ENABLE_AUTO_ATTACK_DESC"] = "Balancer continuellement votre batte sur les brainrots qualifiés",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "Attaque automatique activée",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "Balancer sur les cibles toutes les 0.2s",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "Attaque automatique désactivée",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "Arrêt du balancement de batte",
        ["CONFLICT_WARNING_TITLE"] = "Avertissement de conflit",
        ["CONFLICT_WARNING_CONTENT"] = "Désactivez le gel automatique pendant que l'attaque automatique est active pour éviter les problèmes.",
        ["AUTO_EQUIP_COLLECT_TITLE"] = "Équiper le meilleur et collecter l'argent",
        ["AUTO_EQUIP_COLLECT_DESC"] = "Équiper automatiquement les meilleurs brainrots et collecter l'argent",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "Auto Brainrots activé",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "Équipement des meilleurs brainrots",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "Auto Brainrots désactivé",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "Arrêt de l'équipement automatique",
        ["AUTO_REBIRTH_TITLE"] = "Renaissance automatique",
        ["AUTO_REBIRTH_DESC"] = "Renaissance automatique",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "Renaissance automatique activée",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "Envoi de la demande de renaissance",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "Renaissance automatique désactivée",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "Arrêt de la renaissance automatique",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "Achat automatique de plateformes",
        ["AUTO_BUY_PLATFORMS_DESC"] = "Acheter automatiquement des plateformes",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "Achat automatique de plateformes activé",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "Tentative d'achat de plateformes",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "Achat automatique de plateformes désactivé",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "Arrêt de l'achat de plateformes",
        ["ANTI_AFK_TITLE"] = "Anti AFK",
        ["ANTI_AFK_DESC"] = "Sauter toutes les 5 minutes pour éviter l'AFK",
        ["ANTI_AFK_ENABLED_TITLE"] = "Anti AFK activé",
        ["ANTI_AFK_ENABLED_CONTENT"] = "Saut toutes les 5 minutes",
        ["ANTI_AFK_DISABLED_TITLE"] = "Anti AFK désactivé",
        ["ANTI_AFK_DISABLED_CONTENT"] = "Arrêt du saut automatique",
        ["SESSION_SAFETY_SECTION"] = "Sécurité de session",
        ["AUTO_REJOIN_TITLE"] = "Rejoindre automatiquement",
        ["AUTO_REJOIN_DESC"] = "Essayer automatiquement de rejoindre si vous êtes déconnecté",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "Rejoindre automatiquement activé",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "Nous essaierons de vous reconnecter si vous vous déconnectez.",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "Rejoindre automatiquement désactivé",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "La reconnexion automatique a été désactivée.",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "Rejoindre automatiquement",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "Tentative de rejoindre le serveur...",
        ["SCRIPT_AUTOMATION_SECTION"] = "Automatisation du script",
        ["AUTO_EXECUTE_TITLE"] = "Exécution automatique",
        ["AUTO_EXECUTE_DESC"] = "Mettre ce hub en file d'attente avec votre exécuteur lors des téléportations",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "Exécution automatique activée",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "Chargeur mis en file d'attente pour votre prochaine téléportation.",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "Exécution automatique désactivée",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "File d'attente de téléportation effacée.",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "Erreur d'exécution automatique",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "Info file d'attente de téléportation",
        ["BACKGROUND_IMAGE_TITLE"] = "Activer l'image d'arrière-plan",
        ["BACKGROUND_IMAGE_DESC"] = "Basculer un arrière-plan de fenêtre prédéfini",
        ["BACKGROUND_PRESET_TITLE"] = "Arrière-plan prédéfini",
        ["BACKGROUND_PRESET_DESC"] = "Sélectionnez une image d'arrière-plan",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "Ouverture automatique d'œufs",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "Comment ça fonctionne",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "Équipe et ouvre les œufs sélectionnés tout en respectant le temps de recharge du jeu.",
        ["INV_EGG_SELECTION_TITLE"] = "Sélection d'œufs",
        ["INV_EGG_SELECTION_DESC"] = "Choisissez quels œufs ouvrir automatiquement",
        ["INV_EGG_INTERVAL_TITLE"] = "Intervalle d'ouverture d'œuf (s)",
        ["INV_EGG_INTERVAL_DESC"] = "Délai entre chaque tentative d'ouverture automatique",
        ["INV_EGG_ENABLE_TITLE"] = "Activer l'ouverture automatique d'œufs",
        ["INV_EGG_ENABLE_DESC"] = "Équipe et ouvre automatiquement les œufs choisis",
        
        ["INV_SELL_SECTION_TITLE"] = "Vente automatique",
        ["INV_SELL_SAFETY_TITLE"] = "Sécurité d'abord",
        ["INV_SELL_SAFETY_DESC"] = "Les favoris sont actualisés avant chaque cycle de vente pour que les articles marqués restent dans votre inventaire.",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "Intervalle de vente de brainrots (s)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "À quelle fréquence les brainrots sont vendus",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "Activer la vente automatique de brainrots",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "Vendre les brainrots non favoris à l'intervalle choisi",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "Intervalle de vente de plantes (s)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "À quelle fréquence les plantes sont vendues",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "Activer la vente automatique de plantes",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "Vendre les plantes non favorites à l'intervalle choisi",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "Favoris de brainrots",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "Sélectionnez les raretés ou brainrots spécifiques à garder en favoris automatiquement.",
        ["INV_BRAINROT_RARITY_TITLE"] = "Filtre de rareté",
        ["INV_BRAINROT_RARITY_DESC"] = "Raretés de brainrots à mettre en favoris",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "Brainrots spécifiques",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "Toujours mettre en favoris les noms sélectionnés",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "Argent minimum par seconde",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "Ignorer les brainrots en dessous de cette valeur d'argent par seconde",
        ["INV_BRAINROT_ENABLE_TITLE"] = "Activer les favoris automatiques de brainrots",
        ["INV_BRAINROT_ENABLE_DESC"] = "Garder les brainrots correspondants en favoris avant la vente",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "Favoris de plantes",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "Sélectionnez les raretés ou plantes spécifiques à garder en favoris automatiquement.",
        ["INV_PLANT_RARITY_TITLE"] = "Filtre de rareté",
        ["INV_PLANT_RARITY_DESC"] = "Raretés de plantes à mettre en favoris",
        ["INV_PLANT_SPECIFIC_TITLE"] = "Plantes spécifiques",
        ["INV_PLANT_SPECIFIC_DESC"] = "Toujours mettre en favoris les plantes sélectionnées",
        ["INV_PLANT_ENABLE_TITLE"] = "Activer les favoris automatiques de plantes",
        ["INV_PLANT_ENABLE_DESC"] = "Garder les plantes correspondantes en favoris avant la vente",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "Retirer tous les favoris",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "Retirer tous les articles des favoris",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "Retirer les favoris de tous les brainrots et plantes",
    },
    ["ur"] = {
        ["TITLE"] = "پودے بمقابلہ برین روٹس",
        ["SUBTITLE"] = "ToastyxDD ہب",
        ["WELCOME"] = "پودے بمقابلہ برین روٹس میں خوش آمدید!",
        ["LOADED"] = "GUI کامیابی سے لوڈ ہو گیا!",
        ["MAIN_TAB"] = "معلومات",
        ["PLAYER_TAB"] = "کھلاڑی",
        ["VISUAL_TAB"] = "بصری",
        ["MISC_TAB"] = "متفرق",
        ["SETTINGS_TAB"] = "ترتیبات",
        ["THEME_TAB"] = "تھیمز",
        ["CONFIG_TAB"] = "کنفگ",
        ["COMING_SOON"] = "جلد آرہا ہے",
        ["FEATURES_SOON"] = "خصوصیات تیار ہو رہی ہیں۔",
        ["MAIN_AUTO_TITLE"] = "کھیل کی معلومات",
        ["MAIN_AUTO_DESC"] = "اپنی اشیاء، نقشہ اور گیم کے اعدادوشمار دیکھیں۔",
        ["MAIN_AUTO_SECTION_TITLE"] = "عمومی معلومات",
        ["PLAYER_PARAGRAPH_TITLE"] = "کھلاڑی میں تبدیلیاں",
        ["PLAYER_PARAGRAPH_DESC"] = "اپنے کھلاڑی کی صلاحیتوں اور حرکت میں تبدیلی کریں۔",
        ["PLAYER_SECTION_TITLE"] = "حرکت",
        ["PLAYER_SECTION_DESC"] = "چلنے کی رفتار، کودنے کی طاقت اور پرواز کی خصوصیات جلد آ رہی ہیں۔",
        ["VISUAL_PARAGRAPH_TITLE"] = "بصری خصوصیات",
        ["VISUAL_PARAGRAPH_DESC"] = "ESP، ٹریسرز اور دیگر بصری بہتریاں۔",
        ["VISUAL_SECTION_TITLE"] = "ESP اور ٹریسرز",
        ["MISC_PARAGRAPH_TITLE"] = "متفرقات",
        ["MISC_PARAGRAPH_DESC"] = "اضافی افادیت اور ترتیبات۔",
        ["MISC_CREDITS_TITLE"] = "تشکرات",
        ["MISC_CREDITS_DESC"] = "ToastyxDD نے محبت سے بنایا",
        ["DISCORD_BUTTON_TITLE"] = "Discord میں شامل ہوں",
        ["DISCORD_BUTTON_DESC"] = "Discord دعوت نامہ لنک کاپی کرنے کے لیے کلک کریں",
        ["DISCORD_COPIED_TITLE"] = "Discord لنک کاپی ہو گیا!",
        ["DISCORD_COPIED_CONTENT"] = "Discord دعوت نامہ لنک کلپ بورڈ میں کاپی ہو گیا۔",
        ["DISCORD_ERROR_TITLE"] = "خرابی",
        ["DISCORD_ERROR_CONTENT"] = "آپ کے executor پر کلپ بورڈ معاون نہیں ہے۔",
        ["SETTINGS_PARAGRAPH_TITLE"] = "UI ترتیبات",
        ["SETTINGS_PARAGRAPH_DESC"] = "اپنے GUI کے تجربے کو اپنی مرضی کے مطابق بنائیں۔",
        ["LANGUAGE_LABEL"] = "زبان",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ اہم انتباہ",
        ["LANGUAGE_WARNING_DESC"] = "آپ GUI لوڈ ہونے کے بعد صرف ایک بار زبان تبدیل کر سکتے ہیں۔ اسے دوبارہ تبدیل کرنے سے GUI منجمد ہو جائے گا!",
        ["THEME_PARAGRAPH_TITLE"] = "تھیم کے اختیارات",
        ["THEME_PARAGRAPH_DESC"] = "اپنی پسندیدہ WindUI تھیم منتخب کریں۔",
        ["THEME_DROPDOWN_TITLE"] = "تھیم",
        ["THEME_DROPDOWN_DESC"] = "GUI کے لیے ایک تھیم منتخب کریں",
        ["THEME_CHANGED_TITLE"] = "تھیم تبدیل ہو گئی",
        ["THEME_CHANGED_CONTENT"] = "تھیم سیٹ ہو گئی: %s",
        ["THEME_ERROR_TITLE"] = "تھیم کی خرابی",
        ["THEME_ERROR_CONTENT"] = "منتخب کردہ تھیم اب دستیاب نہیں ہے۔",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "ونڈو کی شفافیت",
        ["TRANSPARENCY_TOGGLE_DESC"] = "شفاف ونڈو پس منظر فعال کریں",
        ["TRANSPARENCY_ENABLED_TITLE"] = "شفافیت فعال ہو گئی",
        ["TRANSPARENCY_DISABLED_TITLE"] = "شفافیت غیر فعال ہو گئی",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "ونڈو کی شفافیت اپ ڈیٹ ہو گئی۔",
        ["WINDOW_CONTROLS_TITLE"] = "ونڈو کنٹرولز",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "ٹوگل کی",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "GUI کھولنے یا بند کرنے کے لیے اس کی کو دبائیں۔",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "ٹوگل کی اپ ڈیٹ ہو گئی",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "ونڈو ٹوگل کی سیٹ ہو گئی: %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "غلط کی",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "یہ کی ٹوگل کے طور پر استعمال نہیں کی جا سکتی۔ براہ کرم کی بورڈ کی منتخب کریں۔",
        ["LANGUAGE_DROPDOWN_TITLE"] = "زبان",
        ["LANGUAGE_DROPDOWN_DESC"] = "GUI کی زبان تبدیل کریں",
        ["LANGUAGE_CHANGED_TITLE"] = "زبان تبدیل ہو گئی",
        ["LANGUAGE_CHANGED_CONTENT"] = "GUI کی زبان اپ ڈیٹ ہو گئی: %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "تشکیل",
        ["CONFIG_PARAGRAPH_DESC"] = "آپ کی ترتیبات خودکار طور پر محفوظ اور اگلی بار لوڈ ہوں گی۔",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "کنفگریشن محفوظ کریں",
        ["CONFIG_SAVE_BUTTON_DESC"] = "موجودہ ترتیبات دستی طور پر محفوظ کریں",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "کنفگ محفوظ ہو گئی!",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "آپ کی ترتیبات کامیابی سے محفوظ ہو گئی ہیں۔",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "کنفگریشن لوڈ کریں",
        ["CONFIG_LOAD_BUTTON_DESC"] = "محفوظ شدہ ترتیبات دوبارہ لوڈ کریں",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "کنفگ لوڈ ہو گئی!",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "آپ کی محفوظ شدہ ترتیبات بحال ہو گئی ہیں۔",
        ["CONFIG_RESET_BUTTON_TITLE"] = "پہلے سے طے شدہ پر ری سیٹ کریں",
        ["CONFIG_RESET_BUTTON_DESC"] = "تمام ترتیبات کو پہلے سے طے شدہ قیمتوں پر ری سیٹ کریں",
        ["CONFIG_RESET_DIALOG_TITLE"] = "کنفگریشن ری سیٹ کریں",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "کیا آپ واقعی تمام ترتیبات کو پہلے سے طے شدہ پر ری سیٹ کرنا چاہتے ہیں؟",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "منسوخ کریں",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "ری سیٹ کریں",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "ترتیبات ری سیٹ ہو گئیں",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "تمام ترتیبات پہلے سے طے شدہ پر ری سیٹ ہو گئیں۔",
        ["CONFIG_ABOUT_TITLE"] = "تعارف",
        ["CONFIG_ABOUT_DESC"] = "Plants Vs Brainrots GUI v1.0\nToastyxDD نے بنایا",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "اپ ڈیٹس چیک کریں",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "چیک کریں کہ آیا نیا ورژن دستیاب ہے",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "اپ ڈیٹ ہے",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "آپ تازہ ترین ورژن استعمال کر رہے ہیں۔",
        
        ["PLAYER_STATS_SECTION"] = "کھلاڑی کے اعدادوشمار",
        ["REBIRTH_TITLE"] = "🔄 دوبارہ جنم",
        ["REBIRTH_DESC"] = "لوڈ ہو رہا ہے...",
        ["CPS_TITLE"] = "💰 فی سیکنڈ رقم",
        ["CPS_DESC"] = "لوڈ ہو رہا ہے...",
        ["ROWS_TITLE"] = "🌾 کھلی قطاریں",
        ["ROWS_DESC"] = "لوڈ ہو رہا ہے...",
        ["ROWS_UNLOCKED"] = "کھلی: %d/%d قطاریں",
        ["SHOP_STATS_SECTION"] = "دکان کے اعدادوشمار",
        ["RESTOCK_TITLE"] = "🏪 دکان ری اسٹاک ٹائمر",
        ["RESTOCK_DESC"] = "لوڈ ہو رہا ہے...",
        ["AUTO_SHOPPING_SECTION"] = "آٹو شاپنگ",
        ["GEAR_SELECTION_TITLE"] = "گیئر انتخاب",
        ["GEAR_SELECTION_DESC"] = "ری اسٹاک پر خودکار خریدنے کے لیے گیئر منتخب کریں",
        ["AUTO_BUY_GEAR_TITLE"] = "آٹو خریدیں گیئر",
        ["AUTO_BUY_GEAR_DESC"] = "منتخب کردہ گیئر خودکار طور پر خریدیں",
        ["PLANT_SELECTION_TITLE"] = "پودے کا انتخاب",
        ["PLANT_SELECTION_DESC"] = "ری اسٹاک پر خودکار خریدنے کے لیے پودے منتخب کریں",
        ["AUTO_BUY_PLANTS_TITLE"] = "آٹو خریدیں پودے",
        ["AUTO_BUY_PLANTS_DESC"] = "منتخب کردہ پودے خودکار طور پر خریدیں",
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "ری اسٹاک اطلاعات",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "اطلاعات فعال کریں",
        ["ENABLE_NOTIFICATIONS_DESC"] = "اشیاء ری اسٹاک ہونے پر اطلاع حاصل کریں",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "اطلاعات فعال ہو گئیں",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "منتخب کردہ نایابیت ری اسٹاک ہونے پر آپ کو مطلع کیا جائے گا",
        ["NOTIFY_RARITIES_TITLE"] = "نایابیت کو مطلع کریں",
        ["NOTIFY_RARITIES_DESC"] = "کس نایابیت کے بارے میں مطلع کرنا ہے منتخب کریں",
        ["WALK_SPEED_TITLE"] = "چلنے کی رفتار",
        ["WALK_SPEED_DESC"] = "اپنی چلنے کی رفتار ایڈجسٹ کریں",
        ["JUMP_POWER_TITLE"] = "کودنے کی طاقت",
        ["JUMP_POWER_DESC"] = "اپنی کود کی اونچائی ایڈجسٹ کریں",
        ["MULTI_JUMP_TITLE"] = "ملٹی جمپ",
        ["MULTI_JUMP_DESC"] = "ہوا میں کئی بار کودیں",
        ["FLY_TITLE"] = "اڑنا",
        ["FLY_DESC"] = "اڑنا فعال کریں (موبائل اور PC پر کام کرتا ہے)",
        ["ROW_STATS_SECTION"] = "قطار کے اعدادوشمار",
        ["ROW_STATS_OVERLAY_TITLE"] = "اوورلے",
        ["ROW_STATS_OVERLAY_DESC"] = "یقینی بنائیں کہ آپ وہیل بیرو کے قریب ہیں",
        ["SHOW_ROW_STATS_TITLE"] = "قطار کے اعدادوشمار دکھائیں",
        ["SHOW_ROW_STATS_DESC"] = "لان موورز کے اوپر فی قطار پودے کی معلومات دکھائیں",
        ["SHOW_ROW_HEADER_TITLE"] = "قطار ہیڈر دکھائیں",
        ["SHOW_ROW_HEADER_DESC"] = "ہر اوورلے کے اوپر قطار کا نام شامل کریں",
        ["SHOW_PLANT_COUNT_TITLE"] = "پودوں کی تعداد دکھائیں",
        ["SHOW_PLANT_COUNT_DESC"] = "ہیڈر لائن میں پودوں کی تعداد شامل کریں",
        ["SHOW_PLANT_DETAILS_TITLE"] = "پودے کی تفصیلات دکھائیں",
        ["SHOW_PLANT_DETAILS_DESC"] = "ہر پودے کو نایابیت اور نقصان کے ساتھ فہرست بنائیں",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "کل نقصان دکھائیں",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "فی قطار مشترکہ نقصان دکھائیں",
        ["SHOW_EMPTY_ROW_TITLE"] = "خالی قطار پیغام دکھائیں",
        ["SHOW_EMPTY_ROW_DESC"] = "جب قطار میں کوئی پودا نہ ہو تو یاد دہانی دکھائیں",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "سب سے کمزور پودے کو نمایاں کریں",
        ["HIGHLIGHT_WEAKEST_DESC"] = "سب سے کم نقصان والے پودے کو سرخ رنگ میں رنگیں",
        ["AUTO_FREEZE_SECTION"] = "آٹو فریز برین روٹس",
        ["FREEZE_GEAR_TITLE"] = "فریز گیئر",
        ["FREEZE_GEAR_DESC"] = "ایک یا زیادہ فریز گیئر منتخب کریں؛ انہیں منتخب ترتیب میں استعمال کیا جائے گا",
        ["TARGET_PRIORITY_TITLE"] = "ہدف ترجیح",
        ["TARGET_PRIORITY_DESC"] = "کون سے برین روٹس کو ہدف بنانا ہے منتخب کریں",
        ["TARGET_RARITY_TITLE"] = "ہدف نایابیت",
        ["TARGET_RARITY_DESC"] = "جب ترجیح نایابیت پر سیٹ ہو تو ایک یا زیادہ نایابیت منتخب کریں",
        ["MINIMUM_HEALTH_TITLE"] = "کم از کم صحت",
        ["MINIMUM_HEALTH_DESC"] = "صحت >= اس قیمت والے برین روٹس کو ہدف بنائیں (صرف صحت کی ترجیح کے لیے)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "آٹو فریز فعال کریں",
        ["ENABLE_AUTO_FREEZE_DESC"] = "ترجیح کی بنیاد پر برین روٹس کو خودکار طور پر منجمد کریں",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "آٹو فریز فعال ہو گیا",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "%s اہداف پر %s استعمال",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "آٹو فریز غیر فعال ہو گیا",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "برین روٹس منجمد کرنا بند",
        ["AUTO_ATTACK_SECTION"] = "آٹو اٹیک برین روٹس",
        ["WARNING_TITLE"] = "انتباہ",
        ["WARNING_AUTO_ATTACK_DESC"] = "تعارض سے بچنے کے لیے آٹو اٹیک کو آٹو فریز کے ساتھ چلانے سے گریز کریں۔",
        ["AUTO_ATTACK_WARNING_TITLE"] = "انتباہ",
        ["AUTO_ATTACK_WARNING_DESC"] = "تعارض سے بچنے کے لیے آٹو اٹیک کو آٹو فریز کے ساتھ چلانے سے گریز کریں۔",
        ["TELEPORT_POSITION_TITLE"] = "ٹیلی پورٹ پوزیشن",
        ["TELEPORT_POSITION_DESC"] = "برین روٹ کے مطابق کہاں ٹیلی پورٹ کرنا ہے منتخب کریں",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "آٹو اٹیک فعال کریں",
        ["ENABLE_AUTO_ATTACK_DESC"] = "اہل برین روٹس پر مسلسل اپنا بیٹ جھولیں",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "آٹو اٹیک فعال ہو گیا",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "ہر 0.2 سیکنڈ میں اہداف پر جھول رہے ہیں",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "آٹو اٹیک غیر فعال ہو گیا",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "بیٹ جھولنا بند",
        ["CONFLICT_WARNING_TITLE"] = "تعارض کی انتباہ",
        ["CONFLICT_WARNING_CONTENT"] = "مسائل سے بچنے کے لیے آٹو اٹیک فعال ہونے کے دوران آٹو فریز بند کریں۔",
        ["AUTO_EQUIP_COLLECT_TITLE"] = "بہترین لیس کریں اور رقم جمع کریں",
        ["AUTO_EQUIP_COLLECT_DESC"] = "بہترین برین روٹس کو خودکار طور پر لیس کریں اور رقم جمع کریں",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "آٹو برین روٹس فعال ہو گیا",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "بہترین برین روٹس لیس کر رہے ہیں",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "آٹو برین روٹس غیر فعال ہو گیا",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "آٹو لیس کرنا بند",
        ["AUTO_REBIRTH_TITLE"] = "آٹو دوبارہ جنم",
        ["AUTO_REBIRTH_DESC"] = "خودکار طور پر دوبارہ جنم",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "آٹو دوبارہ جنم فعال ہو گیا",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "دوبارہ جنم کی درخواست بھیج رہے ہیں",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "آٹو دوبارہ جنم غیر فعال ہو گیا",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "آٹو دوبارہ جنم بند",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "آٹو خریدیں پلیٹ فارمز",
        ["AUTO_BUY_PLATFORMS_DESC"] = "خودکار طور پر پلیٹ فارمز خریدیں",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "آٹو خریدیں پلیٹ فارمز فعال ہو گیا",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "پلیٹ فارمز خریدنے کی کوشش",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "آٹو خریدیں پلیٹ فارمز غیر فعال ہو گیا",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "پلیٹ فارمز خریدنا بند",
        ["ANTI_AFK_TITLE"] = "اینٹی AFK",
        ["ANTI_AFK_DESC"] = "AFK سے بچنے کے لیے ہر 5 منٹ میں کودیں",
        ["ANTI_AFK_ENABLED_TITLE"] = "اینٹی AFK فعال ہو گیا",
        ["ANTI_AFK_ENABLED_CONTENT"] = "ہر 5 منٹ میں کود رہے ہیں",
        ["ANTI_AFK_DISABLED_TITLE"] = "اینٹی AFK غیر فعال ہو گیا",
        ["ANTI_AFK_DISABLED_CONTENT"] = "آٹو کودنا بند",
        ["SESSION_SAFETY_SECTION"] = "سیشن سیفٹی",
        ["AUTO_REJOIN_TITLE"] = "آٹو دوبارہ شامل ہوں",
        ["AUTO_REJOIN_DESC"] = "اگر آپ ڈس کنیکٹ ہو جائیں تو خودکار طور پر دوبارہ شامل ہونے کی کوشش کریں",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "آٹو دوبارہ شامل ہوں فعال ہو گیا",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "اگر آپ ڈس کنیکٹ ہو جائیں تو ہم آپ کو دوبارہ جوڑنے کی کوشش کریں گے۔",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "آٹو دوبارہ شامل ہوں غیر فعال ہو گیا",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "خودکار دوبارہ جڑنا بند کر دیا گیا ہے۔",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "آٹو دوبارہ شامل ہوں",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "سرور میں دوبارہ شامل ہونے کی کوشش...",
        ["SCRIPT_AUTOMATION_SECTION"] = "اسکرپٹ آٹومیشن",
        ["AUTO_EXECUTE_TITLE"] = "آٹو ایگزیکیوٹ",
        ["AUTO_EXECUTE_DESC"] = "جب بھی آپ ٹیلی پورٹ کریں تو اس ہب کو اپنے executor کے ساتھ قطار میں لگائیں",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "آٹو ایگزیکیوٹ فعال ہو گیا",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "آپ کے اگلے ٹیلی پورٹ کے لیے لوڈر قطار میں لگا دیا گیا۔",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "آٹو ایگزیکیوٹ غیر فعال ہو گیا",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "ٹیلی پورٹ قطار صاف ہو گئی۔",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "آٹو ایگزیکیوٹ خرابی",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "ٹیلی پورٹ قطار کی معلومات",
        ["BACKGROUND_IMAGE_TITLE"] = "پس منظر کی تصویر فعال کریں",
        ["BACKGROUND_IMAGE_DESC"] = "پہلے سے طے شدہ ونڈو پس منظر ٹوگل کریں",
        ["BACKGROUND_PRESET_TITLE"] = "پس منظر پہلے سے طے شدہ",
        ["BACKGROUND_PRESET_DESC"] = "پس منظر کی تصویر منتخب کریں",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "آٹو انڈا کھولنا",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "یہ کیسے کام کرتا ہے",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "کھیل کے کول ڈاؤن کا احترام کرتے ہوئے منتخب کردہ انڈے لیس اور کھولتا ہے۔",
        ["INV_EGG_SELECTION_TITLE"] = "انڈے کا انتخاب",
        ["INV_EGG_SELECTION_DESC"] = "خودکار طور پر کھولنے کے لیے انڈے منتخب کریں",
        ["INV_EGG_INTERVAL_TITLE"] = "انڈا کھولنے کا وقفہ (سیکنڈ)",
        ["INV_EGG_INTERVAL_DESC"] = "ہر آٹو-اوپن کی کوشش کے درمیان تاخیر",
        ["INV_EGG_ENABLE_TITLE"] = "آٹو انڈا کھولنا فعال کریں",
        ["INV_EGG_ENABLE_DESC"] = "منتخب کردہ انڈے خودکار طور پر لیس اور کھولتا ہے",
        
        ["INV_SELL_SECTION_TITLE"] = "آٹو فروخت",
        ["INV_SELL_SAFETY_TITLE"] = "حفاظت پہلے",
        ["INV_SELL_SAFETY_DESC"] = "ہر فروخت کے دور سے پہلے پسندیدہ ریفریش کیے جاتے ہیں تاکہ نشان زد اشیاء آپ کی انوینٹری میں رہیں۔",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "برین روٹ فروخت کا وقفہ (سیکنڈ)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "برین روٹس کتنی بار فروخت ہوتے ہیں",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "آٹو فروخت برین روٹس فعال کریں",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "منتخب وقفے پر غیر پسندیدہ برین روٹس فروخت کریں",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "پودوں کی فروخت کا وقفہ (سیکنڈ)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "پودے کتنی بار فروخت ہوتے ہیں",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "آٹو فروخت پودے فعال کریں",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "منتخب وقفے پر غیر پسندیدہ پودے فروخت کریں",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "برین روٹ پسندیدہ",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "تشکیل",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "خودکار طور پر پسندیدہ رکھنے کے لیے نایابیت یا مخصوص برین روٹس منتخب کریں۔",
        ["INV_BRAINROT_RARITY_TITLE"] = "نایابیت فلٹر",
        ["INV_BRAINROT_RARITY_DESC"] = "پسندیدہ کرنے کے لیے برین روٹ نایابیت",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "مخصوص برین روٹس",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "منتخب کردہ نام ہمیشہ پسندیدہ کریں",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "کم از کم نقد فی سیکنڈ",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "اس نقد فی سیکنڈ قیمت سے نیچے برین روٹس نظر انداز کریں",
        ["INV_BRAINROT_ENABLE_TITLE"] = "آٹو پسندیدہ برین روٹس فعال کریں",
        ["INV_BRAINROT_ENABLE_DESC"] = "فروخت سے پہلے مماثل برین روٹس کو پسندیدہ رکھیں",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "پودے پسندیدہ",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "تشکیل",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "خودکار طور پر پسندیدہ رکھنے کے لیے نایابیت یا مخصوص پودے منتخب کریں۔",
        ["INV_PLANT_RARITY_TITLE"] = "نایابیت فلٹر",
        ["INV_PLANT_RARITY_DESC"] = "پسندیدہ کرنے کے لیے پودے نایابیت",
        ["INV_PLANT_SPECIFIC_TITLE"] = "مخصوص پودے",
        ["INV_PLANT_SPECIFIC_DESC"] = "منتخب کردہ پودے ہمیشہ پسندیدہ کریں",
        ["INV_PLANT_ENABLE_TITLE"] = "آٹو پسندیدہ پودے فعال کریں",
        ["INV_PLANT_ENABLE_DESC"] = "فروخت سے پہلے مماثل پودوں کو پسندیدہ رکھیں",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "سب غیر پسندیدہ کریں",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "تمام اشیاء غیر پسندیدہ کریں",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "تمام برین روٹس اور پودوں سے پسندیدہ ہٹائیں",
    },
    ["ph"] = {
        ["TITLE"] = "Plants Vs Brainrots",
        ["SUBTITLE"] = "ToastyxDD Hub",
        ["WELCOME"] = "Maligayang pagdating sa Plants Vs Brainrots!",
        ["LOADED"] = "Matagumpay na na-load ang GUI!",
        ["MAIN_TAB"] = "Impormasyon",
        ["PLAYER_TAB"] = "Manlalaro",
        ["VISUAL_TAB"] = "Visual",
        ["MISC_TAB"] = "Iba Pa",
        ["SETTINGS_TAB"] = "Mga Setting",
        ["THEME_TAB"] = "Mga Tema",
        ["CONFIG_TAB"] = "Config",
        ["COMING_SOON"] = "Malapit Na",
        ["FEATURES_SOON"] = "Ang mga feature ay nasa pag-develop pa.",
        ["MAIN_AUTO_TITLE"] = "Impormasyon ng Laro",
        ["MAIN_AUTO_DESC"] = "Tingnan ang impormasyon tungkol sa iyong mga item, mapa, at stats ng laro.",
        ["MAIN_AUTO_SECTION_TITLE"] = "Pangkalahatang Info",
        ["PLAYER_PARAGRAPH_TITLE"] = "Mga Pagbabago sa Manlalaro",
        ["PLAYER_PARAGRAPH_DESC"] = "Baguhin ang mga kakayahan at kilos ng iyong manlalaro.",
        ["PLAYER_SECTION_TITLE"] = "Paggalaw",
        ["PLAYER_SECTION_DESC"] = "Bilis ng paglakad, lakas ng pagtalon, at lipad ay malapit na.",
        ["VISUAL_PARAGRAPH_TITLE"] = "Mga Visual Features",
        ["VISUAL_PARAGRAPH_DESC"] = "ESP, tracers, at iba pang visual enhancements.",
        ["VISUAL_SECTION_TITLE"] = "ESP at Tracers",
        ["MISC_PARAGRAPH_TITLE"] = "Iba't Iba",
        ["MISC_PARAGRAPH_DESC"] = "Karagdagang utilities at settings.",
        ["MISC_CREDITS_TITLE"] = "Credits",
        ["MISC_CREDITS_DESC"] = "Ginawa nang may pagmamahal ni ToastyxDD",
        ["DISCORD_BUTTON_TITLE"] = "Sumali sa Discord",
        ["DISCORD_BUTTON_DESC"] = "I-click para kopyahin ang Discord invite link",
        ["DISCORD_COPIED_TITLE"] = "Nakopya ang Discord Link!",
        ["DISCORD_COPIED_CONTENT"] = "Nakopya ang Discord invite link sa clipboard.",
        ["DISCORD_ERROR_TITLE"] = "Error",
        ["DISCORD_ERROR_CONTENT"] = "Hindi suportado ang clipboard sa iyong executor.",
        ["SETTINGS_PARAGRAPH_TITLE"] = "Mga Setting ng UI",
        ["SETTINGS_PARAGRAPH_DESC"] = "I-customize ang iyong GUI experience.",
        ["LANGUAGE_LABEL"] = "Wika",
        ["LANGUAGE_WARNING_TITLE"] = "⚠️ Mahalagang Babala",
        ["LANGUAGE_WARNING_DESC"] = "Maaari mo lamang baguhin ang wika MINSAN pagkatapos i-load ang GUI. Ang pagbabago nito muli ay magpa-freeze sa GUI!",
        ["THEME_PARAGRAPH_TITLE"] = "Mga Opsyon ng Tema",
        ["THEME_PARAGRAPH_DESC"] = "Piliin ang iyong gustong WindUI theme.",
        ["THEME_DROPDOWN_TITLE"] = "Tema",
        ["THEME_DROPDOWN_DESC"] = "Pumili ng tema para sa GUI",
        ["THEME_CHANGED_TITLE"] = "Nabago ang Tema",
        ["THEME_CHANGED_CONTENT"] = "Naitakda ang tema sa: %s",
        ["THEME_ERROR_TITLE"] = "Error sa Tema",
        ["THEME_ERROR_CONTENT"] = "Ang napiling tema ay hindi na available.",
        ["TRANSPARENCY_TOGGLE_TITLE"] = "Transparency ng Window",
        ["TRANSPARENCY_TOGGLE_DESC"] = "I-enable ang transparent window background",
        ["TRANSPARENCY_ENABLED_TITLE"] = "Naka-enable ang Transparency",
        ["TRANSPARENCY_DISABLED_TITLE"] = "Naka-disable ang Transparency",
        ["TRANSPARENCY_UPDATED_CONTENT"] = "Na-update ang transparency ng window.",
        ["WINDOW_CONTROLS_TITLE"] = "Mga Kontrol ng Window",
        ["WINDOW_TOGGLE_KEYBIND_TITLE"] = "Toggle Key",
        ["WINDOW_TOGGLE_KEYBIND_DESC"] = "Pindutin ang key na ito para buksan o isara ang GUI.",
        ["WINDOW_TOGGLE_UPDATED_TITLE"] = "Na-update ang Toggle Key",
        ["WINDOW_TOGGLE_UPDATED_CONTENT"] = "Naitakda ang window toggle key sa: %s",
        ["WINDOW_TOGGLE_INVALID_TITLE"] = "Invalid na Key",
        ["WINDOW_TOGGLE_INVALID_CONTENT"] = "Hindi pwedeng gamitin ang key na iyan bilang toggle. Pumili ng keyboard key.",
        ["LANGUAGE_DROPDOWN_TITLE"] = "Wika",
        ["LANGUAGE_DROPDOWN_DESC"] = "Baguhin ang wika ng GUI",
        ["LANGUAGE_CHANGED_TITLE"] = "Nabago ang Wika",
        ["LANGUAGE_CHANGED_CONTENT"] = "Na-update ang wika ng GUI sa: %s %s",
        ["CONFIG_PARAGRAPH_TITLE"] = "Configuration",
        ["CONFIG_PARAGRAPH_DESC"] = "Awtomatikong nase-save at nilo-load ang iyong mga setting sa susunod na launch.",
        ["CONFIG_SAVE_BUTTON_TITLE"] = "I-save ang Configuration",
        ["CONFIG_SAVE_BUTTON_DESC"] = "Manu-manong i-save ang kasalukuyang settings",
        ["CONFIG_SAVE_NOTIFY_TITLE"] = "Na-save ang Config!",
        ["CONFIG_SAVE_NOTIFY_CONTENT"] = "Matagumpay na na-save ang iyong mga setting.",
        ["CONFIG_LOAD_BUTTON_TITLE"] = "I-load ang Configuration",
        ["CONFIG_LOAD_BUTTON_DESC"] = "I-reload ang naka-save na settings",
        ["CONFIG_LOAD_NOTIFY_TITLE"] = "Na-load ang Config!",
        ["CONFIG_LOAD_NOTIFY_CONTENT"] = "Na-restore ang iyong naka-save na settings.",
        ["CONFIG_RESET_BUTTON_TITLE"] = "I-reset sa Default",
        ["CONFIG_RESET_BUTTON_DESC"] = "I-reset ang lahat ng settings sa default values",
        ["CONFIG_RESET_DIALOG_TITLE"] = "I-reset ang Configuration",
        ["CONFIG_RESET_DIALOG_CONTENT"] = "Sigurado ka bang gusto mong i-reset ang lahat ng settings sa default?",
        ["CONFIG_RESET_DIALOG_CANCEL"] = "Kanselahin",
        ["CONFIG_RESET_DIALOG_CONFIRM"] = "I-reset",
        ["CONFIG_RESET_NOTIFY_TITLE"] = "Na-reset ang Settings",
        ["CONFIG_RESET_NOTIFY_CONTENT"] = "Na-reset na ang lahat ng settings sa default.",
        ["CONFIG_ABOUT_TITLE"] = "Tungkol",
        ["CONFIG_ABOUT_DESC"] = "Plants Vs Brainrots GUI v1.0\nGinawa ni ToastyxDD",
        ["CONFIG_UPDATE_BUTTON_TITLE"] = "Tingnan ang Updates",
        ["CONFIG_UPDATE_BUTTON_DESC"] = "Tingnan kung may bagong version na available",
        ["CONFIG_UPDATE_NOTIFY_TITLE"] = "Up to Date",
        ["CONFIG_UPDATE_NOTIFY_CONTENT"] = "Gumagamit ka ng pinakabagong version.",
        
        -- Player Stats
        ["PLAYER_STATS_SECTION"] = "Mga Stats ng Manlalaro",
        ["REBIRTH_TITLE"] = "🔄 Rebirth",
        ["REBIRTH_DESC"] = "Naglo-load...",
        ["CPS_TITLE"] = "💰 Pera Bawat Segundo",
        ["CPS_DESC"] = "Naglo-load...",
        ["ROWS_TITLE"] = "🌾 Nabuksan na Rows",
        ["ROWS_DESC"] = "Naglo-load...",
        ["ROWS_UNLOCKED"] = "Nabuksan: %d/%d rows",
        
        -- Shop Stats
        ["SHOP_STATS_SECTION"] = "Mga Stats ng Tindahan",
        ["RESTOCK_TITLE"] = "🏪 Timer ng Restock ng Tindahan",
        ["RESTOCK_DESC"] = "Naglo-load...",
        
        -- Auto Shopping
        ["AUTO_SHOPPING_SECTION"] = "Auto Shopping",
        ["GEAR_SELECTION_TITLE"] = "Pagpili ng Gear",
        ["GEAR_SELECTION_DESC"] = "Pumili ng gear items na auto bibilhin sa restock",
        ["AUTO_BUY_GEAR_TITLE"] = "Auto Bili ng Gear",
        ["AUTO_BUY_GEAR_DESC"] = "Awtomatikong bumili ng napiling gear",
        ["PLANT_SELECTION_TITLE"] = "Pagpili ng Halaman",
        ["PLANT_SELECTION_DESC"] = "Pumili ng halaman na auto bibilhin sa restock",
        ["AUTO_BUY_PLANTS_TITLE"] = "Auto Bili ng Halaman",
        ["AUTO_BUY_PLANTS_DESC"] = "Awtomatikong bumili ng napiling halaman",
        
        -- Notifications
        ["RESTOCK_NOTIFICATIONS_SECTION"] = "Mga Notification ng Restock",
        ["ENABLE_NOTIFICATIONS_TITLE"] = "I-enable ang Notifications",
        ["ENABLE_NOTIFICATIONS_DESC"] = "Makatanggap ng notification kapag may restock ng items",
        ["NOTIFICATIONS_ENABLED_TITLE"] = "Naka-enable ang Notifications",
        ["NOTIFICATIONS_ENABLED_CONTENT"] = "Makakakuha ka ng notification kapag nag-restock ang napiling rarities",
        ["NOTIFY_RARITIES_TITLE"] = "I-notify ang Rarities",
        ["NOTIFY_RARITIES_DESC"] = "Piliin kung aling rarities ang gusto mong i-notify",
        
        -- Player Movement
        ["WALK_SPEED_TITLE"] = "Bilis ng Paglakad",
        ["WALK_SPEED_DESC"] = "I-adjust ang iyong bilis ng paglakad",
        ["JUMP_POWER_TITLE"] = "Lakas ng Pagtalon",
        ["JUMP_POWER_DESC"] = "I-adjust ang taas ng iyong pagtalon",
        ["MULTI_JUMP_TITLE"] = "Multi Jump",
        ["MULTI_JUMP_DESC"] = "Tumalon nang maraming beses sa hangin",
        ["FLY_TITLE"] = "Lumipad",
        ["FLY_DESC"] = "I-enable ang paglipad (gumagana sa mobile at PC)",
        
        -- Row Statistics
        ["ROW_STATS_SECTION"] = "Mga Stats ng Row",
        ["ROW_STATS_OVERLAY_TITLE"] = "Overlay",
        ["ROW_STATS_OVERLAY_DESC"] = "SIGURADUHING MALAPIT KA SA WHEELBARROW",
        ["SHOW_ROW_STATS_TITLE"] = "Ipakita ang Row Statistics",
        ["SHOW_ROW_STATS_DESC"] = "Ipakita ang info ng halaman bawat row sa ibabaw ng lawn mowers",
        ["SHOW_ROW_HEADER_TITLE"] = "Ipakita ang Row Header",
        ["SHOW_ROW_HEADER_DESC"] = "Isama ang pangalan ng row sa taas ng bawat overlay",
        ["SHOW_PLANT_COUNT_TITLE"] = "Ipakita ang Bilang ng Halaman",
        ["SHOW_PLANT_COUNT_DESC"] = "Idagdag ang bilang ng halaman sa header line",
        ["SHOW_PLANT_DETAILS_TITLE"] = "Ipakita ang Detalye ng Halaman",
        ["SHOW_PLANT_DETAILS_DESC"] = "Ilista ang bawat halaman kasama ang rarity at damage",
        ["SHOW_TOTAL_DAMAGE_TITLE"] = "Ipakita ang Kabuuang Damage",
        ["SHOW_TOTAL_DAMAGE_DESC"] = "Ipakita ang pinagsama-samang damage bawat row",
        ["SHOW_EMPTY_ROW_TITLE"] = "Ipakita ang Empty Row Message",
        ["SHOW_EMPTY_ROW_DESC"] = "Magpakita ng paalala kapag walang halaman sa row",
        ["HIGHLIGHT_WEAKEST_TITLE"] = "I-highlight ang Pinakamahinang Halaman",
        ["HIGHLIGHT_WEAKEST_DESC"] = "Kulayan ng pula ang halaman na may pinakamababang damage",
        
        -- Auto Freeze
        ["AUTO_FREEZE_SECTION"] = "Auto Freeze ng Brainrots",
        ["FREEZE_GEAR_TITLE"] = "Freeze Gear",
        ["FREEZE_GEAR_DESC"] = "Pumili ng isa o higit pang freeze gears; gagamitin sila sa napiling pagkakasunod-sunod",
        ["TARGET_PRIORITY_TITLE"] = "Target Priority",
        ["TARGET_PRIORITY_DESC"] = "Pumili kung aling brainrots ang tatatargetin",
        ["TARGET_RARITY_TITLE"] = "Target Rarity",
        ["TARGET_RARITY_DESC"] = "Pumili ng isa o higit pang rarities kapag naka-set ang priority sa Rarity",
        ["MINIMUM_HEALTH_TITLE"] = "Minimum Health",
        ["MINIMUM_HEALTH_DESC"] = "Tuma-target ng brainrots na may health >= sa value na ito (para lang sa Health priority)",
        ["ENABLE_AUTO_FREEZE_TITLE"] = "I-enable ang Auto Freeze",
        ["ENABLE_AUTO_FREEZE_DESC"] = "Awtomatikong i-freeze ang brainrots base sa priority",
        ["AUTO_FREEZE_ENABLED_TITLE"] = "Naka-enable ang Auto Freeze",
        ["AUTO_FREEZE_ENABLED_CONTENT"] = "Gumagamit ng %s sa %s targets",
        ["AUTO_FREEZE_DISABLED_TITLE"] = "Naka-disable ang Auto Freeze",
        ["AUTO_FREEZE_DISABLED_CONTENT"] = "Tumigil sa pag-freeze ng brainrots",
        
        -- Auto Attack
        ["AUTO_ATTACK_SECTION"] = "Auto Attack ng Brainrots",
        ["WARNING_TITLE"] = "Babala",
        ["WARNING_AUTO_ATTACK_DESC"] = "Iwasang patakbuhin ang auto attack kasama ng auto freeze para maiwasan ang conflicts.",
        ["AUTO_ATTACK_WARNING_TITLE"] = "Babala",
        ["AUTO_ATTACK_WARNING_DESC"] = "Iwasang patakbuhin ang auto attack kasama ng auto freeze para maiwasan ang conflicts.",
        ["TELEPORT_POSITION_TITLE"] = "Posisyon ng Teleport",
        ["TELEPORT_POSITION_DESC"] = "Pumili kung saan mag-teleport relative sa brainrot",
        ["ENABLE_AUTO_ATTACK_TITLE"] = "I-enable ang Auto Attack",
        ["ENABLE_AUTO_ATTACK_DESC"] = "Patuloy na mag-swing ng iyong bat sa qualified brainrots",
        ["AUTO_ATTACK_ENABLED_TITLE"] = "Naka-enable ang Auto Attack",
        ["AUTO_ATTACK_ENABLED_CONTENT"] = "Nag-swing sa targets bawat 0.2s",
        ["AUTO_ATTACK_DISABLED_TITLE"] = "Naka-disable ang Auto Attack",
        ["AUTO_ATTACK_DISABLED_CONTENT"] = "Tumigil sa pag-swing ng bat",
        ["CONFLICT_WARNING_TITLE"] = "Babala sa Conflict",
        ["CONFLICT_WARNING_CONTENT"] = "I-disable ang auto freeze habang naka-on ang auto attack para maiwasan ang mga problema.",
        
        -- Misc Features
        ["AUTO_EQUIP_COLLECT_TITLE"] = "I-equip ang Best at Kolektahin ang Cash",
        ["AUTO_EQUIP_COLLECT_DESC"] = "Awtomatikong i-equip ang best brainrots at kolektahin ang cash",
        ["AUTO_BRAINROTS_ENABLED_TITLE"] = "Naka-enable ang Auto Brainrots",
        ["AUTO_BRAINROTS_ENABLED_CONTENT"] = "Nag-e-equip ng best brainrots",
        ["AUTO_BRAINROTS_DISABLED_TITLE"] = "Naka-disable ang Auto Brainrots",
        ["AUTO_BRAINROTS_DISABLED_CONTENT"] = "Tumigil sa auto-equipping",
        ["AUTO_REBIRTH_TITLE"] = "Auto Rebirth",
        ["AUTO_REBIRTH_DESC"] = "Awtomatikong mag-rebirth",
        ["AUTO_REBIRTH_ENABLED_TITLE"] = "Naka-enable ang Auto Rebirth",
        ["AUTO_REBIRTH_ENABLED_CONTENT"] = "Nagpapadala ng rebirth request",
        ["AUTO_REBIRTH_DISABLED_TITLE"] = "Naka-disable ang Auto Rebirth",
        ["AUTO_REBIRTH_DISABLED_CONTENT"] = "Tumigil ang auto rebirth",
        ["AUTO_BUY_PLATFORMS_TITLE"] = "Auto Bili ng Platforms",
        ["AUTO_BUY_PLATFORMS_DESC"] = "Awtomatikong bumili ng platforms",
        ["AUTO_BUY_PLATFORMS_ENABLED_TITLE"] = "Naka-enable ang Auto Bili ng Platforms",
        ["AUTO_BUY_PLATFORMS_ENABLED_CONTENT"] = "Sinusubukan bumili ng platforms",
        ["AUTO_BUY_PLATFORMS_DISABLED_TITLE"] = "Naka-disable ang Auto Bili ng Platforms",
        ["AUTO_BUY_PLATFORMS_DISABLED_CONTENT"] = "Tumigil sa pagbili ng platforms",
        ["ANTI_AFK_TITLE"] = "Anti AFK",
        ["ANTI_AFK_DESC"] = "Tumalon bawat 5 minuto para maiwasan ang AFK",
        ["ANTI_AFK_ENABLED_TITLE"] = "Naka-enable ang Anti AFK",
        ["ANTI_AFK_ENABLED_CONTENT"] = "Tumalon bawat 5 minuto",
        ["ANTI_AFK_DISABLED_TITLE"] = "Naka-disable ang Anti AFK",
        ["ANTI_AFK_DISABLED_CONTENT"] = "Tumigil sa auto jumping",
        
        -- Session Safety
        ["SESSION_SAFETY_SECTION"] = "Kaligtasan ng Session",
        ["AUTO_REJOIN_TITLE"] = "Auto Rejoin",
        ["AUTO_REJOIN_DESC"] = "Awtomatikong subukang mag-rejoin kung ma-disconnect",
        ["AUTO_REJOIN_ENABLED_TITLE"] = "Naka-enable ang Auto Rejoin",
        ["AUTO_REJOIN_ENABLED_CONTENT"] = "Susubukan naming ikonekta ka ulit kung ma-disconnect ka.",
        ["AUTO_REJOIN_DISABLED_TITLE"] = "Naka-disable ang Auto Rejoin",
        ["AUTO_REJOIN_DISABLED_CONTENT"] = "Naka-off ang auto reconnection.",
        ["AUTO_REJOIN_NOTIFY_TITLE"] = "Auto Rejoin",
        ["AUTO_REJOIN_NOTIFY_CONTENT"] = "Sinusubukan mag-rejoin sa server...",
        
        -- Script Automation
        ["SCRIPT_AUTOMATION_SECTION"] = "Script Automation",
        ["AUTO_EXECUTE_TITLE"] = "Auto Execute",
        ["AUTO_EXECUTE_DESC"] = "I-queue ang hub na ito sa iyong executor kapag nag-teleport",
        ["AUTO_EXECUTE_ENABLED_TITLE"] = "Naka-enable ang Auto Execute",
        ["AUTO_EXECUTE_ENABLED_CONTENT"] = "Na-queue ang loader para sa iyong susunod na teleport.",
        ["AUTO_EXECUTE_DISABLED_TITLE"] = "Naka-disable ang Auto Execute",
        ["AUTO_EXECUTE_DISABLED_CONTENT"] = "Na-clear ang teleport queue.",
        ["AUTO_EXECUTE_ERROR_TITLE"] = "Error sa Auto Execute",
        ["TELEPORT_QUEUE_INFO_TITLE"] = "Impormasyon ng Teleport Queue",
        
        -- Background Image
        ["BACKGROUND_IMAGE_TITLE"] = "I-enable ang Background Image",
        ["BACKGROUND_IMAGE_DESC"] = "I-toggle ang preset window background",
        ["BACKGROUND_PRESET_TITLE"] = "Background Preset",
        ["BACKGROUND_PRESET_DESC"] = "Pumili ng background image",
        
        -- Inventory Tab
        ["INV_EGG_SECTION_TITLE"] = "Auto Pagbukas ng Itlog",
        ["INV_EGG_HOW_IT_WORKS_TITLE"] = "Paano ito gumagana",
        ["INV_EGG_HOW_IT_WORKS_DESC"] = "Nag-e-equip at nagbubukas ng napiling itlog habang sinusunod ang cooldown sa laro.",
        ["INV_EGG_SELECTION_TITLE"] = "Pagpili ng itlog",
        ["INV_EGG_SELECTION_DESC"] = "Pumili kung aling itlog ang awtomatikong bubuksan",
        ["INV_EGG_INTERVAL_TITLE"] = "Interval ng pagbukas ng itlog (s)",
        ["INV_EGG_INTERVAL_DESC"] = "Pagitan sa bawat pagsubok na auto-buksan",
        ["INV_EGG_ENABLE_TITLE"] = "I-enable ang auto pagbukas ng itlog",
        ["INV_EGG_ENABLE_DESC"] = "Awtomatikong nag-e-equip at nagbubukas ng napiling itlog",
        
        ["INV_SELL_SECTION_TITLE"] = "Auto Benta",
        ["INV_SELL_SAFETY_TITLE"] = "Kaligtasan muna",
        ["INV_SELL_SAFETY_DESC"] = "Nire-refresh ang mga paborito bago bawat sell cycle para manatili sa iyong inventory ang mga naka-mark na items.",
        ["INV_BRAINROT_SELL_INTERVAL_TITLE"] = "Interval ng pagbenta ng brainrot (s)",
        ["INV_BRAINROT_SELL_INTERVAL_DESC"] = "Gaano kadalas ibinebenta ang mga brainrot",
        ["INV_BRAINROT_SELL_ENABLE_TITLE"] = "I-enable ang auto benta ng brainrots",
        ["INV_BRAINROT_SELL_ENABLE_DESC"] = "Ibenta ang mga hindi paboritong brainrot sa napiling interval",
        ["INV_PLANT_SELL_INTERVAL_TITLE"] = "Interval ng pagbenta ng halaman (s)",
        ["INV_PLANT_SELL_INTERVAL_DESC"] = "Gaano kadalas ibinebenta ang mga halaman",
        ["INV_PLANT_SELL_ENABLE_TITLE"] = "I-enable ang auto benta ng halaman",
        ["INV_PLANT_SELL_ENABLE_DESC"] = "Ibenta ang mga hindi paboritong halaman sa napiling interval",
        
        ["INV_BRAINROT_FAV_SECTION_TITLE"] = "Mga Paboritong Brainrot",
        ["INV_BRAINROT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_BRAINROT_FAV_CONFIG_DESC"] = "Pumili ng rarities o specific brainrots na awtomatikong papanatilihing paborito.",
        ["INV_BRAINROT_RARITY_TITLE"] = "Rarity filter",
        ["INV_BRAINROT_RARITY_DESC"] = "Mga rarity ng brainrot na gagawing paborito",
        ["INV_BRAINROT_SPECIFIC_TITLE"] = "Specific na brainrots",
        ["INV_BRAINROT_SPECIFIC_DESC"] = "Laging gawing paborito ang napiling pangalan",
        ["INV_BRAINROT_MIN_WORTH_TITLE"] = "Minimum na pera bawat segundo",
        ["INV_BRAINROT_MIN_WORTH_DESC"] = "Huwag pansinin ang mga brainrot sa ibaba ng cash-per-second value na ito",
        ["INV_BRAINROT_ENABLE_TITLE"] = "I-enable ang auto paborito ng brainrots",
        ["INV_BRAINROT_ENABLE_DESC"] = "Panatilihing paborito ang mga tumutugmang brainrot bago magbenta",
        
        ["INV_PLANT_FAV_SECTION_TITLE"] = "Mga Paboritong Halaman",
        ["INV_PLANT_FAV_CONFIG_TITLE"] = "Configuration",
        ["INV_PLANT_FAV_CONFIG_DESC"] = "Pumili ng rarities o specific na halaman na awtomatikong papanatilihing paborito.",
        ["INV_PLANT_RARITY_TITLE"] = "Rarity filter",
        ["INV_PLANT_RARITY_DESC"] = "Mga rarity ng halaman na gagawing paborito",
        ["INV_PLANT_SPECIFIC_TITLE"] = "Specific na halaman",
        ["INV_PLANT_SPECIFIC_DESC"] = "Laging gawing paborito ang napiling halaman",
        ["INV_PLANT_ENABLE_TITLE"] = "I-enable ang auto paborito ng halaman",
        ["INV_PLANT_ENABLE_DESC"] = "Panatilihing paborito ang mga tumutugmang halaman bago magbenta",
        
        ["INV_UNFAV_ALL_SECTION_TITLE"] = "Alisin ang Lahat ng Paborito",
        ["INV_UNFAV_ALL_BUTTON_TITLE"] = "Alisin ang Lahat ng Items sa Paborito",
        ["INV_UNFAV_ALL_BUTTON_DESC"] = "Alisin ang paborito mula sa lahat ng brainrots at halaman",
    }
}

WindUI:Localization({
    Enabled = true,

    Prefix = "loc:",
    DefaultLanguage = defaultLanguageCode,
    Translations = translations
})

-- Helper function to get localized text with formatting
local function getLocalizedText(key, ...)
    local lang = translations[defaultLanguageCode] or translations["en"]
    local template = lang[key]
    if not template then
        return key
    end
    if select("#", ...) > 0 then
        return string.format(template, ...)
    end
    return template
end

-- Create Window
local Window = WindUI:CreateWindow({
    Title = "Plants Vs Brainrots",
    Subtitle = "ToastyxDD Hub",
    Icon = "lucide:flower-2", -- Plant-themed icon using lucide
    Author = "ToastyxDD",
    Folder = "ToastyxDDHub_PlantsVsBrainrots",
    Size = UDim2.fromOffset(570, 500),
    KeySystem = false, -- Hub handles authentication
    Transparent = false,
    BackgroundImageTransparency = 0.7,
    Background = "",
    Theme = "Dark", -- Default theme
    SideBarWidth = 170,
    User = {
        Enabled = true,
        Anonymous = false,
    },
})

Window:Tag({
    Title = "Beta",
    Color = Color3.fromHex("#22C55E"),
})

-- ========================================
local ConfigManager = Window.ConfigManager
local MainConfig = ConfigManager:CreateConfig("PlantsVsBrainrots_Main")

-- Welcome Notification
WindUI:Notify({
    Title = "loc:WELCOME",
    Content = "loc:LOADED",
    Duration = 5,
    Icon = "lucide:flower-2",
})

-- ========================================
-- TABS STRUCTURE
-- ========================================

-- Information Tab (User items, map info, game stats)
MainTab = Window:Tab({
    Title = "loc:MAIN_TAB",
    Icon = "lucide:info",
})

-- Player Tab (Speed, jump, fly modifications)
PlayerTab = Window:Tab({
    Title = "loc:PLAYER_TAB",
    Icon = "lucide:user",
})

-- Visual Tab (ESP, tracers, highlights)
VisualTab = Window:Tab({
    Title = "loc:VISUAL_TAB",
    Icon = "lucide:eye",
})

InventoryTab = Window:Tab({
    Title = "Inventory",
    Icon = "lucide:package",
})

local formatNumber
local escapeRichText

local RowStatistics = {
    enabled = false,
    displays = {},
    updateInterval = 1,
    maxPlantsPerRow = 5,
    headerColorHex = "#93C5FD",
    defaultLineColorHex = "#E2E8F0",
    totalColorHex = "#FACC15",
    weakestColorHex = "#F87171",
    backgroundColor = Color3.fromRGB(15, 23, 42),
    displayWidth = 200,
    minDisplayHeight = 80,
    padding = {
        top = 6,
        bottom = 6,
        left = 8,
        right = 8,
    },
    textSize = 14,
    font = Enum.Font.Gotham,
    lineHeight = 1.1,
    visibilityDistance = 25,
    connections = {},
    plotConnections = {},
    plantConnections = {},
    displayOptions = {
        showRowHeader = true,
        showPlantCount = true,
        showPlantList = true,
        showTotalDamage = true,
        showEmptyMessage = true,
        highlightWeakest = true,
    },
    _loop = nil,
    _toggle = nil,
    _headerToggle = nil,
    _plantCountToggle = nil,
    _plantListToggle = nil,
    _totalDamageToggle = nil,
    _emptyMessageToggle = nil,
    _highlightToggle = nil,
    _currentPlotId = nil,
    rarityColorHex = {
        common = "#E5E7EB",
        uncommon = "#6EE7B7",
        rare = "#60A5FA",
        epic = "#C084FC",
        legendary = "#FBBF24",
        mythic = "#F9A8D4",
        godly = "#FCA5A5",
        secret = "#9CA3AF",
        exotic = "#34D399",
    },
}

function RowStatistics:GetDisplayOption(option)
    local options = self.displayOptions
    if not options then
        return true
    end

    local value = options[option]
    if value == nil then
        return true
    end

    return value
end

function RowStatistics:IsWithinVisibilityRange(attachment, rootPart)
    local maxDistance = self.visibilityDistance
    if not maxDistance or maxDistance <= 0 then
        return true
    end

    if not attachment or not attachment.Position then
        return true
    end

    if not rootPart or not rootPart.Position then
        return true
    end

    local distance = (attachment.Position - rootPart.Position).Magnitude
    return distance <= maxDistance
end

function RowStatistics:GetRarityColorHex(rarity)
    if type(rarity) ~= "string" or rarity == "" then
        return self.defaultLineColorHex
    end

    local normalized = rarity:lower()
    local color = self.rarityColorHex[normalized]
    if color then
        return color
    end

    -- Attempt to strip qualifiers like "(Shiny)"
    local cleaned = normalized:gsub("%s*%b()", ""):gsub("%s+", "")
    color = self.rarityColorHex[cleaned]
    if color then
        return color
    end

    local firstWord = normalized:match("([%a]+)")
    if firstWord then
        color = self.rarityColorHex[firstWord]
        if color then
            return color
        end
    end

    return self.defaultLineColorHex
end

function RowStatistics:SetDisplayOption(option, value)
    if value == nil then
        value = true
    end

    local normalized = value == true

    if not self.displayOptions then
        self.displayOptions = {}
    end

    if self.displayOptions[option] == normalized then
        return
    end

    self.displayOptions[option] = normalized

    local toggle
    if option == "showRowHeader" then
        toggle = self._headerToggle
    elseif option == "showPlantCount" then
        toggle = self._plantCountToggle
    elseif option == "showPlantList" then
        toggle = self._plantListToggle
    elseif option == "showTotalDamage" then
        toggle = self._totalDamageToggle
    elseif option == "showEmptyMessage" then
        toggle = self._emptyMessageToggle
    elseif option == "highlightWeakest" then
        toggle = self._highlightToggle
    end

    if toggle and toggle.Value ~= normalized then
        toggle:Set(normalized)
    end

    if self.enabled then
        task.defer(function()
            if self.enabled then
                self:UpdateDisplays()
            end
        end)
    end
end

function RowStatistics:UpdateDisplaySize(display)
    if not display then
        return
    end

    local billboard = display.billboard
    local frame = display.frame
    local label = display.label
    if not (billboard and frame and label) then
        return
    end

    local padding = self.padding
    local usableWidth = math.max(20, self.displayWidth - (padding.left + padding.right))
    local plainText = (label.Text or ""):gsub("<[^>]->", "")
    plainText = plainText
        :gsub("&lt;", "<")
        :gsub("&gt;", ">")
        :gsub("&amp;", "&")

    local success, textSize = pcall(function()
        return TextService:GetTextSize(plainText, self.textSize, self.font, Vector2.new(usableWidth, 1000))
    end)

    local contentHeight = textSize and textSize.Y or (self.minDisplayHeight - (padding.top + padding.bottom))
    contentHeight = math.max(12, contentHeight)

    local totalHeight = math.max(self.minDisplayHeight, math.ceil(contentHeight * self.lineHeight + padding.top + padding.bottom))

    billboard.Size = UDim2.fromOffset(self.displayWidth, totalHeight)
    frame.Size = UDim2.fromOffset(self.displayWidth, totalHeight)
    label.Size = UDim2.new(1, 0, 0, totalHeight - (padding.top + padding.bottom))
end

function RowStatistics:DestroyDisplay(key)
    local display = self.displays[key]
    if not display then
        return
    end

    if display._connections then
        for index = #display._connections, 1, -1 do
            local connection = display._connections[index]
            if connection and connection.Disconnect then
                connection:Disconnect()
            end
            display._connections[index] = nil
        end
    end

    if display.billboard then
        display.billboard:Destroy()
    end

    self.displays[key] = nil
end

function RowStatistics:ClearDisplays()
    local queue = {}
    for key in pairs(self.displays) do
        table.insert(queue, key)
    end

    for _, key in ipairs(queue) do
        self:DestroyDisplay(key)
    end
end

function RowStatistics:AddConnection(connection, group)
    if not (connection and connection.Disconnect) then
        return
    end

    if group == "plot" then
        table.insert(self.plotConnections, connection)
    else
        table.insert(self.connections, connection)
    end
end

function RowStatistics:DisconnectConnections()
    for index = #self.connections, 1, -1 do
        local connection = self.connections[index]
        if connection and connection.Disconnect then
            connection:Disconnect()
        end
        self.connections[index] = nil
    end
end

function RowStatistics:DisconnectPlotConnections()
    for index = #self.plotConnections, 1, -1 do
        local connection = self.plotConnections[index]
        if connection and connection.Disconnect then
            connection:Disconnect()
        end
        self.plotConnections[index] = nil
    end
end

function RowStatistics:UntrackPlant(plant)
    local connections = self.plantConnections[plant]
    if not connections then
        return
    end

    for index = #connections, 1, -1 do
        local connection = connections[index]
        if connection and connection.Disconnect then
            connection:Disconnect()
        end
        connections[index] = nil
    end

    self.plantConnections[plant] = nil
end

function RowStatistics:DisconnectPlantConnections()
    for plant in pairs(self.plantConnections) do
        self:UntrackPlant(plant)
    end
end

function RowStatistics:TrackPlant(plant)
    if not plant or not plant:IsA("Model") then
        return
    end

    self:UntrackPlant(plant)

    local trackedConnections = {}

    local function addAttributeListener(attributeName)
        local signal = plant:GetAttributeChangedSignal(attributeName)
        if not signal then
            return
        end

        local connection = signal:Connect(function()
            if not self.enabled then
                return
            end

            task.defer(function()
                if self.enabled then
                    self:UpdateDisplays()
                end
            end)
        end)

        table.insert(trackedConnections, connection)
    end

    addAttributeListener("Damage")
    addAttributeListener("Row")
    addAttributeListener("Rarity")
    addAttributeListener("PlantName")
    addAttributeListener("DisplayName")

    local ancestryConnection = plant.AncestryChanged:Connect(function(_, parent)
        if parent then
            return
        end

        self:UntrackPlant(plant)

        if self.enabled then
            task.defer(function()
                if self.enabled then
                    self:UpdateDisplays()
                end
            end)
        end
    end)

    table.insert(trackedConnections, ancestryConnection)

    self.plantConnections[plant] = trackedConnections
end

function RowStatistics:GetPlayerPlotContext()
    local player = game.Players.LocalPlayer
    if not player then
        return nil
    end

    local plotNumber = player:GetAttribute("Plot")
    if not plotNumber then
        return {
            player = player,
            plotId = nil,
        }
    end

    plotNumber = tostring(plotNumber)
    if plotNumber == "" then
        return {
            player = player,
            plotId = nil,
        }
    end

    local workspaceService = game:GetService("Workspace")
    local plotsFolder = workspaceService:FindFirstChild("Plots")
    if not plotsFolder then
        return {
            player = player,
            plotId = plotNumber,
        }
    end

    local plot = plotsFolder:FindFirstChild(plotNumber)
    if not plot then
        return {
            player = player,
            plotId = plotNumber,
        }
    end

    local rowsFolder = plot:FindFirstChild("Rows")
    local plantsFolder = plot:FindFirstChild("Plants")

    return {
        player = player,
        plotId = plotNumber,
        plot = plot,
        rows = rowsFolder,
        plants = plantsFolder,
    }
end

function RowStatistics:AttachPlotListeners()
    self:DisconnectPlotConnections()
    self:DisconnectPlantConnections()

    local context = self:GetPlayerPlotContext()
    if not context or not context.plot then
        return
    end

    if context.rows then
        self:AddConnection(context.rows.ChildAdded:Connect(function()
            if not self.enabled then
                return
            end

            task.defer(function()
                if self.enabled then
                    self:UpdateDisplays()
                end
            end)
        end), "plot")

        self:AddConnection(context.rows.ChildRemoved:Connect(function()
            if not self.enabled then
                return
            end

            task.defer(function()
                if self.enabled then
                    self:UpdateDisplays()
                end
            end)
        end), "plot")
    end

    if context.plants then
        local function onPlantAdded(plant)
            if not plant or not plant:IsA("Model") then
                return
            end

            self:TrackPlant(plant)

            if self.enabled then
                task.defer(function()
                    if self.enabled then
                        self:UpdateDisplays()
                    end
                end)
            end
        end

        local function onPlantRemoved(plant)
            self:UntrackPlant(plant)

            if self.enabled then
                task.defer(function()
                    if self.enabled then
                        self:UpdateDisplays()
                    end
                end)
            end
        end

        for _, plant in ipairs(context.plants:GetChildren()) do
            onPlantAdded(plant)
        end

        self:AddConnection(context.plants.ChildAdded:Connect(onPlantAdded), "plot")
        self:AddConnection(context.plants.ChildRemoved:Connect(onPlantRemoved), "plot")
    end
end

function RowStatistics:AttachListeners()
    self:DisconnectConnections()
    self:DisconnectPlotConnections()

    local player = game.Players.LocalPlayer
    if not player then
        return
    end

    self:AddConnection(player:GetAttributeChangedSignal("Plot"):Connect(function()
        if not self.enabled then
            return
        end

        self._currentPlotId = nil
        self:AttachPlotListeners()
        self:UpdateDisplays()
    end))

    self:AttachPlotListeners()
end

function RowStatistics:GetLawnMowerAttachment(row)
    if not row then
        return nil
    end

    local lawnMower = row:FindFirstChild("Lawn Mower")
    if not lawnMower or not lawnMower:IsA("Model") then
        return nil
    end

    if lawnMower.PrimaryPart then
        return lawnMower.PrimaryPart
    end

    return lawnMower:FindFirstChildWhichIsA("BasePart")
end

function RowStatistics:EnsureDisplay(rowKey, entry)
    local attachment = self:GetLawnMowerAttachment(entry.row)
    if not attachment or not attachment.Parent then
        self:DestroyDisplay(rowKey)
        return nil
    end

    local display = self.displays[rowKey]
    if display and display.billboard and display.billboard.Parent then
        return display
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "RowStatisticsDisplay"
    billboard.ResetOnSpawn = false
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.fromOffset(self.displayWidth, self.minDisplayHeight)
    billboard.MaxDistance = math.huge
    billboard.StudsOffset = Vector3.new(0, 4.5, 0)
    billboard.LightInfluence = 0
    billboard.SizeOffset = Vector2.new(0, 0)
    billboard.ClipsDescendants = false
    billboard.ExtentsOffset = Vector3.new(0, 0, 0)
    billboard.ExtentsOffsetWorldSpace = Vector3.new(0, 0, 0)
    billboard.Adornee = attachment
    billboard.Parent = attachment

    local frame = Instance.new("Frame")
    frame.Name = "Container"
    frame.BackgroundColor3 = self.backgroundColor
    frame.BackgroundTransparency = 0.25
    frame.BorderSizePixel = 0
    frame.Size = UDim2.fromOffset(self.displayWidth, self.minDisplayHeight)
    frame.AutomaticSize = Enum.AutomaticSize.None
    frame.AnchorPoint = Vector2.new(0, 0)
    frame.Position = UDim2.fromOffset(0, 0)
    frame.Parent = billboard

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(59, 130, 246)
    stroke.Thickness = 1
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = frame

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingBottom = UDim.new(0, 6)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = frame

    local label = Instance.new("TextLabel")
    label.Name = "Content"
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, self.minDisplayHeight - (self.padding.top + self.padding.bottom))
    label.AutomaticSize = Enum.AutomaticSize.None
    label.TextColor3 = Color3.fromRGB(226, 232, 240)
    label.TextSize = self.textSize
    label.TextWrapped = true
    label.Font = self.font
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.RichText = true
    label.LineHeight = self.lineHeight
    label.Parent = frame

    display = {
        billboard = billboard,
        label = label,
        frame = frame,
        padding = padding,
        attachment = attachment,
        row = entry.row,
        _connections = {},
    }

    local function track(connection)
        if connection and connection.Connected ~= false then
            table.insert(display._connections, connection)
        end
    end

    track(label:GetPropertyChangedSignal("Text"):Connect(function()
        self:UpdateDisplaySize(display)
    end))

    self:UpdateDisplaySize(display)

    self.displays[rowKey] = display

    return display
end

function RowStatistics:GetRowDisplayName(rowKey, entry)
    if entry and entry.row then
        local displayName = entry.row:GetAttribute("DisplayName")
        if type(displayName) == "string" and displayName ~= "" then
            return displayName
        end
    end

    local numeric = tonumber(rowKey)
    if numeric then
        return string.format("Row %d", numeric)
    end

    return string.format("Row %s", tostring(rowKey))
end

function RowStatistics:BuildRowText(rowKey, entry)
    local options = self.displayOptions or {}
    local showRowHeader = self:GetDisplayOption("showRowHeader")
    local showPlantCount = self:GetDisplayOption("showPlantCount")
    local showPlantList = self:GetDisplayOption("showPlantList")
    local showTotalDamage = self:GetDisplayOption("showTotalDamage")
    local showEmptyMessage = self:GetDisplayOption("showEmptyMessage")
    local highlightWeakest = self:GetDisplayOption("highlightWeakest")

    local lines = {}
    local rowLabel = escapeRichText(self:GetRowDisplayName(rowKey, entry))
    local plantCount = entry.plantCount or 0

    local maxCapacity = self.maxPlantsPerRow or 5

    if showRowHeader then
        local headerText = rowLabel
        if showPlantCount then
            headerText = string.format("%s — %d / %d plant%s", headerText, plantCount, maxCapacity, plantCount == 1 and "" or "s")
        end
        table.insert(lines, string.format("<font color=\"%s\"><b>%s</b></font>", self.headerColorHex, headerText))
    elseif showPlantCount then
        table.insert(lines, string.format("<font color=\"%s\"><b>%d / %d plant%s</b></font>", self.headerColorHex, plantCount, maxCapacity, plantCount == 1 and "" or "s"))
    end

    if plantCount > 0 then
        if showPlantList then
            table.insert(lines, string.format("<font color=\"%s\">Plants:</font>", self.headerColorHex))

            local weakestIndex
            local weakestDamage = math.huge

            if highlightWeakest then
                for index, plantInfo in ipairs(entry.plants) do
                    local damage = tonumber(plantInfo.damage) or 0
                    if damage < weakestDamage then
                        weakestDamage = damage
                        weakestIndex = index
                    end
                end
            end

            for index, plantInfo in ipairs(entry.plants) do
                local damage = tonumber(plantInfo.damage) or 0
                local rarity = type(plantInfo.rarity) == "string" and plantInfo.rarity or ""
                local plantName = escapeRichText(plantInfo.name or "Unknown")
                local raritySuffix = rarity ~= "" and string.format(" [%s]", escapeRichText(rarity)) or ""
                local bullet = string.format("• %s%s", plantName, raritySuffix)
                if showPlantCount then
                    bullet = string.format("%s — %s dmg", bullet, escapeRichText(formatNumber(damage)))
                else
                    bullet = string.format("%s (%s dmg)", bullet, escapeRichText(formatNumber(damage)))
                end

                local colorHex = self:GetRarityColorHex(rarity)
                if highlightWeakest and index == weakestIndex then
                    colorHex = self.weakestColorHex
                end

                table.insert(lines, string.format("<font color=\"%s\">%s</font>", colorHex, bullet))
            end
        end
    else
        if showEmptyMessage then
            table.insert(lines, string.format("<font color=\"%s\">No plants placed yet.</font>", self.defaultLineColorHex))
        end
    end

    if showTotalDamage then
        table.insert(lines, string.format("<font color=\"%s\">Total Damage: %s</font>", self.totalColorHex, escapeRichText(formatNumber(entry.totalDamage or 0))))
    end

    if #lines == 0 then
        table.insert(lines, string.format("<font color=\"%s\"><b>%s</b></font>", self.headerColorHex, rowLabel))
    end

    return table.concat(lines, "\n")
end

function RowStatistics:GetRowSummaries()
    local context = self:GetPlayerPlotContext()
    if not context or not context.plotId then
        return nil
    end

    local rowsFolder = context.rows
    local plantsFolder = context.plants

    if not rowsFolder or not plantsFolder then
        return {}, context.plotId
    end

    local summaries = {}

    for _, row in ipairs(rowsFolder:GetChildren()) do
        if row:IsA("Folder") or row:IsA("Model") then
            local key = tostring(row.Name)
            summaries[key] = {
                row = row,
                plants = {},
                plantCount = 0,
                totalDamage = 0,
            }
        end
    end

    for _, plant in ipairs(plantsFolder:GetChildren()) do
        if plant:IsA("Model") then
            local rowIndex = plant:GetAttribute("Row")
            if rowIndex ~= nil then
                local key = tostring(rowIndex)
                local entry = summaries[key]
                if entry then
                    local damage = tonumber(plant:GetAttribute("Damage")) or 0
                    local cooldown = tonumber(plant:GetAttribute("Cooldown")) or 1
                    if cooldown <= 0 then
                        cooldown = 1
                    end
                    local damagePerSecond = damage / cooldown
                    local rarity = plant:GetAttribute("Rarity")
                    local displayName = plant:GetAttribute("PlantName") or plant:GetAttribute("DisplayName") or plant.Name

                    entry.plantCount = entry.plantCount + 1
                    entry.totalDamage = entry.totalDamage + damagePerSecond

                    table.insert(entry.plants, {
                        name = displayName,
                        damage = damagePerSecond,
                        rarity = rarity,
                        cooldown = cooldown,
                        baseDamage = damage,
                        instance = plant,
                    })
                end
            end
        end
    end

    for _, entry in pairs(summaries) do
        table.sort(entry.plants, function(a, b)
            local damageA = tonumber(a.damage) or 0
            local damageB = tonumber(b.damage) or 0
            if damageA == damageB then
                return tostring(a.name) < tostring(b.name)
            end
            return damageA > damageB
        end)
    end

    local ordered = {}
    for key, entry in pairs(summaries) do
        table.insert(ordered, {
            key = key,
            data = entry,
        })
    end

    table.sort(ordered, function(a, b)
        local aNum = tonumber(a.key)
        local bNum = tonumber(b.key)
        if aNum and bNum then
            if aNum == bNum then
                return a.key < b.key
            end
            return aNum < bNum
        end
        return a.key < b.key
    end)

    return ordered, context.plotId
end

function RowStatistics:UpdateDisplays()
    local orderedRows, plotId = self:GetRowSummaries()

    if not orderedRows then
        self:ClearDisplays()
        self._currentPlotId = nil
        return
    end

    local player = game.Players.LocalPlayer
    local character = player and player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")

    if self._currentPlotId ~= plotId then
        self:ClearDisplays()
        self._currentPlotId = plotId
    end

    local activeKeys = {}

    for _, payload in ipairs(orderedRows) do
        local rowKey = payload.key
        local entry = payload.data
        local display = self:EnsureDisplay(rowKey, entry)
        if display and display.label then
            display.label.Text = self:BuildRowText(rowKey, entry)
            self:UpdateDisplaySize(display)
            task.defer(function()
                if self.enabled and display.billboard then
                    self:UpdateDisplaySize(display)
                end
            end)
            if display.billboard then
                local visible = self:IsWithinVisibilityRange(display.attachment, rootPart)
                display.billboard.Enabled = visible
            end
            activeKeys[rowKey] = true
        end
    end

    local pendingRemoval = {}
    for key in pairs(self.displays) do
        if not activeKeys[key] then
            table.insert(pendingRemoval, key)
        end
    end

    for _, key in ipairs(pendingRemoval) do
        self:DestroyDisplay(key)
    end
end

function RowStatistics:Start()
    if self._loop then
        return
    end

    self:AttachListeners()
    self:UpdateDisplays()

    self._loop = task.spawn(function()
        while self.enabled do
            self:UpdateDisplays()
            task.wait(self.updateInterval)
        end
    end)
end

function RowStatistics:Stop()
    if self._loop then
        task.cancel(self._loop)
        self._loop = nil
    end

    self.enabled = false
    self._currentPlotId = nil
    self:DisconnectConnections()
    self:DisconnectPlotConnections()
    self:DisconnectPlantConnections()
    self:ClearDisplays()
end

function RowStatistics:OnToggle(state)
    if state then
        if self.enabled then
            return
        end
        self.enabled = true
        self:Start()
    else
        if not self.enabled then
            return
        end
        self:Stop()
    end
end

function RowStatistics:SyncFromConfig()
    if not self._toggle then
        return
    end

    if self._headerToggle then
        self:SetDisplayOption("showRowHeader", self._headerToggle.Value)
    end

    if self._plantCountToggle then
        self:SetDisplayOption("showPlantCount", self._plantCountToggle.Value)
    end

    if self._plantListToggle then
        self:SetDisplayOption("showPlantList", self._plantListToggle.Value)
    end

    if self._totalDamageToggle then
        self:SetDisplayOption("showTotalDamage", self._totalDamageToggle.Value)
    end

    if self._emptyMessageToggle then
        self:SetDisplayOption("showEmptyMessage", self._emptyMessageToggle.Value)
    end

    if self._highlightToggle then
        self:SetDisplayOption("highlightWeakest", self._highlightToggle.Value)
    end

    local shouldEnable = self._toggle.Value or false
    if shouldEnable ~= self.enabled then
        self:OnToggle(shouldEnable)
    elseif shouldEnable then
        self:UpdateDisplays()
    end
end

-- Plants Tab
PlantsTab = Window:Tab({
    Title = "Plants",
    Icon = "lucide:sprout",
})

-- Event Tab
EventTab = Window:Tab({
    Title = "Event",
    Icon = "lucide:calendar-star",
})

-- ========================================
-- EVENT TAB STRUCTURE
-- ========================================

local AutoArtistEventSection = EventTab:Section({
    Title = "Auto Artist Event",
    Icon = "lucide:palette",
    Opened = true,
})

AutoArtistEventSection:Paragraph({
    Title = "Event Information",
    Desc = "Automatically delivers the requested brainrot to the Artist. Reads the required item from the poster GUI and delivers it from your inventory.",
})

-- Auto Artist Event state
local AutoArtistEventEnabled = false
local AutoArtistEventLoop = nil

-- Inline sanitizer (same logic as InventoryUtils.SanitizeName)
local function sanitizeBrainrotName(name)
    if type(name) ~= "string" then
        return ""
    end
    
    local cleaned = name:gsub("%b[]", "")
    cleaned = cleaned:gsub("%s+", " ")
    cleaned = cleaned:gsub("^%s+", "")
    cleaned = cleaned:gsub("%s+$", "")
    -- Remove trailing tier suffixes: ' I', ' II', ' III', ' IV', ' V'
    cleaned = cleaned:gsub("%s+I?V%s*$", "")  -- Matches IV or V
    cleaned = cleaned:gsub("%s+I+%s*$", "")   -- Matches I, II, III
    return cleaned
end

-- Get required brainrot from Artist poster
local function getRequiredArtistBrainrot()
    local player = Players.LocalPlayer
    if not player then 
        print("[Artist Event] No LocalPlayer found")
        return nil 
    end
    
    local posterGui = player.PlayerGui:FindFirstChild("Main")
    if not posterGui then 
        print("[Artist Event] No 'Main' found in PlayerGui")
        return nil 
    end
    
    local frame = posterGui:FindFirstChild("PosterGui")
    if not frame then 
        print("[Artist Event] No 'PosterGui' found in Main")
        return nil 
    end
    
    local mainFrame = frame:FindFirstChild("Frame")
    if not mainFrame then 
        print("[Artist Event] No 'Frame' found in PosterGui")
        return nil 
    end
    
    local main = mainFrame:FindFirstChild("Main")
    if not main then 
        print("[Artist Event] No 'Main' found in Frame")
        return nil 
    end
    
    local wantedItem = main:FindFirstChild("WantedItem")
    if not wantedItem then 
        print("[Artist Event] No 'WantedItem' found in Main")
        return nil 
    end
    
    local titleLabel = wantedItem:FindFirstChild("WantedItem_Title")
    if not titleLabel then 
        print("[Artist Event] No 'WantedItem_Title' found in WantedItem")
        return nil 
    end
    
    local brainrotName = titleLabel.Text
    print("[Artist Event] Found brainrot text:", brainrotName)
    
    if brainrotName and brainrotName ~= "" then
        return brainrotName
    end
    
    return nil
end

-- Find brainrot tool in player's inventory (matches BrainrotFavoriteManager logic exactly)
local function findBrainrotInInventory(brainrotName)
    local player = Players.LocalPlayer
    if not player then 
        print("[Artist Event] No LocalPlayer")
        return nil 
    end
    
    -- Get inventory GUI
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then 
        print("[Artist Event] No PlayerGui")
        return nil 
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then 
        print("[Artist Event] No BackpackGui")
        return nil 
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then 
        print("[Artist Event] No Backpack in BackpackGui")
        return nil 
    end
    
    local inventory = backpack:FindFirstChild("Inventory")
    if not inventory then 
        print("[Artist Event] No Inventory")
        return nil 
    end
    
    local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then 
        print("[Artist Event] No ScrollingFrame")
        return nil 
    end
    
    local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
    if not gridFrame then 
        print("[Artist Event] No UIGridFrame")
        return nil 
    end
    
    -- Get player's backpack
    local playerBackpack = player:FindFirstChild("Backpack")
    if not playerBackpack then 
        print("[Artist Event] No player Backpack")
        return nil 
    end
    
    print("[Artist Event] Scanning inventory slots for brainrot:", brainrotName)
    
    -- Process inventory slots (EXACT copy of daily rewards logic)
    for _, slot in ipairs(gridFrame:GetChildren()) do
        repeat
            if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                break
            end
            
            -- Extract item ID from slot
            local itemId = slot:GetAttribute("ID")
            if not itemId or itemId == "" then
                break
            end
            
            -- Check category
            local category = slot:GetAttribute("Category")
            if category ~= "Brainrots" then
                break
            end
            
            -- Get name from Backpack item (EXACT same logic as daily rewards)
            local itemName = nil
            
            for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                local backpackId = backpackItem:GetAttribute("ID")
                if backpackId == itemId then
                    itemName = sanitizeBrainrotName(backpackItem.Name)
                    print("[Artist Event] Found brainrot in slot:", itemName, "ID:", itemId)
                    break
                end
            end
            
            if not itemName or itemName == "" then
                break
            end
            
            -- Check if this matches the required brainrot
            if itemName == brainrotName then
                -- Find and return the actual tool
                for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        print("[Artist Event] MATCH FOUND! Returning tool:", itemName)
                        return backpackItem
                    end
                end
            end
        until true
    end
    
    -- Also check hotbar
    local hotbarFrame = backpack:FindFirstChild("Hotbar")
    if hotbarFrame then
        print("[Artist Event] Checking hotbar...")
        for _, slot in ipairs(hotbarFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                local itemName = nil
                
                for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = sanitizeBrainrotName(backpackItem.Name)
                        print("[Artist Event] Found brainrot in hotbar:", itemName, "ID:", itemId)
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                if itemName == brainrotName then
                    for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                        local backpackId = backpackItem:GetAttribute("ID")
                        if backpackId == itemId then
                            print("[Artist Event] MATCH FOUND in hotbar! Returning tool:", itemName)
                            return backpackItem
                        end
                    end
                end
            until true
        end
    end
    
    print("[Artist Event] No matching brainrot found")
    return nil
end

-- Equip brainrot tool
local function equipBrainrot(tool)
    local player = Players.LocalPlayer
    if not player then return false end
    
    local character = player.Character
    if not character then return false end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    -- If tool is in backpack, equip it
    if tool.Parent == player.Backpack then
        humanoid:EquipTool(tool)
        task.wait(0.2) -- Wait for equip to complete
        return true
    end
    
    -- Already equipped
    if tool.Parent == character then
        return true
    end
    
    return false
end

-- Fire Artist proximity prompt to deliver brainrot
local function deliverToArtist()
    local artistSign = workspace:FindFirstChild("ScriptedMap")
    if not artistSign then 
        print("[Artist Event] No 'ScriptedMap' found in workspace")
        return false 
    end
    
    local artist = artistSign:FindFirstChild("Artist")
    if not artist then 
        print("[Artist Event] No 'Artist' found in ScriptedMap")
        return false 
    end
    
    local sign = artist:FindFirstChild("Sign")
    if not sign then 
        print("[Artist Event] No 'Sign' found in Artist")
        return false 
    end
    
    local prompt = sign:FindFirstChild("Prompt")
    if not prompt then 
        print("[Artist Event] No 'Prompt' found in Sign")
        return false 
    end
    
    local proximityPrompt = prompt:FindFirstChild("ProximityPrompt")
    if not proximityPrompt then 
        print("[Artist Event] No 'ProximityPrompt' found in Prompt")
        return false 
    end
    
    print("[Artist Event] Firing proximity prompt...")
    -- Fire the proximity prompt
    fireproximityprompt(proximityPrompt)
    return true
end

-- Main Auto Artist Event loop
local function autoArtistEvent()
    while AutoArtistEventEnabled do
        -- Check if event is complete (all brainrots delivered)
        local player = Players.LocalPlayer
        if player then
            local posterGui = player.PlayerGui:FindFirstChild("Main")
            if posterGui then
                local frame = posterGui:FindFirstChild("PosterGui")
                if frame then
                    local mainFrame = frame:FindFirstChild("Frame")
                    if mainFrame then
                        local mainComplete = mainFrame:FindFirstChild("Main_Complete")
                        if mainComplete and mainComplete.Visible then
                            print("[Artist Event] Event completed! Restarting...")
                            -- Fire restart remote
                            local remote = ReplicatedStorage:FindFirstChild("Remotes")
                            if remote then
                                local eventsFolder = remote:FindFirstChild("Events")
                                if eventsFolder then
                                    local artistFolder = eventsFolder:FindFirstChild("Artist")
                                    if artistFolder then
                                        local interactRemote = artistFolder:FindFirstChild("Interact")
                                        if interactRemote then
                                            interactRemote:FireServer("ResetRequest")
                                            print("[Artist Event] Restart request sent!")
                                            task.wait(3) -- Wait for restart to process
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        -- Get required brainrot name from poster
        local requiredBrainrot = getRequiredArtistBrainrot()
        print("[Artist Event] Required brainrot:", requiredBrainrot)
        
        if requiredBrainrot then
            -- Find the brainrot in inventory
            local brainrotTool = findBrainrotInInventory(requiredBrainrot)
            print("[Artist Event] Found tool:", brainrotTool and brainrotTool.Name or "nil")
            
            if brainrotTool then
                -- Equip the brainrot
                local equipSuccess = equipBrainrot(brainrotTool)
                print("[Artist Event] Equip success:", equipSuccess)
                
                if equipSuccess then
                    -- Deliver to Artist
                    local deliverySuccess = deliverToArtist()
                    print("[Artist Event] Delivery success:", deliverySuccess)
                    
                    if deliverySuccess then
                        task.wait(0.5) -- Wait after successful delivery
                    else
                        task.wait(0.2) -- Delivery failed, wait shorter
                    end
                else
                    task.wait(0.2) -- Equip failed, wait shorter
                end
            else
                print("[Artist Event] Brainrot not found in inventory!")
                task.wait(1) -- No brainrot in inventory, wait longer
            end
        else
            print("[Artist Event] No requirement found in poster GUI!")
            task.wait(1) -- No requirement found, wait longer
        end
        
        task.wait(0.3) -- Base wait between cycles
    end
end

-- Toggle for Auto Artist Event
AutoArtistEventSection:Toggle({
    Title = "Auto Artist Event",
    Desc = "Automatically delivers the requested brainrot to the Artist",
    Default = false,
    Callback = function(value)
        AutoArtistEventEnabled = value
        
        if value then
            -- Start the auto artist event loop
            if not AutoArtistEventLoop or coroutine.status(AutoArtistEventLoop) == "dead" then
                AutoArtistEventLoop = task.spawn(autoArtistEvent)
            end
        else
            -- Stop the loop
            if AutoArtistEventLoop then
                task.cancel(AutoArtistEventLoop)
                AutoArtistEventLoop = nil
            end
        end
    end,
})

-- ========================================
-- AUTO FAVORITE EVENT BRAINROTS
-- ========================================

AutoArtistEventSection:Paragraph({
    Title = "Auto Favorite Event Brainrots",
    Desc = "Automatically favorites one of each event brainrot type to protect them from auto-sell.",
})

-- Event brainrots list (all 22 types)
local EventBrainrotsList = {
    "Bandito Bobrito",
    "Ballerina Cappuccina",
    "Bananita Dolphinita",
    "Gangster Footera",
    "Burbaloni Lulliloli",
    "Elefanto Cocofanto",
    "Las Tralaleritas",
    "Madung",
    "Bottellini",
    "Frigo Camelo",
    "Bombini Gussini",
    "Aerilino Armadillo",
    "Baby Peperoncini And Marmellata",
    "Pesto Mortioni",
    "Kiwissimo",
    "Giraffa Celeste",
    "Constructione Tralala",
    "Matteo",
    "Luis Traffico",
    "La Tomatoro",
    "Crazylone Pizaione",
    "Garamararam"
}

-- Convert to lookup table for faster access
local EventBrainrotsLookup = {}
for _, name in ipairs(EventBrainrotsList) do
    EventBrainrotsLookup[name] = true
end

-- State for auto favorite event brainrots
local AutoFavoriteEventBrainrotsEnabled = false

-- Function to favorite event brainrots (one of each type)
local function favoriteEventBrainrots()
    local player = Players.LocalPlayer
    if not player then return 0 end
    
    -- Get inventory GUI
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return 0 end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then return 0 end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then return 0 end
    
    local inventory = backpack:FindFirstChild("Inventory")
    if not inventory then return 0 end
    
    local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then return 0 end
    
    local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
    if not gridFrame then return 0 end
    
    local playerBackpack = player:FindFirstChild("Backpack")
    if not playerBackpack then return 0 end
    
    local favoritedTypes = {}
    local processed = 0
    
    -- Process inventory slots
    for _, slot in ipairs(gridFrame:GetChildren()) do
        repeat
            if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                break
            end
            
            -- Check if already favorited
            local heartIcon = slot:FindFirstChild("HeartIcon")
            if heartIcon then
                local category = slot:GetAttribute("Category")
                if category == "Brainrots" then
                    -- Get the item ID to find its name
                    local itemId = slot:GetAttribute("ID")
                    if itemId and itemId ~= "" then
                        for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                            local backpackId = backpackItem:GetAttribute("ID")
                            if backpackId == itemId then
                                local itemName = sanitizeBrainrotName(backpackItem.Name)
                                if EventBrainrotsLookup[itemName] then
                                    -- Mark this type as already favorited
                                    favoritedTypes[itemName] = true
                                end
                                break
                            end
                        end
                    end
                    break
                end
            end
            
            -- Extract item ID from slot
            local itemId = slot:GetAttribute("ID")
            if not itemId or itemId == "" then
                break
            end
            
            -- Check category
            local category = slot:GetAttribute("Category")
            if category ~= "Brainrots" then
                break
            end
            
            -- Get name from Backpack item
            local itemName = nil
            
            for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                local backpackId = backpackItem:GetAttribute("ID")
                if backpackId == itemId then
                    itemName = sanitizeBrainrotName(backpackItem.Name)
                    break
                end
            end
            
            if not itemName or itemName == "" then
                break
            end
            
            -- Check if this is an event brainrot and not yet favorited
            if EventBrainrotsLookup[itemName] and not favoritedTypes[itemName] then
                -- Favorite this item using the remote
                local FavoriteItemRemote = ReplicatedStorage:FindFirstChild("Remotes")
                if FavoriteItemRemote then
                    FavoriteItemRemote = FavoriteItemRemote:FindFirstChild("FavoriteItem")
                    if FavoriteItemRemote then
                        FavoriteItemRemote:FireServer(itemId)
                        favoritedTypes[itemName] = true
                        processed += 1
                        task.wait(0.1) -- Small delay between favorites
                    end
                end
            end
        until true
    end
    
    -- Also check hotbar
    local hotbarFrame = backpack:FindFirstChild("Hotbar")
    if hotbarFrame then
        for _, slot in ipairs(hotbarFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Brainrots" then
                        local itemId = slot:GetAttribute("ID")
                        if itemId and itemId ~= "" then
                            for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                                local backpackId = backpackItem:GetAttribute("ID")
                                if backpackId == itemId then
                                    local itemName = sanitizeBrainrotName(backpackItem.Name)
                                    if EventBrainrotsLookup[itemName] then
                                        favoritedTypes[itemName] = true
                                    end
                                    break
                                end
                            end
                        end
                        break
                    end
                end
                
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                local itemName = nil
                
                for _, backpackItem in ipairs(playerBackpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = sanitizeBrainrotName(backpackItem.Name)
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                if EventBrainrotsLookup[itemName] and not favoritedTypes[itemName] then
                    local FavoriteItemRemote = ReplicatedStorage:FindFirstChild("Remotes")
                    if FavoriteItemRemote then
                        FavoriteItemRemote = FavoriteItemRemote:FindFirstChild("FavoriteItem")
                        if FavoriteItemRemote then
                            FavoriteItemRemote:FireServer(itemId)
                            favoritedTypes[itemName] = true
                            processed += 1
                            task.wait(0.1)
                        end
                    end
                end
            until true
        end
    end
    
    return processed
end

-- Toggle for Auto Favorite Event Brainrots
AutoArtistEventSection:Toggle({
    Title = "Auto Favorite Event Brainrots",
    Desc = "Protects one of each event brainrot type from auto-sell",
    Default = false,
    Callback = function(value)
        AutoFavoriteEventBrainrotsEnabled = value
    end,
})

AutoArtistEventSection:Paragraph({
    Title = "End of Section",
    Desc = "",
})

-- Misc Tab (Utilities, settings)
MiscTab = Window:Tab({
    Title = "loc:MISC_TAB",
    Icon = "lucide:box",
})

-- Settings Tab (Theme, config, preferences)
SettingsTab = Window:Tab({
    Title = "loc:SETTINGS_TAB",
    Icon = "lucide:settings",
})

-- Theme Tab (Theme selection)
ThemeTab = Window:Tab({
    Title = "loc:THEME_TAB",
    Icon = "lucide:palette",
})

-- Config Tab (Save/load preferences)
ConfigTab = Window:Tab({
    Title = "loc:CONFIG_TAB",
    Icon = "lucide:save",
})

-- Changelog Tab
ChangelogTab = Window:Tab({
    Title = "Changelog",
    Icon = "lucide:newspaper",
})

-- ========================================
-- PLANTS TAB STRUCTURE
-- ========================================

local RemovePlantsSection = PlantsTab:Section({
    Title = "Remove Plants by Row",
    Icon = "lucide:trash-2",
    Opened = true,
})

RemovePlantsSection:Paragraph({
    Title = "Row Management",
    Desc = "Select a row (1-7) to remove all plants in that row.",
})

local function getPlayerPlantsInRow(rowNumber)
    local player = Players.LocalPlayer
    if not player then
        return {}
    end

    local plotId = player:GetAttribute("Plot")
    if not plotId then
        return {}
    end

    plotId = tostring(plotId)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return {}
    end

    local plot = plotsFolder:FindFirstChild(plotId)
    if not plot then
        return {}
    end

    local plantsFolder = plot:FindFirstChild("Plants")
    if not plantsFolder then
        return {}
    end

    local plantsInRow = {}
    
    for _, plant in ipairs(plantsFolder:GetChildren()) do
        if plant:IsA("Model") then
            local plantRow = plant:GetAttribute("Row")
            
            if plantRow == rowNumber then
                local id = plant:GetAttribute("ID")
                if id and id ~= "" then
                    table.insert(plantsInRow, {
                        model = plant,
                        id = id,
                        name = plant.Name
                    })
                end
            end
        end
    end
    
    return plantsInRow
end

local function removePlantsInRow(rowNumber)
    local plants = getPlayerPlantsInRow(rowNumber)
    
    if #plants == 0 then
        WindUI:Notify({
            Title = "No Plants Found",
            Content = string.format("No plants found in Row %d", rowNumber),
            Duration = 3,
            Icon = "lucide:alert-circle",
        })
        return
    end
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes")
    if remote then
        remote = remote:FindFirstChild("RemoveItem")
    end
    
    if not remote then
        WindUI:Notify({
            Title = "Error",
            Content = "RemoveItem remote not found",
            Duration = 3,
            Icon = "lucide:x",
        })
        return
    end
    
    local removed = 0
    
    for _, plantData in ipairs(plants) do
        local success = pcall(function()
            remote:FireServer(plantData.id)
        end)
        
        if success then
            removed = removed + 1
        end
        
        task.wait(0.1)
    end
    
    WindUI:Notify({
        Title = "Plants Removed",
        Content = string.format("Removed %d plants from Row %d", removed, rowNumber),
        Duration = 3,
        Icon = "lucide:check",
    })
end

local selectedRow = 1

local RowDropdown = RemovePlantsSection:Dropdown({
    Title = "Select Row",
    Desc = "Choose which row to remove plants from (1-7)",
    Values = { "Row 1", "Row 2", "Row 3", "Row 4", "Row 5", "Row 6", "Row 7" },
    Value = "Row 1",
    Multi = false,
    Callback = function(selected)
        selectedRow = tonumber(selected:match("%d+")) or 1
    end
})

local RemoveRowButton = RemovePlantsSection:Button({
    Title = "Remove All Plants in Selected Row",
    Desc = "This will remove all plants in the selected row permanently!",
    Callback = function()
        task.spawn(function()
            removePlantsInRow(selectedRow)
        end)
    end
})

RemovePlantsSection:Paragraph({
    Title = "End of Section",
    Desc = "",
})

-- ========================================
-- REMOVE PLANTS BY CONDITIONS
-- ========================================

local RemoveConditionalSection = PlantsTab:Section({
    Title = "Remove Plants by Conditions",
    Icon = "lucide:filter",
    Opened = true,
})

RemoveConditionalSection:Paragraph({
    Title = "Conditional Removal",
    Desc = "Remove plants based on rarity and/or damage per second. Enable the toggle and set your filters.",
})

local RemovePlantsControl = {
    enabled = false,
    selectedRarities = {},
    maxDamagePerSecond = 1000,
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
}

local function getPlayerPlantsMatchingConditions()
    local player = Players.LocalPlayer
    if not player then
        return {}
    end

    local plotId = player:GetAttribute("Plot")
    if not plotId then
        return {}
    end

    plotId = tostring(plotId)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return {}
    end

    local plot = plotsFolder:FindFirstChild(plotId)
    if not plot then
        return {}
    end

    local plantsFolder = plot:FindFirstChild("Plants")
    if not plantsFolder then
        return {}
    end

    local matchingPlants = {}
    local hasRarityFilter = #RemovePlantsControl.selectedRarities > 0
    
    for _, plant in ipairs(plantsFolder:GetChildren()) do
        if plant:IsA("Model") then
            local id = plant:GetAttribute("ID")
            if id and id ~= "" then
                local shouldRemove = false
                
                -- Check rarity filter
                if hasRarityFilter then
                    local plantRarity = plant:GetAttribute("Rarity")
                    if plantRarity and table.find(RemovePlantsControl.selectedRarities, plantRarity) then
                        shouldRemove = true
                    end
                end
                
                -- Check damage filter (always apply if max damage is set)
                local damage = tonumber(plant:GetAttribute("Damage")) or 0
                local cooldown = tonumber(plant:GetAttribute("Cooldown")) or 1
                if cooldown <= 0 then
                    cooldown = 1
                end
                local damagePerSecond = damage / cooldown
                
                if damagePerSecond <= RemovePlantsControl.maxDamagePerSecond then
                    shouldRemove = true
                end
                
                -- Only add if at least one condition matches
                if shouldRemove then
                    table.insert(matchingPlants, {
                        model = plant,
                        id = id,
                        name = plant.Name,
                        rarity = plant:GetAttribute("Rarity") or "Unknown",
                        damagePerSecond = damagePerSecond,
                        row = plant:GetAttribute("Row") or "?"
                    })
                end
            end
        end
    end
    
    return matchingPlants
end

local function removePlantsMatchingConditions()
    if not RemovePlantsControl.enabled then
        return
    end
    
    local plants = getPlayerPlantsMatchingConditions()
    
    if #plants == 0 then
        return
    end
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes")
    if remote then
        remote = remote:FindFirstChild("RemoveItem")
    end
    
    if not remote then
        return
    end
    
    local removed = 0
    
    for _, plantData in ipairs(plants) do
        if not RemovePlantsControl.enabled then
            break
        end
        
        local success = pcall(function()
            remote:FireServer(plantData.id)
        end)
        
        if success then
            removed = removed + 1
        end
        
        task.wait(0.1)
    end
end

local RemovePlantsRarityDropdown = RemoveConditionalSection:Dropdown({
    Title = "Filter by Rarity",
    Desc = "Select rarities to remove (leave empty to ignore rarity)",
    Values = RemovePlantsControl.rarityOptions,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        if type(selected) == "table" then
            RemovePlantsControl.selectedRarities = selected
        else
            RemovePlantsControl.selectedRarities = {}
        end
    end
})

local RemovePlantsDamageSlider = RemoveConditionalSection:Slider({
    Title = "Max Damage Per Second",
    Desc = "Remove plants with damage per second BELOW or EQUAL to this value",
    Step = 10,
    Value = {
        Min = 0,
        Max = 20000,
        Default = 1000,
    },
    Callback = function(value)
        RemovePlantsControl.maxDamagePerSecond = tonumber(value) or 1000
    end
})

local RemovePlantsToggle = RemoveConditionalSection:Toggle({
    Title = "Enable Auto-Remove Plants",
    Desc = "Automatically remove plants matching the conditions above (runs every 10 seconds)",
    Default = false,
    Callback = function(state)
        RemovePlantsControl.enabled = state
        
        if state then
            WindUI:Notify({
                Title = "Auto-Remove Enabled",
                Content = "Will remove plants matching conditions every 10s",
                Duration = 3,
                Icon = "lucide:trash-2",
            })
            
            task.spawn(function()
                while RemovePlantsControl.enabled do
                    pcall(removePlantsMatchingConditions)
                    task.wait(10)
                end
            end)
        else
            WindUI:Notify({
                Title = "Auto-Remove Disabled",
                Content = "Stopped removing plants",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})

local RemovePlantsNowButton = RemoveConditionalSection:Button({
    Title = "Remove Matching Plants Now",
    Desc = "Immediately remove all plants matching the conditions (one-time action)",
    Callback = function()
        task.spawn(function()
            removePlantsMatchingConditions()
        end)
    end
})

RemoveConditionalSection:Paragraph({
    Title = "End of Section",
    Desc = "",
})

-- ========================================
-- AUTO PLANT SEEDS
-- ========================================

local AutoPlantSeedsSection = PlantsTab:Section({
    Title = "Auto Plant Seeds",
    Icon = "lucide:sprout",
    Opened = true,
})

AutoPlantSeedsSection:Paragraph({
    Title = "Smart Seed Planting",
    Desc = "Plants seeds in rows with least plants. Each unlocked row gives 5 slots (max 35 slots). Each row can hold max 9 plants. Respects your total slot limit.",
})

local AutoPlantSeedsControl = {
    enabled = false,
    selectedRarities = {},
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    plantingThread = nil,
}

-- Seed rarity lookup table
local SeedRarityMap = {
    -- Original seeds
    ["Cactus Seed"] = "Rare",
    ["Strawberry Seed"] = "Rare",
    ["Pumpkin Seed"] = "Epic",
    ["Sunflower Seed"] = "Epic",
    ["Dragon Fruit Seed"] = "Legendary",
    ["Eggplant Seed"] = "Legendary",
    ["Watermelon Seed"] = "Mythic",
    ["Grape Seed"] = "Mythic",
    ["Cocotank Seed"] = "Godly",
    ["Carnivorous Plant Seed"] = "Godly",
    ["Mr Carrot Seed"] = "Secret",
    ["Tomatrio Seed"] = "Secret",
    ["Shroombino Seed"] = "Secret",
    ["Mango Seed"] = "Secret",
    ["King Limone Seed"] = "Secret",
    
    -- Prison Event seeds
    ["Don Fragola Seed"] = "Rare",
    ["Sunzio Seed"] = "Epic",
    ["Aubie Seed"] = "Legendary",
    ["Copuccino Seed"] = "Godly",
    
    -- Hit List Event seed
    ["Tomade Torelli Seed"] = "Godly",
    
    -- Other seeds
    ["Pine-a-Punch Seed"] = "Godly",
    ["Peppero Seed"] = "Unknown",
    ["Corniboxer Seed"] = "Unknown",
    ["Los Durianos Seed"] = "Unknown",
    
    -- Alternative names (without Seed suffix in case sanitizer removes it differently)
    ["Cocotank"] = "Godly",
    ["Cocotkan Seed"] = "Godly",  -- Typo variant
    ["Cocotkan"] = "Godly",
}

local function getPlotContext()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end

    local plotId = player:GetAttribute("Plot")
    if not plotId then
        return nil
    end

    plotId = tostring(plotId)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return nil
    end

    local plot = plotsFolder:FindFirstChild(plotId)
    if not plot then
        return nil
    end

    return {
        plot = plot,
        plotId = plotId,
        rows = plot:FindFirstChild("Rows"),
        plants = plot:FindFirstChild("Plants")
    }
end

local function getRowPlantCounts()
    local context = getPlotContext()
    if not context or not context.plants then
        return {}, 0
    end

    local rowCounts = {}
    local totalPlants = 0
    
    -- Count plants in each row
    for _, plant in ipairs(context.plants:GetChildren()) do
        if plant:IsA("Model") then
            local rowNum = plant:GetAttribute("Row")
            if rowNum then
                rowCounts[rowNum] = (rowCounts[rowNum] or 0) + 1
                totalPlants = totalPlants + 1
            end
        end
    end
    
    return rowCounts, totalPlants
end

local function getUnlockedRowsCount()
    local context = getPlotContext()
    if not context or not context.rows then
        return 0
    end

    local unlockedRows = 0
    
    for _, row in ipairs(context.rows:GetChildren()) do
        if row:IsA("Folder") or row:IsA("Model") then
            unlockedRows = unlockedRows + 1
        end
    end
    
    return unlockedRows
end

local function getTotalAvailableSlots()
    local unlockedRows = getUnlockedRowsCount()
    return unlockedRows * 5
end

local function findAvailableGrassInRow(rowNumber)
    local player = Players.LocalPlayer
    if not player then
        return nil
    end

    local plotId = player:GetAttribute("Plot")
    if not plotId then
        return nil
    end

    plotId = tostring(plotId)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return nil
    end

    local plot = plotsFolder:FindFirstChild(plotId)
    if not plot then
        return nil
    end

    local rowsFolder = plot:FindFirstChild("Rows")
    if not rowsFolder then
        return nil
    end

    local row = rowsFolder:FindFirstChild(tostring(rowNumber))
    if not row then
        return nil
    end

    local grassFolder = row:FindFirstChild("Grass")
    if not grassFolder then
        return nil
    end

    -- Find first available grass
    for _, grass in ipairs(grassFolder:GetChildren()) do
        if grass:IsA("BasePart") then
            local canPlace = grass:GetAttribute("CanPlace")
            local occupied = grass:GetAttribute("Occupied")
            
            if canPlace == true and occupied == nil then
                return grass
            end
        end
    end

    return nil
end

local function getRowWithLeastPlants()
    local context = getPlotContext()
    if not context or not context.rows then
        return nil
    end

    local rowCounts, totalPlants = getRowPlantCounts()
    
    local minCount = math.huge
    local bestRow = nil
    
    -- Only check unlocked rows
    for _, row in ipairs(context.rows:GetChildren()) do
        if row:IsA("Folder") or row:IsA("Model") then
            local rowNum = tonumber(row.Name)
            if rowNum then
                local count = rowCounts[rowNum] or 0
                -- Each row can have max 9 plants (grass spots)
                if count < 9 and count < minCount then
                    minCount = count
                    bestRow = rowNum
                end
            end
        end
    end
    
    return bestRow, minCount
end

local function getSeedsFromInventory()
    local player = Players.LocalPlayer
    if not player then
        return {}
    end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return {}
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then
        return {}
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then
        return {}
    end
    
    local inventory = backpack:FindFirstChild("Inventory")
    if not inventory then
        return {}
    end
    
    local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then
        return {}
    end
    
    local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
    if not gridFrame then
        return {}
    end

    local backpackFolder = player:FindFirstChild("Backpack")
    if not backpackFolder then
        return {}
    end

    local seeds = {}
    local hasRarityFilter = #AutoPlantSeedsControl.selectedRarities > 0

    local slotCount = 0
    local seedSlotCount = 0
    
    -- Process inventory slots
    for _, slot in ipairs(gridFrame:GetChildren()) do
        slotCount = slotCount + 1
        
        repeat
            if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                break
            end
            
            -- Check category
            local category = slot:GetAttribute("Category")
            if category == "Seeds" then
                seedSlotCount = seedSlotCount + 1
            end
            
            if category ~= "Seeds" then
                break
            end
            
            -- Get slot ID
            local itemId = slot:GetAttribute("ID")
            if not itemId or itemId == "" then
                break
            end
            
            -- Find matching tool in backpack to get name
            local seedName = nil
            
            for _, backpackItem in ipairs(backpackFolder:GetChildren()) do
                if backpackItem:IsA("Tool") then
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        -- Sanitize name: remove [xNN] quantity prefix
                        local rawName = backpackItem.Name
                        seedName = rawName:gsub("%[x%d+%]%s*", "") -- Remove [xNN] prefix
                        seedName = seedName:gsub("^%s+", ""):gsub("%s+$", "") -- Trim spaces
                        break
                    end
                end
            end
            
            if not seedName or seedName == "" then
                break
            end
            
            -- Get rarity from lookup table
            local rarity = SeedRarityMap[seedName]
            
            -- Check rarity filter
            if hasRarityFilter then
                if not rarity or not table.find(AutoPlantSeedsControl.selectedRarities, rarity) then
                    break
                end
            end
            
            table.insert(seeds, {
                id = itemId,
                name = seedName,
                rarity = rarity or "Unknown",
                slot = slot
            })
        until true
    end

    return seeds
end

local function plantSeed(seedID, seedName, grass)
    -- First, equip the seed
    local player = Players.LocalPlayer
    if not player then
        return false
    end
    
    local character = player.Character
    if not character then
        return false
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then
        return false
    end
    
    -- Find the seed tool in backpack
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then
        return false
    end
    
    local seedTool = nil
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            local itemId = item:GetAttribute("ID")
            if itemId == seedID then
                seedTool = item
                break
            end
        end
    end
    
    if not seedTool then
        return false
    end
    
    -- Equip the tool
    humanoid:EquipTool(seedTool)
    task.wait(0.2) -- Wait for equip to complete
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes")
    if not remote then
        return false
    end
    
    remote = remote:FindFirstChild("PlaceItem")
    if not remote then
        return false
    end
    
    -- Extract plant name from seed name (remove " Seed" suffix)
    local plantName = seedName:gsub(" Seed$", "")
    
    -- Build the argument table as the game expects
    local args = {
        ID = seedID,
        CFrame = grass.CFrame,
        Item = plantName,
        Floor = grass
    }

    local success = pcall(function()
        remote:FireServer(args)
    end)
    
    task.wait(0.2) -- Wait for server response

    return success
end

local function autoPlantSeeds()
    if not AutoPlantSeedsControl.enabled then
        return
    end

    -- Check if we have available slots
    local totalAvailableSlots = getTotalAvailableSlots()
    local rowCounts, totalPlants = getRowPlantCounts()
    
    if totalPlants >= totalAvailableSlots then
        -- All slots are full
        return
    end

    local seeds = getSeedsFromInventory()
    
    if #seeds == 0 then
        return
    end

    for i, seed in ipairs(seeds) do
        if not AutoPlantSeedsControl.enabled then
            break
        end

        -- Re-check slot availability
        rowCounts, totalPlants = getRowPlantCounts()
        if totalPlants >= totalAvailableSlots then
            break
        end

        local targetRow = getRowWithLeastPlants()
        if not targetRow then
            break
        end
        
        local grass = findAvailableGrassInRow(targetRow)
        
        if grass then
            local success = plantSeed(seed.id, seed.name, grass)
            
            if success then
                task.wait(0.3)
            else
                task.wait(0.1)
            end
        else
            task.wait(0.1)
        end
    end
end

local AutoPlantSeedsRarityDropdown = AutoPlantSeedsSection:Dropdown({
    Title = "Filter by Rarity",
    Desc = "Select rarities to plant (leave empty to plant all seeds)",
    Values = AutoPlantSeedsControl.rarityOptions,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        if type(selected) == "table" then
            AutoPlantSeedsControl.selectedRarities = selected
        else
            AutoPlantSeedsControl.selectedRarities = {}
        end
    end
})

local AutoPlantSeedsToggle = AutoPlantSeedsSection:Toggle({
    Title = "Enable Auto Plant Seeds",
    Desc = "Automatically plants seeds in rows with the least plants (runs every 5 seconds)",
    Default = false,
    Callback = function(state)
        AutoPlantSeedsControl.enabled = state
        
        if state then
            WindUI:Notify({
                Title = "Auto Plant Seeds Enabled",
                Content = "Planting seeds in rows with least plants",
                Duration = 3,
                Icon = "lucide:sprout",
            })
            
            if AutoPlantSeedsControl.plantingThread then
                task.cancel(AutoPlantSeedsControl.plantingThread)
            end
            
            AutoPlantSeedsControl.plantingThread = task.spawn(function()
                while AutoPlantSeedsControl.enabled do
                    pcall(autoPlantSeeds)
                    task.wait(5)
                end
            end)
        else
            if AutoPlantSeedsControl.plantingThread then
                task.cancel(AutoPlantSeedsControl.plantingThread)
                AutoPlantSeedsControl.plantingThread = nil
            end
            
            WindUI:Notify({
                Title = "Auto Plant Seeds Disabled",
                Content = "Stopped planting seeds",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})

local PlantSeedsNowButton = AutoPlantSeedsSection:Button({
    Title = "Plant Seeds Now",
    Desc = "Immediately plant all matching seeds (one-time action)",
    Callback = function()
        task.spawn(function()
            autoPlantSeeds()
            WindUI:Notify({
                Title = "Planting Complete",
                Content = "Finished planting seeds",
                Duration = 3,
                Icon = "lucide:check",
            })
        end)
    end
})

AutoPlantSeedsSection:Paragraph({
    Title = "End of Section",
    Desc = "",
})

-- ========================================
-- INFORMATION TAB STRUCTURE
-- ========================================

MainTab:Paragraph({
    Title = "loc:MAIN_AUTO_TITLE",
    Desc = "loc:MAIN_AUTO_DESC",
})

MainTab:Divider()

local function formatTime(seconds)
    if type(seconds) ~= "number" or seconds <= 0 then
        return "Ready!"

    end
    local mins = math.floor(seconds / 60)
    local secs = math.floor(seconds % 60)
    return string.format("%02d:%02d", mins, secs)
end

function formatNumber(num)
    if type(num) ~= "number" then return "0" end
    if num >= 1000000 then
        return string.format("%.2fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.2fK", num / 1000)
    else
        return string.format("%.0f", num)
    end
end

function escapeRichText(text)
    if type(text) ~= "string" then
        text = tostring(text or "")
    end

    text = text:gsub("&", "&amp;")
    text = text:gsub("<", "&lt;")
    text = text:gsub(">", "&gt;")

    return text
end

-- Player Statistics Section
PlayerStatsSection = MainTab:Section({
    Title = "loc:PLAYER_STATS_SECTION",
    Icon = "lucide:user",

    Opened = true,
})

local RebirthParagraph = PlayerStatsSection:Paragraph({
    Title = "loc:REBIRTH_TITLE",
    Desc = "loc:REBIRTH_DESC",
    Color = Color3.fromHex("#FFD700"),
})

local CPSParagraph = PlayerStatsSection:Paragraph({
    Title = "loc:CPS_TITLE",
    Desc = "loc:CPS_DESC",
    Color = Color3.fromHex("#30FF6A"),
})

local RowsParagraph = PlayerStatsSection:Paragraph({
    Title = "loc:ROWS_TITLE",
    Desc = "loc:ROWS_DESC",
    Color = Color3.fromHex("#22C55E"),
})

-- Shop Statistics Section (combines restock timer and stock info)
ShopStatsSection = MainTab:Section({
    Title = "loc:SHOP_STATS_SECTION",
    Icon = "lucide:shopping-cart",
    Opened = true,
})

local RestockParagraph = ShopStatsSection:Paragraph({
    Title = "loc:RESTOCK_TITLE",
    Desc = "loc:RESTOCK_DESC",
    Color = Color3.fromHex("#3B82F6"),
})

-- Shop state management
local ShopState = {
    itemParagraphs = {},
    isRunning = true,
    notifiedItems = {},
    lastShopData = "", -- Cache to detect actual changes
    allowNotifications = false -- Enable when timer is 298-300 (shop just restocked)
}

-- ========================================
-- AUTO SHOPPING SYSTEM (SIMPLE & FAST)
-- ========================================
local AutoShopping = {
    gearEnabled = false,
    plantEnabled = false,
    gearSelected = {},
    plantSelected = {},
    
    gearNames = {
        "Water Bucket",
        "Frost Grenade",
        "Banana Gun",
        "Frost Blower",
        "Carrot Launcher"
    },
    plantNames = {
        "Cactus Seed",
        "Strawberry Seed",
        "Pumpkin Seed",
        "Sunflower Seed",
        "Dragon Fruit Seed",
        "Eggplant Seed",
        "Watermelon Seed",
        "Grape Seed",
        "Cocotank Seed",
        "Carnivorous Plant Seed",
        "Mr Carrot Seed",
        "Tomatrio Seed",
        "Shroombino Seed",
        "Mango Seed",
        "King Limone Seed"
    },
    
    gearRemote = BuyGearRemote,
    plantRemote = BuyItemRemote,
    isBuying = false,
    retryInterval = 5,
    _retryTask = nil,
}

-- Buy function with delays
function AutoShopping:BuyItems(shopItems, selectedItems, remote, itemType)
    if not remote then
        return
    end
    
    -- Check if any selected items match shop items
    local matchedItems = {}
    for _, selectedName in ipairs(selectedItems) do
        for _, shopItem in ipairs(shopItems) do
            if shopItem.name == selectedName and shopItem.quantity and shopItem.quantity > 0 then
                table.insert(matchedItems, {
                    name = selectedName,
                    stock = math.floor(shopItem.quantity)
                })
                break
            end
        end
    end
    
    if #matchedItems == 0 then
        return
    end
    
    -- Buy in background with delays (no isBuying check - let it run each cycle)
    task.spawn(function()
        for _, item in ipairs(matchedItems) do
            for i = 1, item.stock do
                pcall(function()
                    remote:FireServer(item.name, true)
                end)
                task.wait(0.4) -- 0.4 second delay between each remote
            end
        end
    end)

    self:EnsureRetryLoop()
end

function AutoShopping:GetRestockSeconds(kind)
    local workspaceService = game:GetService("Workspace")
    if not workspaceService then
        return nil
    end

    if kind == "gear" then
        return workspaceService:GetAttribute("NextGearRestock")
    elseif kind == "plant" then
        return workspaceService:GetAttribute("NextSeedRestock")
    end

    return nil
end

function AutoShopping:HasSelectableStock(mainGui, shopName, selectedNames)
    if not mainGui or not shopName or not selectedNames or #selectedNames == 0 then
        return false
    end

    local shopGui = mainGui:FindFirstChild(shopName)
    if not shopGui then
        return false
    end

    local frame = shopGui:FindFirstChild("Frame")
    if not frame then
        return false
    end

    local scrollingFrame = frame:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then
        return false
    end

    local selectedLookup = {}
    for _, name in ipairs(selectedNames) do
        selectedLookup[name] = true
    end

    for _, item in ipairs(scrollingFrame:GetChildren()) do
        if item:IsA("GuiObject") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" then
            if selectedLookup[item.Name] then
                local stockLabel = item:FindFirstChild("Stock")
                if stockLabel and stockLabel:IsA("TextLabel") then
                    local normalized = string.lower(stockLabel.Text or "")
                    local numeric = normalized:match("x%s*([%d%.]+)") or normalized:match("([%d%.]+)")
                    if numeric then
                        local quantity = tonumber(numeric)
                        if quantity and quantity > 0 then
                            return true
                        end
                    end
                end
            end
        end
    end

    return false
end

function AutoShopping:ShouldContinueRetries()
    local player = game.Players.LocalPlayer
    if not player then
        return false
    end

    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return false
    end

    local mainGui = playerGui:FindFirstChild("Main")
    if not mainGui then
        return false
    end

    local gearPending = false
    if self.gearEnabled and #self.gearSelected > 0 then
        local restock = self:GetRestockSeconds("gear")
        if not restock or restock > 2 then
            gearPending = self:HasSelectableStock(mainGui, "Gears", self.gearSelected)
        end
    end

    local plantPending = false
    if self.plantEnabled and #self.plantSelected > 0 then
        local restock = self:GetRestockSeconds("plant")
        if not restock or restock > 2 then
            plantPending = self:HasSelectableStock(mainGui, "Seeds", self.plantSelected)
        end
    end

    return gearPending or plantPending
end

function AutoShopping:EnsureRetryLoop()
    if self._retryTask then
        return
    end

    if not self:ShouldContinueRetries() then
        return
    end

    self._retryTask = task.spawn(function()
        while true do
            task.wait(self.retryInterval or 5)
            if not self:ShouldContinueRetries() then
                break
            end
            self:TriggerImmediatePurchase()
        end
        self._retryTask = nil
    end)
end

-- Called from updateShopStock
function AutoShopping:OnShopUpdate(seedsItems, gearsItems)
    if self.gearEnabled and #self.gearSelected > 0 then
        self:BuyItems(gearsItems or {}, self.gearSelected, self.gearRemote, "gear")
    end
    
    if self.plantEnabled and #self.plantSelected > 0 then
        self:BuyItems(seedsItems or {}, self.plantSelected, self.plantRemote, "plant")
    end
end

-- Mount UI
function AutoShopping:MountUI(tab)
    local section = tab:Section({
        Title = "loc:AUTO_SHOPPING_SECTION",
        Opened = true,
    })

    local gearDropdown = section:Dropdown({
        Title = "loc:GEAR_SELECTION_TITLE",
        Desc = "loc:GEAR_SELECTION_DESC",
        Values = self.gearNames,
        Value = {},
        Multi = true,
        AllowNone = true,
        Callback = function(selected)
            self.gearSelected = selected
        end
    })
    MainConfig:Register("AutoBuyGearSelection", gearDropdown)

    local gearToggle = section:Toggle({
        Title = "loc:AUTO_BUY_GEAR_TITLE",
        Desc = "loc:AUTO_BUY_GEAR_DESC",
        Default = false,
        Callback = function(state)
            self.gearEnabled = state
            -- Immediately check and buy when enabled
            if state and #self.gearSelected > 0 then
                task.spawn(function()
                    self:TriggerImmediatePurchase()
                end)
            end
        end
    })
    MainConfig:Register("AutoBuyGearEnabled", gearToggle)

    local plantDropdown = section:Dropdown({
        Title = "loc:PLANT_SELECTION_TITLE",
        Desc = "loc:PLANT_SELECTION_DESC",
        Values = self.plantNames,
        Value = {},
        Multi = true,
        AllowNone = true,
        Callback = function(selected)
            self.plantSelected = selected
        end
    })
    MainConfig:Register("AutoBuyPlantsSelection", plantDropdown)

    local plantToggle = section:Toggle({
        Title = "loc:AUTO_BUY_PLANTS_TITLE",
        Desc = "loc:AUTO_BUY_PLANTS_DESC",
        Default = false,
        Callback = function(state)
            self.plantEnabled = state
            -- Immediately check and buy when enabled
            if state and #self.plantSelected > 0 then
                task.spawn(function()
                    self:TriggerImmediatePurchase()
                end)
            end
        end
    })
    MainConfig:Register("AutoBuyPlantsEnabled", plantToggle)

    -- Store references for later config sync
    self._gearDropdown = gearDropdown
    self._plantDropdown = plantDropdown
    self._gearToggle = gearToggle
    self._plantToggle = plantToggle
end

-- Sync state from loaded config (called after config loads)
function AutoShopping:SyncFromConfig()
    if self._gearDropdown then
        self.gearSelected = self._gearDropdown.Value or {}
    end
    if self._plantDropdown then
        self.plantSelected = self._plantDropdown.Value or {}
    end
    if self._gearToggle then
        self.gearEnabled = self._gearToggle.Value or false
    end
    if self._plantToggle then
        self.plantEnabled = self._plantToggle.Value or false
    end
end

-- Scan shop GUI and trigger immediate purchase (used on config load and toggle enable)
function AutoShopping:TriggerImmediatePurchase()
    local player = game.Players.LocalPlayer
    if not player or not player.PlayerGui then return end
    
    local mainGui = player.PlayerGui:FindFirstChild("Main")
    if not mainGui then return end
    
    -- Scan Gears shop
    if self.gearEnabled and #self.gearSelected > 0 then
        local gearsGui = mainGui:FindFirstChild("Gears")
        local gearsItems = {}
        if gearsGui then
            local frame = gearsGui:FindFirstChild("Frame")
            if frame then
                local scrollingFrame = frame:FindFirstChild("ScrollingFrame")
                if scrollingFrame then
                    for _, item in ipairs(scrollingFrame:GetChildren()) do
                        if item:IsA("GuiObject") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" then
                            local stockLabel = item:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                local normalized = stockText:lower()
                                local numeric = normalized:match("x%s*([%d%.]+)") or normalized:match("([%d%.]+)")
                                if numeric then
                                    local quantity = tonumber(numeric)
                                    if quantity and quantity > 0 then
                                        table.insert(gearsItems, {
                                            name = item.Name,
                                            quantity = quantity
                                        })
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if #gearsItems > 0 then
            self:BuyItems(gearsItems, self.gearSelected, self.gearRemote, "gear")
        end
    end
    
    -- Scan Seeds shop
    if self.plantEnabled and #self.plantSelected > 0 then
        local seedsGui = mainGui:FindFirstChild("Seeds")
        local seedsItems = {}
        if seedsGui then
            local frame = seedsGui:FindFirstChild("Frame")
            if frame then
                local scrollingFrame = frame:FindFirstChild("ScrollingFrame")
                if scrollingFrame then
                    for _, item in ipairs(scrollingFrame:GetChildren()) do
                        if item:IsA("GuiObject") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" then
                            local stockLabel = item:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                local normalized = stockText:lower()
                                local numeric = normalized:match("x%s*([%d%.]+)") or normalized:match("([%d%.]+)")
                                if numeric then
                                    local quantity = tonumber(numeric)
                                    if quantity and quantity > 0 then
                                        table.insert(seedsItems, {
                                            name = item.Name,
                                            quantity = quantity
                                        })
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if #seedsItems > 0 then
            self:BuyItems(seedsItems, self.plantSelected, self.plantRemote, "plant")
        end
    end
end

-- Notification Settings Section
NotificationSection = MainTab:Section({
    Title = "loc:RESTOCK_NOTIFICATIONS_SECTION",
    Icon = "lucide:bell",
    Opened = true,
})

NotifyToggle = NotificationSection:Toggle({
    Title = "loc:ENABLE_NOTIFICATIONS_TITLE",
    Desc = "loc:ENABLE_NOTIFICATIONS_DESC",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "loc:NOTIFICATIONS_ENABLED_TITLE",
                Content = "loc:NOTIFICATIONS_ENABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:bell",
            })
        end
    end
})
MainConfig:Register("NotifyEnabled", NotifyToggle)

RarityDropdown = NotificationSection:Dropdown({
    Title = "loc:NOTIFY_RARITIES_TITLE",
    Desc = "loc:NOTIFY_RARITIES_DESC",
    Values = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    Value = { "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    Multi = true,
    AllowNone = false,
    Callback = function(selected)
        -- Dropdown callback updates internal value automatically
    end
})
MainConfig:Register("NotifyRarities", RarityDropdown)

-- Cache for row count to prevent unnecessary updates
local lastRowCount = nil

local function updatePlayerStats()
    local player = game.Players.LocalPlayer
    if not player then return end
    
    -- Get Rebirth
    local rebirth = player:GetAttribute("Rebirth")
    if type(rebirth) == "number" then
        RebirthParagraph:SetDesc(string.format("Current Rebirth: %d", rebirth))
    else
        RebirthParagraph:SetDesc("Rebirth: 0")
    end
    
    -- Get CPS
    local cps = player:GetAttribute("CPS")
    if type(cps) == "number" then
        CPSParagraph:SetDesc(string.format("Earning: $%s/sec", formatNumber(cps)))
    else
        CPSParagraph:SetDesc("CPS: $0/sec")
    end
    
    -- Get Unlocked Rows
    local plotNumber = player:GetAttribute("Plot")
    
    -- Plot attribute is a string, convert it for use
    if plotNumber then
        plotNumber = tostring(plotNumber)
        local workspace = game:GetService("Workspace")
        local plots = workspace:FindFirstChild("Plots")
        
        if plots then
            local playerPlot = plots:FindFirstChild(plotNumber)
            
            if playerPlot then
                local rowsFolder = playerPlot:FindFirstChild("Rows")
                
                if rowsFolder then
                    local unlockedCount = 0
                    local totalRows = 0
                    
                    -- Count rows with "Lawn Mower" model (unlocked indicator)
                    for _, row in ipairs(rowsFolder:GetChildren()) do
                        if row:IsA("Folder") or row:IsA("Model") then
                            totalRows = totalRows + 1
                            local lawnMower = row:FindFirstChild("Lawn Mower")
                            if lawnMower and lawnMower:IsA("Model") then
                                unlockedCount = unlockedCount + 1
                            end
                        end
                    end
                    
                    -- Update UI with current count
                    local currentCount = unlockedCount * 1000 + totalRows -- Combine both values for cache
                    if currentCount ~= lastRowCount then
                        lastRowCount = currentCount
                        RowsParagraph:SetDesc(getLocalizedText("ROWS_UNLOCKED", unlockedCount, totalRows))
                    end
                else
                    if lastRowCount ~= 0 then
                        lastRowCount = 0
                        RowsParagraph:SetDesc("No rows folder found")
                    end
                end
            else
                if lastRowCount ~= -1 then
                    lastRowCount = -1
                    RowsParagraph:SetDesc(string.format("Plot %s not found", plotNumber))
                end
            end
        else
            if lastRowCount ~= -2 then
                lastRowCount = -2
                RowsParagraph:SetDesc("Plots not found in workspace")
            end
        end
    else
        if lastRowCount ~= -999 then
            lastRowCount = -999
            RowsParagraph:SetDesc("Plot number not set")
        end
    end
    
    -- Get Shop Restock Timer from Workspace
    local workspace = game:GetService("Workspace")
    local restockValue = workspace:GetAttribute("NextGearRestock") or workspace:GetAttribute("NextSeedRestock")
    
    if type(restockValue) == "number" then
        RestockParagraph:SetDesc(string.format("Time until restock: %s", formatTime(restockValue)))
        
        -- Enable notifications when timer is between 300-298 (shop just restocked!)
        if restockValue >= 298 and restockValue <= 300 then
            -- Clear notified items for new restock cycle
            if not ShopState.allowNotifications then
                ShopState.notifiedItems = {}
            end
            ShopState.allowNotifications = true
        else
            ShopState.allowNotifications = false
        end
    else
        RestockParagraph:SetDesc("Restock: Unknown")
        ShopState.allowNotifications = false
    end
end

local function updateShopStock()
    local player = game.Players.LocalPlayer
    if not player then return end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return end
    
    local mainGui = playerGui:FindFirstChild("Main")
    if not mainGui then return end
    
    -- Quick data hash to check if anything changed (prevents unnecessary GUI updates)
    local function createShopHash(seedsGui, gearsGui)
        local hash = {}
        
        for _, shopData in ipairs({{shopGui = seedsGui, prefix = "S"}, {shopGui = gearsGui, prefix = "G"}}) do
            if shopData.shopGui then
                local frame = shopData.shopGui:FindFirstChild("Frame")
                if frame then
                    local scrollingFrame = frame:FindFirstChild("ScrollingFrame")
                    if scrollingFrame then
                        for _, item in ipairs(scrollingFrame:GetChildren()) do
                            if item:IsA("GuiObject") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" then
                                local stockLabel = item:FindFirstChild("Stock")
                                if stockLabel and stockLabel:IsA("TextLabel") then
                                    table.insert(hash, shopData.prefix .. item.Name .. ":" .. stockLabel.Text)
                                end
                            end
                        end
                    end
                end
            end
        end
        
        table.sort(hash)
        return table.concat(hash, "|")
    end
    
    local seedsGui = mainGui:FindFirstChild("Seeds")
    local gearsGui = mainGui:FindFirstChild("Gears")
    local currentHash = createShopHash(seedsGui, gearsGui)
    
    -- Only update if data actually changed OR if notifications are enabled (so we can notify about new items)
    if currentHash == ShopState.lastShopData and not ShopState.allowNotifications then
        return
    end
    
    -- Update GUI only if hash changed, but continue to check notifications
    local shouldUpdateGUI = (currentHash ~= ShopState.lastShopData)
    ShopState.lastShopData = currentHash
    
    -- Clear old paragraphs only if we're updating GUI
    if shouldUpdateGUI then
        for _, para in ipairs(ShopState.itemParagraphs) do
            pcall(function() para:Destroy() end)
        end
        ShopState.itemParagraphs = {}
    end
    
    -- Rarity color mapping
    local rarityColors = {
        ["Rare"] = Color3.fromHex("#60A5FA"),      -- Light blue
        ["Epic"] = Color3.fromHex("#C084FC"),      -- Light purple
        ["Legendary"] = Color3.fromHex("#FBBF24"), -- Light yellow
        ["Mythic"] = Color3.fromHex("#F9A8D4"),    -- Light pink
        ["Godly"] = Color3.fromHex("#FCA5A5"),     -- Light red
        ["Secret"] = Color3.fromHex("#9CA3AF"),    -- Gray
    }
    
    -- Rarity ranking (higher = better)
    local rarityRank = {
        ["Secret"] = 6,
        ["Godly"] = 5,
        ["Mythic"] = 4,
        ["Legendary"] = 3,
        ["Epic"] = 2,
        ["Rare"] = 1,
        ["Unknown"] = 0,
    }
    
    local seedsItems = {}
    local gearsItems = {}
    
    -- Function to scan a shop
    local function scanShop(shopGui, itemsTable)
        if not shopGui then return end
        
        local frame = shopGui:FindFirstChild("Frame")
        if not frame then return end
        
        local scrollingFrame = frame:FindFirstChild("ScrollingFrame")
        if not scrollingFrame then return end
        
        for _, item in ipairs(scrollingFrame:GetChildren()) do
            if item:IsA("GuiObject") and item.Name ~= "UIListLayout" and item.Name ~= "UIPadding" then
                local stockLabel = item:FindFirstChild("Stock")
                local rarityLabel = item:FindFirstChild("Rarity")
                
                if stockLabel and stockLabel:IsA("TextLabel") then
                    local stockText = stockLabel.Text
                    local itemName = item.Name
                    local rarity = "Unknown"

                    -- Get rarity if available
                    if rarityLabel and rarityLabel:IsA("TextLabel") then
                        rarity = rarityLabel.Text
                    end

                    local quantity
                    if typeof(stockText) == "string" then
                        local normalized = stockText:lower()
                        local numeric = normalized:match("x%s*([%d%.]+)") or normalized:match("([%d%.]+)")
                        if numeric then
                            quantity = tonumber(numeric)
                        end
                    end

                    if quantity and quantity > 0 then
                        table.insert(itemsTable, {
                            name = itemName,
                            stock = stockText,
                            rarity = rarity,
                            quantity = quantity
                        })
                    end
                end
            end
        end
    end
    
    -- Scan Seeds and Gears shops (already retrieved above for hash)
    scanShop(seedsGui, seedsItems)
    scanShop(gearsGui, gearsItems)
    
    -- Sort function by rarity (highest to lowest)
    local function sortByRarity(a, b)
        local rankA = rarityRank[a.rarity] or 0
        local rankB = rarityRank[b.rarity] or 0
        if rankA == rankB then
            return a.name < b.name -- Alphabetical if same rarity
        end
        return rankA > rankB -- Higher rarity first
    end
    
    table.sort(seedsItems, sortByRarity)
    table.sort(gearsItems, sortByRarity)

    AutoShopping:OnShopUpdate(seedsItems, gearsItems)
    
    -- Helper function to check if item should be notified
    local function shouldNotify(item)
        if not NotifyToggle.Value then return false end
        
        -- Only allow notifications during restock window (prevents notifications on purchases)
        if not ShopState.allowNotifications then return false end
        
        -- Get selected rarities from dropdown
        local selectedRarities = RarityDropdown.Value
        if type(selectedRarities) ~= "table" then return false end
        
        -- Check if rarity is in selected rarities
        local rarityMatch = false
    for _, rarity in ipairs(selectedRarities) do
            if item.rarity == rarity then
                rarityMatch = true
                break
            end
        end
        
        if not rarityMatch then return false end
        
        -- Check if we haven't already notified about this item
        local itemKey = item.name .. "_" .. item.rarity
        if ShopState.notifiedItems[itemKey] then return false end
        
        return true
    end
    
    -- Helper function to send notification
    local function notifyItem(item, emoji)
        local itemKey = item.name .. "_" .. item.rarity
        ShopState.notifiedItems[itemKey] = true
        
        WindUI:Notify({
            Title = string.format("%s %s Restocked!", emoji, item.name),
            Content = string.format("Rarity: %s | Stock: %s", item.rarity, item.stock),
            Duration = 5,
            Icon = "lucide:shopping-cart",
        })
    end
    
    -- Create paragraphs for Seeds first (only if GUI needs update)
    if shouldUpdateGUI then
        if #seedsItems > 0 then
            for _, item in ipairs(seedsItems) do
                local color = rarityColors[item.rarity] or Color3.fromHex("#10B981") -- Default to green
                local para = ShopStatsSection:Paragraph({
                    Title = string.format("🌱 %s", item.name),
                    Desc = string.format("Stock: %s | Rarity: %s", item.stock, item.rarity),
                    Color = color,
                })
                table.insert(ShopState.itemParagraphs, para)
            end
        end
        
        -- Create paragraphs for Gears second
        if #gearsItems > 0 then
            for _, item in ipairs(gearsItems) do
                local color = rarityColors[item.rarity] or Color3.fromHex("#10B981") -- Default to green
                local para = ShopStatsSection:Paragraph({
                    Title = string.format("⚙️ %s", item.name),
                    Desc = string.format("Stock: %s | Rarity: %s", item.stock, item.rarity),
                    Color = color,
                })
                table.insert(ShopState.itemParagraphs, para)
            end
        end
        
        -- Show message if no items are in stock
        if #seedsItems == 0 and #gearsItems == 0 then
            local emptyPara = ShopStatsSection:Paragraph({
                Title = "No Items In Stock",
                Desc = "Shop data will update when restock timer reaches 0",
                Color = Color3.fromHex("#6B7280"), -- Gray
            })
            table.insert(ShopState.itemParagraphs, emptyPara)
        end
    end
    
    -- Check notifications separately (always runs when notifications enabled, regardless of GUI update)
    if ShopState.allowNotifications then
        -- Check Seeds
        for _, item in ipairs(seedsItems) do
            if shouldNotify(item) then
                notifyItem(item, "🌱")
            end
        end
        
        -- Check Gears
        for _, item in ipairs(gearsItems) do
            if shouldNotify(item) then
                notifyItem(item, "⚙️")
            end
        end
    end
end

-- Initial shop stock update
updateShopStock()

-- Main loop - updates player/game stats every 0.5 seconds
task.spawn(function()
    while ShopState.isRunning do
        pcall(updatePlayerStats)
        task.wait(0.5)
    end
end)

-- Shop stock refresh loop - checks every 5 seconds for better performance
task.spawn(function()
    while ShopState.isRunning do
        pcall(updateShopStock)
        task.wait(5) -- 5 seconds to avoid performance issues
    end
end)

-- ========================================
-- PLAYER TAB STRUCTURE
-- ========================================

PlayerTab:Paragraph({
    Title = "loc:PLAYER_PARAGRAPH_TITLE",
    Desc = "loc:PLAYER_PARAGRAPH_DESC",
    Color = Color3.fromHex("#315DFF"),
})

PlayerTab:Divider()

-- Movement Section
MovementSection = PlayerTab:Section({
    Title = "loc:PLAYER_SECTION_TITLE",
    Opened = true,
})

-- Walk Speed Slider
local WalkSpeedSlider = MovementSection:Slider({
    Title = "loc:WALK_SPEED_TITLE",
    Desc = "loc:WALK_SPEED_DESC",
    Step = 1,
    Value = {
        Min = 16,
        Max = 200,
        Default = 16,
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end
})
MainConfig:Register("WalkSpeed", WalkSpeedSlider)

-- Jump Power Slider
local JumpPowerSlider = MovementSection:Slider({
    Title = "loc:JUMP_POWER_TITLE",
    Desc = "loc:JUMP_POWER_DESC",
    Step = 1,
    Value = {
        Min = 50,
        Max = 300,
        Default = 50,
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = value
        end
    end
})
MainConfig:Register("JumpPower", JumpPowerSlider)

-- Multi Jump Toggle
local multiJumpEnabled = false
local MultiJumpToggle = MovementSection:Toggle({
    Title = "loc:MULTI_JUMP_TITLE",
    Desc = "loc:MULTI_JUMP_DESC",
    Default = false,
    Callback = function(state)
        multiJumpEnabled = state
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                if state then
                    game:GetService("UserInputService").JumpRequest:Connect(function()
                        if multiJumpEnabled and humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end)
                end
            end
        end
    end
})
MainConfig:Register("MultiJump", MultiJumpToggle)

-- Fly Toggle
local flyEnabled = false
local flySpeed = 50
local FlyToggle = MovementSection:Toggle({
    Title = "loc:FLY_TITLE",
    Desc = "loc:FLY_DESC",
    Default = false,
    Callback = function(state)
        flyEnabled = state
        local player = game.Players.LocalPlayer
        if not player or not player.Character then return end
        
        local humanoid = player.Character:FindFirstChild("Humanoid")
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        
        if state then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "FlyVelocity"
            bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = rootPart
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.Name = "FlyGyro"
            bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bodyGyro.CFrame = rootPart.CFrame
            bodyGyro.Parent = rootPart
            
            game:GetService("RunService").RenderStepped:Connect(function()
                if not flyEnabled or not rootPart or not rootPart:FindFirstChild("FlyVelocity") then return end
                
                local camera = workspace.CurrentCamera
                local moveDirection = Vector3.new()
                
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                    moveDirection = moveDirection + (camera.CFrame.LookVector)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                    moveDirection = moveDirection - (camera.CFrame.LookVector)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                    moveDirection = moveDirection - (camera.CFrame.RightVector)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                    moveDirection = moveDirection + (camera.CFrame.RightVector)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    moveDirection = moveDirection + Vector3.new(0, 1, 0)
                end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDirection = moveDirection - Vector3.new(0, 1, 0)
                end
                
                bodyVelocity.Velocity = moveDirection * flySpeed
                bodyGyro.CFrame = camera.CFrame
            end)
        else
            if rootPart then
                if rootPart:FindFirstChild("FlyVelocity") then
                    rootPart.FlyVelocity:Destroy()
                end
                if rootPart:FindFirstChild("FlyGyro") then
                    rootPart.FlyGyro:Destroy()
                end
            end
        end
    end
})
MainConfig:Register("Fly", FlyToggle)

local RowStatsSection = VisualTab:Section({
    Title = "loc:ROW_STATS_SECTION",
    Icon = "lucide:list-tree",
    Opened = true,
})

RowStatsSection:Paragraph({
    Title = "loc:ROW_STATS_OVERLAY_TITLE",
    Desc = "loc:ROW_STATS_OVERLAY_DESC",
})

local RowStatsToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_ROW_STATS_TITLE",
    Desc = "loc:SHOW_ROW_STATS_DESC",
    Default = false,
    Callback = function(state)
        RowStatistics:OnToggle(state)
    end
})
MainConfig:Register("RowStatisticsEnabled", RowStatsToggle)
RowStatistics._toggle = RowStatsToggle

local RowStatsHeaderToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_ROW_HEADER_TITLE",
    Desc = "loc:SHOW_ROW_HEADER_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("showRowHeader", state)
    end
})
MainConfig:Register("RowStatisticsShowHeader", RowStatsHeaderToggle)
RowStatistics._headerToggle = RowStatsHeaderToggle

local RowStatsCountToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_PLANT_COUNT_TITLE",
    Desc = "loc:SHOW_PLANT_COUNT_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("showPlantCount", state)
    end
})
MainConfig:Register("RowStatisticsShowPlantCount", RowStatsCountToggle)
RowStatistics._plantCountToggle = RowStatsCountToggle

local RowStatsPlantListToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_PLANT_DETAILS_TITLE",
    Desc = "loc:SHOW_PLANT_DETAILS_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("showPlantList", state)
    end
})
MainConfig:Register("RowStatisticsShowPlantList", RowStatsPlantListToggle)
RowStatistics._plantListToggle = RowStatsPlantListToggle

local RowStatsTotalToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_TOTAL_DAMAGE_TITLE",
    Desc = "loc:SHOW_TOTAL_DAMAGE_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("showTotalDamage", state)
    end
})
MainConfig:Register("RowStatisticsShowTotalDamage", RowStatsTotalToggle)
RowStatistics._totalDamageToggle = RowStatsTotalToggle

local RowStatsEmptyToggle = RowStatsSection:Toggle({
    Title = "loc:SHOW_EMPTY_ROW_TITLE",
    Desc = "loc:SHOW_EMPTY_ROW_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("showEmptyMessage", state)
    end
})
MainConfig:Register("RowStatisticsShowEmptyMessage", RowStatsEmptyToggle)
RowStatistics._emptyMessageToggle = RowStatsEmptyToggle

local RowStatsHighlightToggle = RowStatsSection:Toggle({
    Title = "loc:HIGHLIGHT_WEAKEST_TITLE",
    Desc = "loc:HIGHLIGHT_WEAKEST_DESC",
    Default = true,
    Callback = function(state)
        RowStatistics:SetDisplayOption("highlightWeakest", state)
    end
})
MainConfig:Register("RowStatisticsHighlightWeakest", RowStatsHighlightToggle)
RowStatistics._highlightToggle = RowStatsHighlightToggle

-- Seed the display options with current toggle values so the overlay reflects saved config states
RowStatistics:SetDisplayOption("showRowHeader", RowStatsHeaderToggle.Value)
RowStatistics:SetDisplayOption("showPlantCount", RowStatsCountToggle.Value)
RowStatistics:SetDisplayOption("showPlantList", RowStatsPlantListToggle.Value)
RowStatistics:SetDisplayOption("showTotalDamage", RowStatsTotalToggle.Value)
RowStatistics:SetDisplayOption("showEmptyMessage", RowStatsEmptyToggle.Value)
RowStatistics:SetDisplayOption("highlightWeakest", RowStatsHighlightToggle.Value)

-- ========================================
-- MISC TAB STRUCTURE
-- ========================================

MiscTab:Paragraph({
    Title = "loc:MISC_PARAGRAPH_TITLE",
    Desc = "loc:MISC_PARAGRAPH_DESC",
    Color = Color3.fromHex("#FFD700"),
})

MiscTab:Divider()
MiscTab:Divider()

AutoShopping:MountUI(MiscTab)

-- ========================================
-- AUTO FREEZE BRAINROTS SYSTEM
-- ========================================

local AutoFreeze = {
    enabled = false,
    gearOptions = { "Frost Grenade", "Frost Blower" },
    selectedGears = { "Frost Grenade" },
    priority = "Health",
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    selectedRarities = { "Legendary" },
    minHealth = 2000, -- Must match slider default
    loop = nil,
    lastUsedTime = 0,
    cooldown = 0.5, -- Cooldown between checks (Frost Blower has its own 3.5s internal cooldown)
    rejectedBrainrots = {}, -- Track brainrots that failed health/boss criteria (skip them)
    cleanupInterval = 30, -- Clean up tracking every 30 seconds
    lastCleanup = 0,
    _suppressGearCallback = false,
}

local function sanitizeGearSelection(selection, allowedList, fallback)
    local sanitized = {}
    local seen = {}

    if type(selection) == "table" then
        for _, item in ipairs(selection) do
            if table.find(allowedList, item) and not seen[item] then
                table.insert(sanitized, item)
                seen[item] = true
            end
        end
    elseif type(selection) == "string" then
        if table.find(allowedList, selection) then
            table.insert(sanitized, selection)
            seen[selection] = true
        end
    end

    if #sanitized == 0 then
        if type(fallback) == "table" then
            for _, item in ipairs(fallback) do
                if table.find(allowedList, item) and not seen[item] then
                    table.insert(sanitized, item)
                    seen[item] = true
                end
            end
        elseif type(fallback) == "string" and table.find(allowedList, fallback) then
            table.insert(sanitized, fallback)
            seen[fallback] = true
        end
    end

    if #sanitized == 0 and allowedList[1] then
        table.insert(sanitized, allowedList[1])
    end

    return sanitized
end

function AutoFreeze:SetSelectedGears(selection, options)
    options = options or {}
    local sanitized = sanitizeGearSelection(selection, self.gearOptions, self.selectedGears)

    local previous = self.selectedGears or {}
    local changed = (#sanitized ~= #previous)

    if not changed then
        for index, gear in ipairs(sanitized) do
            if previous[index] ~= gear then
                changed = true
                break
            end
        end
    end

    self.selectedGears = sanitized

    if options.syncDropdown and self._gearDropdown then
        self._suppressGearCallback = true
        self._gearDropdown:Select(self.selectedGears)
        self._suppressGearCallback = false
    end

    return changed
end

function AutoFreeze:GetSelectedGearLabel()
    if not self.selectedGears or #self.selectedGears == 0 then
        return self.gearOptions[1] or "Frost Grenade"
    end
    return table.concat(self.selectedGears, ", ")
end

function AutoFreeze:GetSelectedGears()
    if not self.selectedGears or #self.selectedGears == 0 then
        self.selectedGears = { self.gearOptions[1] }
    end
    return self.selectedGears
end

function AutoFreeze:SetRaritySelection(selection, options)
    options = options or {}
    local sanitized = sanitizeGearSelection(selection, self.rarityOptions, self.selectedRarities)

    local previous = self.selectedRarities or {}
    local changed = (#sanitized ~= #previous)

    if not changed then
        for index, rarity in ipairs(sanitized) do
            if previous[index] ~= rarity then
                changed = true
                break
            end
        end
    end

    self.selectedRarities = sanitized

    if options.syncDropdown and self._rarityDropdown then
        self._rarityDropdown:Select(self.selectedRarities)
    end

    if changed and self.priority == "Rarity" then
        self.rejectedBrainrots = {}
    end

    return changed
end

AutoFreeze:SetSelectedGears(AutoFreeze.selectedGears)
AutoFreeze:SetRaritySelection(AutoFreeze.selectedRarities)

function AutoFreeze:FindGearInBackpack(gearName)
    local player = game.Players.LocalPlayer
    if not player then return nil end
    
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        return nil 
    end
    
    -- Search for gear with pattern matching (e.g., [x62] Frost Grenade)
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name, gearName) then
            return item
        end
    end
    
    return nil
end

function AutoFreeze:FindGearInWorkspace(gearName)
    local player = game.Players.LocalPlayer
    if not player then return nil end
    
    local character = player.Character
    if not character then return nil end
    
    local workspacePlayers = workspace:FindFirstChild("Players")
    if not workspacePlayers then 
        return nil 
    end

    local playerFolder = workspacePlayers:FindFirstChild(player.Name)
    if not playerFolder then 
        return nil 
    end
    
    -- Search for gear in workspace
    for _, item in ipairs(playerFolder:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name, gearName) then
            return item
        end
    end
    
    return nil
end

function AutoFreeze:GetTargetBrainrots()
    local player = game.Players.LocalPlayer
    if not player then return {} end
    
    local playerPlot = tostring(player:GetAttribute("Plot") or "")
    if playerPlot == "" then 
        return {} 
    end
    
    local brainrotsFolder = workspace:FindFirstChild("ScriptedMap")
    if brainrotsFolder then
        brainrotsFolder = brainrotsFolder:FindFirstChild("Brainrots")
    end
    if not brainrotsFolder then 
        return {} 
    end
    
    local targets = {}
    
    for _, brainrot in ipairs(brainrotsFolder:GetChildren()) do
        if brainrot:IsA("Model") then
            local brainrotId = brainrot.Name -- Use the brainrot's unique name as ID
            
            -- Skip if already rejected (failed health/boss check)
            if self.rejectedBrainrots[brainrotId] then
                continue
            end
            
            local plot = brainrot:GetAttribute("Plot")
            local progress = brainrot:GetAttribute("Progress")
            local maxHealth = brainrot:GetAttribute("MaxHealth")
            local isBoss = brainrot:GetAttribute("Boss")
            local rarity = tostring(brainrot:GetAttribute("Rarity") or "")
            
            -- Filter by plot and progress
            if tostring(plot) == playerPlot and type(progress) == "number" and progress >= 0.65 then
                -- Apply priority filter
                local shouldTarget = false
                
                if self.priority == "Boss only" then
                    shouldTarget = (isBoss == true)
                elseif self.priority == "Health" then
                    shouldTarget = (type(maxHealth) == "number" and maxHealth >= self.minHealth)
                elseif self.priority == "Rarity" then
                    if rarity ~= "" then
                        shouldTarget = table.find(self.selectedRarities, rarity) ~= nil
                    end
                end
                
                if shouldTarget then
                    -- This brainrot meets criteria - keep checking it (might unfreeze)
                    table.insert(targets, {
                        model = brainrot,
                        id = brainrotId,
                        health = maxHealth or 0,
                        isBoss = isBoss or false,
                        progress = progress,
                        rarity = rarity,
                    })
                else
                    -- Mark as rejected (doesn't meet health/boss criteria)
                    -- Won't check this one again since health won't increase
                    self.rejectedBrainrots[brainrotId] = true
                end
            end
        end
    end
    
    -- Sort by progress (closer to end = higher priority)
    table.sort(targets, function(a, b)
        return a.progress > b.progress
    end)
    
    return targets
end

function AutoFreeze:UseFrostGrenade(brainrot)
    local player = game.Players.LocalPlayer
    if not player then return false end
    
    -- First, check if Frost Grenade is already equipped (in workspace)
    local gear = self:FindGearInWorkspace("Frost Grenade")
    
    -- If not equipped, find it in backpack and equip it
    if not gear then
        gear = self:FindGearInBackpack("Frost Grenade")
        if not gear then
            return false
        end
        
        -- Equip the tool
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:EquipTool(gear)
            task.wait(0.2) -- Wait for equip to complete
            
            -- Verify it's now equipped
            gear = self:FindGearInWorkspace("Frost Grenade")
            if not gear then
                return false
            end
        else
            return false
        end
    end
    
    local rootPart = brainrot.model:FindFirstChild("HumanoidRootPart") or brainrot.model:FindFirstChild("Torso") or brainrot.model.PrimaryPart
    if not rootPart then 
        return false 
    end
    
    local pos = rootPart.Position
    
    local remote = game:GetService("ReplicatedStorage").Remotes.UseItem
    if not remote then 
        return false 
    end
    
    local success = pcall(function()
        local arguments = {
            ["Toggle"] = true,
            ["Tool"] = gear,
            ["Time"] = 0.5,
            ["Pos"] = pos
        }
        remote:FireServer(arguments)
    end)
    
    if success then
        -- Wait 3 seconds cooldown before it can be used again
        task.wait(3.0)
    end
    
    return success
end

function AutoFreeze:UseFrostBlower(brainrot)
    local player = game.Players.LocalPlayer
    if not player then return false end
    
    -- First, check if Frost Blower is already equipped (in workspace)
    local gear = self:FindGearInWorkspace("Frost Blower")
    
    -- If not equipped, find it in backpack and equip it
    if not gear then
        gear = self:FindGearInBackpack("Frost Blower")
        if not gear then
            return false
        end
        
        -- Equip the tool
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:EquipTool(gear)
            task.wait(0.2) -- Wait for equip to complete
            
            -- Verify it's now equipped
            gear = self:FindGearInWorkspace("Frost Blower")
            if not gear then
                return false
            end
        else
            return false
        end
    end
    
    -- Get player's character and root part
    if not player.Character then 
        return false 
    end
    
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then 
        return false 
    end
    
    -- Get brainrot's root part
    local rootPart = brainrot.model:FindFirstChild("HumanoidRootPart") or brainrot.model:FindFirstChild("Torso") or brainrot.model.PrimaryPart
    if not rootPart then 
        return false 
    end
    
    -- Teleport behind brainrot (5.5 studs back) and face it
    local brainrotPos = rootPart.Position
    local offset = (rootPart.CFrame.LookVector * 10) -- 5.5 studs behind
    local teleportPos = brainrotPos + offset
    humanoidRootPart.CFrame = CFrame.new(teleportPos, brainrotPos) -- Face the brainrot
    
    local remote = game:GetService("ReplicatedStorage").Remotes.UseItem
    if not remote then 
        return false 
    end
    
    -- Activate Frost Blower (Toggle = true)
    local activateSuccess = pcall(function()
        local arguments = {
            ["Tool"] = gear,
            ["Toggle"] = true
        }
        remote:FireServer(arguments)
    end)
    
    if not activateSuccess then
        return false
    end
    
    -- Keep it active for 0.3 seconds to freeze the brainrot
    task.wait(0.3)
    
    -- Deactivate Frost Blower (Toggle = false)
    local deactivateSuccess = pcall(function()
        local arguments = {
            ["Tool"] = gear,
            ["Toggle"] = false
        }
        remote:FireServer(arguments)
    end)
    
    if not deactivateSuccess then
        return false
    end
    
    -- Wait 3.5 seconds cooldown before it can be used again
    task.wait(3.5)
    
    return true
end

function AutoFreeze:Start()
    if self.loop then return end
    
    -- Clear tracking when starting
    self.rejectedBrainrots = {}
    self.lastCleanup = tick()
    
    self.loop = task.spawn(function()
        while self.enabled do
            pcall(function()
                -- Periodic cleanup: Clear processed brainrots that no longer exist
                local currentTime = tick()
                if currentTime - self.lastCleanup >= self.cleanupInterval then
                    local brainrotsFolder = workspace:FindFirstChild("ScriptedMap")
                    if brainrotsFolder then
                        brainrotsFolder = brainrotsFolder:FindFirstChild("Brainrots")
                    end
                    
                    if brainrotsFolder then
                        local existingIds = {}
                        for _, brainrot in ipairs(brainrotsFolder:GetChildren()) do
                            existingIds[brainrot.Name] = true
                        end
                        
                        -- Remove rejected brainrots that no longer exist
                        for id in pairs(self.rejectedBrainrots) do
                            if not existingIds[id] then
                                self.rejectedBrainrots[id] = nil
                            end
                        end
                    end
                    
                    self.lastCleanup = currentTime
                end
                
                local targets = self:GetTargetBrainrots()
                
                if #targets > 0 then
                    local currentTime = tick()
                    if currentTime - self.lastUsedTime >= self.cooldown then
                        local target = targets[1] -- Highest priority

                        local success = false
                        for _, gearName in ipairs(self:GetSelectedGears()) do
                            if gearName == "Frost Grenade" then
                                success = self:UseFrostGrenade(target)
                            elseif gearName == "Frost Blower" then
                                success = self:UseFrostBlower(target)
                            end

                            if success then
                                break
                            end
                        end

                        if success then
                            self.lastUsedTime = currentTime
                            -- Don't mark as processed - keep freezing it (might unfreeze)
                        end
                    end
                end
            end)
            
            task.wait(0.5) -- Check every 0.5 seconds
        end
    end)
end

function AutoFreeze:Stop()
    if self.loop then
        task.cancel(self.loop)
        self.loop = nil
    end
    -- Clear tracking when stopping
    self.rejectedBrainrots = {}
end

-- Sync state from loaded config (called after config loads)
function AutoFreeze:SyncFromConfig()
    if self._gearDropdown then
        self:SetSelectedGears(self._gearDropdown.Value, { syncDropdown = true })
    end
    if self._priorityDropdown then
        self.priority = self._priorityDropdown.Value or "Health"
    end
    if self._rarityDropdown then
        self:SetRaritySelection(self._rarityDropdown.Value, { syncDropdown = true })
        if self.priority == "Rarity" then
            self._rarityDropdown:Unlock()
        else
            self._rarityDropdown:Lock()
        end
    end
    if self._healthSlider then
        self.minHealth = tonumber(self._healthSlider.Value) or 2000
        if self.priority == "Health" then
            self._healthSlider:Unlock()
        else
            self._healthSlider:Lock()
        end
    end
    if self.priority == "Rarity" then
        self.rejectedBrainrots = {}
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
    end
end

-- ========================================
-- AUTO ATTACK SYSTEM
-- ========================================

local AutoAttack = {
    enabled = false,
    priority = "Health",
    minHealth = 2000,
    teleportOptions = { "On brainrot", "Below brainrot" },
    teleportMode = "On brainrot",
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    selectedRarities = { "Legendary" },
    loop = nil,
    cooldown = 0.2,
    lastUsedTime = 0,
    originalCFrame = nil,
    currentTargetModel = nil,
    currentTargetId = nil,
    _noclipConnection = nil,
    _followConnection = nil,
    _humanoidStateRestore = {},
}

function AutoAttack:FindBatInBackpack()
    local player = game.Players.LocalPlayer
    if not player then return nil end

    local backpack = player:FindFirstChild("Backpack")
    if not backpack then
        return nil
    end

    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name, "Bat") then
            return item
        end
    end

    return nil
end

function AutoAttack:FindBatInWorkspace()
    local player = game.Players.LocalPlayer
    if not player then return nil end

    local workspacePlayers = workspace:FindFirstChild("Players")
    if not workspacePlayers then
        return nil
    end

    local playerFolder = workspacePlayers:FindFirstChild(player.Name)
    if not playerFolder then
        return nil
    end

    for _, item in ipairs(playerFolder:GetChildren()) do
        if item:IsA("Tool") and string.find(item.Name, "Bat") then
            return item
        end
    end

    return nil
end

function AutoAttack:EnsureBatEquipped()
    if self:FindBatInWorkspace() then
        return true
    end

    local player = game.Players.LocalPlayer
    if not player then return false end

    local batInBackpack = self:FindBatInBackpack()
    if not batInBackpack then
        return false
    end

    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid:EquipTool(batInBackpack)
        task.wait(0.1)
        return self:FindBatInWorkspace() ~= nil
    end

    return false
end

function AutoAttack:SetRaritySelection(selection, options)
    options = options or {}
    local sanitized = sanitizeGearSelection(selection, self.rarityOptions, self.selectedRarities)

    local previous = self.selectedRarities or {}
    local changed = (#sanitized ~= #previous)

    if not changed then
        for index, rarity in ipairs(sanitized) do
            if previous[index] ~= rarity then
                changed = true
                break
            end
        end
    end

    self.selectedRarities = sanitized

    if options.syncDropdown and self._rarityDropdown then
        self._rarityDropdown:Select(self.selectedRarities)
    end

    return changed
end

AutoAttack:SetRaritySelection(AutoAttack.selectedRarities)

function AutoAttack:SetCharacterCollision(canCollide)
    local player = game.Players.LocalPlayer
    if not player then return end

    local character = player.Character
    if not character then return end

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = canCollide
        end
    end
end

function AutoAttack:SetPlatformStandingEnabled(enabled)
    local player = game.Players.LocalPlayer
    if not player then
        return
    end

    local character = player.Character
    if not character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

    local key = "PlatformStanding"
    if enabled then
        local previous = self._humanoidStateRestore[key]
        humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, previous == nil and true or previous)
        self._humanoidStateRestore[key] = nil
    else
        if self._humanoidStateRestore[key] == nil then
            self._humanoidStateRestore[key] = humanoid:GetStateEnabled(Enum.HumanoidStateType.PlatformStanding)
        end
        humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
    end
end

function AutoAttack:GetFollowOffset()
    if self.teleportMode == "Below brainrot" then
        return Vector3.new(0, -10, 0)
    end
    return Vector3.new(0, 0, 0)
end

function AutoAttack:DetachFromBrainrot()
    if self._followConnection then
        self._followConnection:Disconnect()
        self._followConnection = nil
    end
    self.currentTargetModel = nil
    self.currentTargetId = nil
end

function AutoAttack:AttachToBrainrot(brainrotModel)
    if not brainrotModel or not brainrotModel.Parent then
        return false
    end

    local primaryPart = brainrotModel.PrimaryPart
    if not primaryPart then
        return false
    end

    local player = game.Players.LocalPlayer
    if not player then
        return false
    end

    local character = player.Character
    if not character then
        return false
    end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        return false
    end

    self:DetachFromBrainrot()

    local function step()
        if not self.enabled then
            return false
        end

        if not brainrotModel.Parent then
            return false
        end

        local targetPrimary = brainrotModel.PrimaryPart
        if not targetPrimary then
            return false
        end

        local currentPlayer = game.Players.LocalPlayer
        if not currentPlayer then
            return false
        end

        local currentCharacter = currentPlayer.Character
        if not currentCharacter then
            return false
        end

        local currentRoot = currentCharacter:FindFirstChild("HumanoidRootPart")
        if not currentRoot then
            return false
        end

        local offset = self:GetFollowOffset()
        local destination = targetPrimary.Position + offset
        local lookVector = targetPrimary.CFrame.LookVector
        lookVector = Vector3.new(lookVector.X, 0, lookVector.Z)
        if lookVector.Magnitude < 0.1 then
            lookVector = Vector3.new(0, 0, -1)
        else
            lookVector = lookVector.Unit
        end

        currentRoot.CFrame = CFrame.new(destination, destination + lookVector)
        currentRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        currentRoot.Velocity = Vector3.new(0, 0, 0)
        currentRoot.RotVelocity = Vector3.new(0, 0, 0)

        return true
    end

    local initialSuccess = step()
    if not initialSuccess then
        self:DetachFromBrainrot()
        return false
    end

    self.currentTargetModel = brainrotModel
    self.currentTargetId = brainrotModel.Name

    self._followConnection = RunService.Heartbeat:Connect(function()
        if not step() then
            self:DetachFromBrainrot()
        end
    end)

    return true
end

function AutoAttack:EnableNoclip()
    self:DisableNoclip()
    self:SetCharacterCollision(false)
    self:SetPlatformStandingEnabled(false)

    self._noclipConnection = RunService.Stepped:Connect(function()
        self:SetCharacterCollision(false)

        local player = game.Players.LocalPlayer
        if not player then
            return
        end

        local character = player.Character
        if not character then
            return
        end

        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            return
        end

        humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        humanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.RunningNoPhysics then
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        end
    end)
end

function AutoAttack:DisableNoclip()
    if self._noclipConnection then
        self._noclipConnection:Disconnect()
        self._noclipConnection = nil
    end

    self:SetCharacterCollision(true)
    self:SetPlatformStandingEnabled(true)

    local player = game.Players.LocalPlayer
    if player then
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
    end
end

function AutoAttack:GetTargetBrainrots()
    local player = game.Players.LocalPlayer
    if not player then return {} end

    local playerPlot = tostring(player:GetAttribute("Plot") or "")
    if playerPlot == "" then
        return {}
    end

    local brainrotsFolder = workspace:FindFirstChild("ScriptedMap")
    if brainrotsFolder then
        brainrotsFolder = brainrotsFolder:FindFirstChild("Brainrots")
    end
    if not brainrotsFolder then
        return {}
    end

    local targets = {}

    for _, brainrot in ipairs(brainrotsFolder:GetChildren()) do
        if brainrot:IsA("Model") then
            local plot = brainrot:GetAttribute("Plot")
            if tostring(plot) == playerPlot then
                local maxHealth = brainrot:GetAttribute("MaxHealth")
                local isBoss = brainrot:GetAttribute("Boss") == true
                local rarity = tostring(brainrot:GetAttribute("Rarity") or "")

                local shouldTarget = false
                if self.priority == "Boss only" then
                    shouldTarget = isBoss
                elseif self.priority == "Health" then
                    shouldTarget = (type(maxHealth) == "number" and maxHealth >= self.minHealth)
                elseif self.priority == "Rarity" then
                    if rarity ~= "" then
                        shouldTarget = table.find(self.selectedRarities, rarity) ~= nil
                    end
                end

                if shouldTarget then
                    table.insert(targets, {
                        model = brainrot,
                        id = brainrot.Name,
                        health = maxHealth or 0,
                        isBoss = isBoss,
                        rarity = rarity,
                    })
                end
            end
        end
    end

    table.sort(targets, function(a, b)
        return (a.health or 0) > (b.health or 0)
    end)

    return targets
end

function AutoAttack:PerformAttack(targetId)
    if not targetId then
        return false
    end

    local remoteParent = game:GetService("ReplicatedStorage").Remotes
    if not remoteParent then
        return false
    end

    local remote = remoteParent:FindFirstChild("AttacksServer")
    if not remote or not remote:FindFirstChild("WeaponAttack") then
        return false
    end

    local weaponAttack = remote.WeaponAttack
    local arguments = { { targetId } }

    local success = pcall(function()
        weaponAttack:FireServer(unpack(arguments))
    end)

    return success
end

function AutoAttack:Start()
    if self.loop then return end

    self.lastUsedTime = 0

    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            self.originalCFrame = humanoidRootPart.CFrame
        end
    end

    self:EnableNoclip()

    self.loop = task.spawn(function()
        while self.enabled do
            local targets = self:GetTargetBrainrots()
            if #targets > 0 and self:EnsureBatEquipped() then
                local primaryTarget = targets[1]
                local brainrotModel = primaryTarget.model

                if brainrotModel then
                    if self.currentTargetModel ~= brainrotModel or self.currentTargetId ~= primaryTarget.id then
                        self:AttachToBrainrot(brainrotModel)
                    end
                end

                if primaryTarget.id and self:PerformAttack(primaryTarget.id) then
                    self.lastUsedTime = tick()
                    task.wait(self.cooldown)
                else
                    task.wait(0.2)
                end
            else
                if self.currentTargetModel then
                    self:DetachFromBrainrot()
                end
                task.wait(0.2)
            end
        end
    end)
end

function AutoAttack:Stop()
    if self.loop then
        task.cancel(self.loop)
        self.loop = nil
    end

    self:DetachFromBrainrot()
    self:DisableNoclip()

    local targetCFrame = self.originalCFrame
    self.originalCFrame = nil

    if targetCFrame then
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = targetCFrame
            end
        end
    end
end

function AutoAttack:SyncFromConfig()
    if self._priorityDropdown then
        self.priority = self._priorityDropdown.Value or "Health"
        if self._rarityDropdown then
            if self.priority == "Rarity" then
                self._rarityDropdown:Unlock()
            else
                self._rarityDropdown:Lock()
            end
        end
        if self._healthSlider then
            if self.priority == "Health" then
                self._healthSlider:Unlock()
            else
                self._healthSlider:Lock()
            end
        end
    end
    if self._teleportDropdown then
        local selected = self._teleportDropdown.Value or self.teleportOptions[1]
        if not table.find(self.teleportOptions, selected) then
            selected = self.teleportOptions[1]
            self._teleportDropdown:Select(selected)
        end
        self.teleportMode = selected
    end
    if self._rarityDropdown then
        self:SetRaritySelection(self._rarityDropdown.Value, { syncDropdown = true })
    end
    if self._healthSlider then
        self.minHealth = tonumber(self._healthSlider.Value) or 2000
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
    end
end

-- ========================================
-- INVENTORY AUTOMATION SYSTEMS
-- ========================================

local InventoryUtils = {}

function InventoryUtils:GetBackpack()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end

    return player:FindFirstChild("Backpack")
end

function InventoryUtils.GetRemote(name)
    if type(name) ~= "string" or name == "" then
        return nil
    end

    local remotesFolder = Remotes or ReplicatedStorage:FindFirstChild("Remotes")
    if not remotesFolder then
        return nil
    end

    return remotesFolder:FindFirstChild(name)
end

function InventoryUtils.SanitizeName(name)
    if type(name) ~= "string" then
        return ""
    end

    local cleaned = name:gsub("%b[]", "")
    cleaned = cleaned:gsub("%s+", " ")
    cleaned = cleaned:gsub("^%s+", "")
    cleaned = cleaned:gsub("%s+$", "")
    -- Remove trailing tier suffixes: ' I', ' II', ' III', ' IV', ' V'
    cleaned = cleaned:gsub("%s+I?V%s*$", "")  -- Matches IV or V
    cleaned = cleaned:gsub("%s+I+%s*$", "")   -- Matches I, II, III
    return cleaned
end

local function coerceNumber(value)
    if type(value) == "number" then
        return value
    end

    if type(value) == "string" then
        local numeric = tonumber(value)
        if numeric then
            return numeric
        end
    end

    return nil
end

local function extractValue(container, key)
    if not container or type(key) ~= "string" then
        return nil
    end

    local attributeValue = container:GetAttribute(key)
    if attributeValue ~= nil then
        return attributeValue
    end

    local child = container:FindFirstChild(key)
    if child then
        if child:IsA("StringValue") or child:IsA("IntValue") or child:IsA("NumberValue") or child:IsA("BoolValue") then
            return child.Value
        end
    end

    return nil
end

function InventoryUtils:GetItemInfo(item)
    if not item then
        return nil
    end

    local cleanName = InventoryUtils.SanitizeName(item.Name or "")
    if cleanName == "" then
        return nil
    end

    local info = {
        instance = item,
        rawName = item.Name,
        cleanName = cleanName,
    }

    info.id = extractValue(item, "ID") or extractValue(item, "Id") or extractValue(item, "id")

    local detailsContainer = item:FindFirstChild(cleanName)
    if detailsContainer then
        info.rarity = extractValue(detailsContainer, "Rarity") or extractValue(item, "Rarity")
        info.worth = coerceNumber(extractValue(detailsContainer, "Worth") or extractValue(item, "Worth"))
        info.category = extractValue(detailsContainer, "Category") or extractValue(detailsContainer, "Type") or extractValue(item, "Category") or extractValue(item, "Type")

        local favoriteState = extractValue(detailsContainer, "Favorited") or extractValue(detailsContainer, "Favorite")
        if favoriteState == nil then
            favoriteState = extractValue(item, "Favorited") or extractValue(item, "Favorite")
        end
        info.favorited = favoriteState == true
    else
        info.rarity = extractValue(item, "Rarity")
        info.worth = coerceNumber(extractValue(item, "Worth"))
        info.category = extractValue(item, "Category") or extractValue(item, "Type")
        local favoriteState = extractValue(item, "Favorited") or extractValue(item, "Favorite")
        info.favorited = favoriteState == true
    end

    return info
end

function InventoryUtils:ClassifyItem(info, brainrotSet, plantSet)
    if not info then
        return "other"
    end

    if info.category and type(info.category) == "string" then
        local lowered = string.lower(info.category)
        if lowered:find("brainrot") then
            return "brainrot"
        elseif lowered:find("plant") or lowered:find("seed") then
            return "plant"
        end
    end

    if brainrotSet and brainrotSet[info.cleanName] then
        return "brainrot"
    end

    if plantSet and plantSet[info.cleanName] then
        return "plant"
    end

    if info.cleanName:lower():find("egg") then
        return "egg"
    end

    if info.worth and info.worth > 0 then
        return "brainrot"
    end

    return "other"
end

function InventoryUtils:FavoriteItemById(id)
    if type(id) ~= "string" or id == "" then
        return false
    end

    local remote = InventoryUtils.GetRemote("FavoriteItem")
    if not remote then
        return false
    end

    local success = pcall(function()
        remote:FireServer(id)
    end)

    return success == true
end

function InventoryUtils:PruneProcessed(processedMap, currentIds)
    if type(processedMap) ~= "table" then
        return
    end

    for id in pairs(processedMap) do
        if not currentIds[id] then
            processedMap[id] = nil
        end
    end
end

local BrainrotFavoriteNames = {
    "Boneca Ambalabu",
    "Fluri Flura",
    "Trulimero Trulicina",
    "Lirili Larila",
    "Noobini Bananini",
    "Orangutini Ananassini",
    "Pipi Kiwi",
    "Noobini Cactusini (fused)",
    "Orangutini Strawberrini (fused)",
    "Espresso Signora",
    "Tim Cheese",
    "Agarrini La Palini",
    "Bambini Crostini",
    "Alessio",
    "Bandito Bobrito",
    "Trippi Troppi",
    "Brr Brr Patapim",
    "Cappuccino Assasino",
    "Svinino Bombondino",
    "Brr Brr Sunflowerini (fused)",
    "Svinino Pumpkinino (fused)",
    "Orcalero Orcala",
    "Las Tralaleritas",
    "Ballerina Cappuccina",
    "Bananita Dolphinita",
    "Burbaloni Lulliloli",
    "Elefanto Cocofanto",
    "Gangster Footera",
    "Madung",
    "Dragonfrutina Dolphinita (fused)",
    "Eggplantini Burbalonini (fused)",
    "Bombini Gussini",
    "Frigo Camelo",
    "Bombardilo Watermelondrilo (fused)",
    "Bombardiro Crocodilo",
    "Giraffa Celeste",
    "Matteo",
    "Odin Din Din Dun",
    "Tralalelo Tralala",
    "Cocotanko Giraffanto (fused)",
    "Carnivourita Tralalerita (fused)",
    "Vacca Saturno Saturnita",
    "Garamararam",
    "Los Tralaleritos",
    "Los Mr Carrotitos (fused)",
    "Blueberrinni Octopussini",
    "Pot Hotspot",
    "Brri Brri Bicus Dicus Bombicus",
    "Crazylone Pizalone",
    "Bredda Ratto",
    "Armini Bodybuilderini",
    "67",
    "Squalo Cavallo",
    "Gottolini Owl",
    "Hotspotini Burrito",
    "Ospedale",
    "Rhino Toasterino",
    "Chef Cabracadabra",
    "Dragon Cannelloni",
    "Wardenelli Brickatoni",
    "Mattone Ratto",
}

local BrainrotNameSet = {}
for _, name in ipairs(BrainrotFavoriteNames) do
    BrainrotNameSet[name] = true
end

local PlantNameSet = {}
local PlantNameList = {}
do
    local unique = {}
    if AutoShopping and type(AutoShopping.plantNames) == "table" then
        for _, name in ipairs(AutoShopping.plantNames) do
            local clean = InventoryUtils.SanitizeName(name)
            if clean ~= "" then
                -- Skip seed names - only use base names
                local base = clean:gsub("%s+Seed$", "")
                if base ~= "" and not unique[base] then
                    unique[base] = true
                    table.insert(PlantNameList, base)
                end
            end
        end
    end

    table.sort(PlantNameList, function(a, b)
        return a < b
    end)

    for _, value in ipairs(PlantNameList) do
        PlantNameSet[value] = true
    end
end

local AutoEggs = {
    enabled = false,
    selection = "All Eggs",
    options = { "All Eggs", "Godly Lucky Egg", "Meme Lucky Egg", "Secret Lucky Egg" },
    interval = 10,
    loop = nil,
    lastOpen = 0,
    _toggle = nil,
    _dropdown = nil,
    _intervalSlider = nil,
}

function AutoEggs:SetSelection(selection, options)
    options = options or {}
    if not table.find(self.options, selection) then
        selection = self.options[1]
    end
    self.selection = selection
    if options.syncDropdown and self._dropdown then
        self._dropdown:Select(selection)
    end
    return selection
end

function AutoEggs:GetCandidateEgg()
    local backpack = InventoryUtils:GetBackpack()
    if not backpack then
        return nil
    end

    for _, item in ipairs(backpack:GetChildren()) do
        repeat
            if not item:IsA("Tool") then
                break
            end
            
            local clean = InventoryUtils.SanitizeName(item.Name)
            if clean == "" then
                break
            end
            
            -- Skip Eggplant plant - only match actual eggs
            local lowerName = clean:lower()
            if lowerName == "eggplant" then
                break
            end
            
            if self.selection == "All Eggs" then
                if lowerName:find("egg") then
                    return item
                end
            elseif clean == self.selection then
                return item
            end
        until true
    end

    return nil
end

function AutoEggs:EquipTool(tool)
    if not tool then
        return false
    end

    local player = Players.LocalPlayer
    if not player then
        return false
    end

    local character = player.Character
    if not character then
        return false
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return false
    end

    if tool.Parent ~= character then
        humanoid:EquipTool(tool)
        task.wait(0.1)
    end

    return tool.Parent == character
end

function AutoEggs:OpenEgg()
    local remote = InventoryUtils.GetRemote("OpenEgg")
    if not remote then
        return false
    end

    local success = pcall(function()
        remote:FireServer()
    end)

    return success == true
end

function AutoEggs:ProcessOnce()
    local eggTool = self:GetCandidateEgg()
    if not eggTool then
        return false
    end

    self:EquipTool(eggTool)
    task.wait(0.1)

    if self:OpenEgg() then
        self.lastOpen = tick()
        return true
    end

    return false
end

function AutoEggs:Start()
    if self.loop then
        return
    end

    self.loop = task.spawn(function()
        while self.enabled do
            local interval = math.max(self.interval or 10, 10)
            if tick() - self.lastOpen >= interval then
                pcall(function()
                    self:ProcessOnce()
                end)
            end
            task.wait(1)
        end
    end)
end

function AutoEggs:Stop()
    if self.loop then
        task.cancel(self.loop)
        self.loop = nil
    end
end

function AutoEggs:SyncFromConfig()
    if self._dropdown then
        self:SetSelection(self._dropdown.Value or self.selection, { syncDropdown = true })
    end
    if self._intervalSlider then
        self.interval = math.clamp(tonumber(self._intervalSlider.Value) or self.interval or 10, 10, 600)
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
        if self.enabled then
            self:Start()
        else
            self:Stop()
        end
    end
end

local BrainrotFavoriteManager = {
    enabled = false,
    selectedRarities = { "Mythic", "Godly", "Secret" },
    selectedNames = {},
    selectedNameLookup = {},
    minimumWorth = 0,
    loop = nil,
    refreshInterval = 10,
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    autoDailyRewardsEnabled = false,
    _rarityDropdown = nil,
    _namesDropdown = nil,
    _minWorthSlider = nil,
    _toggle = nil,
    _dailyRewardsToggle = nil,
}

function BrainrotFavoriteManager:SetSelectedRarities(selection, options)
    options = options or {}
    local sanitized = sanitizeGearSelection(selection, self.rarityOptions, self.selectedRarities)
    self.selectedRarities = sanitized
    if options.syncDropdown and self._rarityDropdown then
        self._rarityDropdown:Select(self.selectedRarities)
    end
    return sanitized
end

function BrainrotFavoriteManager:SetSelectedNames(selection, options)
    options = options or {}
    local sanitized = {}

    if type(selection) == "table" then
        for _, name in ipairs(selection) do
            if BrainrotNameSet[name] then
                table.insert(sanitized, name)
            end
        end
    elseif type(selection) == "string" and BrainrotNameSet[selection] then
        sanitized = { selection }
    end

    table.sort(sanitized, function(a, b)
        return a < b
    end)

    self.selectedNames = sanitized
    self.selectedNameLookup = {}
    for _, name in ipairs(sanitized) do
        self.selectedNameLookup[name] = true
    end

    if options.syncDropdown and self._namesDropdown then
        self._namesDropdown:Select(self.selectedNames)
    end

    return sanitized
end

function BrainrotFavoriteManager:GetInventoryGui()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return nil
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then
        return nil
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then
        return nil
    end
    
    local inventory = backpack:FindFirstChild("Inventory")
    if not inventory then
        return nil
    end
    
    local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then
        return nil
    end
    
    return scrollingFrame:FindFirstChild("UIGridFrame")
end

function BrainrotFavoriteManager:GetHotbarGui()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return nil
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then
        return nil
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then
        return nil
    end
    
    return backpack:FindFirstChild("Hotbar")
end

function BrainrotFavoriteManager:GetRequiredDailyRewardsBrainrots()
    local player = Players.LocalPlayer
    if not player then
        return {}
    end
    
    local plotNumber = player:GetAttribute("Plot")
    if not plotNumber then
        return {}
    end
    
    plotNumber = tostring(plotNumber)
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return {}
    end
    
    local playerPlot = plotsFolder:FindFirstChild(plotNumber)
    if not playerPlot then
        return {}
    end
    
    local eventPlatforms = playerPlot:FindFirstChild("EventPlatforms")
    if not eventPlatforms then
        return {}
    end
    
    local requiredBrainrots = {}
    
    for _, platform in pairs(eventPlatforms:GetChildren()) do
        local platformUI = platform:FindFirstChild("PlatformEventUI")
        if platformUI and platformUI.Enabled then
            local titleLabel = platformUI:FindFirstChild("Title")
            if titleLabel then
                local brainrotName = titleLabel.ContentText or titleLabel.Text
                if brainrotName and brainrotName ~= "" then
                    local cleanName = InventoryUtils.SanitizeName(brainrotName)
                    requiredBrainrots[cleanName] = true
                end
            end
        end
    end
    
    return requiredBrainrots
end

function BrainrotFavoriteManager:FavoriteDailyRewardsBrainrots()
    if not self.autoDailyRewardsEnabled then
        return 0
    end
    
    local requiredBrainrots = self:GetRequiredDailyRewardsBrainrots()
    if not next(requiredBrainrots) then
        return 0
    end
    
    local gridFrame = self:GetInventoryGui()
    local hotbarFrame = self:GetHotbarGui()
    
    if not gridFrame and not hotbarFrame then
        return 0
    end
    
    local player = Players.LocalPlayer
    if not player then
        return 0
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then
        return 0
    end
    
    local favoritedBrainrots = {}
    local processed = 0
    
    -- Process inventory slots
    if gridFrame then
        for _, slot in ipairs(gridFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Brainrots" then
                        break
                    end
                end
            
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                -- Get name from Backpack item
                local itemName = nil
                
                for _, backpackItem in ipairs(backpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = InventoryUtils.SanitizeName(backpackItem.Name)
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                -- Check if this brainrot is required and not yet favorited
                if requiredBrainrots[itemName] and not favoritedBrainrots[itemName] then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        favoritedBrainrots[itemName] = true
                        processed += 1
                    end
                end
            until true
        end
    end
    
    -- Process hotbar slots
    if hotbarFrame then
        for _, slot in ipairs(hotbarFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Brainrots" then
                        break
                    end
                end
                
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                -- Get name from Backpack item
                local itemName = nil
                
                for _, backpackItem in ipairs(backpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = InventoryUtils.SanitizeName(backpackItem.Name)
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                -- Check if this brainrot is required and not yet favorited
                if requiredBrainrots[itemName] and not favoritedBrainrots[itemName] then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        favoritedBrainrots[itemName] = true
                        processed += 1
                    end
                end
            until true
        end
    end
    
    return processed
end

function BrainrotFavoriteManager:ProcessOnce(options)
    options = options or {}
    if not options.force and not self.enabled then
        return 0
    end

    local hasRarity = #self.selectedRarities > 0
    local hasNames = next(self.selectedNameLookup) ~= nil
    local hasMinWorth = self.minimumWorth > 0
    
    if not hasRarity and not hasNames and not hasMinWorth then
        return 0
    end

    local gridFrame = self:GetInventoryGui()
    local hotbarFrame = self:GetHotbarGui()
    
    if not gridFrame and not hotbarFrame then
        return 0
    end

    local player = Players.LocalPlayer
    if not player then
        return 0
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then
        return 0
    end

    local processed = 0
    
    -- Process inventory slots
    if gridFrame then
        for _, slot in ipairs(gridFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Brainrots" then
                        break
                    end
                end
            
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                -- Extract rarity from UIGradient children
                local rarity = nil
                for _, child in ipairs(toolName:GetChildren()) do
                    if child:IsA("UIGradient") then
                        rarity = child.Name
                        break
                    end
                end
                
                -- Get name from Backpack item for worth checking
                local itemName = nil
                local worth = 0
                
                for _, backpackItem in ipairs(backpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = InventoryUtils.SanitizeName(backpackItem.Name)
                        local worthValue = backpackItem:GetAttribute("Worth")
                        worth = tonumber(worthValue) or 0
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                -- Check filters
                local shouldFavorite = false
                
                if hasNames and self.selectedNameLookup[itemName] then
                    shouldFavorite = true
                end
                
                if not shouldFavorite and hasRarity and rarity then
                    if table.find(self.selectedRarities, rarity) then
                        shouldFavorite = true
                    end
                end
                
                if not shouldFavorite and hasMinWorth and worth >= self.minimumWorth then
                    shouldFavorite = true
                end
                
                if shouldFavorite then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        processed += 1
                    end
                end
            until true
        end
    end
    
    -- Process hotbar slots
    if hotbarFrame then
        for _, slot in ipairs(hotbarFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Brainrots" then
                        break
                    end
                end
                
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Brainrots" then
                    break
                end
                
                -- Extract rarity from UIGradient children
                local rarity = nil
                for _, child in ipairs(toolName:GetChildren()) do
                    if child:IsA("UIGradient") then
                        rarity = child.Name
                        break
                    end
                end
                
                -- Get name from Backpack item for worth checking
                local itemName = nil
                local worth = 0
                
                for _, backpackItem in ipairs(backpack:GetChildren()) do
                    local backpackId = backpackItem:GetAttribute("ID")
                    if backpackId == itemId then
                        itemName = InventoryUtils.SanitizeName(backpackItem.Name)
                        local worthValue = backpackItem:GetAttribute("Worth")
                        worth = tonumber(worthValue) or 0
                        break
                    end
                end
                
                if not itemName or itemName == "" then
                    break
                end
                
                -- Check filters
                local shouldFavorite = false
                
                if hasNames and self.selectedNameLookup[itemName] then
                    shouldFavorite = true
                end
                
                if not shouldFavorite and hasRarity and rarity then
                    if table.find(self.selectedRarities, rarity) then
                        shouldFavorite = true
                    end
                end
                
                if not shouldFavorite and hasMinWorth and worth >= self.minimumWorth then
                    shouldFavorite = true
                end
                
                if shouldFavorite then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        processed += 1
                    end
                end
            until true
        end
    end

    return processed
end

function BrainrotFavoriteManager:Start()
    if self.loop then
        return
    end

    print("[BrainrotFav] Starting favorite loop")
    self.loop = task.spawn(function()
        while self.enabled do
            pcall(function()
                self:ProcessOnce()
            end)
            task.wait(self.refreshInterval)
        end
    end)
end

function BrainrotFavoriteManager:Stop()
    if self.loop then
        print("[BrainrotFav] Stopping favorite loop")
        task.cancel(self.loop)
        self.loop = nil
    end
end

function BrainrotFavoriteManager:SyncFromConfig()
    if self._rarityDropdown then
        self:SetSelectedRarities(self._rarityDropdown.Value, { syncDropdown = true })
    end
    if self._namesDropdown then
        self:SetSelectedNames(self._namesDropdown.Value, { syncDropdown = true })
    end
    if self._minWorthSlider then
        self.minimumWorth = math.max(0, tonumber(self._minWorthSlider.Value) or self.minimumWorth or 0)
    end
    if self._dailyRewardsToggle then
        self.autoDailyRewardsEnabled = self._dailyRewardsToggle.Value or false
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
        if self.enabled then
            self:Start()
        else
            self:Stop()
        end
    end
end

local PlantFavoriteManager = {
    enabled = false,
    selectedRarities = {},
    selectedNames = {},
    selectedNameLookup = {},
    loop = nil,
    refreshInterval = 10,
    rarityOptions = { "Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret" },
    _rarityDropdown = nil,
    _namesDropdown = nil,
    _toggle = nil,
}

function PlantFavoriteManager:SetSelectedRarities(selection, options)
    options = options or {}
    local sanitized = sanitizeGearSelection(selection, self.rarityOptions, self.selectedRarities)
    self.selectedRarities = sanitized
    if options.syncDropdown and self._rarityDropdown then
        self._rarityDropdown:Select(self.selectedRarities)
    end
    return sanitized
end

function PlantFavoriteManager:SetSelectedNames(selection, options)
    options = options or {}
    local sanitized = {}

    if type(selection) == "table" then
        for _, name in ipairs(selection) do
            if PlantNameSet[name] then
                table.insert(sanitized, name)
            end
        end
    elseif type(selection) == "string" and PlantNameSet[selection] then
        sanitized = { selection }
    end

    table.sort(sanitized, function(a, b)
        return a < b
    end)

    self.selectedNames = sanitized
    self.selectedNameLookup = {}
    for _, name in ipairs(sanitized) do
        self.selectedNameLookup[name] = true
    end

    if options.syncDropdown and self._namesDropdown then
        self._namesDropdown:Select(self.selectedNames)
    end

    return sanitized
end

function PlantFavoriteManager:GetInventoryGui()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return nil
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then
        return nil
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then
        return nil
    end
    
    local inventory = backpack:FindFirstChild("Inventory")
    if not inventory then
        return nil
    end
    
    local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
    if not scrollingFrame then
        return nil
    end
    
    return scrollingFrame:FindFirstChild("UIGridFrame")
end

function PlantFavoriteManager:GetHotbarGui()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end
    
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then
        return nil
    end
    
    local backpackGui = playerGui:FindFirstChild("BackpackGui")
    if not backpackGui then
        return nil
    end
    
    local backpack = backpackGui:FindFirstChild("Backpack")
    if not backpack then
        return nil
    end
    
    return backpack:FindFirstChild("Hotbar")
end

function PlantFavoriteManager:ProcessOnce(options)
    options = options or {}
    if not options.force and not self.enabled then
        return 0
    end

    local hasRarity = #self.selectedRarities > 0
    local hasNames = next(self.selectedNameLookup) ~= nil
    
    if not hasRarity and not hasNames then
        return 0
    end

    local gridFrame = self:GetInventoryGui()
    local hotbarFrame = self:GetHotbarGui()
    
    if not gridFrame and not hotbarFrame then
        return 0
    end

    local processed = 0
    
    -- Process inventory slots
    if gridFrame then
        for _, slot in ipairs(gridFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Plants" then
                        break
                    end
                end
                
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Plants" then
                    break
                end
                
                -- Extract rarity from UIGradient children
                local rarity = nil
                for _, child in ipairs(toolName:GetChildren()) do
                    if child:IsA("UIGradient") then
                        rarity = child.Name
                        break
                    end
                end
                
                -- Get clean name from slot
                local itemName = InventoryUtils.SanitizeName(toolName.Text or "")
                if itemName == "" then
                    break
                end
                
                -- Check filters
                local shouldFavorite = false
                
                if hasNames and self.selectedNameLookup[itemName] then
                    shouldFavorite = true
                end
                
                if not shouldFavorite and hasRarity and rarity then
                    if table.find(self.selectedRarities, rarity) then
                        shouldFavorite = true
                    end
                end
                
                if shouldFavorite then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        processed += 1
                    end
                end
            until true
        end
    end
    
    -- Process hotbar slots
    if hotbarFrame then
        for _, slot in ipairs(hotbarFrame:GetChildren()) do
            repeat
                if not (slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton")) then
                    break
                end
                
                -- Check if already favorited
                local heartIcon = slot:FindFirstChild("HeartIcon")
                if heartIcon then
                    local category = slot:GetAttribute("Category")
                    if category == "Plants" then
                        break
                    end
                end
                
                -- Get slot information
                local toolName = slot:FindFirstChild("ToolName")
                if not toolName then
                    break
                end
                
                -- Extract item ID from slot
                local itemId = slot:GetAttribute("ID")
                if not itemId or itemId == "" then
                    break
                end
                
                -- Check category
                local category = slot:GetAttribute("Category")
                if category ~= "Plants" then
                    break
                end
                
                -- Extract rarity from UIGradient children
                local rarity = nil
                for _, child in ipairs(toolName:GetChildren()) do
                    if child:IsA("UIGradient") then
                        rarity = child.Name
                        break
                    end
                end
                
                -- Get clean name from slot
                local itemName = InventoryUtils.SanitizeName(toolName.Text or "")
                if itemName == "" then
                    break
                end
                
                -- Check filters
                local shouldFavorite = false
                
                if hasNames and self.selectedNameLookup[itemName] then
                    shouldFavorite = true
                end
                
                if not shouldFavorite and hasRarity and rarity then
                    if table.find(self.selectedRarities, rarity) then
                        shouldFavorite = true
                    end
                end
                
                if shouldFavorite then
                    if InventoryUtils:FavoriteItemById(itemId) then
                        processed += 1
                    end
                end
            until true
        end
    end

    return processed
end

function PlantFavoriteManager:Start()
    if self.loop then
        return
    end

    print("[PlantFav] Starting favorite loop")
    self.loop = task.spawn(function()
        while self.enabled do
            pcall(function()
                self:ProcessOnce()
            end)
            task.wait(self.refreshInterval)
        end
    end)
end

function PlantFavoriteManager:Stop()
    if self.loop then
        print("[PlantFav] Stopping favorite loop")
        task.cancel(self.loop)
        self.loop = nil
    end
end

function PlantFavoriteManager:SyncFromConfig()
    if self._rarityDropdown then
        self:SetSelectedRarities(self._rarityDropdown.Value, { syncDropdown = true })
    end
    if self._namesDropdown then
        self:SetSelectedNames(self._namesDropdown.Value, { syncDropdown = true })
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
        if self.enabled then
            self:Start()
        else
            self:Stop()
        end
    end
end

local AutoSellBrainrots = {
    enabled = false,
    interval = 60,
    minInterval = 10,
    maxInterval = 600,
    loop = nil,
    _slider = nil,
    _toggle = nil,
}

function AutoSellBrainrots:SetInterval(value)
    local numeric = tonumber(value)
    if not numeric then
        return self.interval
    end
    numeric = math.floor(numeric + 0.5)
    self.interval = math.clamp(numeric, self.minInterval, self.maxInterval)
    return self.interval
end

function AutoSellBrainrots:Trigger()
    -- Run daily rewards favorite check first if enabled
    if BrainrotFavoriteManager.autoDailyRewardsEnabled then
        BrainrotFavoriteManager:FavoriteDailyRewardsBrainrots()
        task.wait(1)
    end
    
    -- Run event brainrots favorite check if enabled
    if AutoFavoriteEventBrainrotsEnabled then
        favoriteEventBrainrots()
        task.wait(1)
    end
    
    -- Run favorite check if enabled
    if BrainrotFavoriteManager.enabled then
        BrainrotFavoriteManager:ProcessOnce({ force = true })
    end
    
    -- Wait 2 seconds before selling
    task.wait(2)
    
    local remote = InventoryUtils.GetRemote("ItemSell")
    if not remote then
        return false
    end

    local arguments = { [3] = true }
    local success = pcall(function()
        remote:FireServer(table.unpack(arguments, 1, 3))
    end)

    return success == true
end

function AutoSellBrainrots:Start()
    if self.loop then
        return
    end

    self.loop = task.spawn(function()
        while self.enabled do
            pcall(function()
                self:Trigger()
            end)

            local interval = math.clamp(self.interval or self.minInterval, self.minInterval, self.maxInterval)
            local elapsed = 0
            while self.enabled and elapsed < interval do
                local step = math.min(1, interval - elapsed)
                task.wait(step)
                elapsed += step
            end
        end
    end)
end

function AutoSellBrainrots:Stop()
    if self.loop then
        task.cancel(self.loop)
        self.loop = nil
    end
end

function AutoSellBrainrots:SyncFromConfig()
    if self._slider then
        self:SetInterval(self._slider.Value)
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
        if self.enabled then
            self:Start()
        else
            self:Stop()
        end
    end
end

local AutoSellPlants = {
    enabled = false,
    interval = 60,
    minInterval = 10,
    maxInterval = 600,
    loop = nil,
    _slider = nil,
    _toggle = nil,
}

function AutoSellPlants:SetInterval(value)
    local numeric = tonumber(value)
    if not numeric then
        return self.interval
    end
    numeric = math.floor(numeric + 0.5)
    self.interval = math.clamp(numeric, self.minInterval, self.maxInterval)
    return self.interval
end

function AutoSellPlants:Trigger()
    -- Run favorite check first if enabled
    if PlantFavoriteManager.enabled then
        PlantFavoriteManager:ProcessOnce({ force = true })
    end
    
    -- Wait 2 seconds before selling
    task.wait(2)
    
    local remote = InventoryUtils.GetRemote("ItemSell")
    if not remote then
        return false
    end

    local arguments = { [2] = true }
    local success = pcall(function()
        remote:FireServer(table.unpack(arguments, 1, 3))
    end)

    return success == true
end

function AutoSellPlants:Start()
    if self.loop then
        return
    end

    self.loop = task.spawn(function()
        while self.enabled do
            pcall(function()
                self:Trigger()
            end)

            local interval = math.clamp(self.interval or self.minInterval, self.minInterval, self.maxInterval)
            local elapsed = 0
            while self.enabled and elapsed < interval do
                local step = math.min(1, interval - elapsed)
                task.wait(step)
                elapsed += step
            end
        end
    end)
end

function AutoSellPlants:Stop()
    if self.loop then
        task.cancel(self.loop)
        self.loop = nil
    end
end

function AutoSellPlants:SyncFromConfig()
    if self._slider then
        self:SetInterval(self._slider.Value)
    end
    if self._toggle then
        self.enabled = self._toggle.Value or false
        if self.enabled then
            self:Start()
        else
            self:Stop()
        end
    end
end

local EggSection = InventoryTab:Section({
    Title = "loc:INV_EGG_SECTION_TITLE",
    Icon = "lucide:egg",
    Opened = true,
})

EggSection:Paragraph({
    Title = "loc:INV_EGG_HOW_IT_WORKS_TITLE",
    Desc = "loc:INV_EGG_HOW_IT_WORKS_DESC",
})

local AutoEggSelectionDropdown = EggSection:Dropdown({
    Title = "loc:INV_EGG_SELECTION_TITLE",
    Desc = "loc:INV_EGG_SELECTION_DESC",
    Values = AutoEggs.options,
    Value = AutoEggs.selection,
    Multi = false,
    Callback = function(selected)
        AutoEggs:SetSelection(selected)
    end
})
MainConfig:Register("AutoEggSelection", AutoEggSelectionDropdown)
AutoEggs._dropdown = AutoEggSelectionDropdown
AutoEggs:SetSelection(AutoEggSelectionDropdown.Value or AutoEggs.selection, { syncDropdown = true })

local AutoEggIntervalSlider = EggSection:Slider({
    Title = "loc:INV_EGG_INTERVAL_TITLE",
    Desc = "loc:INV_EGG_INTERVAL_DESC",
    Step = 1,
    Value = {
        Min = 10,
        Max = 600,
        Default = 10,
    },
    Callback = function(value)
        AutoEggs.interval = math.clamp(tonumber(value) or AutoEggs.interval or 10, 10, 600)
    end
})
MainConfig:Register("AutoEggInterval", AutoEggIntervalSlider)
AutoEggs._intervalSlider = AutoEggIntervalSlider
AutoEggs.interval = math.clamp(tonumber(AutoEggIntervalSlider.Value) or AutoEggs.interval or 10, 10, 600)

local AutoEggToggle = EggSection:Toggle({
    Title = "loc:INV_EGG_ENABLE_TITLE",
    Desc = "loc:INV_EGG_ENABLE_DESC",
    Default = false,
    Callback = function(state)
        AutoEggs.enabled = state
        if state then
            AutoEggs:Start()
            WindUI:Notify({
                Title = "Auto eggs enabled",
                Content = "Opening eggs on a loop.",
                Duration = 3,
                Icon = "lucide:egg",
            })
        else
            AutoEggs:Stop()
            WindUI:Notify({
                Title = "Auto eggs disabled",
                Content = "Stopped opening eggs.",
                Duration = 3,
                Icon = "lucide:egg-off",
            })
        end
    end
})
MainConfig:Register("AutoEggsEnabled", AutoEggToggle)
AutoEggs._toggle = AutoEggToggle

local AutoSellSection = InventoryTab:Section({
    Title = "loc:INV_SELL_SECTION_TITLE",
    Icon = "lucide:dollar-sign",
    Opened = true,
})

AutoSellSection:Paragraph({
    Title = "loc:INV_SELL_SAFETY_TITLE",
    Desc = "loc:INV_SELL_SAFETY_DESC",
})

local BrainrotSellSlider = AutoSellSection:Slider({
    Title = "loc:INV_BRAINROT_SELL_INTERVAL_TITLE",
    Desc = "loc:INV_BRAINROT_SELL_INTERVAL_DESC",
    Step = 1,
    Value = {
        Min = 10,
        Max = 600,
        Default = 60,
    },
    Callback = function(value)
        AutoSellBrainrots:SetInterval(value)
    end
})
MainConfig:Register("AutoSellBrainrotsInterval", BrainrotSellSlider)
AutoSellBrainrots._slider = BrainrotSellSlider
AutoSellBrainrots:SetInterval(BrainrotSellSlider.Value or AutoSellBrainrots.interval)

local BrainrotSellToggle = AutoSellSection:Toggle({
    Title = "loc:INV_BRAINROT_SELL_ENABLE_TITLE",
    Desc = "loc:INV_BRAINROT_SELL_ENABLE_DESC",
    Default = false,
    Callback = function(state)
        AutoSellBrainrots.enabled = state
        if state then
            AutoSellBrainrots:Trigger()
            AutoSellBrainrots:Start()
            WindUI:Notify({
                Title = "Auto sell brainrots enabled",
                Content = string.format("Selling every %ds.", AutoSellBrainrots.interval),
                Duration = 3,
                Icon = "lucide:dollar-sign",
            })
        else
            AutoSellBrainrots:Stop()
            WindUI:Notify({
                Title = "Auto sell brainrots disabled",
                Content = "Brainrot sell loop stopped.",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoSellBrainrotsEnabled", BrainrotSellToggle)
AutoSellBrainrots._toggle = BrainrotSellToggle

local PlantSellSlider = AutoSellSection:Slider({
    Title = "loc:INV_PLANT_SELL_INTERVAL_TITLE",
    Desc = "loc:INV_PLANT_SELL_INTERVAL_DESC",
    Step = 1,
    Value = {
        Min = 10,
        Max = 600,
        Default = 60,
    },
    Callback = function(value)
        AutoSellPlants:SetInterval(value)
    end
})
MainConfig:Register("AutoSellPlantsInterval", PlantSellSlider)
AutoSellPlants._slider = PlantSellSlider
AutoSellPlants:SetInterval(PlantSellSlider.Value or AutoSellPlants.interval)

local PlantSellToggle = AutoSellSection:Toggle({
    Title = "loc:INV_PLANT_SELL_ENABLE_TITLE",
    Desc = "loc:INV_PLANT_SELL_ENABLE_DESC",
    Default = false,
    Callback = function(state)
        AutoSellPlants.enabled = state
        if state then
            AutoSellPlants:Trigger()
            AutoSellPlants:Start()
            WindUI:Notify({
                Title = "Auto sell plants enabled",
                Content = string.format("Selling every %ds.", AutoSellPlants.interval),
                Duration = 3,
                Icon = "lucide:dollar-sign",
            })
        else
            AutoSellPlants:Stop()
            WindUI:Notify({
                Title = "Auto sell plants disabled",
                Content = "Plant sell loop stopped.",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoSellPlantsEnabled", PlantSellToggle)
AutoSellPlants._toggle = PlantSellToggle

local BrainrotFavoritesSection = InventoryTab:Section({
    Title = "loc:INV_BRAINROT_FAV_SECTION_TITLE",
    Icon = "lucide:heart",
    Opened = true,
})

BrainrotFavoritesSection:Paragraph({
    Title = "loc:INV_BRAINROT_FAV_CONFIG_TITLE",
    Desc = "loc:INV_BRAINROT_FAV_CONFIG_DESC",
})

local BrainrotRarityDropdown = BrainrotFavoritesSection:Dropdown({
    Title = "loc:INV_BRAINROT_RARITY_TITLE",
    Desc = "loc:INV_BRAINROT_RARITY_DESC",
    Values = BrainrotFavoriteManager.rarityOptions,
    Value = BrainrotFavoriteManager.selectedRarities,
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        BrainrotFavoriteManager:SetSelectedRarities(selected)
    end
})
MainConfig:Register("BrainrotFavoriteRarities", BrainrotRarityDropdown)
BrainrotFavoriteManager._rarityDropdown = BrainrotRarityDropdown
BrainrotFavoriteManager:SetSelectedRarities(BrainrotRarityDropdown.Value, { syncDropdown = true })

local BrainrotNameDropdown = BrainrotFavoritesSection:Dropdown({
    Title = "loc:INV_BRAINROT_SPECIFIC_TITLE",
    Desc = "loc:INV_BRAINROT_SPECIFIC_DESC",
    Values = BrainrotFavoriteNames,
    Value = BrainrotFavoriteManager.selectedNames,
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        BrainrotFavoriteManager:SetSelectedNames(selected)
    end
})
MainConfig:Register("BrainrotFavoriteNames", BrainrotNameDropdown)
BrainrotFavoriteManager._namesDropdown = BrainrotNameDropdown
BrainrotFavoriteManager:SetSelectedNames(BrainrotNameDropdown.Value, { syncDropdown = true })

local BrainrotMinWorthSlider = BrainrotFavoritesSection:Slider({
    Title = "loc:INV_BRAINROT_MIN_WORTH_TITLE",
    Desc = "loc:INV_BRAINROT_MIN_WORTH_DESC",
    Step = 1,
    Value = {
        Min = 0,
        Max = 1000000,
        Default = 0,
    },
    Callback = function(value)
        BrainrotFavoriteManager.minimumWorth = math.max(0, tonumber(value) or 0)
    end
})
MainConfig:Register("BrainrotFavoriteMinimumWorth", BrainrotMinWorthSlider)
BrainrotFavoriteManager._minWorthSlider = BrainrotMinWorthSlider
BrainrotFavoriteManager.minimumWorth = math.max(0, tonumber(BrainrotMinWorthSlider.Value) or 0)

local BrainrotDailyRewardsToggle = BrainrotFavoritesSection:Toggle({
    Title = "Auto Favorite Daily Rewards Brainrots",
    Desc = "Automatically favorite one of each brainrot required for event platforms (runs before auto-sell)",
    Default = false,
    Callback = function(state)
        BrainrotFavoriteManager.autoDailyRewardsEnabled = state
        if state then
            WindUI:Notify({
                Title = "Daily Rewards Auto-Favorite Enabled",
                Content = "Will protect required brainrots before selling.",
                Duration = 3,
                Icon = "lucide:gift",
            })
        else
            WindUI:Notify({
                Title = "Daily Rewards Auto-Favorite Disabled",
                Content = "Stopped protecting event brainrots.",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("BrainrotDailyRewardsAutoFavorite", BrainrotDailyRewardsToggle)
BrainrotFavoriteManager._dailyRewardsToggle = BrainrotDailyRewardsToggle

local BrainrotFavoriteToggle = BrainrotFavoritesSection:Toggle({
    Title = "loc:INV_BRAINROT_ENABLE_TITLE",
    Desc = "loc:INV_BRAINROT_ENABLE_DESC",
    Default = false,
    Callback = function(state)
        BrainrotFavoriteManager.enabled = state
        if state then
            BrainrotFavoriteManager:Start()
            WindUI:Notify({
                Title = "Brainrot favorites enabled",
                Content = "Protecting selected brainrots.",
                Duration = 3,
                Icon = "lucide:heart",
            })
        else
            BrainrotFavoriteManager:Stop()
            WindUI:Notify({
                Title = "Brainrot favorites disabled",
                Content = "Stopped auto favoriting brainrots.",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("BrainrotAutoFavoriteEnabled", BrainrotFavoriteToggle)
BrainrotFavoriteManager._toggle = BrainrotFavoriteToggle

local PlantFavoritesSection = InventoryTab:Section({
    Title = "loc:INV_PLANT_FAV_SECTION_TITLE",
    Icon = "lucide:leaf",
    Opened = true,
})

PlantFavoritesSection:Paragraph({
    Title = "loc:INV_PLANT_FAV_CONFIG_TITLE",
    Desc = "loc:INV_PLANT_FAV_CONFIG_DESC",
})

local PlantRarityDropdown = PlantFavoritesSection:Dropdown({
    Title = "loc:INV_PLANT_RARITY_TITLE",
    Desc = "loc:INV_PLANT_RARITY_DESC",
    Values = PlantFavoriteManager.rarityOptions,
    Value = PlantFavoriteManager.selectedRarities,
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        PlantFavoriteManager:SetSelectedRarities(selected)
    end
})
MainConfig:Register("PlantFavoriteRarities", PlantRarityDropdown)
PlantFavoriteManager._rarityDropdown = PlantRarityDropdown
PlantFavoriteManager:SetSelectedRarities(PlantRarityDropdown.Value, { syncDropdown = true })

local PlantNameDropdown = PlantFavoritesSection:Dropdown({
    Title = "loc:INV_PLANT_SPECIFIC_TITLE",
    Desc = "loc:INV_PLANT_SPECIFIC_DESC",
    Values = PlantNameList,
    Value = PlantFavoriteManager.selectedNames,
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        PlantFavoriteManager:SetSelectedNames(selected)
    end
})
MainConfig:Register("PlantFavoriteNames", PlantNameDropdown)
PlantFavoriteManager._namesDropdown = PlantNameDropdown
PlantFavoriteManager:SetSelectedNames(PlantNameDropdown.Value, { syncDropdown = true })

local PlantFavoriteToggle = PlantFavoritesSection:Toggle({
    Title = "loc:INV_PLANT_ENABLE_TITLE",
    Desc = "loc:INV_PLANT_ENABLE_DESC",
    Default = false,
    Callback = function(state)
        PlantFavoriteManager.enabled = state
        if state then
            PlantFavoriteManager:Start()
            WindUI:Notify({
                Title = "Plant favorites enabled",
                Content = "Protecting selected plants.",
                Duration = 3,
                Icon = "lucide:leaf",
            })
        else
            PlantFavoriteManager:Stop()
            WindUI:Notify({
                Title = "Plant favorites disabled",
                Content = "Stopped auto favoriting plants.",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("PlantAutoFavoriteEnabled", PlantFavoriteToggle)
PlantFavoriteManager._toggle = PlantFavoriteToggle

-- Unfavorite All Section
local UnfavoriteAllSection = InventoryTab:Section({
    Title = "loc:INV_UNFAV_ALL_SECTION_TITLE",
    Icon = "lucide:heart-off",
    Opened = true,
})

local UnfavoriteAllButton = UnfavoriteAllSection:Button({
    Title = "loc:INV_UNFAV_ALL_BUTTON_TITLE",
    Desc = "loc:INV_UNFAV_ALL_BUTTON_DESC",
    Callback = function()
        task.spawn(function()
            local player = Players.LocalPlayer
            if not player then
                WindUI:Notify({
                    Title = "Error",
                    Content = "Player not found",
                    Duration = 3,
                    Icon = "lucide:x",
                })
                return
            end
            
            local playerGui = player:FindFirstChild("PlayerGui")
            if not playerGui then
                WindUI:Notify({
                    Title = "Error",
                    Content = "PlayerGui not found",
                    Duration = 3,
                    Icon = "lucide:x",
                })
                return
            end
            
            local backpackGui = playerGui:FindFirstChild("BackpackGui")
            if not backpackGui then
                WindUI:Notify({
                    Title = "Error",
                    Content = "BackpackGui not found",
                    Duration = 3,
                    Icon = "lucide:x",
                })
                return
            end
            
            local backpack = backpackGui:FindFirstChild("Backpack")
            if not backpack then
                WindUI:Notify({
                    Title = "Error",
                    Content = "Backpack not found",
                    Duration = 3,
                    Icon = "lucide:x",
                })
                return
            end
            
            -- Get inventory grid
            local inventory = backpack:FindFirstChild("Inventory")
            local gridFrame = nil
            if inventory then
                local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
                if scrollingFrame then
                    gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
                end
            end
            
            -- Get hotbar
            local hotbarFrame = backpack:FindFirstChild("Hotbar")
            
            local unfavorited = 0
            
            -- Process inventory slots
            if gridFrame then
                for _, slot in ipairs(gridFrame:GetChildren()) do
                    if slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton") then
                        local heartIcon = slot:FindFirstChild("HeartIcon")
                        if heartIcon then
                            local category = slot:GetAttribute("Category")
                            if category == "Brainrots" or category == "Plants" then
                                local itemId = slot:GetAttribute("ID")
                                if itemId and itemId ~= "" then
                                    if InventoryUtils:FavoriteItemById(itemId) then
                                        unfavorited += 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            -- Process hotbar slots
            if hotbarFrame then
                for _, slot in ipairs(hotbarFrame:GetChildren()) do
                    if slot:IsA("Frame") or slot:IsA("ImageLabel") or slot:IsA("ImageButton") or slot:IsA("TextButton") then
                        local heartIcon = slot:FindFirstChild("HeartIcon")
                        if heartIcon then
                            local category = slot:GetAttribute("Category")
                            if category == "Brainrots" or category == "Plants" then
                                local itemId = slot:GetAttribute("ID")
                                if itemId and itemId ~= "" then
                                    if InventoryUtils:FavoriteItemById(itemId) then
                                        unfavorited += 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            WindUI:Notify({
                Title = "Unfavorite Complete",
                Content = string.format("Unfavorited %d items", unfavorited),
                Duration = 5,
                Icon = "lucide:heart-off",
            })
        end)
    end
})

-- Mount UI for Auto Freeze
local FreezeSection = MiscTab:Section({
    Title = "loc:AUTO_FREEZE_SECTION",
    Icon = "lucide:snowflake",
    Opened = true,
})

local defaultGearSelection = {}
for _, gear in ipairs(AutoFreeze:GetSelectedGears()) do
    table.insert(defaultGearSelection, gear)
end

local FreezeGearDropdown = FreezeSection:Dropdown({
    Title = "loc:FREEZE_GEAR_TITLE",
    Desc = "loc:FREEZE_GEAR_DESC",
    Values = AutoFreeze.gearOptions,
    Value = defaultGearSelection,
    Multi = true,
    AllowNone = false,
    Callback = function(selected)
        if AutoFreeze._suppressGearCallback then
            return
        end

        AutoFreeze:SetSelectedGears(selected)
    end
})
MainConfig:Register("FreezeGear", FreezeGearDropdown)
AutoFreeze._gearDropdown = FreezeGearDropdown

local FreezePriorityDropdown = FreezeSection:Dropdown({
    Title = "loc:TARGET_PRIORITY_TITLE",
    Desc = "loc:TARGET_PRIORITY_DESC",
    Values = { "Health", "Boss only", "Rarity" },
    Value = "Health",
    Multi = false,
    Callback = function(selected)
        AutoFreeze.priority = selected
        AutoFreeze.rejectedBrainrots = {}

        if AutoFreeze._rarityDropdown then
            if selected == "Rarity" then
                AutoFreeze._rarityDropdown:Unlock()
                AutoFreeze:SetRaritySelection(AutoFreeze._rarityDropdown.Value, { syncDropdown = true })
            else
                AutoFreeze._rarityDropdown:Lock()
            end
        end

        if AutoFreeze._healthSlider then
            if selected == "Health" then
                AutoFreeze._healthSlider:Unlock()
            else
                AutoFreeze._healthSlider:Lock()
            end
        end
    end
})
MainConfig:Register("FreezePriority", FreezePriorityDropdown)
AutoFreeze._priorityDropdown = FreezePriorityDropdown

local defaultFreezeRaritySelection = {}
for _, rarity in ipairs(AutoFreeze.selectedRarities) do
    table.insert(defaultFreezeRaritySelection, rarity)
end

local FreezeRarityDropdown = FreezeSection:Dropdown({
    Title = "loc:TARGET_RARITY_TITLE",
    Desc = "loc:TARGET_RARITY_DESC",
    Values = AutoFreeze.rarityOptions,
    Value = defaultFreezeRaritySelection,
    Multi = true,
    AllowNone = false,
    Callback = function(selected)
        AutoFreeze:SetRaritySelection(selected)
    end
})
FreezeRarityDropdown:Lock()
MainConfig:Register("FreezeRarities", FreezeRarityDropdown)
AutoFreeze._rarityDropdown = FreezeRarityDropdown

local FreezeHealthSlider = FreezeSection:Slider({
    Title = "loc:MINIMUM_HEALTH_TITLE",
    Desc = "loc:MINIMUM_HEALTH_DESC",
    Step = 100,
    Value = {
        Min = 50,
        Max = 1000000,
        Default = 2000,
    },
    Callback = function(value)
        AutoFreeze.minHealth = tonumber(value) or 2000
    end
})
MainConfig:Register("FreezeMinHealth", FreezeHealthSlider)
AutoFreeze._healthSlider = FreezeHealthSlider

local FreezeToggle = FreezeSection:Toggle({
    Title = "loc:ENABLE_AUTO_FREEZE_TITLE",
    Desc = "loc:ENABLE_AUTO_FREEZE_DESC",
    Default = false,
    Callback = function(state)
        AutoFreeze.enabled = state
        
        if state then
            AutoFreeze:Start()
            WindUI:Notify({
                Title = "loc:AUTO_FREEZE_ENABLED_TITLE",
                Content = string.format("loc:AUTO_FREEZE_ENABLED_CONTENT", AutoFreeze:GetSelectedGearLabel(), AutoFreeze.priority),
                Duration = 3,
                Icon = "lucide:snowflake",
            })
        else
            AutoFreeze:Stop()
            WindUI:Notify({
                Title = "loc:AUTO_FREEZE_DISABLED_TITLE",
                Content = "loc:AUTO_FREEZE_DISABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoFreeze", FreezeToggle)
AutoFreeze._toggle = FreezeToggle

FreezeSection:Paragraph({
    Title = "─── End of Auto Freeze Section ───",
    Desc = " ",
})

local AttackSection = MiscTab:Section({
    Title = "loc:AUTO_ATTACK_SECTION",
    Icon = "lucide:swords",
    Opened = true,
})

AttackSection:Paragraph({
    Title = "loc:WARNING_TITLE",
    Desc = "loc:WARNING_AUTO_ATTACK_DESC",
})

local AttackPriorityDropdown = AttackSection:Dropdown({
    Title = "loc:TARGET_PRIORITY_TITLE",
    Desc = "loc:TARGET_PRIORITY_DESC",
    Values = { "Health", "Boss only", "Rarity" },
    Value = "Health",
    Multi = false,
    Callback = function(selected)
        AutoAttack.priority = selected
        if AutoAttack._rarityDropdown then
            if selected == "Rarity" then
                AutoAttack._rarityDropdown:Unlock()
                AutoAttack:SetRaritySelection(AutoAttack._rarityDropdown.Value, { syncDropdown = true })
            else
                AutoAttack._rarityDropdown:Lock()
            end
        end
        if AutoAttack._healthSlider then
            if selected == "Health" then
                AutoAttack._healthSlider:Unlock()
            else
                AutoAttack._healthSlider:Lock()
            end
        end
    end
})
MainConfig:Register("AttackPriority", AttackPriorityDropdown)
AutoAttack._priorityDropdown = AttackPriorityDropdown

local defaultRaritySelection = {}
for _, rarity in ipairs(AutoAttack.selectedRarities) do
    table.insert(defaultRaritySelection, rarity)
end

local AttackRarityDropdown = AttackSection:Dropdown({
    Title = "loc:TARGET_RARITY_TITLE",
    Desc = "loc:TARGET_RARITY_DESC",
    Values = AutoAttack.rarityOptions,
    Value = defaultRaritySelection,
    Multi = true,
    AllowNone = false,
    Callback = function(selected)
        AutoAttack:SetRaritySelection(selected)
    end
})
AttackRarityDropdown:Lock()
MainConfig:Register("AttackRarities", AttackRarityDropdown)
AutoAttack._rarityDropdown = AttackRarityDropdown

local AttackTeleportDropdown = AttackSection:Dropdown({
    Title = "loc:TELEPORT_POSITION_TITLE",
    Desc = "loc:TELEPORT_POSITION_DESC",
    Values = AutoAttack.teleportOptions,
    Value = AutoAttack.teleportOptions[1],
    Multi = false,
    Callback = function(selected)
        AutoAttack.teleportMode = selected
    end
})
MainConfig:Register("AttackTeleportMode", AttackTeleportDropdown)
AutoAttack._teleportDropdown = AttackTeleportDropdown

local AttackHealthSlider = AttackSection:Slider({
    Title = "loc:MINIMUM_HEALTH_TITLE",
    Desc = "loc:MINIMUM_HEALTH_DESC",
    Step = 100,
    Value = {
        Min = 50,
        Max = 1000000,
        Default = 2000,
    },
    Callback = function(value)
        AutoAttack.minHealth = tonumber(value) or 2000
    end
})
MainConfig:Register("AttackMinHealth", AttackHealthSlider)
AutoAttack._healthSlider = AttackHealthSlider

local AttackToggle = AttackSection:Toggle({
    Title = "loc:ENABLE_AUTO_ATTACK_TITLE",
    Desc = "loc:ENABLE_AUTO_ATTACK_DESC",
    Default = false,
    Callback = function(state)
        AutoAttack.enabled = state

        if state then
            AutoAttack:Start()
            WindUI:Notify({
                Title = "loc:AUTO_ATTACK_ENABLED_TITLE",
                Content = "loc:AUTO_ATTACK_ENABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:swords",
            })
            if AutoFreeze and AutoFreeze.enabled then
                WindUI:Notify({
                    Title = "loc:CONFLICT_WARNING_TITLE",
                    Content = "loc:CONFLICT_WARNING_CONTENT",
                    Duration = 4,
                    Icon = "lucide:alert-triangle",
                })
            end
        else
            AutoAttack:Stop()
            WindUI:Notify({
                Title = "loc:AUTO_ATTACK_DISABLED_TITLE",
                Content = "loc:AUTO_ATTACK_DISABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoAttack", AttackToggle)
AutoAttack._toggle = AttackToggle

AttackSection:Paragraph({
    Title = "─── End of Auto Attack Section ───",
    Desc = " ",
})

-- Auto Equip Best & Collect Cash (moved to bottom of misc list)
local autoBrainrotsEnabled = false
local autoBrainrotsLoop = nil
local autoBrainrotsInterval = 10

local AutoBrainrotsIntervalSlider = MiscTab:Slider({
    Title = "Auto Collect Interval",
    Desc = "Delay between equip & collect cycles (seconds)",
    Step = 1,
    Value = {
        Min = 10,
        Max = 600,
        Default = 10,
    },
    Callback = function(value)
        local numeric = tonumber(value) or 10
        autoBrainrotsInterval = math.clamp(math.floor(numeric + 0.5), 10, 600)
    end
})
MainConfig:Register("AutoBrainrotsInterval", AutoBrainrotsIntervalSlider)
autoBrainrotsInterval = math.clamp(tonumber(AutoBrainrotsIntervalSlider.Value) or 10, 10, 600)

local AutoBrainrotsToggle = MiscTab:Toggle({
    Title = "loc:AUTO_EQUIP_COLLECT_TITLE",
    Desc = "loc:AUTO_EQUIP_COLLECT_DESC",
    Default = false,
    Callback = function(state)
        autoBrainrotsEnabled = state

        if state then
            autoBrainrotsLoop = task.spawn(function()
                while autoBrainrotsEnabled do
                    pcall(function()
                        local remote = game:GetService("ReplicatedStorage").Remotes.EquipBestBrainrots
                        if remote then
                            remote:FireServer()
                        end
                    end)
                    task.wait(math.clamp(autoBrainrotsInterval, 10, 600))
                end
            end)

            WindUI:Notify({
                Title = "Auto Brainrots Enabled",
                Content = "Equipping best brainrots",
                Duration = 3,
                Icon = "lucide:zap",
            })
        else
            if autoBrainrotsLoop then
                task.cancel(autoBrainrotsLoop)
                autoBrainrotsLoop = nil
            end

            WindUI:Notify({
                Title = "Auto Brainrots Disabled",
                Content = "Stopped auto-equipping",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoBrainrots", AutoBrainrotsToggle)

MiscTab:Paragraph({
    Title = "─── End of Auto Equip & Collect Section ───",
    Desc = " ",
})

local autoRebirthEnabled = false
local autoRebirthLoop = nil

local AutoRebirthToggle = MiscTab:Toggle({
    Title = "loc:AUTO_REBIRTH_TITLE",
    Desc = "loc:AUTO_REBIRTH_DESC",
    Default = false,
    Callback = function(state)
        autoRebirthEnabled = state

        if state then
            autoRebirthLoop = task.spawn(function()
                while autoRebirthEnabled do
                    pcall(function()
                        local remotesFolder = Remotes or ReplicatedStorage:FindFirstChild("Remotes")
                        local rebirthRemote = remotesFolder and remotesFolder:FindFirstChild("Rebirth")
                        if rebirthRemote then
                            rebirthRemote:FireServer()
                        end
                    end)
                    task.wait(10)
                end
            end)

            WindUI:Notify({
                Title = "loc:AUTO_REBIRTH_ENABLED_TITLE",
                Content = "loc:AUTO_REBIRTH_ENABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:rotate-ccw",
            })
        else
            if autoRebirthLoop then
                task.cancel(autoRebirthLoop)
                autoRebirthLoop = nil
            end

            WindUI:Notify({
                Title = "loc:AUTO_REBIRTH_DISABLED_TITLE",
                Content = "loc:AUTO_REBIRTH_DISABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoRebirth", AutoRebirthToggle)

MiscTab:Paragraph({
    Title = "─── End of Auto Rebirth Section ───",
    Desc = " ",
})

local function getPlayerPlantsFolder()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end

    local plotId = player:GetAttribute("Plot")
    if not plotId then
        return nil
    end

    plotId = tostring(plotId)
    if plotId == "" then
        return nil
    end

    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return nil
    end

    local plot = plotsFolder:FindFirstChild(plotId)
    if not plot then
        return nil
    end

    return plot:FindFirstChild("Plants")
end

local function findNextPlatformId()
    local plantsFolder = getPlayerPlantsFolder()
    if not plantsFolder then
        return nil
    end

    local nextId
    for _, plant in ipairs(plantsFolder:GetChildren()) do
        if plant and plant:IsA("Model") and plant:FindFirstChild("PlatformPrice") then
            local numericId = tonumber(plant.Name)
            if numericId then
                if not nextId or numericId < nextId then
                    nextId = numericId
                end
            end
        end
    end

    if nextId then
        return tostring(nextId)
    end

    return nil
end

local autoBuyPlatformsEnabled = false
local autoBuyPlatformsLoop = nil

local AutoBuyPlatformsToggle = MiscTab:Toggle({
    Title = "loc:AUTO_BUY_PLATFORMS_TITLE",
    Desc = "loc:AUTO_BUY_PLATFORMS_DESC",
    Default = false,
    Callback = function(state)
        autoBuyPlatformsEnabled = state

        if state then
            if autoBuyPlatformsLoop then
                task.cancel(autoBuyPlatformsLoop)
                autoBuyPlatformsLoop = nil
            end

            autoBuyPlatformsLoop = task.spawn(function()
                while autoBuyPlatformsEnabled do
                    local platformId = findNextPlatformId()
                    if platformId then
                        pcall(function()
                            local remotesFolder = Remotes or ReplicatedStorage:FindFirstChild("Remotes")
                            local buyPlatformRemote = remotesFolder and remotesFolder:FindFirstChild("BuyPlatform")
                            if buyPlatformRemote then
                                buyPlatformRemote:FireServer(platformId)
                            end
                        end)
                    end
                    task.wait(10)
                end
            end)

            WindUI:Notify({
                Title = "loc:AUTO_BUY_PLATFORMS_ENABLED_TITLE",
                Content = "loc:AUTO_BUY_PLATFORMS_ENABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:shopping-cart",
            })
        else
            if autoBuyPlatformsLoop then
                task.cancel(autoBuyPlatformsLoop)
                autoBuyPlatformsLoop = nil
            end

            WindUI:Notify({
                Title = "loc:AUTO_BUY_PLATFORMS_DISABLED_TITLE",
                Content = "loc:AUTO_BUY_PLATFORMS_DISABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoBuyPlatforms", AutoBuyPlatformsToggle)

MiscTab:Paragraph({
    Title = "─── End of Auto Buy Platforms Section ───",
    Desc = " ",
})

local function performAutoJump()
    local player = Players.LocalPlayer
    if not player then
        return
    end

    local character = player.Character
    if not character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Jump = true
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

local antiAfkEnabled = false
local antiAfkLoop = nil

local AntiAfkToggle = MiscTab:Toggle({
    Title = "loc:ANTI_AFK_TITLE",
    Desc = "loc:ANTI_AFK_DESC",
    Default = false,
    Callback = function(state)
        antiAfkEnabled = state

        if state then
            if antiAfkLoop then
                task.cancel(antiAfkLoop)
                antiAfkLoop = nil
            end

            antiAfkLoop = task.spawn(function()
                while antiAfkEnabled do
                    pcall(performAutoJump)
                    task.wait(300)
                end
            end)

            WindUI:Notify({
                Title = "loc:ANTI_AFK_ENABLED_TITLE",
                Content = "loc:ANTI_AFK_ENABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:activity",
            })
        else
            if antiAfkLoop then
                task.cancel(antiAfkLoop)
                antiAfkLoop = nil
            end

            WindUI:Notify({
                Title = "loc:ANTI_AFK_DISABLED_TITLE",
                Content = "loc:ANTI_AFK_DISABLED_CONTENT",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AntiAFK", AntiAfkToggle)

MiscTab:Paragraph({
    Title = "─── End of Anti-AFK Section ───",
    Desc = " ",
})

-- ========================================
-- AUTO INVASION ACTIVATION
-- ========================================

local AutoInvasionControl = {
    enabled = false,
    checkThread = nil,
    lastActivation = 0
}

local AutoInvasionToggle = MiscTab:Toggle({
    Title = "Auto Activate Invasion",
    Desc = "Automatically starts invasion events when ready",
    Default = false,
    Callback = function(state)
        AutoInvasionControl.enabled = state
        
        if state then
            if AutoInvasionControl.checkThread then
                task.cancel(AutoInvasionControl.checkThread)
                AutoInvasionControl.checkThread = nil
            end
            
            AutoInvasionControl.checkThread = task.spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local Players = game:GetService("Players")
                local COOLDOWN_TIME = 300 -- 5 minutes in seconds
                
                while AutoInvasionControl.enabled do
                    local success, timerText = pcall(function()
                        local player = Players.LocalPlayer
                        if not player then return nil end
                        
                        local playerGui = player:FindFirstChild("PlayerGui")
                        if not playerGui then return nil end
                        
                        local mainGui = playerGui:FindFirstChild("Main")
                        if not mainGui then return nil end
                        
                        local invasionGui = mainGui:FindFirstChild("Brainrot_Invasion")
                        if not invasionGui then return nil end
                        
                        local timer = invasionGui:FindFirstChild("Timer")
                        if not timer then return nil end
                        
                        local timeLabel = timer:FindFirstChild("Time")
                        if not timeLabel then return nil end
                        
                        return timeLabel.ContentText
                    end)
                    
                    if success and timerText == "00:00" then
                        local currentTime = tick()
                        if currentTime - AutoInvasionControl.lastActivation >= COOLDOWN_TIME then
                            task.wait(1) -- Wait 1 second to ensure timer is stable
                            
                            pcall(function()
                                local remote = ReplicatedStorage:FindFirstChild("Remotes")
                                if remote then
                                    local missionRemotes = remote:FindFirstChild("MissionServicesRemotes")
                                    if missionRemotes then
                                        local startInvasion = missionRemotes:FindFirstChild("RequestStartInvasion")
                                        if startInvasion then
                                            startInvasion:FireServer()
                                            AutoInvasionControl.lastActivation = tick()
                                        end
                                    end
                                end
                            end)
                        end
                    end
                    
                    task.wait(1)
                end
                
                AutoInvasionControl.checkThread = nil
            end)
            
            WindUI:Notify({
                Title = "Auto Invasion",
                Content = "Invasion auto-activation enabled",
                Duration = 3,
                Icon = "lucide:swords",
            })
        else
            if AutoInvasionControl.checkThread then
                task.cancel(AutoInvasionControl.checkThread)
                AutoInvasionControl.checkThread = nil
            end
            
            WindUI:Notify({
                Title = "Auto Invasion",
                Content = "Invasion auto-activation disabled",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoInvasion", AutoInvasionToggle)

MiscTab:Paragraph({
    Title = "─── End of Auto Invasion Section ───",
    Desc = " ",
})

-- ========================================
-- AUTO DAILY REWARDS
-- ========================================

local AutoDailyRewardsControl = {
    enabled = false,
    processingThread = nil
}

local function GetPlayerPlotNumber()
    local player = Players.LocalPlayer
    if not player then 
        return nil 
    end
    
    local plotNumber = player:GetAttribute("Plot")
    if not plotNumber then
        return nil
    end
    
    return tostring(plotNumber)
end

local function EquipBrainrotByName(brainrotName)
    local backpack = InventoryUtils:GetBackpack()
    if not backpack then return false end
    
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and InventoryUtils.SanitizeName(item.Name) == InventoryUtils.SanitizeName(brainrotName) then
            local player = Players.LocalPlayer
            if player and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:EquipTool(item)
                    return true
                end
            end
        end
    end
    
    return false
end

local function ProcessDailyRewards()
    local plotNumber = GetPlayerPlotNumber()
    if not plotNumber then
        print("[Auto Daily] Failed to get plot number")
        return
    end
    
    print("[Auto Daily] Plot number:", plotNumber)
    
    local plotsFolder = workspace:FindFirstChild("Plots")
    if not plotsFolder then
        print("[Auto Daily] Plots folder not found")
        return
    end
    
    local playerPlot = plotsFolder:FindFirstChild(plotNumber)
    if not playerPlot then
        print("[Auto Daily] Player plot not found:", plotNumber)
        return
    end
    
    print("[Auto Daily] Found player plot")
    
    local eventPlatforms = playerPlot:FindFirstChild("EventPlatforms")
    if not eventPlatforms then
        print("[Auto Daily] EventPlatforms not found in plot")
        return
    end
    
    print("[Auto Daily] Found EventPlatforms")
    local platformCount = 0
    
    for _, platform in pairs(eventPlatforms:GetChildren()) do
        if not AutoDailyRewardsControl.enabled then break end
        
        platformCount = platformCount + 1
        print("[Auto Daily] Processing platform:", platform.Name)
        
        local platformUI = platform:FindFirstChild("PlatformEventUI")
        if platformUI then
            -- Check if platform is still active (Enabled = true means not done yet)
            local isActive = platformUI.Enabled
            
            print("[Auto Daily] Platform Enabled:", isActive)
            
            if isActive then
                local titleLabel = platformUI:FindFirstChild("Title")
                
                if titleLabel then
                    local brainrotName = titleLabel.ContentText or titleLabel.Text
                    
                    print("[Auto Daily] Platform requires:", brainrotName)
                    print("[Auto Daily] Attempting to equip:", brainrotName)
                    
                    local equipped = EquipBrainrotByName(brainrotName)
                    
                    if equipped then
                        print("[Auto Daily] Successfully equipped!")
                        task.wait(0.5)
                        
                        local hitbox = platform:FindFirstChild("Hitbox")
                        if hitbox then
                            print("[Auto Daily] Found hitbox")
                            local proximityPrompt = hitbox:FindFirstChild("ProximityPrompt")
                            if proximityPrompt then
                                print("[Auto Daily] Found proximity prompt")
                                local player = Players.LocalPlayer
                                if player and player.Character then
                                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                                    if hrp then
                                        hrp.CFrame = hitbox.CFrame
                                        task.wait(0.3)
                                        
                                        proximityPrompt:InputHoldBegin()
                                        task.wait(proximityPrompt.HoldDuration or 0.5)
                                        proximityPrompt:InputHoldEnd()
                                        
                                        print("[Auto Daily] Activated platform!")
                                        task.wait(1)
                                    end
                                end
                            else
                                print("[Auto Daily] No proximity prompt found")
                            end
                        else
                            print("[Auto Daily] No hitbox found")
                        end
                    else
                        print("[Auto Daily] Failed to equip brainrot")
                    end
                else
                    print("[Auto Daily] No Title label found")
                end
            else
                print("[Auto Daily] Platform already complete (Enabled = false)")
            end
        else
            print("[Auto Daily] No PlatformEventUI found")
        end
        
        task.wait(0.5)
    end
    
    print("[Auto Daily] Processed", platformCount, "platforms")
end

local AutoDailyRewardsToggle = MiscTab:Toggle({
    Title = "Auto Daily Rewards",
    Desc = "Automatically complete event platform sacrifices",
    Default = false,
    Callback = function(state)
        AutoDailyRewardsControl.enabled = state
        
        if state then
            if AutoDailyRewardsControl.processingThread then
                task.cancel(AutoDailyRewardsControl.processingThread)
                AutoDailyRewardsControl.processingThread = nil
            end
            
            AutoDailyRewardsControl.processingThread = task.spawn(function()
                while AutoDailyRewardsControl.enabled do
                    pcall(ProcessDailyRewards)
                    task.wait(5)
                end
                
                AutoDailyRewardsControl.processingThread = nil
            end)
            
            WindUI:Notify({
                Title = "Auto Daily Rewards",
                Content = "Processing event platforms",
                Duration = 3,
                Icon = "lucide:gift",
            })
        else
            if AutoDailyRewardsControl.processingThread then
                task.cancel(AutoDailyRewardsControl.processingThread)
                AutoDailyRewardsControl.processingThread = nil
            end
            
            WindUI:Notify({
                Title = "Auto Daily Rewards",
                Content = "Stopped processing platforms",
                Duration = 3,
                Icon = "lucide:x",
            })
        end
    end
})
MainConfig:Register("AutoDailyRewards", AutoDailyRewardsToggle)

MiscTab:Paragraph({
    Title = "─── End of Auto Daily Rewards Section ───",
    Desc = " ",
})

-- ========================================
-- SESSION SAFETY UTILITIES
-- ========================================

local SessionSafety = {
    autoRejoinEnabled = false,
    lastAttempt = 0,
    attemptCooldown = 5,
    notifyCooldown = 20,
    lastNotify = 0,
    errorConnection = nil,
    teleportFailedConnection = nil,
    _toggle = nil,
}

function SessionSafety:DisconnectHandlers()
    if self.errorConnection then
        self.errorConnection:Disconnect()
        self.errorConnection = nil
    end

    if self.teleportFailedConnection then
        self.teleportFailedConnection:Disconnect()
        self.teleportFailedConnection = nil
    end
end

function SessionSafety:AttemptRejoin(message)
    if not self.autoRejoinEnabled then
        return
    end

    local now = os.clock()
    if now - self.lastAttempt < self.attemptCooldown then
        return
    end

    self.lastAttempt = now

    local localPlayer = Players.LocalPlayer
    if not localPlayer then
        return
    end

    task.spawn(function()
        task.wait(2)
        if not self.autoRejoinEnabled then
            return
        end

        local success = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
        end)

        if not success then
            pcall(function()
                TeleportService:Teleport(game.PlaceId, localPlayer)
            end)
        end
    end)

    if now - self.lastNotify >= self.notifyCooldown then
        self.lastNotify = now
        WindUI:Notify({
            Title = "Auto Rejoin",
            Content = message and ("Attempting to rejoin: " .. message) or "Attempting to rejoin the server...",
            Duration = 4,
            Icon = "lucide:refresh-cw",
        })
    end
end

function SessionSafety:ConnectHandlers()
    if not self.errorConnection then
        self.errorConnection = GuiService.ErrorMessageChanged:Connect(function()
            local message = GuiService:GetErrorMessage()
            if message and message ~= "" then
                self:AttemptRejoin(message)
            end
        end)
    end

    if not self.teleportFailedConnection then
        self.teleportFailedConnection = TeleportService.TeleportInitFailed:Connect(function(player, result, message)
            if player ~= Players.LocalPlayer then
                return
            end

            local details = message or (typeof(result) == "EnumItem" and result.Name) or tostring(result)
            self:AttemptRejoin(details)
        end)
    end
end

function SessionSafety:SetAutoRejoin(state)
    state = state == true
    if self.autoRejoinEnabled == state then
        return
    end

    self.autoRejoinEnabled = state

    if state then
        self:ConnectHandlers()
        self.lastAttempt = -self.attemptCooldown
        self.lastNotify = -self.notifyCooldown

        local message = GuiService:GetErrorMessage()
        if message and message ~= "" then
            self:AttemptRejoin(message)
        end

        WindUI:Notify({
            Title = "Auto Rejoin Enabled",
            Content = "We'll try to reconnect you if you disconnect.",
            Duration = 3,
            Icon = "lucide:refresh-cw",
        })
    else
        self:DisconnectHandlers()
        WindUI:Notify({
            Title = "Auto Rejoin Disabled",
            Content = "Automatic reconnection has been turned off.",
            Duration = 3,
            Icon = "lucide:power",
        })
    end
end

function SessionSafety:SyncFromConfig()
    if self._toggle then
        self:SetAutoRejoin(self._toggle.Value)
    end
end

local AutoExecuteManager = {
    enabled = false,
    loaderUrl = "https://raw.githubusercontent.com/nouralddin-abdullah/Plants-Vs-Brainrots/refs/heads/main/main.lua",
    _toggle = nil,
    _teleportConnection = nil,
}

function AutoExecuteManager:GetQueueFunction()
    local queue = nil

    if typeof(queue_on_teleport) == "function" then
        queue = queue_on_teleport
    elseif typeof(queueonteleport) == "function" then
        queue = queueonteleport
    end

    if not queue and typeof(syn) == "table" then
        local synQueue = syn.queue_on_teleport or syn.queueonteleport
        if typeof(synQueue) == "function" then
            queue = synQueue
        end
    end

    if not queue and typeof(getgenv) == "function" then
        local genv = getgenv()
        if typeof(genv) == "table" then
            local genvQueue = genv.queue_on_teleport or genv.queueonteleport
            if typeof(genvQueue) == "function" then
                queue = genvQueue
            end
        end
    end

    local exploitTables = { _G, getrenv and getrenv() }
    for _, env in ipairs(exploitTables) do
        if typeof(env) == "table" then
            local envQueue = env.queue_on_teleport or env.queueonteleport
            if typeof(envQueue) == "function" then
                queue = envQueue
                break
            end
        end
    end

    local exploitSpecific = { syn, fluxus, KRNL_LOADER, identifyexecutor }
    for _, exploit in ipairs(exploitSpecific) do
        if typeof(exploit) == "table" then
            local candidate = exploit.queue_on_teleport or exploit.queueonteleport
            if typeof(candidate) == "function" then
                queue = candidate
                break
            end
        end
    end

    return queue
end

function AutoExecuteManager:SupportsQueue()
    return typeof(self:GetQueueFunction()) == "function"
end

function AutoExecuteManager:GetStubSource()
    local url = self.loaderUrl
    local lines = {
        "-- Auto-execute loader for Plants Vs Brainrots GUI",
        "local url = \"" .. url .. "\"",
        "local success, response = pcall(function()",
        "    return game:HttpGet(url)",
        "end)",
        "if success and typeof(response) == \"string\" then",
        "    local loader = loadstring(response)",
        "    if typeof(loader) == \"function\" then",
        "        loader()",
        "    end",
        "end",
    }
    return table.concat(lines, "\n") .. "\n"
end

function AutoExecuteManager:QueueOnTeleport()
    local queueFunc = self:GetQueueFunction()
    if typeof(queueFunc) ~= "function" then
        return false, "Your executor does not support queue_on_teleport."
    end

    local scriptSource = self:GetStubSource()
    local ok, err = pcall(queueFunc, scriptSource)
    if not ok then
        return false, err
    end

    return true
end

function AutoExecuteManager:ClearQueuedTeleport()
    local queueFunc = self:GetQueueFunction()
    if typeof(queueFunc) ~= "function" then
        return false, "queue_on_teleport is unavailable."
    end

    local ok, err = pcall(queueFunc, "-- Auto execute disabled\n")
    if not ok then
        return false, err
    end

    return true
end

function AutoExecuteManager:BindTeleportWatcher()
    if self._teleportConnection or not self:SupportsQueue() then
        return
    end

    local localPlayer = Players and Players.LocalPlayer
    if not localPlayer then
        return
    end

    self._teleportConnection = localPlayer.OnTeleport:Connect(function(state)
        if not self.enabled then
            return
        end

        if state == Enum.TeleportState.Started or state == Enum.TeleportState.InProgress then
            self:QueueOnTeleport()
        end
    end)
end

function AutoExecuteManager:UnbindTeleportWatcher()
    if self._teleportConnection then
        self._teleportConnection:Disconnect()
        self._teleportConnection = nil
    end
end

function AutoExecuteManager:SetEnabled(state)
    state = state == true
    if self.enabled == state then
        if state then
            self:QueueOnTeleport()
            self:BindTeleportWatcher()
        else
            self:ClearQueuedTeleport()
        end
        return
    end

    if state then
        local queueOk, queueErr = self:QueueOnTeleport()

        if not queueOk then
            WindUI:Notify({
                Title = "Auto Execute Error",
                Content = tostring(queueErr),
                Duration = 4,
                Icon = "lucide:alert-triangle",
            })

            if self._toggle then
                self._toggle:Set(false)
            end

            self:ClearQueuedTeleport()
            return
        end

        self.enabled = true

        self:BindTeleportWatcher()

        WindUI:Notify({
            Title = "Auto Execute Enabled",
            Content = "Loader queued for your next teleport.",
            Duration = 3,
            Icon = "lucide:save",
        })
    else
        self:UnbindTeleportWatcher()

        local cleared, clearErr = self:ClearQueuedTeleport()
        if not cleared and clearErr then
            WindUI:Notify({
                Title = "Teleport Queue Info",
                Content = tostring(clearErr),
                Duration = 4,
                Icon = "lucide:info",
            })
        else
            WindUI:Notify({
                Title = "Auto Execute Disabled",
                Content = "Teleport queue cleared.",
                Duration = 3,
                Icon = "lucide:trash",
            })
        end

        self.enabled = false
    end
end

function AutoExecuteManager:SyncFromConfig()
    if self._toggle then
        self:SetEnabled(self._toggle.Value)
    end
end

-- ========================================
-- SETTINGS TAB STRUCTURE
-- ========================================

SettingsTab:Paragraph({
    Title = "loc:SETTINGS_PARAGRAPH_TITLE",
    Desc = "loc:SETTINGS_PARAGRAPH_DESC",
    Color = Color3.fromHex("#315DFF"),
})

SettingsTab:Divider()
local defaultToggleKey = "H"
local currentToggleKey = defaultToggleKey
local ToggleKeybind

local function applyToggleKey(keyName, shouldSelectElement)
    if type(keyName) ~= "string" then
        return false
    end

    local normalized = keyName:upper()
    local keyCode = Enum.KeyCode[normalized]
    if not keyCode then
        WindUI:Notify({
            Title = "loc:WINDOW_TOGGLE_INVALID_TITLE",
            Content = "loc:WINDOW_TOGGLE_INVALID_CONTENT",
            Duration = 3,
            Icon = "lucide:alert-triangle",
        })
        return false
    end

    currentToggleKey = normalized
    Window:SetToggleKey(keyCode)

    if shouldSelectElement and ToggleKeybind then
        ToggleKeybind:Set(normalized)
    end

    return true
end

applyToggleKey(defaultToggleKey, false)

-- Theme Tab Content
ThemeTab:Paragraph({
    Title = "loc:THEME_PARAGRAPH_TITLE",
    Desc = "loc:THEME_PARAGRAPH_DESC",
    Color = Color3.fromHex("#315DFF"),
})

ThemeTab:Divider()

local availableThemes = {}
do
    local themesMap = WindUI:GetThemes()
    if type(themesMap) == "table" then
        for themeName in pairs(themesMap) do
            table.insert(availableThemes, themeName)
        end
    end
end

table.sort(availableThemes)

if #availableThemes == 0 then
    availableThemes = { "Dark", "Light" }
end

local function isThemeAvailable(theme)
    for _, name in ipairs(availableThemes) do
        if name == theme then
            return true
        end
    end
    return false
end

local defaultTheme = WindUI:GetCurrentTheme()
if not defaultTheme or not isThemeAvailable(defaultTheme) then
    defaultTheme = availableThemes[1] or "Dark"
end

local ThemeDropdown = ThemeTab:Dropdown({
    Title = "loc:THEME_DROPDOWN_TITLE",
    Desc = "loc:THEME_DROPDOWN_DESC",
    Values = availableThemes,
    Value = defaultTheme,
    Multi = false,
    Callback = function(selected)
        if isThemeAvailable(selected) then
            WindUI:SetTheme(selected)
            WindUI:Notify({
                Title = "loc:THEME_CHANGED_TITLE",
                Content = "loc:THEME_CHANGED_CONTENT",
                Duration = 3,
                Icon = "lucide:palette",
            })
        else
            WindUI:Notify({
                Title = "loc:THEME_ERROR_TITLE",
                Content = "loc:THEME_ERROR_CONTENT",
                Duration = 3,
                Icon = "lucide:alert-triangle",
            })
            if isThemeAvailable(defaultTheme) then
                ThemeDropdown:Select(defaultTheme)
            end
        end
    end
})
MainConfig:Register("Theme", ThemeDropdown)

local backgroundImages = {
    Zenitsu = "rbxassetid://124285118905815",
    Spiderman = "rbxassetid://119134087037313",
    Luffy = "rbxassetid://126362587219350",
    Kazutora = "rbxassetid://139555002272444",
}

local backgroundNames = {
    "Zenitsu",
    "Spiderman",
    "Luffy",
    "Kazutora",
}

local currentBackgroundName = backgroundNames[1]
local backgroundEnabled = false

local BackgroundToggle = ThemeTab:Toggle({
    Title = "loc:BACKGROUND_IMAGE_TITLE",
    Desc = "loc:BACKGROUND_IMAGE_DESC",
    Default = false,
    Callback = function(state)
        backgroundEnabled = state
        if state then
            local assetId = backgroundImages[currentBackgroundName] or ""
            Window:SetBackgroundImage(assetId)
        else
            Window:SetBackgroundImage("")
        end
    end
})
MainConfig:Register("BackgroundEnabled", BackgroundToggle)

local BackgroundDropdown = ThemeTab:Dropdown({
    Title = "loc:BACKGROUND_PRESET_TITLE",
    Desc = "loc:BACKGROUND_PRESET_DESC",
    Values = backgroundNames,
    Value = currentBackgroundName,
    Multi = false,
    Callback = function(selected)
        currentBackgroundName = selected
        if backgroundEnabled then
            local assetId = backgroundImages[selected] or ""
            Window:SetBackgroundImage(assetId)
        end
    end
})
MainConfig:Register("BackgroundImage", BackgroundDropdown)

-- Language Warning
SettingsTab:Paragraph({
    Title = "loc:LANGUAGE_WARNING_TITLE",
    Desc = "loc:LANGUAGE_WARNING_DESC",
})

-- Language Dropdown
local LanguageDropdown = SettingsTab:Dropdown({
    Title = "loc:LANGUAGE_DROPDOWN_TITLE",
    Desc = "loc:LANGUAGE_DROPDOWN_DESC",
    Values = { "English", "Arabic", "Hindi", "French", "Urdu", "Filipino" },
    Value = "English",
    Multi = false,
    Callback = function(selected)
        if selected == "English" then
            WindUI:SetLanguage("en")
        elseif selected == "Arabic" then
            WindUI:SetLanguage("ar")
        elseif selected == "Hindi" then
            WindUI:SetLanguage("hi")
        elseif selected == "French" then
            WindUI:SetLanguage("fr")
        elseif selected == "Urdu" then
            WindUI:SetLanguage("ur")
        elseif selected == "Filipino" then
            WindUI:SetLanguage("ph")
        end
    end
})
MainConfig:Register("Language", LanguageDropdown)

SettingsTab:Divider()

WindowControlsSection = SettingsTab:Section({
    Title = "loc:WINDOW_CONTROLS_TITLE",
    Opened = true,
})

ToggleKeybind = WindowControlsSection:Keybind({
    Title = "loc:WINDOW_TOGGLE_KEYBIND_TITLE",
    Desc = "loc:WINDOW_TOGGLE_KEYBIND_DESC",
    Value = defaultToggleKey,
    Callback = function(keyName)
        if type(keyName) ~= "string" then
            return
        end

        if keyName ~= currentToggleKey then
            if applyToggleKey(keyName, false) then
                WindUI:Notify({
                    Title = "loc:WINDOW_TOGGLE_UPDATED_TITLE",
                    Content = "loc:WINDOW_TOGGLE_UPDATED_CONTENT",
                    Duration = 3,
                    Icon = "lucide:keyboard",
                })
            end
        end
    end
})
MainConfig:Register("ToggleKey", ToggleKeybind)

local SessionSafetySection = SettingsTab:Section({
    Title = "loc:SESSION_SAFETY_SECTION",
    Opened = true,
})

local AutoRejoinToggle = SessionSafetySection:Toggle({
    Title = "loc:AUTO_REJOIN_TITLE",
    Desc = "loc:AUTO_REJOIN_DESC",
    Default = false,
    Callback = function(state)
        SessionSafety:SetAutoRejoin(state)
    end
})
MainConfig:Register("AutoRejoin", AutoRejoinToggle)
SessionSafety._toggle = AutoRejoinToggle

local ScriptAutomationSection = SettingsTab:Section({
    Title = "loc:SCRIPT_AUTOMATION_SECTION",
    Opened = true,
})

local AutoExecuteToggle = ScriptAutomationSection:Toggle({
    Title = "loc:AUTO_EXECUTE_TITLE",
    Desc = "loc:AUTO_EXECUTE_DESC",
    Default = false,
    Callback = function(state)
        AutoExecuteManager:SetEnabled(state)
    end
})
MainConfig:Register("AutoExecute", AutoExecuteToggle)
AutoExecuteManager._toggle = AutoExecuteToggle

ConfigTab:Paragraph({
    Title = "loc:CONFIG_PARAGRAPH_TITLE",
    Desc = "loc:CONFIG_PARAGRAPH_DESC",
    Color = Color3.fromHex("#30FF6A"),
})

ConfigTab:Divider()

ConfigTab:Button({
    Title = "loc:CONFIG_SAVE_BUTTON_TITLE",
    Desc = "loc:CONFIG_SAVE_BUTTON_DESC",
    Callback = function()
        MainConfig:Save()
        WindUI:Notify({
            Title = "loc:CONFIG_SAVE_NOTIFY_TITLE",
            Content = "loc:CONFIG_SAVE_NOTIFY_CONTENT",
            Duration = 3,
            Icon = "lucide:save",
        })
    end
})

ConfigTab:Button({
    Title = "loc:CONFIG_LOAD_BUTTON_TITLE",
    Desc = "loc:CONFIG_LOAD_BUTTON_DESC",
    Callback = function()
        MainConfig:Load()
        WindUI:Notify({
            Title = "loc:CONFIG_LOAD_NOTIFY_TITLE",
            Content = "loc:CONFIG_LOAD_NOTIFY_CONTENT",
            Duration = 3,
            Icon = "lucide:folder-open",
        })
    end
})

ConfigTab:Button({
    Title = "loc:CONFIG_RESET_BUTTON_TITLE",
    Desc = "loc:CONFIG_RESET_BUTTON_DESC",
    Callback = function()
        WindUI:Dialog({
            Title = "loc:CONFIG_RESET_DIALOG_TITLE",
            Content = "loc:CONFIG_RESET_DIALOG_CONTENT",
            Icon = "lucide:alert-triangle",
            Buttons = {
                {
                    Title = "loc:CONFIG_RESET_DIALOG_CANCEL",
                    Variant = "Tertiary",
                    Callback = function() end,
                },
                {
                    Title = "loc:CONFIG_RESET_DIALOG_CONFIRM",
                    Variant = "Primary",
                    Icon = "lucide:trash-2",
                    Callback = function()
                        WindUI:Notify({
                            Title = "loc:CONFIG_RESET_NOTIFY_TITLE",
                            Content = "loc:CONFIG_RESET_NOTIFY_CONTENT",
                            Duration = 3,
                            Icon = "lucide:refresh-cw",
                        })
                    end,
                }
            }
        }):Show()
    end
})

ConfigTab:Divider()

ConfigTab:Paragraph({
    Title = "loc:CONFIG_ABOUT_TITLE",
    Desc = "loc:CONFIG_ABOUT_DESC",
    Color = Color3.fromHex("#8A2BE2"),
})

ConfigTab:Button({
    Title = "loc:CONFIG_UPDATE_BUTTON_TITLE",
    Desc = "loc:CONFIG_UPDATE_BUTTON_DESC",
    Callback = function()
        WindUI:Notify({
            Title = "loc:CONFIG_UPDATE_NOTIFY_TITLE",
            Content = "loc:CONFIG_UPDATE_NOTIFY_CONTENT",
            Duration = 3,
            Icon = "lucide:check-circle",
        })
    end
})

-- ========================================
-- AUTO-LOAD SAVED CONFIG
-- ========================================

-- Automatically load saved configuration on startup
task.spawn(function()
    task.wait(0.5) -- Wait for GUI to fully initialize
    MainConfig:Load()
    
    -- Wait a bit more for config values to apply to UI elements
    task.wait(0.2)
    
    -- Sync AutoShopping state from loaded config dropdowns/toggles
    AutoShopping:SyncFromConfig()
    
    -- Sync AutoFreeze settings from loaded config
    AutoFreeze:SyncFromConfig()

    -- Sync AutoAttack settings from loaded config
    AutoAttack:SyncFromConfig()

    -- Sync inventory automation systems
    AutoEggs:SyncFromConfig()
    BrainrotFavoriteManager:SyncFromConfig()
    PlantFavoriteManager:SyncFromConfig()
    AutoSellBrainrots:SyncFromConfig()
    AutoSellPlants:SyncFromConfig()

    -- Sync row statistics overlay state
    RowStatistics:SyncFromConfig()
    SessionSafety:SyncFromConfig()
    AutoExecuteManager:SyncFromConfig()
    
    -- Check if auto-buy was enabled in saved config and trigger immediate purchase
    if (AutoShopping.gearEnabled and #AutoShopping.gearSelected > 0) or 
       (AutoShopping.plantEnabled and #AutoShopping.plantSelected > 0) then
        task.spawn(function()
            task.wait(1) -- Wait for shop data to load
            AutoShopping:TriggerImmediatePurchase()
        end)
    end
    
    WindUI:Notify({
        Title = "loc:CONFIG_LOAD_NOTIFY_TITLE",
        Content = "loc:CONFIG_LOAD_NOTIFY_CONTENT",
        Duration = 3,
        Icon = "lucide:check-circle",
    })
end)

-- Auto-save configuration on window close
Window:OnClose(function()
    MainConfig:Save()
    -- Don't stop the update loop! Keep it running so timer continues updating
end)

-- ========================================
-- CHANGELOG TAB CONTENT
-- ========================================

ChangelogTab:Paragraph({
    Title = "📰 Latest Updates",
    Desc = "Recent changes and new features"
})

ChangelogTab:Divider()

ChangelogTab:Paragraph({
    Title = "🆕 Auto Invasion System",
    Desc = "New automation feature added! Check the Misc tab for 'Auto Activate Invasion' toggle. \n • Auto Invasion: Misc Tab → 'Auto Activate Invasion'\n•."
})
