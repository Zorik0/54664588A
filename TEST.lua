-- Load Maclib
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

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
    Name = "Auto Teleport to Pads",
    Default = false,
    Callback = function(State)
        print("Auto Teleport to Pads:", State and "Enabled" or "Disabled")
        -- Add your logic here for Auto Teleport to Pads
    end,
})

AutoBuildSection:Toggle({
    Name = "Auto Collect",
    Default = false,
    Callback = function(State)
        print("Auto Collect:", State and "Enabled" or "Disabled")
        -- Add your logic here for Auto Collect
    end,
})

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
