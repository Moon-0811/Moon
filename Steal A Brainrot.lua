local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Moon",
	Icon = 0,
	LoadingTitle = "Moon",
	LoadingSubtitle = "by Friedie",
	ShowText = "Rayfield",
	Theme = "Default",

	ToggleUIKeybind = "K",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "Moon",
	},

	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = false,
	},

	KeySystem = false,
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = { "Hello" },
	},
})

--// Variables
local Steal = false

--// Functions

--// Tabs
local Tab1 = Window:CreateTab("Main", "rewind")

local Section1 = Tab1:CreateSection("Misc")

local SliderWalkSpeed = Tab1:CreateSlider({
	Name = "WalkSpeed",
	Range = { 16, 250 },
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 16,
	Flag = "",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local SliderJumpPower = Tab1:CreateSlider({
	Name = "JumpPower",
	Range = { 50, 500 },
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 50,
	Flag = "",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

local ButtonEsp = Tab1:CreateButton({
	Name = "Esp",
	Callback = function()
		for _, Player in pairs(game.Players:GetPlayers()) do
			if Player.Name ~= game:GetService("Players").LocalPlayer.Name then
				local Character = Player.Character

				if not Character.Head:FindFirstChild("Esp") then
					local BillboardGui = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					BillboardGui.Name = "Esp"
					BillboardGui.Parent = game:GetService("ReplicatedFirst")
					BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					BillboardGui.Active = true
					BillboardGui.AlwaysOnTop = true
					BillboardGui.LightInfluence = 1.000
					BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
					BillboardGui.Size = UDim2.new(5, 0, 2, 0)
					BillboardGui.Adornee = Character

					TextLabel.Parent = BillboardGui
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel.BorderSizePixel = 0
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
					TextLabel.TextScaled = true
					TextLabel.TextSize = 14.000
					TextLabel.TextStrokeTransparency = 0.500
					TextLabel.TextWrapped = true
					TextLabel.Text = Player.Name
				end

				if not Character:FindFirstChild("Esp") then
					local Highlight = Instance.new("Highlight")
					Highlight.Name = "Esp"
					Highlight.Parent = Character
					Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
					Highlight.Adornee = game:GetService("ReplicatedFirst")
				end
			end
		end
	end,
})

local ButtonAntiVc = Tab1:CreateButton({
	Name = "Bypass Voice Chat Ban",
	Callback = function()
		game:GetService("VoiceChatService"):joinVoice()
	end,
})

local ButtonNoClip = Tab1:CreateButton({
	Name = "NoClip",
	Callback = function() end,
})

local ButtonDestroy = Tab1:CreateButton({
	Name = "Destroy",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local Tab2 = Window:CreateTab("Steal A Brainrot", "rewind")

local Section2 = Tab2:CreateSection("Misc")

local KeybindSteal = Tab2:CreateKeybind({
	Name = "Steal",
	CurrentKeybind = "F",
	HoldToInteract = false,
	Flag = "",
	Callback = function()
		local Player = game:GetService("Players").LocalPlayer
		local Character = Player.Character
		if Steal == false then
			Steal = true
			Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, 173, 0)
		elseif Steal == true then
			Steal = false
			Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, -50, 0)
		end
	end,
})
