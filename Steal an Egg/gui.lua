local Scripts = {
    [1] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main.lua",
    [2] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main2.lua",
    [3] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main3.lua"
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OTC_StealAnEgg"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromOffset(320, 250)
Frame.Position = UDim2.new(0.5, -160, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 55)
Title.BackgroundTransparency = 1
Title.Text = "Choose Steal an Egg Script"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local function CreateButton(number, y)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.fromOffset(260, 45)
    Button.Position = UDim2.new(0.5, -130, 0, y)
    Button.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
    Button.BorderSizePixel = 0
    Button.Text = "Script " .. number
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamMedium
    Button.Parent = Frame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 7)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()

        local success, result = pcall(function()
            local source = game:HttpGet(Scripts[number])
            local script = loadstring(source)

            if not script then
                error("Failed to load Script " .. number)
            end

            script()
        end)

        if not success then
            warn("[OTC] Script " .. number .. " error: " .. tostring(result))
        end
    end)
end

CreateButton(1, 65)
CreateButton(2, 115)
CreateButton(3, 165)