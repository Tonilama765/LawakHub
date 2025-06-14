-- LawakHub Blox Fruits Script
repeat wait() until game:IsLoaded()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("LawakHub | Blox Fruits", "Ocean")

-- Tab
local Main = Window:NewTab("Auto Farm")
local Section = Main:NewSection("Auto Leveling")

local Weapon = "Melee" -- Default
local AutoFarm = false
local AutoBoss = false

-- Dropdown Weapon
Section:NewDropdown("Pilih Senjata", "Pilih jenis serangan", {"Melee", "Sword", "Fruit"}, function(option)
    Weapon = option
end)

-- Toggle Auto Farm
Section:NewToggle("Auto Farm Level", "Farm level otomatis", function(state)
    AutoFarm = state
end)

-- Toggle Farm Boss
Section:NewToggle("Auto Farm Boss", "Farm boss otomatis", function(state)
    AutoBoss = state
end)

-- Code Auto Farm (contoh sederhana)
spawn(function()
    while true do wait()
        if AutoFarm then
            pcall(function()
                -- logika farming berdasarkan Weapon
                print("Farming menggunakan: "..Weapon)
                -- tambahkan logika farming di sini sesuai kebutuhan
            end)
        end
    end
end)

-- Tab Raid & Lainnya
local Raid = Window:NewTab("Raid & Misc")
local RaidSec = Raid:NewSection("Auto")

RaidSec:NewToggle("Auto Raid + Kill Aura", "Raid otomatis dengan serang cepat", function(state)
    _G.AutoRaid = state
end)

RaidSec:NewButton("Redeem Semua Code", "Klaim semua code aktif", function()
    local codes = {"kittgaming", "sub2fer999", "Axiore", "Sub2Daigrock", "TantaiGaming"}
    for _,v in pairs(codes) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v)
        end)
    end
end)

-- Auto Haki
spawn(function()
    while wait(1) do
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
end)

-- FPS Boost
local Settings = Window:NewTab("Settings")
local SetSec = Settings:NewSection("Utility")

SetSec:NewButton("Boost FPS", "Matikan efek untuk ringan", function()
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end
end)

-- Auto Chest
local function CollectChests()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("chest") and v:IsA("Model") then
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
                wait(1)
            end)
        end
    end
end

SetSec:NewButton("Auto Chest (Sekali Klik)", "Ambil semua chest", CollectChests)

-- Save Config (dummy)
SetSec:NewButton("Save Config", "Simpan pengaturan (simulasi)", function()
    print("Config tersimpan! (simulasi)")
end)

-- End
