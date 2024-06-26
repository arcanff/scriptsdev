local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "SISYPHUS SIMULATOR",
    LoadingTitle = "SISYPHUS SIMULATOR",
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
        SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"https://pastebin.com/raw/QmPifjyX"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Tabs = {
    Chil = Window:CreateTab("TOYS", nil),
    Farm = Window:CreateTab("FARM", nil),
    Xtras = Window:CreateTab("XTRAS", nil)
}

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CHILD TABS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Push = Tabs.Chil:CreateSection("PUSH")

local ActiveHappy = false

local ToggleHappy = Tabs.Chil:CreateToggle({
    Name = "HAPPY!",
    CurrentValue = false,
    Flag = "ToggleHappy",
    Callback = function(value)
        ActiveHappy = value
        local function Candy()
        if game.Players.LocalPlayer.World.Value ~= -10 then -- teleport if you're on wrong world (game bugs if wrong world)
            game:GetService("ReplicatedStorage").Remote.Event.World:FindFirstChild("[C-S]TryGoWorld"):FireServer(-10)
            wait(.3)
        end
        game:GetService("ReplicatedStorage").Remote.Event.Game["[C-S]PlayerTryBall"]:FireServer(-10)
    end
        while ActiveHappy do
            Candy()
            wait() 
        end
    end,
})

local ActiveEnd = false
local ToggleHappyEnd = Tabs.Chil:CreateToggle({
    Name = "HAPPY! END",
    CurrentValue = false,
    Flag = "ToggleHappyEnd",
    Callback = function(value)
        ActiveEnd = value
        local function CandyEnd()
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerEnd"):FireServer(true,1)
        end
        while ActiveEnd do
            CandyEnd()
            task.wait(0.001)
        end
    end,
})

local Push = Tabs.Chil:CreateSection("CLAIMABLES")

local ActiveCandie = false
local ToggleCandies = Tabs.Chil:CreateToggle({
    Name = "Candies",
    CurrentValue = false,
    Flag = "Candies",
    Callback = function(value)
        ActiveCandie = value
        local function Candies()
            game:GetService("ReplicatedStorage").Remote.Event.HappyChild.AddChildLolly:FireServer()
        end
        while ActiveCandie do
            Candies()
            wait() 
        end
    end,
})

local ToggleBalloos = Tabs.Chil:CreateToggle({
    Name = "Balloons",
    CurrentValue = false,
    Flag = "ToggleHappyEnd",
    Callback = function(value)
        active = value
        local function Balloons()
        end
        while active do
            Balloons()
            wait() 
        end
    end,
})

local ActiveEggs = false
local ToggleCandies = Tabs.Chil:CreateToggle({
    Name = "Eggs",
    CurrentValue = false,
    Flag = "Candies",
    Callback = function(value)
        ActiveEggs = value
        local function Candies()
            local args = {
                [1] = "Children1",
                [2] = 20
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Luck"):WaitForChild("[C-S]DoLuck"):InvokeServer(unpack(args))
            local args = {
                [1] = "Children2",
                [2] = 20
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Luck"):WaitForChild("[C-S]DoLuck"):InvokeServer(unpack(args))
        end
        while ActiveEggs do
            Candies()
            wait() 
        end
    end,
})
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> FARM TAB <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local ActiveClick = false
local StrongClick = Tabs.Farm:CreateToggle({
    Name = "STRONG CLICK",
    CurrentValue = false,
    Flag = "StrongClick",
    Callback = function(value)
        ActiveClick = value -- 
        local function StrongClick()
            local args = {
                [1] = game:GetService("ReplicatedStorage").Assets.Tools:FindFirstChild("8_8")
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerClick"):FireServer(unpack(args))
        end
        while ActiveClick do
            StrongClick()
            wait() -- 
        end
    end,
})

local Push = Tabs.Farm:CreateSection("PUSH")

local ActiveBest = false 
local AutoPush = Tabs.Farm:CreateToggle({
    Name = "AUTO PUSH BEST WORLD",
    CurrentValue = false,
    Flag = "AutoPush",
    Callback = function(value)
        ActiveBest = value -- 
        local function PushBestWorld()
            local args = {
                [1] = true
            }
            PlayerBestWorld = getsenv(game.Players.LocalPlayer.PlayerScripts.WorldManager).getBestWorld()
            
            -- Asegurarse de que PlayerBestWorld no sea mayor que 8
            if PlayerBestWorld > 8 then
                PlayerBestWorld = 8
            end

            if game.Players.LocalPlayer.World.Value ~= PlayerBestWorld then -- teleport if you're on wrong world (game bugs if wrong world)
                game:GetService("ReplicatedStorage").Remote.Event.World:FindFirstChild("[C-S]TryGoWorld"):FireServer(PlayerBestWorld)
                wait(.3)
            end
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerTryBall"):FireServer(PlayerBestWorld)
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerEnd"):FireServer(false, 0.99)
        end
        
        while ActiveBest do
            PushBestWorld()
            wait() -- 
        end
    end,
})

local ActiveChristmas = false 
local ToggleChristmas = Tabs.Farm:CreateToggle({
    Name = "CHRISTMAS",
    CurrentValue = false,
    Flag = "ToggleChristmas",
    Callback = function(value)
        ActiveChristmas = value
        local function Gifts()
            if game.Players.LocalPlayer.World.Value ~= -1 then -- teleport if you're on wrong world (game bugs if wrong world)
                game:GetService("ReplicatedStorage").Remote.Event.World:FindFirstChild("[C-S]TryGoWorld"):FireServer(-1)
                wait(.3)
            end
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerTryBall"):FireServer(-1)
            game:GetService("ReplicatedStorage").Remote.Event.Game:FindFirstChild("[C-S]PlayerEnd"):FireServer(false,0.99)
        end
        while ActiveChristmas do
            Gifts()
            wait() 
        end
    end,
})

local ActiveUp = false 
local ChristmasUp = Tabs.Farm:CreateToggle({
    Name = "CHRISTMAS COUNT UP",
    CurrentValue = false,
    Flag = "ChristmasUp",
    Callback = function(value)
        ActiveUp = value 
        local function Gifts()
            if game.Players.LocalPlayer.World.Value ~= -1 then -- teleport if you're on wrong world (game bugs if wrong world)
                game:GetService("ReplicatedStorage").Remote.Event.World:FindFirstChild("[C-S]TryGoWorld"):FireServer(-1)
                wait(.3)
            end
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerTryBall"):FireServer(-1)
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerEnd"):FireServer(true,1)
        end
        while ActiveUp do
            Gifts()
            wait()
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
            wait() -- 
        end
    end,
})

local active_super_rebirth = false 
local ToggleSuperRebirth = Tabs.Farm:CreateToggle({
    Name = "SUPER REBIRTH",
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> XTRAS TAB <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local Xtras = Tabs.Xtras:CreateSection("FUNCTIONS")

local WalkSpeed = Tabs.Xtras:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Walk Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local Button = Tabs.Xtras:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

local ActiveGems = false 
local StartsGems = Tabs.Xtras:CreateToggle({
    Name = "Starts to Gems",
    CurrentValue = false,
    Flag = "StartsGems",
    Callback = function(value)
        ActiveGems = value
        local function StartGems()
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Eco"):WaitForChild("[C-S]PlayerTryUp"):FireServer("Up_Gems")
        end
        while ActiveGems do
            StartGems()
            wait() 
        end
    end,
})
