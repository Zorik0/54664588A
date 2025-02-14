local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local KeyButton = Instance.new("TextButton")
local SubmitButton = Instance.new("TextButton")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
Frame.BackgroundTransparency = 0.250
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.378580332, 0, 0.363636374, 0)
Frame.Size = UDim2.new(0, 390, 0, 251)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
TextBox.BackgroundTransparency = 0.200
TextBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderSizePixel = 2
TextBox.Position = UDim2.new(0.247989908, 0, 0.486486495, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 30.000
TextBox.TextWrapped = true
TextBox.PlaceholderText = 'Paste Key Here'
wait(2)
TextBox:CaptureFocus()

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.370888114, 0, -0.198044851, 0)
ImageLabel.SelectionImageObject = Frame
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "rbxassetid://74914034808156"

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.247989908, 0, 0.137592211, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "SoulForge Hub"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.121288747, 0, 0.387387395, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 22)
TextLabel_2.Font = Enum.Font.Michroma
TextLabel_2.Text = "Paste Key here"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

KeyButton.Name = "KeyButton"
KeyButton.Parent = Frame
KeyButton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
KeyButton.BorderColor3 = Color3.fromRGB(159, 159, 159)
KeyButton.Position = UDim2.new(0.597439051, 0, 0.770065606, 0)
KeyButton.Size = UDim2.new(0, 63, 0, 34)
KeyButton.Font = Enum.Font.Unknown
KeyButton.Text = "GET KEY"
KeyButton.TextColor3 = Color3.fromRGB(170, 255, 0)
KeyButton.TextScaled = true
KeyButton.TextSize = 14.000
KeyButton.TextWrapped = true
KeyButton.MouseButton1Click:Connect(function()
setclipboard(tostring("https://link-target.net/347027/soulforge-keysystem-01"))

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "SoulForge Hub", Description = "Key Link Has been Copied, Open It in browser"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
)

end)

SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = Frame
SubmitButton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
SubmitButton.BorderColor3 = Color3.fromRGB(159, 159, 159)
SubmitButton.Position = UDim2.new(0.246156976, 0, 0.770065606, 0)
SubmitButton.Size = UDim2.new(0, 128, 0, 34)
SubmitButton.Font = Enum.Font.Unknown
SubmitButton.Text = "SUBMIT"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextScaled = true
SubmitButton.TextSize = 14.000
SubmitButton.TextWrapped = true
SubmitButton.MouseButton1Click:Connect(function()
    local key = game:HttpGet("https://pastebin.com/raw/bRcVZwNf")
    local inputText = TextBox.Text
    if inputText == key then
        print('Key Verified')
        local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

        Notification:Notify(
            {Title = "SoulForge Hub", Description = "Key Verified, Welcome to SoulForge Hub"},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
        )

        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zorik0/54664588A/refs/heads/main/Game_Finder.lua"))()
    else 
        print('Incorrect key') 
        local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

        Notification:Notify(
            {Title = "SoulForge Hub", Description = "Incorrect Key"},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
        )

        end -- Added the missing 'end' here
print(inputText)
end)
