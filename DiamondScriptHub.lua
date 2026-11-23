--[[
    Multi-Game Script Hub — V1 [BETA]
    Одна вкладка • Мультиязычность • Авто-закрытие
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ==========================================
-- ПЕРЕВОДЫ
-- ==========================================
local Translations = {
    RU = { buttons = {
        brook1 = "Brookhaven — ESP + Телепорт",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
    EN = { buttons = {
        brook1 = "Brookhaven — ESP + Teleport",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
    UA = { buttons = {
        brook1 = "Brookhaven — ESP + Телепорт",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
    ES = { buttons = {
        brook1 = "Brookhaven — ESP + Teletransporte",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
    DE = { buttons = {
        brook1 = "Brookhaven — ESP + Teleport",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
    FR = { buttons = {
        brook1 = "Brookhaven — ESP + Téléportation",
        brook2 = "Brookhaven — Qwakk Hub",
        boat1  = "Build a Boat — DiamondBoatHub",
        univ   = "Universal — Diamond Universal Hub",
        mm2    = "Murder Mystery 2 — Diamond MM2 [BETA]",
    }},
}

local LangMap = {
    ["🇷🇺 Русский"]     = "RU",
    ["🇬🇧 English"]     = "EN",
    ["🇺🇦 Українська"]  = "UA",
    ["🇪🇸 Español"]     = "ES",
    ["🇩🇪 Deutsch"]     = "DE",
    ["🇫🇷 Français"]    = "FR",
}

-- ==========================================
-- ОКНО
-- ==========================================
local Window = Rayfield:CreateWindow({
   Name = "Multi-Game Script Hub — V1 [BETA]",
   LoadingTitle = "Loading Hub V1 [BETA]...",
   LoadingSubtitle = "multilingual • auto-close",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MultiGameHub",
      FileName = "Config"
   },
   KeySystem = false
})

local Tab = Window:CreateTab("📜 Hub — V1 [BETA]", 4483362458)

-- ==========================================
-- ЗАПУСК СКРИПТА + ЗАКРЫТИЕ ХАБА
-- ==========================================
local function RunAndClose(loader)
    pcall(function() Rayfield:Destroy() end)
    pcall(function()
        for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
            if gui.Name:find("Rayfield") then gui:Destroy() end
        end
    end)
    task.wait(0.15)
    local ok, err = pcall(loader)
    if not ok then warn("[Hub V1 [BETA]] Script error:", err) end
end

-- ==========================================
-- ССЫЛКИ НА КНОПКИ
-- ==========================================
local ButtonRefs = {}

local function RegisterButton(key, callback)
    local btn = Tab:CreateButton({
        Name = Translations.RU.buttons[key],
        Callback = callback,
    })
    ButtonRefs[key] = btn
end

-- ==========================================
-- ЯЗЫКОВОЙ ДРОПДАУН
-- ==========================================
Tab:CreateDropdown({
    Name = "🌐 Language / Язык",
    Options = {
        "🇷🇺 Русский", "🇬🇧 English", "🇺🇦 Українська",
        "🇪🇸 Español", "🇩🇪 Deutsch", "🇫🇷 Français"
    },
    CurrentOption = {"🇷🇺 Русский"},
    MultipleOptions = false,
    Flag = "SelectedLanguage",
    Callback = function(opt)
        local lang = LangMap[opt] or "RU"
        local T = Translations[lang]
        if not T then return end
        for key, btn in pairs(ButtonRefs) do
            pcall(function() btn:Set({Name = T.buttons[key]}) end)
        end
    end,
})

-- ==========================================
-- BROOKHAVEN
-- ==========================================
Tab:CreateSection("Brookhaven")

RegisterButton("brook1", function()
    RunAndClose(function()
        loadstring(game:HttpGet("https://pastebin.ai/raw/2tNmSSrEr"))()
    end)
end)

RegisterButton("brook2", function()
    RunAndClose(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/FVLTqa3x"))()
    end)
end)

-- ==========================================
-- BUILD A BOAT
-- ==========================================
Tab:CreateSection("Build a Boat")

RegisterButton("boat1", function()
    RunAndClose(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/donnagarhartqg494-max/DiamondBoatHub/main/DiamondBoatHub.lua"))()
    end)
end)

-- ==========================================
-- UNIVERSAL
-- ==========================================
Tab:CreateSection("Universal")

RegisterButton("univ", function()
    RunAndClose(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/donnagarhartqg494-max/DIAMOND-UNIVERSAL-HUB/refs/heads/main/DIAMOND%20UNIVERSAL%20HUB.lua"))()
    end)
end)

-- ==========================================
-- MURDER MYSTERY 2
-- ==========================================
Tab:CreateSection("Murder Mystery 2")

RegisterButton("mm2", function()
    RunAndClose(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/donnagarhartqg494-max/DIAMOND-MM2/refs/heads/main/DIAMOND%20MM2.lua"))()
    end)
end)

-- ==========================================
-- УВЕДОМЛЕНИЕ
-- ==========================================
Rayfield:Notify({
   Title = "Hub V1 [BETA] Loaded",
   Content = "Pick a script — hub will auto-close. Run code again to reopen.",
   Duration = 6,
   Image = 4483362458,
})
