local library = {}

function library:CreateWindow(name)
	local LIbMain = Instance.new("ScreenGui")
	local MainWindow = Instance.new("Frame")
	local GUIName = Instance.new("TextLabel")
	local CloseBUtton = Instance.new("ImageButton")
	local Container = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local UISizeConstraint = Instance.new("UISizeConstraint")
	local UICorner_4 = Instance.new("UICorner")
	
	
	UISizeConstraint.Parent = MainWindow

	UICorner_4.CornerRadius = UDim.new(0, 6)
	UICorner_4.Parent = MainWindow
	
	LIbMain.Name = "LIbMain"
	LIbMain.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	LIbMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainWindow.Name = "MainWindow"
	MainWindow.Parent = LIbMain
	MainWindow.BackgroundColor3 = Color3.fromRGB(33, 31, 32)
	MainWindow.BorderSizePixel = 0
	MainWindow.Position = UDim2.new(0.39651072, 0, 0.183458641, 0)
	MainWindow.Size = UDim2.new(0, 202, 0, 296)
	MainWindow.Draggable = true
	MainWindow.Active = true

	GUIName.Name = "GUIName"
	GUIName.Parent = MainWindow
	GUIName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIName.BackgroundTransparency = 1.000
	GUIName.Position = UDim2.new(0.103960395, 0, 0.0268096514, 0)
	GUIName.Size = UDim2.new(0, 142, 0, 28)
	GUIName.Font = Enum.Font.Nunito
	GUIName.Text = name
	GUIName.TextColor3 = Color3.fromRGB(180, 180, 180)
	GUIName.TextScaled = true
	GUIName.TextSize = 14.000
	GUIName.TextWrapped = true
	GUIName.TextXAlignment = Enum.TextXAlignment.Left

	CloseBUtton.Name = "CloseBUtton"
	CloseBUtton.Parent = GUIName
	CloseBUtton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseBUtton.BackgroundTransparency = 1.000
	CloseBUtton.Position = UDim2.new(1.05320334, 0, 0.142857149, 0)
	CloseBUtton.Size = UDim2.new(0, 20, 0, 20)
	CloseBUtton.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseBUtton.ImageColor3 = Color3.fromRGB(180, 180, 180)
	CloseBUtton.ScaleType = Enum.ScaleType.Fit
	CloseBUtton.MouseButton1Down:Connect(function()
		MainWindow:Destroy()
	end)

	Container.Name = "Container"
	Container.Parent = MainWindow
	Container.BackgroundColor3 = Color3.fromRGB(33, 31, 32)
	Container.BackgroundTransparency = 0.900
	Container.BorderColor3 = Color3.fromRGB(180, 180, 180)
	Container.Position = UDim2.new(0, 0, 0.158788726, 0)
	Container.Size = UDim2.new(0, 202, 0, 248)

	UIListLayout.Parent = Container
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	
	UIPadding.Parent = Container
	UIPadding.PaddingTop = UDim.new(0, 15)
	
	local coolLib = {}
	
	function coolLib:CreateButton(text, callback)
		local Button = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local callback = callback or function() end
		
		Button.Name = "Button"
		Button.Parent = Container
		Button.BackgroundColor3 = Color3.fromRGB(49, 46, 47)
		Button.Position = UDim2.new(0.0767326728, 0, 0, 0)
		Button.Size = UDim2.new(0, 171, 0, 33)
		Button.Font = Enum.Font.Nunito
		Button.Text = text
		Button.TextColor3 = Color3.fromRGB(180, 180, 180)
		Button.TextSize = 24.000
		Button.MouseButton1Down:Connect(function()
			pcall(callback)
		end)

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = Button
	end
	
	function coolLib:CreateToggle(name, callback)
		local actions = {}
		local toggled = false
		
		local Toggle = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local UICorner_3 = Instance.new("UICorner")
		local callback = callback or function() end
		
		Toggle.Name = "Toggle"
		Toggle.Parent = Container
		Toggle.BackgroundColor3 = Color3.fromRGB(49, 46, 47)
		Toggle.Position = UDim2.new(0.0767326728, 0, 0, 0)
		Toggle.Size = UDim2.new(0, 171, 0, 33)
		Toggle.Font = Enum.Font.Nunito
		Toggle.Text = name
		Toggle.TextColor3 = Color3.fromRGB(180, 180, 180)
		Toggle.TextSize = 24.000
		
		local Checker = Instance.new("TextLabel")

		UICorner_2.CornerRadius = UDim.new(0, 6)
		UICorner_2.Parent = Toggle
		
		Checker.Name = "Checker"
        Checker.Parent = Toggle
        Checker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Checker.BackgroundTransparency = 1.000
        Checker.Position = UDim2.new(0.777777791, 0, 0, 0)
        Checker.Size = UDim2.new(0, 30, 0, 33)
        Checker.Font = Enum.Font.Nunito
        Checker.Text = ""
        Checker.TextColor3 = Color3.fromRGB(180, 180, 180)
        Checker.TextSize = 14.000
		
		local function Fire()
			toggled = not toggled
			Checker.Text = toggled and utf8.char(10003) or ""
			pcall(callback, toggled)
		end
		
		Toggle.MouseButton1Click:Connect(Fire)
		
		function actions:Set(arg)
			Checker.Text = toggled and utf8.char(10003) or ""
			pcall(callback, arg)
		end

	end
	return coolLib;
end

return library
