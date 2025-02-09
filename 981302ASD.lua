TextLabel_2.Parent = Frame

local key = game:HttpGet("https://pastebin.com/raw/bRcVZwNf")
    local inputText = TextBox.Text
    if inputText == key then
        print('it works')
    else
        print('incorrect key') end -- Added the missing 'end' here
print(inputText)
