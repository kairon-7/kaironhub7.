-- KAIRON HUB - ULTRA SIMPLE VERSION
local player = game.Players.LocalPlayer

-- Create a simple GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "KAIRON HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.BackgroundTransparency = 1
title.Parent = frame

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BorderSizePixel = 0
close.Parent = frame
close.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- Function to create buttons
local function makeButton(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 250, 0, 40)
    btn.Position = UDim2.new(0.5, -125, 0, yPos)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    btn.BorderSizePixel = 0
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Function to make toggle buttons
local function makeToggle(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 250, 0, 40)
    btn.Position = UDim2.new(0.5, -125, 0, yPos)
    btn.Text = text .. " [OFF]"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    btn.BorderSizePixel = 0
    btn.Parent = frame
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. (state and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(60, 60, 80)
        callback(state)
    end)
    return btn
end

-- ===== BUTTONS =====

-- Heal Button
makeButton("Heal", 50, function()
    print("Healing...")
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.Health = hum.MaxHealth
            print("Healed! Health: " .. hum.Health)
        else
            print("No Humanoid found!")
        end
    else
        print("No Character!")
    end
end)

-- God Mode Toggle
makeToggle("God Mode", 100, function(state)
    print("God Mode: " .. tostring(state))
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            if state then
                hum.MaxHealth = 999999999
                hum.Health = 999999999
            else
                hum.MaxHealth = 100
                hum.Health = 100
            end
        end
    end
end)

-- Walk Speed Button (increments)
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0, 250, 0, 40)
speedBtn.Position = UDim2.new(0.5, -125, 0, 150)
speedBtn.Text = "Walk Speed: 16"
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
speedBtn.BorderSizePixel = 0
speedBtn.Parent = frame

local speed = 16
speedBtn.MouseButton1Click:Connect(function()
    speed = speed + 5
    if speed > 100 then speed = 16 end
    speedBtn.Text = "Walk Speed: " .. speed
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = speed
        end
    end
end)

-- Full Bright Toggle
makeToggle("Full Bright", 200, function(state)
    game.Lighting.Brightness = state and 10 or 1
    print("Full Bright: " .. tostring(state))
end)

-- Keybind
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        screenGui.Enabled = not screenGui.Enabled
    end
end)


print("KAIRON HUB LOADED! Press RightShift to toggle")
