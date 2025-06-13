--- LawakHub – Grow a Garden with GUI & Auto-run
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🛡 Anti Lag
local function noLag()
  for _, v in pairs(game:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then v:Destroy() end
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
      v.Enabled = false
    end
  end
  if workspace:FindFirstChild("Terrain") then workspace.Terrain:Clear() end
  local L = game:GetService("Lighting")
  L.GlobalShadows = false
  L.FogEnd = 1e6
  for _, d in pairs(game:GetDescendants()) do
    if d:IsA("Decal") then d.Transparency = 1 end
    if d:IsA("MeshPart") then d.Material = Enum.Material.SmoothPlastic end
  end
end

noLag()

-- 🌱 Upgrade Logic
local plantLevel = 1
local plantsPlanted = 0
local maxLevel = 5
local levelData = {
  [1] = {size = 2, color = "Bright green"},
  [2] = {size = 3, color = "Earth green"},
  [3] = {size = 4, color = "Bright yellow"},
  [4] = {size = 5, color = "Bright orange"},
  [5] = {size = 6, color = "Bright red"},
}

-- 🚀 Create Plant
local function createPlant()
  local cfg = levelData[plantLevel] or levelData[1]
  local part = Instance.new("Part")
  part.Shape = Enum.PartType.Ball
  part.Material = Enum.Material.Grass
  part.Size = Vector3.new(cfg.size, cfg.size, cfg.size)
  part.BrickColor = BrickColor.new(cfg.color)
  part.Anchored = true
  part.CanCollide = false
  part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -2.5, -5)
  part.Parent = workspace

  plantsPlanted += 1
  if plantsPlanted % 5 == 0 and plantLevel < maxLevel then
    plantLevel += 1
    infoLabel.Text = "🌟 Level Up! Sekarang Level " .. plantLevel
  end
end

-- 🎁 Buat GUI
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "GrowGardenGui"

local button = Instance.new("TextButton", screenGui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0, 20, 0, 20)
button.Text = "🌱 Plant"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24

local upBtn = button:Clone()
upBtn.Position = UDim2.new(0, 20, 0, 80)
upBtn.Text = "⬆ Upgrade"

local infoLabel = Instance.new("TextLabel", screenGui)
infoLabel.Size = UDim2.new(0, 200, 0, 30)
infoLabel.Position = UDim2.new(0, 20, 0, 140)
infoLabel.Text = "Level: 1 | Plants: 0"
infoLabel.TextSize = 18
infoLabel.BackgroundTransparency = 1
infoLabel.TextXAlignment = Enum.TextXAlignment.Left

button.MouseButton1Click:Connect(function()
  createPlant()
  infoLabel.Text = "Level: " .. plantLevel .. " | Plants: " .. plantsPlanted
end)

upBtn.MouseButton1Click:Connect(function()
  if plantLevel < maxLevel then
    plantLevel += 1
    infoLabel.Text = "Level: " .. plantLevel .. " | Plants: " .. plantsPlanted
    infoLabel.Text = "🌟 Level Up! Sekarang Level " .. plantLevel
    wait(2)
    infoLabel.Text = "Level: " .. plantLevel .. " | Plants: " .. plantsPlanted
  else
    infoLabel.Text = "🔝 Sudah di Level Max!"
    wait(2)
    infoLabel.Text = "Level: " .. plantLevel .. " | Plants: " .. plantsPlanted
  end
end)

-- 📦 Cek isi egg & event
local function showInfo()
  local RS = game:GetService("ReplicatedStorage")
  print("📦 Eggs:")
  if RS:FindFirstChild("Eggs") then
    for _, e in ipairs(RS.Eggs:GetChildren()) do print(" - "..e.Name) end
  end
  print("🎉 StockEvents:")
  if RS:FindFirstChild("StockEvents") then
    for _, e in ipairs(RS.StockEvents:GetChildren()) do print(" - "..e.Name) end
  end
end

showInfo()

print("Grow a Garden GUI siap! Tekan tombol di kiri atas untuk mulai.")
