-- Simple UI Library Demo
-- Toggle, Slider, Button, Keybind, and Dropdown only

local function CreateSimpleUI()
    -- Initialize the library
    local library = loadstring(game:HttpGet("YOUR_LIBRARY_URL_HERE"))()
    
    library:init()
    
    -- Create main window
    local window = library.NewWindow({
        title = 'Simple Demo',
        size = UDim2.new(0, 550, 0, 650),
        position = UDim2.new(0, 100, 0, 100)
    })
    
    -- Create tabs
    local combatTab = window:AddTab('Combat', 1)
    local playerTab = window:AddTab('Player', 2)
    
    -- Create sections
    local aimSection = combatTab:AddSection('Aiming', 1, 1)
    local movementSection = playerTab:AddSection('Movement', 2, 1)
    
    -- ============= TOGGLES =============
    local aimbot = aimSection:AddToggle({
        text = 'Enable Aimbot',
        flag = 'aimbot_enabled',
        state = false,
        callback = function(enabled)
            print('Aimbot:', enabled)
        end
    })
    
    local teamCheck = aimSection:AddToggle({
        text = 'Team Check',
        flag = 'team_check',
        state = true,
        callback = function(enabled)
            print('Team Check:', enabled)
        end
    })
    
    local wallCheck = aimSection:AddToggle({
        text = 'Wall Check',
        flag = 'wall_check',
        state = false,
        callback = function(enabled)
            print('Wall Check:', enabled)
        end
    })
    
    -- ============= SLIDERS =============
    local fovRadius = aimSection:AddSlider({
        text = 'FOV Radius',
        flag = 'fov_radius',
        min = 10,
        max = 500,
        increment = 10,
        value = 150,
        suffix = 'px',
        callback = function(value)
            print('FOV Radius:', value)
        end
    })
    
    local smoothness = aimSection:AddSlider({
        text = 'Smoothness',
        flag = 'aim_smoothness',
        min = 0,
        max = 100,
        increment = 1,
        value = 50,
        suffix = '%',
        callback = function(value)
            print('Smoothness:', value)
        end
    })
    
    local walkSpeed = movementSection:AddSlider({
        text = 'Walk Speed',
        flag = 'walk_speed',
        min = 16,
        max = 200,
        increment = 1,
        value = 16,
        callback = function(value)
            print('Walk Speed:', value)
        end
    })
    
    local jumpPower = movementSection:AddSlider({
        text = 'Jump Power',
        flag = 'jump_power',
        min = 50,
        max = 300,
        increment = 5,
        value = 50,
        callback = function(value)
            print('Jump Power:', value)
        end
    })
    
    -- ============= DROPDOWNS =============
    local aimPart = aimSection:AddList({
        text = 'Target Part',
        flag = 'target_part',
        values = {'Head', 'Torso', 'HumanoidRootPart', 'Random'},
        selected = 'Head',
        callback = function(selected)
            print('Target Part:', selected)
        end
    })
    
    local aimMethod = aimSection:AddList({
        text = 'Aim Method',
        flag = 'aim_method',
        values = {'Mouse', 'Camera', 'Silent'},
        selected = 'Mouse',
        callback = function(selected)
            print('Aim Method:', selected)
        end
    })
    
    -- ============= KEYBINDS =============
    local aimbotKey = aimSection:AddBind({
        text = 'Aimbot Key',
        flag = 'aimbot_keybind',
        bind = Enum.KeyCode.E,
        mode = 'hold',
        callback = function(active)
            print('Aimbot Key Active:', active)
        end
    })
    
    local flyKey = movementSection:AddBind({
        text = 'Fly Key',
        flag = 'fly_keybind',
        bind = Enum.KeyCode.X,
        mode = 'toggle',
        callback = function(active)
            print('Fly:', active)
        end
    })
    
    local noclipKey = movementSection:AddBind({
        text = 'Noclip Key',
        flag = 'noclip_keybind',
        bind = Enum.KeyCode.C,
        mode = 'toggle',
        callback = function(active)
            print('Noclip:', active)
        end
    })
    
    -- ============= BUTTONS =============
    local resetAim = aimSection:AddButton({
        text = 'Reset Aim Settings',
        callback = function()
            fovRadius:SetValue(150)
            smoothness:SetValue(50)
            aimPart:Select('Head')
            print('Aim settings reset!')
        end
    })
    
    local resetMovement = movementSection:AddButton({
        text = 'Reset Movement',
        confirm = true,
        callback = function()
            walkSpeed:SetValue(16)
            jumpPower:SetValue(50)
            print('Movement reset!')
        end
    })
    
    local teleportHome = movementSection:AddButton({
        text = 'Teleport to Spawn',
        callback = function()
            print('Teleporting to spawn...')
        end
    })
    
    -- ============= SETTINGS TAB =============
    library:CreateSettingsTab(window)
    
    -- Access values using flags
    game:GetService('RunService').Heartbeat:Connect(function()
        if library.flags.aimbot_enabled then
            -- Use library.flags.fov_radius
            -- Use library.flags.aim_smoothness
            -- Use library.flags.target_part
        end
        
        if library.flags.walk_speed then
            -- Apply walk speed
        end
    end)
    
    return library
end

-- Initialize the UI
local myUI = CreateSimpleUI()

--[[
SIMPLE REFERENCE:

TOGGLES:
- toggle:SetState(bool)

SLIDERS:
- slider:SetValue(number)

BUTTONS:
- Just trigger the callback

KEYBINDS:
- bind:SetBind(Enum.KeyCode.X)

DROPDOWNS:
- dropdown:Select('value')
- dropdown:AddValue('newValue')
- dropdown:RemoveValue('value')

ACCESS VALUES:
- library.flags.flag_name
]]
