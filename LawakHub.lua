--[[ 
    LawakHub - Blox Fruits Script
    ByToni (Jaksel) | UI: Modern + Floating Logo
]]

repeat wait() until game:IsLoaded()

-- UI Loader
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "LawakHub | Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "LawakHub",
    IntroEnabled = false
})

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Text = "ByToni"
watermark.TextColor3 = Color3.fromRGB(255,255,255)
watermark.BackgroundColor3 = Color3.fromRGB(0,0,0)
watermark.BackgroundTransparency = 0.5
watermark.Size = UDim2.new(0, 100, 0, 25)
watermark.Position = UDim2.new(1, -110, 1, -35)
watermark.TextScaled = true
watermark.Font = Enum.Font.Gotham
watermark.BorderSizePixel = 0
watermark.Parent = game.CoreGui

-- [ MAIN TAB ]
local MainTab = Window:MakeTab({ Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false })

MainTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
        while _G.AutoFarm and task.wait() do
            pcall(function()
                -- your farming logic here
            end)
        end
    end
})

MainTab:AddToggle({
    Name = "Bring Mob",
    Default = false,
    Callback = function(v)
        _G.BringMob = v
        while _G.BringMob and wait() do
            -- bring mob logic
        end
    end
})

-- [ RAID TAB ]
local RaidTab = Window:MakeTab({ Name = "Raid", Icon = "rbxassetid://4483345998", PremiumOnly = false })

RaidTab:AddButton({
    Name = "Auto Buy Raid Chip",
    Callback = function()
        -- buy chip logic
    end
})

RaidTab:AddToggle({
    Name = "Auto Start & Next Island",
    Default = false,
    Callback = function(v)
        _G.AutoRaid = v
        while _G.AutoRaid and wait() do
            -- auto raid logic
        end
    end
})

RaidTab:AddToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(v)
        _G.KillAura = v
        -- kill aura logic here
    end
})

-- [ FRUIT TAB ]
local FruitTab = Window:MakeTab({ Name = "Fruit", Icon = "rbxassetid://4483345998", PremiumOnly = false })

FruitTab:AddButton({ Name = "Auto Random Fruit", Callback = function() -- logic end })

FruitTab:AddToggle({
    Name = "ESP Fruit",
    Default = false,
    Callback = function(v)
        _G.ESPfruit = v
        -- ESP logic
    end
})

FruitTab:AddToggle({
    Name = "Fruit Sniper",
    Default = false,
    Callback = function(v)
        _G.SnipeFruit = v
        -- Snipe logic
    end
})

-- [ SEA EVENT TAB ]
local SeaTab = Window:MakeTab({ Name = "Sea Event", Icon = "rbxassetid://4483345998", PremiumOnly = false })

SeaTab:AddToggle({
    Name = "Auto Terror Shark",
    Default = false,
    Callback = function(v)
        _G.TerrorShark = v
        -- terror shark logic
    end
})

-- [ SHOP TAB ]
local ShopTab = Window:MakeTab({ Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ShopTab:AddButton({ Name = "Buy Haki", Callback = function() -- haki logic end })
ShopTab:AddButton({ Name = "Buy Superhuman", Callback = function() -- buy logic end })
ShopTab:AddButton({ Name = "Change Race", Callback = function() -- race logic end })

-- [ SETTINGS ]
local SetTab = Window:MakeTab({ Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false })

SetTab:AddButton({
    Name = "FPS Boost",
    Callback = function()
        -- fps boost
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
        sethiddenproperty(game:GetService("Lighting"), "Technology", Enum.Technology.Compatibility)
    end
})

OrionLib:Init()
