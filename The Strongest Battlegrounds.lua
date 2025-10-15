loadstring(game:HttpGet("https://raw.githubusercontent.com/Moon-0811/Moon/refs/heads/main/Lag.lua"), true)()

--// Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"), true)()
if Rayfield then
	local Window = Rayfield:CreateWindow({
		Name = "Moon",
		Icon = 101123037159333,
		LoadingTitle = "Moon",
		LoadingSubtitle = "by Friedie",
		ShowText = "Rayfield",
		Theme = "Default",
	})

	--// References
	local Main = Window:CreateTab("Main")
	local Game = Window:CreateTab("Game")
	local Miscellaneous = Main:CreateSection("Miscellaneous")
	local Miscellaneous = Game:CreateSection("Miscellaneous")

	--// Scripts
	local SliderWalkSpeed = Main:CreateSlider({
		Name = "WalkSpeed",
		Range = { 16, 250 },
		Increment = 1,
		Suffix = "WalkSpeed",
		CurrentValue = 16,
		Flag = "",
		Callback = function(Value)
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
		end,
	})

	local SliderJumpPower = Main:CreateSlider({
		Name = "JumpPower",
		Range = { 50, 250 },
		Increment = 1,
		Suffix = "JumpPower",
		CurrentValue = 50,
		Flag = "",
		Callback = function(Value)
			game:GetService("Players").LocalPlayer.Character.Humanoid.UseJumpPower = true
			game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
		end,
	})

	local DropdownTeleport = Main:CreateDropdown({
		Name = "Teleport",
		Options = { "" },
		CurrentOption = { "" },
		MultipleOptions = false,
		Flag = "",
		Callback = function(Options)
			if Options[1] ~=  "None" then
				if game:GetService("Players")[Options[1]] then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Options[1]].Character.HumanoidRootPart.CFrame
				end
			end
		end,
	})

	local ButtonTeleport = Main:CreateButton({
		Name = "Refresh",
		Callback = function()
	        task.spawn(function()
		        local Table = {}
		        for i, Player in game:GetService("Players"):GetPlayers() do
			        if not table.find(Table, Player.Name) and Player.Name ~= game:GetService("Players").LocalPlayer.Name then
				        table.insert(Table, Player.Name)
			        end
			    end
				DropdownTeleport:Set({ "None" })
		        DropdownTeleport:Refresh(Table)
	        end)
		end,
	})
end
