--[[ Set the file here:
StarterPlayer/StarterCharacterScripts ]]--

local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local rootPart = Character.PrimaryPart
local upperTorso = Character:WaitForChild("UpperTorso")
local waistJoint = upperTorso:WaitForChild("Waist")

local currentSpeed = 0
local currentTween = nil;

local UIS = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

Humanoid.Running:Connect(function(speed)
	currentSpeed = speed
end)

local originalWaistC1 = waistJoint.C1
local MaxRotation = math.rad(65)
runService:BindToRenderStep("vanityCamera", 400, function()	
	local TargetPos = (Camera.CFrame * CFrame.new(0,0, -1000)).p
	local TorsoFront = rootPart.CFrame.LookVector
	local TorsoRight = rootPart.CFrame.RightVector
	local vectorToTarget = (TargetPos - rootPart.Position)
	local rotation = math.atan2(TorsoRight:Dot(vectorToTarget), TorsoFront:Dot(vectorToTarget))
	
	if (rotation < -MaxRotation) then
		rotation = -MaxRotation
	elseif (rotation > MaxRotation) then
		rotation = MaxRotation
	end
	
	if (math.abs(rotation) == MaxRotation and currentSpeed <= 0.5) then
		local newRootPartCFrame = CFrame.new(rootPart.Position, Vector3.new(TargetPos.X, TargetPos.Y, TargetPos.Z))
		currentTween = TweenService:Create(rootPart, TweenInfo.new(0.33),{
			CFrame = newRootPartCFrame
		})
		currentTween:Play()
	else
		if (currentTween and currentSpeed > 0.5) then
			if (currentTween.PlaybackState == Enum.PlaybackState.Playing) then
				currentTween:Cancel()
			end
		end
		waistJoint.C1 = CFrame.Angles(0, rotation, 0) * originalWaistC1
	end
end)
