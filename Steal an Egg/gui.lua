local Scripts = {
    [1] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main.lua",
    [2] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main2.lua",
    [3] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main3.lua"
}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OTC_StealAnEgg_Selector"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(500, 300)
Main.Position = UDim2.new(0.5, -250, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(225, 139, 18)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(35, 25, 15)
Stroke.Thickness = 4
Stroke.Parent = Main

local Scale = Instance.new("UIScale")
Scale.Scale = 0
Scale.Parent = Main

TweenService:Create(
    Scale,
    TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Scale = 1}
):Play()

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -70, 0, 60)
Title.Position = UDim2.new(0, 35, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = "CHOOSE SCRIPT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 32
Title.Font = Enum.Font.GothamBlack
Title.TextStrokeColor3 = Color3.fromRGB(25, 25, 25)
Title.TextStrokeTransparency = 0
Title.Parent = Main

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Size = UDim2.fromOffset(40, 40)
Close.Position = UDim2.new(1, -48, 0, -10)
Close.BackgroundColor3 = Color3.fromRGB(75, 68, 95)
Close.BorderSizePixel = 0
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 24
Close.Font = Enum.Font.GothamBlack
Close.TextStrokeTransparency = 0
Close.TextStrokeColor3 = Color3.fromRGB(25, 25, 25)
Close.ZIndex = 10
Close.Parent = Main

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = Close

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = Color3.fromRGB(35, 25, 15)
CloseStroke.Thickness = 3
CloseStroke.Parent = Close

Close.MouseEnter:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(100, 90, 125)}
    ):Play()
end)

Close.MouseLeave:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(75, 68, 95)}
    ):Play()
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Container = Instance.new("Frame")
Container.Name = "Scripts"
Container.Size = UDim2.new(1, -50, 0, 170)
Container.Position = UDim2.new(0, 25, 0, 90)
Container.BackgroundTransparency = 1
Container.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.FillDirection = Enum.FillDirection.Horizontal
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Center
Layout.Padding = UDim.new(0, 10)
Layout.Parent = Container

local function CreateScriptCard(number)
    local Card = Instance.new("Frame")
    Card.Name = "Script" .. number
    Card.Size = UDim2.fromOffset(135, 160)
    Card.BackgroundColor3 = Color3.fromRGB(255, 202, 50)
    Card.BorderSizePixel = 0
    Card.Parent = Container

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 10)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = Color3.fromRGB(70, 45, 10)
    CardStroke.Thickness = 3
    CardStroke.Parent = Card

    local Number = Instance.new("TextLabel")
    Number.Size = UDim2.new(1, 0, 0, 50)
    Number.Position = UDim2.new(0, 0, 0, 5)
    Number.BackgroundTransparency = 1
    Number.Text = tostring(number)
    Number.TextColor3 = Color3.fromRGB(255, 255, 255)
    Number.TextSize = 42
    Number.Font = Enum.Font.GothamBlack
    Number.TextStrokeTransparency = 0
    Number.TextStrokeColor3 = Color3.fromRGB(35, 25, 10)
    Number.Parent = Card

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -10, 0, 25)
    Label.Position = UDim2.new(0, 5, 0, 55)
    Label.BackgroundTransparency = 1
    Label.Text = "STEAL AN EGG"
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamBlack
    Label.TextStrokeTransparency = 0
    Label.TextStrokeColor3 = Color3.fromRGB(40, 30, 10)
    Label.Parent = Card

    local Select = Instance.new("TextButton")
    Select.Name = "Select"
    Select.Size = UDim2.new(1, -20, 0, 38)
    Select.Position = UDim2.new(0, 10, 1, -48)
    Select.BackgroundColor3 = Color3.fromRGB(255, 170, 25)
    Select.BorderSizePixel = 0
    Select.Text = "SELECT"
    Select.TextColor3 = Color3.fromRGB(255, 255, 255)
    Select.TextSize = 15
    Select.Font = Enum.Font.GothamBlack
    Select.TextStrokeTransparency = 0
    Select.TextStrokeColor3 = Color3.fromRGB(55, 35, 5)
    Select.Parent = Card

    local SelectCorner = Instance.new("UICorner")
    SelectCorner.CornerRadius = UDim.new(0, 8)
    SelectCorner.Parent = Select

    local SelectStroke = Instance.new("UIStroke")
    SelectStroke.Color = Color3.fromRGB(75, 45, 5)
    SelectStroke.Thickness = 2
    SelectStroke.Parent = Select

    Select.MouseEnter:Connect(function()
        TweenService:Create(
            Card,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                Size = UDim2.fromOffset(142, 167),
                BackgroundColor3 = Color3.fromRGB(255, 215, 65)
            }
        ):Play()

        TweenService:Create(
            Select,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(255, 190, 35)}
        ):Play()
    end)

    Select.MouseLeave:Connect(function()
        TweenService:Create(
            Card,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                Size = UDim2.fromOffset(135, 160),
                BackgroundColor3 = Color3.fromRGB(255, 202, 50)
            }
        ):Play()

        TweenService:Create(
            Select,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(255, 170, 25)}
        ):Play()
    end)

    Select.MouseButton1Click:Connect(function()
        Select.Text = "LOADING..."

        local success, result = pcall(function()
            local Source = game:HttpGet(Scripts[number])
            local LoadedScript = loadstring(Source)

            if not LoadedScript then
                error("Failed to compile Script " .. number)
            end

            LoadedScript()
        end)

        ScreenGui:Destroy()

        if not success then
            warn("[OTC] Script " .. number .. " failed: " .. tostring(result))
        end
    end)
end

CreateScriptCard(1)
CreateScriptCard(2)
CreateScriptCard(3)