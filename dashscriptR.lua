--[[ Set the file here:
StarterPlayer/StarterCharacterScripts ]]--

local UIS = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local Char = script.Parent
local HRP = Char:WaitForChild("HumanoidRootPart")
local debounce = false

local WKey = false
local AKey = false
local SKey = false
local DKey = false

Mouse.KeyDown:Connect(function(key)
	if key == "w" then
		WKey = true
	elseif key == "a" then
		AKey = true
	elseif key == "s" then
		SKey = true
	elseif key == "d" then
		DKey = true
	end
end)

Mouse.KeyUp:Connect(function(key)
	if key == "w" then
		WKey = false
	elseif key == "a" then
		AKey = false
	elseif key == "s" then
		SKey = false
	elseif key == "d" then
		DKey = false
	end
end)

UIS.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Q then
		if WKey == true  then
			if debounce == false then
				local vel = Instance.new("BodyVelocity", HRP)
				vel.MaxForce = Vector3.new(math.huge,0,math.huge)
				vel.Velocity = HRP.CFrame.LookVector*100
				game.Debris:AddItem(vel,0.2)
				debounce = true
				wait(1)
				debounce = false
			end
		elseif AKey == true then
			if debounce == false then
				local vel = Instance.new("BodyVelocity", HRP)
				vel.MaxForce = Vector3.new(math.huge,0,math.huge)
				vel.Velocity = HRP.CFrame.RightVector*-100
				game.Debris:AddItem(vel,0.2)
				debounce = true
				wait(1)
				debounce = false
			end
		elseif SKey == true then
			if debounce == false then
				local vel = Instance.new("BodyVelocity", HRP)
				vel.MaxForce = Vector3.new(math.huge,0,math.huge)
				vel.Velocity = HRP.CFrame.LookVector*-100
				game.Debris:AddItem(vel,0.2)
				debounce = true
				wait(1)
				debounce = false
			end
		elseif DKey == true then
			if debounce == false then
				local vel = Instance.new("BodyVelocity", HRP)
				vel.MaxForce = Vector3.new(math.huge,0,math.huge)
				vel.Velocity = HRP.CFrame.RightVector*100
				game.Debris:AddItem(vel,0.2)
				debounce = true
				wait(1)
				debounce = false
			end
		end
	end
end)
