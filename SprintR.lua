local userInput = game:GetService('UserInputService')
local Players = game:GetService('Players')

local sprintSpeed = 30
local walkSpeed = 16

local player = Players.LocalPlayer

local function beginSprint (input, gameProcessed)
	if not gameProcessed then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keycode = input.KeyCode
			if keycode == Enum.KeyCode.RightAlt then
				player.Character.Humanoid.WalkSpeed = sprintSpeed
			end
		end	
	end
end


local function endSprint (input, gameProcessed)
	if not gameProcessed then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keycode = input.KeyCode
			if keycode == Enum.KeyCode.RightAlt then
				player.Character.Humanoid.WalkSpeed = walkSpeed
			end
		end	
	end
end


userInput.InputBegan:Connect(beginSprint)
userInput.InputEnded:Connect(endSprint)