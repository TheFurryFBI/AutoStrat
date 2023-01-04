local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Sigmanic/ROBLOX/main/ModificationWallyUi')))() --Yes it contains a loadstring, (sorry mm) but it's from Sigmanic so it should be safe (I hope)
local w = library:CreateWindow("Toggleable Autoskip") -- Creates the window
w:Toggle("Auto skip") --Toggle name (If you modify this, it doesnt change anything aside from the name of the toggle)
local ActualDirectory = game.CoreGui.ScreenGui.Container["Toggleable Autoskip"]:WaitForChild("container").Frame["Auto skip"].Checkmark --Directory to the window, + WaitForChild to prevent those "Invalid member" errors + to the toggle as well

local Prop = game.ReplicatedStorage.State.Voting.Enabled
Prop:GetPropertyChangedSignal("Value"):Connect(function()
    if Prop.Value and ActualDirectory.Text == "✓" then
        game.ReplicatedStorage.RemoteEvent:FireServer("Waves","Skip")
    end
end)
