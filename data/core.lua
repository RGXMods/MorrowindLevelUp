--=====================================================================================
-- MRLU | MorrowindLevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "MRLU: RGX-Framework not loaded")

MRLU = MRLU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "MorrowindLevelUp"
local PREFIX = "|Tinterface/addons/MorrowindLevelUp/media/icon:16:16|t - |cffffffff[|r|cff231f20MRLU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/MorrowindLevelUp/media/icon:18:18|t [|cff231f20M|r|cfffffffforrowind|r |cff231f20L|r|cffffffffevel|r |cff231f20U|r|cff231f20p|r|cff231f20!|r]"

MRLU.version = ADDON_VERSION
MRLU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\MorrowindLevelUp\\sounds\\morrowind_high.ogg",
medium = "Interface\\Addons\\MorrowindLevelUp\\sounds\\morrowind_med.ogg",
low = "Interface\\Addons\\MorrowindLevelUp\\sounds\\morrowind_low.ogg",
},
defaultSoundId = 569593,
savedVar = "MRLUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

MRLU.handle = handle

local L = MRLU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_VARIANT_HIGH"] or ""))
print(PREFIX .. " " .. (L["HELP_VARIANT_MEDIUM"] or ""))
print(PREFIX .. " " .. (L["HELP_VARIANT_LOW"] or ""))
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(MRLU.L)
L = MRLU.L or {}
handle:Init()
initialized = true
end, "MRLU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "MRLU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(MRLU.L)
L = MRLU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "MRLU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "MRLU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("mrlu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. tostring(err))
end
end, "MRLU_SLASH")
