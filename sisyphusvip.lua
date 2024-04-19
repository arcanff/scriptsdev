local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "SISYPHUS SIMULATOR [💎]",
    LoadingTitle = "VIP SISYPHUS SIMULATOR",
    LoadingSubtitle = "By ARCAN",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "SISYPHUSHUB"
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Key | Sisyphus Hub",
        Subtitle = "Key System",
        Note = "Key In Discord Server",
        FileName = "SisyphusKeyHub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"1"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EASTER TAB <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Tabs = {
    Easter = Window:CreateTab("EASTER", nil),
    Farm = Window:CreateTab("FARM", nil),
    Relics = Window:CreateTab("RELICS", nil),
    Xtras = Window:CreateTab("XTRAS", nil)
}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EGG SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Egg = Tabs.Easter:CreateSection("EVENT FARM")

local function CollectEggs()
    local collecting = true -- Variable para controlar si se está recolectando huevos

    -- Comienza a recolectar huevos
    while collecting do
        game:GetService("ReplicatedStorage").Easter.AddEgg:FireServer()
        wait() -- Espera 0.1 segundo antes de recolectar otro huevo
    end
end

-- Función para hacer el server hop
local function ServerHop()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    
    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
        return Http:JSONDecode(Raw)
    end
    
    local Server, Next; repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
    until Server
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, bestserver, game.Players.LocalPlayer)

    TPS:TeleportToPlaceInstance(_place,Server.id,game:GetService('Players').LocalPlayer)
end

-- Crear el botón para activar la recolección de huevos y hacer el server hop
local Button = Tabs.Easter:CreateButton({
    Name = "Egg Sucking || Server Hop",
    Callback = function()
        spawn(CollectEggs)
        wait(2.5)
        ServerHop() 
    end,
})

local Button = Tabs.Easter:CreateButton({
    Name = "Egg Sucking",
    Callback = function()
        spawn(CollectEggs)
    end,
})

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SHOP SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Shop = Tabs.Easter:CreateSection("EASTER SHOP")

local Dragon = Tabs.Easter:CreateButton({
    Name = "DRAGON",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Easter"):WaitForChild("GetPetBig"):FireServer()
    end,
})

local Cat = Tabs.Easter:CreateButton({
    Name = "CAT",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Easter"):WaitForChild("GetPetCat"):FireServer()
    end,
})

-- local Coins = Tabs.Easter:CreateButton({
--     Name = "COINS",
--     Callback = function()
--         game:GetService("ReplicatedStorage"):WaitForChild("Easter"):WaitForChild("ExchangeCoin"):FireServer()
--     end,
-- })


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PUSH SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Push = Tabs.Farm:CreateSection("PUSH")

local active = false 
local AutoPush = Tabs.Farm:CreateToggle({
    Name = "AUTO PUSH",
    CurrentValue = false,
    Flag = "AutoPush",
    Callback = function(value)
        active = value -- 
        local function PushBerstWorld()
            local args = {
                [1] = true
            }
            PlayerBestWorld = getsenv(game.Players.LocalPlayer.PlayerScripts.WorldManager).getBestWorld()
            if game.Players.LocalPlayer.World.Value ~= PlayerBestWorld then -- teleport if youre on wrong world (game bugs if wrong world)
                game:GetService("ReplicatedStorage").Remote.Event.World:FindFirstChild("[C-S]TryGoWorld"):FireServer(PlayerBestWorld)
                wait(.3)
            end
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerTryBall"):FireServer(PlayerBestWorld)
            wait(.1)
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerEnd"):FireServer(false,0.99)
        end
        while active do
            PushBerstWorld()
            wait() -- 
        end
    end,
})

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> REBIRTH SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Rebirth = Tabs.Farm:CreateSection("REBIRTH")

local active_auto_rebirth = false
local ToggleAutoRebirth = Tabs.Farm:CreateToggle({
    Name = "AUTO REBIRTH",
    CurrentValue = false,
    Flag = "ToggleAutoRebirth",
    Callback = function(value)
        active_auto_rebirth = value
        local function AutoRebirth()
            local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Eco"):WaitForChild("[C-S]PlayerTryRebirth"):FireServer()
        end
        while active_auto_rebirth do
            AutoRebirth()
            wait(1/35) -- 
        end
    end,
})

local active_super_rebirth = false 
local ToggleSuperRebirth = Tabs.Farm:CreateToggle({
    Name = "SUPERREBIRTH",
    CurrentValue = false,
    Flag = "ToggleSuperRebirth",
    Callback = function(value)
        active_super_rebirth = value 
        local function SuperRebirth()
            local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Eco"):WaitForChild("[C-S]PlayerTrySuperRebirth"):FireServer()
        end
        while active_super_rebirth do
            SuperRebirth()
            wait() -- 
        end
    end,
})

local Egg = Tabs.Farm:CreateSection("CHRISTMAS")

local ToggleChristmas = Tabs.Farm:CreateToggle({
    Name = "CHRISTMAS",
    CurrentValue = false,
    Flag = "ToggleChristmas",
    Callback = function(value)
        active = value
        local function Gifts()
            local args = {
                [1] = -1
            }
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerTryBall"):FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerEnd"):FireServer(false,0.99)
        end
        while active do
            Gifts()
            wait() 
        end
    end,
})

local ChristmasUp = Tabs.Farm:CreateToggle({
    Name = "CHRISTMAS COUNT UP",
    CurrentValue = false,
    Flag = "ChristmasUp",
    Callback = function(value)
        active = value 
        local function Gifts()
            local args = {
                [1] = -1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerTryBall"):FireServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerEnd"):FireServer(true,1)
        end
        while active do
            Gifts()
            wait(1/4) -- qe3xrfcsw
        end
    end,
})

local Egg = Tabs.Farm:CreateSection("NETHER")


local ToggleNether = Tabs.Farm:CreateToggle({
    Name = "COINS",
    CurrentValue = false,
    Flag = "ToggleNether",
    Callback = function(value)
        active = value -- 
        local function Coins()
            local args = {
                [1] = -2
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerEnd"):FireServer(true,1)
        end
        while active do
            Coins()
            wait()
        end
    end,
})
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> RELICS SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Relics = Tabs.Relics:CreateSection("RELICS")

local ToggleAtlantisRelic = Tabs.Relics:CreateToggle({
    Name = "ATLANTIS",
    CurrentValue = false,
    Flag = "ToggleAtlantisRelic",
    Callback = function(value)
        AtlantisRelic = value 
        local function Atlantis()
            local args = {
                [1] = "2",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while AtlantisRelic do
            Atlantis()
            wait() 
        end
    end,
})

local ToggleTempleRelic = Tabs.Relics:CreateToggle({
    Name = "TEMPLE",
    CurrentValue = false,
    Flag = "ToggleTempleRelic",
    Callback = function(value)
        TempleRelic = value 
        local function Temple()
            local args = {
                [1] = "3",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while TempleRelic do
            Temple()
            wait() 
        end
    end,
})

local TogglePyramidRelic = Tabs.Relics:CreateToggle({
    Name = "PYRAMID",
    CurrentValue = false,
    Flag = "TogglePyramidRelic",
    Callback = function(value)
        PiramidRelic = value 
        local function Pyramid()
            local args = {
                [1] = "4",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            local args = {
                [1] = "4",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while PiramidRelic do
            Pyramid()
            wait(1/8)
        end
    end,
})

local ToggleHeavenRelic = Tabs.Relics:CreateToggle({
    Name = "HEAVEN",
    CurrentValue = false,
    Flag = "ToggleHeavenRelic",
    Callback = function(value)
        HeavenRelic = value 
        local function Heaven()
            local args = {
                [1] = "5",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            local args = {
                [1] = "5",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while HeavenRelic do
            Heaven()
            wait(1/8) 
        end
    end,
})

local ToggleSpaceRelic = Tabs.Relics:CreateToggle({
    Name = "SPACE",
    CurrentValue = false,
    Flag = "ToggleSpaceRelic",
    Callback = function(value)
        SpaceRelic = value 
        local function Space()
            local args = {
                [1] = "6",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while SpaceRelic do
            Space()
            wait()
        end
    end,
})

local ToggleCoveRelic = Tabs.Relics:CreateToggle({
    Name = "COVE",
    CurrentValue = false,
    Flag = "ToggleCoveRelic",
    Callback = function(value)
        CoveRelic = value 
        local function Cove()
            local args = {
                [1] = "7",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while CoveRelic do
            Cove()
            wait()
        end
    end,
})

local ToggleTimeRelic = Tabs.Relics:CreateToggle({
    Name = "TIME",
    CurrentValue = false,
    Flag = "ToggleTimeRelic",
    Callback = function(value)
        TimeRelic = value 
        local function Time()
            local args = {
                [1] = "8",
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Ornaments"):WaitForChild("[C-S]PlayerTryDoLuck"):InvokeServer(unpack(args))
        end
        while TimeRelic do
            Time()
            wait()
        end
    end,
})

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> XTRAS SECTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Xtras = Tabs.Xtras:CreateSection("FUNCTIONS")

local WalkSpeed = Tabs.Xtras:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Walk Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local Slider = Tabs.Xtras:CreateSlider({
    Name = "Jump [don't work]",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Jump Power",
    CurrentValue = 50,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

local Button = Tabs.Xtras:CreateButton({
    Name = "Server Hop",
    Callback = function()
        ServerHop() 
    end,
})


local AFK = Tabs.Xtras:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "AFK",
    Callback = function(value)
        active = value -- 

        -- 
        local function AntiAFK()
            game.Players.LocalPlayer.Character.Humanoid.Jump = true
        end

        -- 
        while active do
            AntiAFK()
            wait() -- qe3xrfcsw
        end
    end,
})

local StartsGems = Tabs.Xtras:CreateToggle({
    Name = "Starts to Gems",
    CurrentValue = false,
    Flag = "StartsGems",
    Callback = function(value)
        active = value -- 

        -- 
        local function StartGems()
            local args = {
                [1] = "Up_Gems"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Eco"):WaitForChild("[C-S]PlayerTryUp"):FireServer(unpack(args))
        end

        -- 
        while active do
            StartGems()
            wait() -- qe3xrfcsw
        end
    end,
})