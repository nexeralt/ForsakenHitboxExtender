local lolz = {}
local emergency_stop = false

function StudsIntoPower(studs)
return (studs * 6)
end

function lolz:ExtendHitbox(studs, time)
local distance = StudsIntoPower(studs)
local start = tick()
local connection = nil
repeat game:GetService("RunService").Heartbeat:Wait()
local velocity = nil
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
velocity = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = velocity * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = velocity
end
until tick() - start > tonumber(time) or emergency_stop == true
if emergency_stop == true then
emergency_stop = false
end
end

function lolz:StopExtendingHitbox()
emergency_stop = true
end

return lolz
