
-- Raptor Hub
-- Powered by SoulForge 

-- Fetch Key 
key = game:HttpGet("https://pastebin.com/raw/bRcVZwNf")


-- BUTTON TO MAXIMIZE THE GUI
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ImageButtonGui"
screenGui.ResetOnSpawn = false -- Ensure it does not reset on spawn
screenGui.Parent = playerGui

-- Create an ImageButton
local imageButton = Instance.new("ImageButton")
imageButton.Size = UDim2.new(0, 50, 0, 50) -- Size of the button
imageButton.Position = UDim2.new(0.5, -50, 0.5, -50) -- Center of the screen
imageButton.Image = "rbxassetid://74914034808156" -- Replace with your image asset ID
imageButton.Draggable = true -- Make the button draggable
imageButton.Active = true -- Ensure the button is active
imageButton.Transparency = 1
imageButton.Parent = screenGui

-- Functionality for the button
imageButton.MouseButton1Click:Connect(function()
    -- Send Keypress (OPEN GUI)
    local VirtualInputManager = game:GetService("VirtualInputManager")

    -- Simulate pressing the right Ctrl key
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightControl, false, nil)

    -- Simulate releasing the right Ctrl key
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightControl, false, nil)
end)

local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:Window({
    Title = "SoulForge Hub",
    Subtitle = "Free | V2.01",
    Size = UDim2.fromOffset(634, 450),
    DragStyle = 2,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})

-- NOTIFICATIONS ================================================================================
Window:Notify({
    Title = "SoulForge Hub",
    Description = "Powered by Zoriko",
    Lifetime = 10
})


-- GLOBAL SETTINGS ================================================================================
local Global_Setting = Window:GlobalSetting({
    Name = "Moderator Join Alerts",
    Default = false,
    Callback = function(State)
        print("Moderator Join Alerts " .. (State and "Enabled" or "Disabled"))
    end,
})

local Global_Setting = Window:GlobalSetting({
    Name = "Moderator Join Alerts",
    Default = false,
    Callback = function(State)
        print("Moderator Join Alerts " .. (State and "Enabled" or "Disabled"))
    end,
})

--TABS ================================================================================
local TabGroup = Window:TabGroup()
local Tab = TabGroup:Tab({
    Name = 'Auto Farming'

  })

  local Section = Tab:Section({
    Side = "Left"
})

local Section1 = Tab:Section({
    Side = "Right"
})
Section:Toggle({
    Name = "Auto Build",
    Default = false,
    Callback = function(value)
        Window:Notify({
            Title = "SoulForge",
            Description = (value and "Enabled " or "Disabled ") .. "Flight"
        })
    end
}, "AutoBuildToggle")

local autoCollectEnabled = false

Section1:Toggle({
    Name = "Auto Collect",
    Default = false,
    Callback = function(value)
        autoCollectEnabled = value -- Fix: Ensure toggle works correctly
        
        if autoCollectEnabled then
            task.spawn(function()
                while autoCollectEnabled do
                    local localPlayer = game.Players.LocalPlayer
                    if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local collectorPath = workspace.Tycoons:FindFirstChild(localPlayer.Name)
                        if collectorPath and collectorPath:FindFirstChild("Auxiliary") and collectorPath.Auxiliary:FindFirstChild("Collector") and collectorPath.Auxiliary.Collector:FindFirstChild("Collect") then
                            localPlayer.Character.HumanoidRootPart.CFrame = collectorPath.Auxiliary.Collector.Collect.CFrame
                        end
                    end
                    task.wait(0.1) -- Adjust the delay as needed
                end
            end)
        end
        
        Window:Notify({
            Title = "SoulForge",
            Description = (value and "Enabled Auto Collect" or "Disabled Auto Collect")
        })
    end
}, "AutoCollectToggle")
