local wait,spawn,delay = task.wait,task.spawn,task.delay
local gamepassID = "Your gamepass id"
local Teams = game:GetService("Teams")

game.Players.PlayerAdded:Connect(function(player)
	if game:GetService("GamePassService"):PlayerHasPass(player, gamepassID) then
		player.Team = Teams["Team 1"]
	else 
		player.Team = Teams["Team 2"]
end
end)
