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

	local ButtonFuel = Game:CreateButton({
		Name = "Fuel",
		Callback = function()
			task.spawn(function()
				for i, Model in ipairs(game.Workspace.Items:GetChildren()) do
					task.spawn(function()
						if Model:GetAttribute("BurnFuel") then
							game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(Model)
							task.wait(0.25)
							Model.PrimaryPart.CFrame = game.Workspace.Map.Campground.MainFire.Center.CFrame + Vector3.new(0, 20, 0)
							task.wait(0.25)
							game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(Model)
							game.Debris:AddItem(Model, 10)
						end
					end)
				end
			end)
		end,
	})

	local ButtonCraft = Game:CreateButton({
		Name = "Craft",
		Callback = function()
			task.spawn(function()
				for i, Model in ipairs(game.Workspace.Items:GetChildren()) do
					task.spawn(function()
						if Model.Name == "Log" or Model:GetAttribute("Scrappable") or Model.Name == "Cultist Gem" then
							game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(Model)
							task.wait(0.25)
							Model.PrimaryPart.CFrame = game.Workspace.Map.Campground.CraftingBench.TouchZone.CFrame + Vector3.new(0, 3, -2)
							task.wait(0.25)
							game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(Model)
							game.Debris:AddItem(Model, 10)
						end
					end)
				end
			end)
		end,
	})

	local ButtonInvincible = Game:CreateButton({
		Name = "Invincible",
		Callback = function()
			task.spawn(function()
				while task.wait(10) do
					game:GetService("ReplicatedStorage").RemoteEvents.DamagePlayer:FireServer(-math.huge)
				end
			end)
		end,
	})

	local DropdownItem = Game:CreateDropdown({
		Name = "Item",
		Options = { "" },
		CurrentOption = { "" },
		MultipleOptions = false,
		Flag = "",
		Callback = function(Options)
			if Options[1] ~= "None" then
				task.spawn(function()
					for i, Model in ipairs(game.Workspace.Items:GetChildren()) do
						task.spawn(function()
							if Model.PrimaryPart and Model.Name == Options[1] then
								game:GetService("ReplicatedStorage").RemoteEvents.RequestStartDraggingItem:FireServer(Model)
								task.wait(0.25)
								Model.PrimaryPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
								task.wait(0.25)
								game:GetService("ReplicatedStorage").RemoteEvents.StopDraggingItem:FireServer(Model)
							end
						end)
					end
				end)
			end
		end,
	})

	local ButtonItem = Game:CreateButton({
		Name = "Refresh",
		Callback = function()
			task.spawn(function()
				local Table = {}
				for i, Model in ipairs(game.Workspace.Items:GetChildren()) do
					if not table.find(Table, Model.Name) then
					    table.insert(Table, Model.Name)
					end
				end
				DropdownItem:Set({ "None" })
				DropdownItem:Refresh(Table)
			end)
		end,
	})
end
