local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local backpack = lp.Backpack
local character = lp.Character

character:PivotTo(CFrame.new(0, 999999999999999, 0))

task.wait(0.3)

-- dumps tools inside the backpack to workspace
for i,v in pairs(backpack:GetChildren()) do
	if v:IsA("Tool") and v.CanBeDropped then
		task.spawn(function()
			v.Parent = character
			repeat task.wait() until v.Parent ~= backpack
		end)
	end
end

for i,v in pairs(character:GetChildren()) do
	if v:IsA("Tool") and v.CanBeDropped then
		task.spawn(function()
			v.Parent = workspace
		end)
	end
end
