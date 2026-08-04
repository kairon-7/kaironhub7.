-- Kairon Hub - Sangam Edition
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Hub = WindUI:CreateWindow({
    Title = "Kairon Hub",
    Size = UDim2.new(0, 500, 0, 400),
    Theme = "Dark"
})

-- Tabs
local PlayerTab = Hub:CreateTab("Player")
local GameTab = Hub:CreateTab("Game")
local VisualsTab = Hub:CreateTab("Visuals")

-- PLAYER TAB
PlayerTab:CreateLabel("Player Controls")

PlayerTab:CreateButton({
    Name = "Heal",
    Callback = function()
        local p = game.Players.LocalPlayer
        if p and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then h.Health = h.MaxHealth end
        end
    end
})

PlayerTab:CreateToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(state)
        local p = game.Players.LocalPlayer
        if p and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then
                h.MaxHealth = state and 1e9 or 100
                h.Health = state and 1e9 or 100
            end
        end
    end
})

-- GAME TAB
GameTab:CreateLabel("Game Controls")

GameTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        local p = game.Players.LocalPlayer
        if p and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then h.WalkSpeed = value end
        end
    end
})

-- VISUALS TAB
VisualsTab:CreateLabel("Visual Settings")

VisualsTab:CreateToggle({
    Name = "Full Bright",
    Default = false,
    Callback = function(state)
        game.Lighting.Brightness = state and 10 or 1
    end
})

-- Keybind
Hub:SetKeybind("RightShift")

print("Kairon Hub Loaded Successfully!")