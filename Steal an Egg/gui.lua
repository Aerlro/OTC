local Scripts = {
    [1] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main.lua",
    [2] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main2.lua",
    [3] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20an%20Egg/main3.lua"
}

local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OTC_StealAnEgg"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

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

local function LoadScript(number)
    local url = Scripts[number]

    print("[OTC] Selected Script: " .. tostring(number))
    print("[OTC] URL: " .. tostring(url))

    if not url then
        warn("[OTC] Script URL not found!")
        return
    end

    local success, result = pcall(function()
        print("[OTC] Downloading Script " .. number .. "...")

        local source = game:HttpGet(url)

        print("[OTC] Downloaded " .. tostring(#source) .. " characters")

        if not source or source == "" then
            error("Script returned an empty source")
        end

        local compiled, compileError = loadstring(source)

        if not compiled then
            error("Compile error: " .. tostring(compileError))
        end

        print("[OTC] Script " .. number .. " compiled successfully")

        compiled()

        print("[OTC] Script " .. number .. " executed successfully")
    end)

    if not success then
        warn("[OTC] Script " .. tostring(number) .. " failed!")
        warn("[OTC] Error: " .. tostring(result))
    end
end

local function CreateButton(number, y)
    local Button = Instance.new("TextButton")

    Button.Name = "Script" .. tostring(number)
    Button.Size = UDim2.fromOffset(260, 45)
    Button.Position = UDim2.new(0.5, -130, 0, y)

    Button.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
    Button.BorderSizePixel = 0

    Button.Text = "Script " .. tostring(number)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamMedium

    Button.AutoButtonColor = true
    Button.Parent = Frame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 7)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        print("[OTC] Button clicked: Script " .. tostring(number))

        Button.Active = false
        Button.Text = "Loading..."

        task.wait(0.1)

        ScreenGui:Destroy()

        LoadScript(number)
    end)
end

CreateButton(1, 65)
CreateButton(2, 115)
CreateButton(3, 165)