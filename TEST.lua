-- Load Maclib
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
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

-- Create the main window
local Window = MacLib:Window({
    Title = "Elemental Powers Tycoon",
    Subtitle = "UI by Maclib",
    Size = UDim2.fromOffset(634, 450),
    DragStyle = 2,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})

-- Create a Tab Group
local TabGroup = Window:TabGroup()

-- Add the "Auto Build" Tab
local AutoBuildTab = TabGroup:Tab({
    Name = "Auto Build",
    Image = "", -- Optional: Add an image path here if needed
})

-- Add sections to the "Auto Build" Tab
local AutoBuildSection = AutoBuildTab:Section({
    Side = "Left",
})

-- Add Toggles for "Auto Build"
AutoBuildSection:Toggle({
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


AutoBuildSection:Toggle({
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

-- Add the "GamePlay" Tab
local GamePlayTab = TabGroup:Tab({
    Name = "GamePlay",
    Image = "", -- Optional: Add an image path here if needed
})

-- Add sections to the "GamePlay" Tab
local GamePlaySection = GamePlayTab:Section({
    Side = "Left",
})

-- Add Button for "Safe Spot"
GamePlaySection:Button({
    Name = "Safe Spot",
    Callback = function()
        print("Safe Spot Button Clicked")
        -- Add your logic here for Safe Spot
    end,
})

-- Add Toggle for "Auto Safe Spot"
GamePlaySection:Toggle({
    Name = "Auto Safe Spot",
    Default = false,
    Callback = function(State)
        print("Auto Safe Spot:", State and "Enabled" or "Disabled")
        -- Add your logic here for Auto Safe Spot
    end,
})

-- Add the "Misc" Tab
local MiscTab = TabGroup:Tab({
    Name = "Misc",
    Image = "", -- Optional: Add an image path here if needed
})

-- Add sections to the "Misc" Tab
local MiscSection = MiscTab:Section({
    Side = "Left",
})

-- Add Buttons for "Misc" Tab
MiscSection:Button({
    Name = "Player Speed",
    Callback = function()
        print("Player Speed Button Clicked")
        -- Add your logic here for Player Speed
    end,
})

MiscSection:Button({
    Name = "Player Jumps",
    Callback = function()
        print("Player Jumps Button Clicked")
        -- Add your logic here for Player Jumps
    end,
})

MiscSection:Button({
    Name = "HitBox Expand",
    Callback = function()
        print("HitBox Expand Button Clicked")
        -- Add your logic here for HitBox Expand
    end,
})
