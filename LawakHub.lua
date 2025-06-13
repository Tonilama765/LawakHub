-- 🌱 Grow a Garden - Dengan Upgrade Tanaman
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- 🔼 Data Upgrade
local plantLevel = 1
local plantsPlanted = 0
local maxLevel = 5

-- 📦 Data Level (ukuran, warna, material, kecepatan tumbuh)
local levelData = {
    [1] = {color = "Bright green", material = Enum.Material.Grass, size = 2, growSpeed = 0.2},
    [2] = {color = "Lime green", material = Enum.Material.SmoothPlastic, size = 2.5, growSpeed = 0.15},
    [3] = {color = "Earth green", material = Enum.Material.Neon, size = 3, growSpeed = 0.12},
    [4] = {color = "Bright violet", material = Enum.Material.ForceField, size = 3.5, growSpeed = 0.09},
    [5] = {color = "Gold", material = Enum.Material.Gold, size = 4, growSpeed = 0.07},
}

-- 🪴 Fungsi menanam tanaman
local function createPlant()
    local level = levelData[plantLevel]
    local plant = Instance.new("Part")
    plant.Size = Vector3.new(level.size, level.size, level.size)
    plant.Anchored = true
    plant.Shape = Enum.PartType.Ball
    plant.BrickColor = BrickColor.new(level.color)
    plant.Material = level.material
    plant.TopSurface = Enum.SurfaceType.Smooth
    plant.BottomSurface = Enum.SurfaceType.Smooth
    plant.CanCollide = false

    local pos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if pos then
        plant.Position = pos.Position + Vector3.new(0, 1, -5)
        plant.Parent = workspace

        -- Efek tumbuh
        task.spawn(function()
            for i = 1, 10 do
                wait(level.growSpeed)
                plant.Size = plant.Size + Vector3.new(0.1, 0.2, 0.1)
                plant.Position = plant.Position + Vector3.new(0, 0.1, 0)
            end
        end)
    end

    -- Hitung dan upgrade
    plantsPlanted += 1
    if plantsPlanted % 5 == 0 and plantLevel < maxLevel then
        plantLevel += 1
        print("🌟 Tanaman kamu di-upgrade ke Level " .. plantLevel .. "!")
    end
end

Mouse.Button1Down:Connect(createPlant)

-- ⚙️ No Lag
local function noLag()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Explosion") then
            v:Destroy()
        elseif v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end
    if workspace:FindFirstChild("Terrain") then
        workspace.Terrain:Clear()
    end
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 1000000
    for _, d in pairs(game:GetDescendants()) do
        if d:IsA("Decal") then
            d.Transparency = 1
        end
        if d:IsA("MeshPart") then
            d.Material = Enum.Material.SmoothPlastic
        end
    end
end

noLag()

-- 📦 Lihat isi Egg & Event
local function showEggAndEventInfo()
    local RS = game:GetService("ReplicatedStorage")
    if RS:FindFirstChild("Eggs") then
        print("📦 Isi Egg:")
        for _, egg in pairs(RS.Eggs:GetChildren()) do
            print("🥚 Egg: " .. egg.Name)
            for _, pet in pairs(egg:GetChildren()) do
                print("  🐾 Pet: " .. pet.Name)
            end
        end
    end
    if RS:FindFirstChild("StockEvents") then
        print("🎉 Stock Events:")
        for _, event in pairs(RS.StockEvents:GetChildren()) do
            print("🛒 Event: " .. event.Name)
        end
    end
end

showEggAndEventInfo()

print("[Grow a Garden 🌿] Klik untuk tanam. Tanaman akan upgrade setiap 5 kali tanam!")
