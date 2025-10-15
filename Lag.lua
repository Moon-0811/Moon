game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").ClockTime = 12
game:GetService("GarbageCollectorService"):RequestGarbageCollection()
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
settings().Physics.AllowSleep = true
game:GetService("RunService").Stepped:Connect(function()
    settings().Physics.PhysicsSimulationRate = Enum.PhysicsSimulationRate.Fixed240Hz
end)