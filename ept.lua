
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


local localPlayer = game.Players.LocalPlayer
workspace.Tycoons[localPlayer.Name].Auxiliary.Shop:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary["2X"]:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Infinity:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Meteor:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Crate:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Size:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Speed:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.Health:Destroy()
workspace.Tycoons[localPlayer.Name].Auxiliary.AllPowers:Destroy()

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
local Tab1 = TabGroup:Tab({
    Name = 'Auto Farming'

  })

  local Section = Tab1:Section({
    Side = "Left"
})

local Section1 = Tab1:Section({
    Side = "Right"
})

Section:Toggle({
    Name = "Auto Build",
    Default = false,
    Callback = function(value)
        autoBuildEnabled = value

        Window:Notify({
            Title = "SoulForge",
            Description = (value and "Enabled Auto Build" or "Disabled Auto Build")
        })

        if value then
            task.spawn(function()
                local localPlayer = game.Players.LocalPlayer
                local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")

                while autoBuildEnabled do
                    local tycoon = workspace.Tycoons[localPlayer.Name]
                    if tycoon and tycoon:FindFirstChild("Buttons") then
                        for _, thing in ipairs(tycoon.Buttons:GetChildren()) do
                            if thing:IsA("Folder") or thing:IsA("Model") then -- Ensure it contains Buttons
                                for _, button in ipairs(thing:GetChildren()) do
                                    if button:IsA("Part") or button:IsA("BasePart") then
                                        hrp.CFrame = button.CFrame
                                        task.wait(0.5) -- Adjust delay as needed
                                    end
                                end
                            end
                        end
                    end
                    task.wait(5) -- Prevents excessive looping
                end
            end)
        end
    end
}, "AutoBuildToggle")

local autoCollectEnabled = false

Section1:Toggle({
    Name = "Auto Collect",
    Default = false,
    Callback = function(value)
        autoCollectEnabled = value
        
        Window:Notify({
            Title = "SoulForge",
            Description = (value and "Enabled Auto Collect" or "Disabled Auto Collect")
        })

        if value then
            task.spawn(function()
                while autoCollectEnabled do
                    local localPlayer = game.Players.LocalPlayer
                    if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        localPlayer.Character.HumanoidRootPart.CFrame = workspace.Tycoons[localPlayer.Name].Auxiliary.Collector.Collect.CFrame
                    end
                    task.wait(1) -- Adjust this delay to avoid excessive server requests
                end
            end)
        end
    end
}, "AutoCollectToggle")

-- Tab 2: GamePlay
local Tab2 = TabGroup:Tab({
    Name = "GamePlay"
})

local Section3 = Tab2:Section({
    Side = "Left"
})

Section3:Button({
    Name = "Kill All",
    Callback = function()
        print("Killed everyone.")
    end
})
