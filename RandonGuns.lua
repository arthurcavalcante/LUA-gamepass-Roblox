local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Folder = RS:WaitForChild("Guns")
-- Change the "Folder" if you change the folder name in Replicated Storage

local function onCharacterAdded(character)
	local Tools = Folder:GetChildren()
	local ToolsTable = Tools
	local chosenTools = {}

	repeat
		local selectedIndex = math.random(1, #ToolsTable)
		table.insert(chosenTools, ToolsTable[selectedIndex])
		table.remove(ToolsTable, selectedIndex)
	until #chosenTools >= 2
	-- Numbers of tools going to give

	local plr = Players:GetPlayerFromCharacter(character)
	for i,v in pairs(chosenTools) do
		Folder:FindFirstChild(v.Name):Clone().Parent = plr.Backpack
	end
end

local function onAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded) -- Triggers when the player spawns or respawns
end

Players.PlayerAdded:Connect(onAdded)



