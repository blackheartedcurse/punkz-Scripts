local RunService = game:GetService("RunService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local AntiFlingFunction = nil

AntiFlingFunction = RunService.Stepped:Connect(function()
    for i,p in pairs(players:GetPlayers()) do
        task.spawn(function()
            if p ~= plr and p.Character then
                for i,v in pairs(p.Character:GetChildren()) do
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                            v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			    v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end
                    end)
                end
            end
        end)
    end
end)

repeat task.wait() until _G.AntiFlingToggled == false
AntiFlingFunction:Disconnect()
