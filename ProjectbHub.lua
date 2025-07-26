-- 🌌 Galaxy-Themed Script Hub with Animated RGB Border (Snake Flow)
-- Draggable UI, Galaxy particles, RGB edges, animated title

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "GalaxyScriptHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- 🌌 Galaxy Background
local background = Instance.new("ImageLabel")
background.Name = "GalaxyBackground"
background.Parent = gui
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.Image = "rbxassetid://15033465726"
background.BackgroundTransparency = 1
background.ImageTransparency = 0.5
background.ZIndex = 0

-- ✨ Glow Effect
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1, 0, 1, 0)
glow.Position = UDim2.new(0, 0, 0, 0)
glow.BackgroundTransparency = 1
glow.ImageTransparency = 0.9
glow.Image = "rbxassetid://5016890038"
glow.ZIndex = 1
glow.Parent = gui

-- 🪐 Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 240)
frame.Position = UDim2.new(0.5, -160, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ZIndex = 2
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- 🌈 RGB Snake Flow Border
local rgbEdge = Instance.new("UIStroke")
rgbEdge.Thickness = 2
rgbEdge.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
rgbEdge.Color = Color3.fromRGB(255, 0, 255)
rgbEdge.Parent = frame

spawn(function()
	while true do
		for h = 0, 1, 0.01 do
			local color = Color3.fromHSV(h, 1, 1)
			rgbEdge.Color = color
			wait(0.02)
		end
	end
end)

-- 🌟 Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 36)
titleBar.BackgroundTransparency = 1
titleBar.ZIndex = 3
titleBar.Parent = frame

local title = Instance.new("TextLabel")
title.Text = "✨ Galaxy Script Hub ✨"
title.Size = UDim2.new(1, -70, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 4
title.Parent = titleBar

spawn(function()
	while true do
		for h = 0, 1, 0.005 do -- slower change
			title.TextColor3 = Color3.fromHSV(h, 1, 1)
			wait(0.05) -- slower transition
		end
	end
end)

-- ❌➖ Buttons
local function createIconButton(symbol, offsetX)
	local btn = Instance.new("TextButton")
	btn.Text = symbol
	btn.Size = UDim2.new(0, 30, 0, 30)
	btn.Position = UDim2.new(1, offsetX, 0, 3)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.ZIndex = 5
	btn.Parent = titleBar
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(1, 0)
	c.Parent = btn
	return btn
end

local closeBtn = createIconButton("❌", -35)
local minimizeBtn = createIconButton("➖", -70)

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- 📦 Content Holder
local contentHolder = Instance.new("Frame")
contentHolder.Size = UDim2.new(1, -20, 0, 170)
contentHolder.Position = UDim2.new(0, 10, 0, 50)
contentHolder.BackgroundTransparency = 1
contentHolder.ZIndex = 3
contentHolder.Parent = frame

local layout = Instance.new("UIListLayout", contentHolder)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	contentHolder.Visible = not minimized
	frame.Size = minimized and UDim2.new(0, 320, 0, 50) or UDim2.new(0, 320, 0, 240)
end)

-- 🗂 Script List
local scripts = {
	{ name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source" },
	{ name = "Dark Dex", url = "https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua" },
	{ name = "Fly GUI", url = "https://pastebin.com/raw/yYqF7gYk" },
}

-- 🔘 Script Buttons
for _, data in ipairs(scripts) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 36)
	btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.Text = "🚀 " .. data.name
	btn.ZIndex = 4
	btn.AutoButtonColor = false
	btn.Parent = contentHolder
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 10)
	c.Parent = btn

	btn.MouseButton1Click:Connect(function()
		local originalText = btn.Text
		local originalColor = btn.BackgroundColor3
		btn.Text = "✅ Script Executed!"
		btn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
		pcall(function()
			loadstring(game:HttpGet(data.url))()
		end)
		task.delay(2, function()
			btn.Text = originalText
			btn.BackgroundColor3 = originalColor
		end)
	end)
end

-- 🌌 Particle Stars
local particle = Instance.new("ParticleEmitter")
particle.Texture = "rbxassetid://284205403"
particle.LightEmission = 1
particle.Rate = 5
particle.Lifetime = NumberRange.new(5, 10)
particle.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0.1),
	NumberSequenceKeypoint.new(1, 0.2)
})
particle.Transparency = NumberSequence.new(0.2)
particle.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(128, 0, 255))
particle.Speed = NumberRange.new(2)
particle.VelocitySpread = 180
particle.Parent = background
