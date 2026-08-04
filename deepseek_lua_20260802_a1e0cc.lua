-- Kairon Hub - Venyx Edition (Xeno Compatible)
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/pizzaboxer/Venyx/main/Venyx.lua"))()

local Hub = Venyx:CreateWindow({
    Title = "Kairon Hub",
    Size = UDim2.new(0, 500, 0, 400),
    Theme = "Dark"
})

local T1 = Hub:CreateTab("Player")
local T2 = Hub:CreateTab("Game")
local T3 = Hub:CreateTab("Visuals")

-- PLAYER TAB
T1:AddButton({
    Name = "Heal",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
        end
    end
})

T1:AddToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.MaxHealth = state and 1e9 or 100
                humanoid.Health = state and 1e9 or 100
            end
        end
    end
})

-- GAME TAB
T2:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end
})

-- VISUALS TAB
T3:AddToggle({
    Name = "Full Bright",
    Default = false,
    Callback = function(state)
        game.Lighting.Brightness = state and 10 or 1
    end
})

Hub:SetKeybind("RightShift")
print("Kairon Hub Loaded")
