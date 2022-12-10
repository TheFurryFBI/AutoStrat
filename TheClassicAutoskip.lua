local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Sigmanic/ROBLOX/main/ModificationWallyUi')))() --Yes it contains a loadstring, (sorry mm) but it's from Sigmanic so it should be safe (I hope)
local w = library:CreateWindow("Toggleable Autoskip") -- Creates the window
w:Toggle("Auto skip") --Toggle name (If you modify this, it doesnt change anything aside from the name of the toggle)
local ToggleLocalBecauseImLazy = game.CoreGui.ScreenGui.Container["Toggleable Autoskip"]:WaitForChild("container") --Directory to the window, + WaitForChild to prevent those "Invalid member" errors
local ActualDirectory = ToggleLocalBecauseImLazy.Frame["Auto skip"].Checkmark --Directory to the toggle

function CheckForTick() --Actual code
				local Prop = game.ReplicatedStorage.State.Voting.Enabled --Directory to the skip
				Prop:GetPropertyChangedSignal("Value"):Connect(function() --Credits to mm for the autoskip script
				if Prop.Value then --Checks if the skip GUI is present (or if the wave can be skipped)
				if ToggleLocalBecauseImLazy.Text == "✓" then --Checks if it's on
 				game.ReplicatedStorage.RemoteEvent:FireServer("Waves","Skip") --Skips the wave
			end
		end
	end)
end

ActualDirectory:GetPropertyChangedSignal("Text"):Connect(CheckForTick) --Checks if the checkbox is ticked or not, then runs the script from line 7
