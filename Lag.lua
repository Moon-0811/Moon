task.spawn(function()
    for i, Part in pairs(game.Workspace:GetDescendants()) do
        if Part:IsA("BasePart") then
            Part.Material = Enum.Material.SmoothPlastic
        end
    end
end)
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").ClockTime = 12
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
settings().Physics.AllowSleep = true
game:GetService("RunService").Stepped:Connect(function()
    settings().Physics.PhysicsSimulationRate = Enum.PhysicsSimulationRate.Fixed240Hz
end)