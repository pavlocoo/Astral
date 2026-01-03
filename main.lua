-- Load the library (put your raw GitHub link here)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/pavlocoo/Astral/refs/heads/main/docs.lua"))()

-- Initialize the library
library:init()

-- Create the main window
local window = library.NewWindow({
    title = 'My Script Hub',
    size = UDim2.new(0, 550, 0, 650),
    position = UDim2.new(0, 100, 0, 100)
})

-- Create Combat Tab
local combatTab = window:AddTab('Combat', 1)
local combatSection = combatTab:AddSection('Combat Features', 1, 1)

-- TOGGLES
local aimbotToggle = combatSection:AddToggle({
    text = 'Aimbot',
    flag = 'aimbot',
    state = false,
    callback = function(enabled)
        print('Aimbot:', enabled)
        -- Add your aimbot code here
    end
})

local espToggle = combatSection:AddToggle({
    text = 'ESP',
    flag = 'esp',
    state = false,
    callback = function(enabled)
        print('ESP:', enabled)
        -- Add your ESP code here
    end
})

local silentAimToggle = combatSection:AddToggle({
    text = 'Silent Aim',
    flag = 'silent_aim',
    state = false,
    callback = function(enabled)
        print('Silent Aim:', enabled)
        -- Add your silent aim code here
    end
})

-- SLIDERS
local fovSlider = combatSection:AddSlider({
    text = 'FOV Size',
    flag = 'fov_size',
    min = 50,
    max = 500,
    increment = 10,
    value = 150,
    suffix = ' px',
    callback = function(value)
        print('FOV Size:', value)
        -- Update your FOV circle size here
    end
})

local smoothnessSlider = combatSection:AddSlider({
    text = 'Aim Smoothness',
    flag = 'smoothness',
    min = 1,
    max = 100,
    increment = 1,
    value = 50,
    suffix = '%',
    callback = function(value)
        print('Smoothness:', value)
        -- Update aim smoothness here
    end
})

-- DROPDOWN
local targetPartDropdown = combatSection:AddList({
    text = 'Target Part',
    flag = 'target_part',
    values = {'Head', 'Torso', 'HumanoidRootPart', 'UpperTorso', 'LowerTorso'},
    selected = 'Head',
    callback = function(selected)
        print('Target Part:', selected)
        -- Update which body part to aim at
    end
})

local predictionDropdown = combatSection:AddList({
    text = 'Prediction Type',
    flag = 'prediction',
    values = {'None', 'Basic', 'Advanced', 'Custom'},
    selected = 'None',
    callback = function(selected)
        print('Prediction:', selected)
        -- Update prediction method
    end
})

-- KEYBIND
local aimbotKeybind = combatSection:AddBind({
    text = 'Aimbot Key',
    flag = 'aimbot_key',
    bind = Enum.KeyCode.E,
    mode = 'hold', -- 'hold' or 'toggle'
    callback = function(active)
        print('Aimbot Key Active:', active)
        -- Activate aimbot when key is held
    end
})

-- BUTTON
local resetAimButton = combatSection:AddButton({
    text = 'Reset Aim Settings',
    callback = function()
        fovSlider:SetValue(150)
        smoothnessSlider:SetValue(50)
        targetPartDropdown:Select('Head')
        print('Aim settings reset to default!')
    end
})

-- Create Player Tab
local playerTab = window:AddTab('Player', 2)
local movementSection = playerTab:AddSection('Movement', 2, 1)

-- TOGGLES
local speedToggle = movementSection:AddToggle({
    text = 'Speed Hack',
    flag = 'speed',
    state = false,
    callback = function(enabled)
        print('Speed:', enabled)
        if enabled then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = library.flags.speed_value
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
})

local jumpToggle = movementSection:AddToggle({
    text = 'Jump Power',
    flag = 'jump',
    state = false,
    callback = function(enabled)
        print('Jump Power:', enabled)
        if enabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = library.flags.jump_value
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end
})

local flyToggle = movementSection:AddToggle({
    text = 'Fly',
    flag = 'fly',
    state = false,
    callback = function(enabled)
        print('Fly:', enabled)
        -- Add fly code here
    end
})

-- SLIDERS
local speedSlider = movementSection:AddSlider({
    text = 'Walk Speed',
    flag = 'speed_value',
    min = 16,
    max = 200,
    increment = 1,
    value = 50,
    callback = function(value)
        print('Speed Value:', value)
        if library.flags.speed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

local jumpSlider = movementSection:AddSlider({
    text = 'Jump Power',
    flag = 'jump_value',
    min = 50,
    max = 300,
    increment = 5,
    value = 100,
    callback = function(value)
        print('Jump Value:', value)
        if library.flags.jump then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

local flySpeedSlider = movementSection:AddSlider({
    text = 'Fly Speed',
    flag = 'fly_speed',
    min = 10,
    max = 200,
    increment = 5,
    value = 50,
    callback = function(value)
        print('Fly Speed:', value)
        -- Update fly speed
    end
})

-- DROPDOWN
local movementModeDropdown = movementSection:AddList({
    text = 'Movement Mode',
    flag = 'movement_mode',
    values = {'Normal', 'Smooth', 'Teleport', 'Custom'},
    selected = 'Normal',
    callback = function(selected)
        print('Movement Mode:', selected)
        -- Change movement behavior
    end
})

-- KEYBIND
local flyKeybind = movementSection:AddBind({
    text = 'Fly Toggle',
    flag = 'fly_key',
    bind = Enum.KeyCode.F,
    mode = 'toggle',
    callback = function(active)
        print('Fly Active:', active)
        flyToggle:SetState(active)
    end
})

local noclipKeybind = movementSection:AddBind({
    text = 'Noclip Key',
    flag = 'noclip_key',
    bind = Enum.KeyCode.N,
    mode = 'toggle',
    callback = function(active)
        print('Noclip Active:', active)
        -- Toggle noclip
    end
})

-- BUTTON
local resetMovementButton = movementSection:AddButton({
    text = 'Reset Movement',
    confirm = true, -- Requires confirmation
    callback = function()
        speedSlider:SetValue(16)
        jumpSlider:SetValue(50)
        speedToggle:SetState(false)
        jumpToggle:SetState(false)
        print('Movement reset!')
    end
})

local teleportSpawnButton = movementSection:AddButton({
    text = 'Teleport to Spawn',
    callback = function()
        local spawnLocation = game.Workspace.SpawnLocation
        if spawnLocation then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawnLocation.CFrame
            print('Teleported to spawn!')
        end
    end
})

-- Create Visual Tab
local visualTab = window:AddTab('Visuals', 3)
local visualSection = visualTab:AddSection('Visual Settings', 3, 1)

-- TOGGLES
local fullbrightToggle = visualSection:AddToggle({
    text = 'Fullbright',
    flag = 'fullbright',
    state = false,
    callback = function(enabled)
        print('Fullbright:', enabled)
        local lighting = game:GetService("Lighting")
        if enabled then
            lighting.Brightness = 2
            lighting.ClockTime = 14
            lighting.FogEnd = 100000
        else
            lighting.Brightness = 1
            lighting.ClockTime = 12
            lighting.FogEnd = 500
        end
    end
})

local removeFogToggle = visualSection:AddToggle({
    text = 'Remove Fog',
    flag = 'remove_fog',
    state = false,
    callback = function(enabled)
        print('Remove Fog:', enabled)
        game:GetService("Lighting").FogEnd = enabled and 100000 or 500
    end
})

-- SLIDERS
local fovAdjustSlider = visualSection:AddSlider({
    text = 'Camera FOV',
    flag = 'camera_fov',
    min = 70,
    max = 120,
    increment = 1,
    value = 90,
    suffix = '°',
    callback = function(value)
        print('Camera FOV:', value)
        workspace.CurrentCamera.FieldOfView = value
    end
})

-- DROPDOWN
local timeOfDayDropdown = visualSection:AddList({
    text = 'Time of Day',
    flag = 'time_of_day',
    values = {'Morning', 'Noon', 'Evening', 'Night', 'Custom'},
    selected = 'Noon',
    callback = function(selected)
        print('Time of Day:', selected)
        local lighting = game:GetService("Lighting")
        if selected == 'Morning' then
            lighting.ClockTime = 8
        elseif selected == 'Noon' then
            lighting.ClockTime = 12
        elseif selected == 'Evening' then
            lighting.ClockTime = 18
        elseif selected == 'Night' then
            lighting.ClockTime = 0
        end
    end
})

-- KEYBIND
local fullbrightKeybind = visualSection:AddBind({
    text = 'Fullbright Toggle',
    flag = 'fullbright_key',
    bind = Enum.KeyCode.B,
    mode = 'toggle',
    callback = function(active)
        fullbrightToggle:SetState(active)
    end
})

-- BUTTON
local resetVisualsButton = visualSection:AddButton({
    text = 'Reset Visuals',
    callback = function()
        fullbrightToggle:SetState(false)
        removeFogToggle:SetState(false)
        fovAdjustSlider:SetValue(90)
        print('Visuals reset!')
    end
})

-- Create Settings Tab (includes config system)
library:CreateSettingsTab(window)

-- Notification when loaded
library:SendNotification('Script loaded successfully!', 5, Color3.fromRGB(0, 255, 0))

-- You can access any value using library.flags
-- Example:
game:GetService('RunService').Heartbeat:Connect(function()
    -- Check if aimbot is enabled
    if library.flags.aimbot then
        -- Do aimbot logic using:
        -- library.flags.fov_size
        -- library.flags.smoothness
        -- library.flags.target_part
    end
    
    -- Check other flags
    if library.flags.esp then
        -- Do ESP logic
    end
end)

print('UI Initialized! Press', library.flags.togglebind, 'to open/close')
