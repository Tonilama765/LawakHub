repeat wait() until game:IsLoaded()

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "LawakHub | Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "LawakHub"
})

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Text = "ByToni"
watermark.TextColor3 = Color3.new(1,1,1)
watermark.BackgroundColor3 = Color3.new(0,0,0)
watermark.BackgroundTransparency = 0.4
watermark.Size = UDim2.new(0, 100, 0, 25)
watermark.Position = UDim2.new(1, -110, 1, -35)
watermark.TextScaled = true
watermark.Font = Enum.Font.Gotham
watermark.BorderSizePixel = 0
watermark.Parent = game.CoreGui

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddLabel("LawakHub Loaded ✔")
MainTab:AddButton({
    Name = "Test Button",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "LawakHub";
            Text = "Script Berhasil Dimuat!";
            Duration = 4;
        })
    end
})

OrionLib:Init()
