--Libraries used:
--Bracket V3 (https://github.com/AlexR32/Roblox#bracketv3)
--Noclip Fling (https://controlc.com/a4570bb2)

local Config = {
    WindowName = "RHater V2 Control Panel",
	Color = Color3.fromRGB(255,0,0),
	Keybind = Enum.KeyCode.RightControl
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Basic Admin")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("Player")
local Section2 = Tab1:CreateSection("LoopFling")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")
local Section5 = Tab1:CreateSection("Ranking")
local Section6 = Tab1:CreateSection("Misc")

plr=nil
loopflingpicking=false
local Label1 = Section1:CreateLabel("Label 1")
Label1:UpdateText("the h")
-------------
Section1:CreateTextBox("player name here (full username for rank)", "numbers and letters", false, function(String)
	plr=String
end)

local Button1 = Section2:CreateButton("LoopFling", function()
while true do
	wait(0.1)
Target = plr -- target name, can be shortened
flinghh = 1000 -- what to set your hipheight to while flinging

loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()

end
end)
Button1:AddToolTip("LoopFlings the player (same as rhater loopfling), kinda buggy")

Section1:CreateTextBox("player name here (full username for rank)", "numbers and letters", false, function(String)
	plr=String
end)

local Button91 = Section6:CreateButton("Tp Back on death", function()
loadstring(game:HttpGet('https://pastebin.com/raw/KbN4kxaC',true))()
end)
Button91:AddToolTip("tps u back to ur old position when u die and respawn")

local Button2 = Section5:CreateButton("Rank", function()
local rankedplr = game.Players:FindFirstChild(plr)
local args = {
    [1] = "/w " .. rankedplr.Name .. " [RHater V2] You have been ranked, you may look at the commands at github/Alexplayrus1/RHater-V2/blob/main/commands.md",
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
rankedplr.Chatted:Connect(function(msg)
    if msg==".cmds" then
      local args = {
    [1] = "/w " .. rankedplr.Name .. " [RHater V2] .loopfling - prompts you to enter a players username to loopfling them, kinda kicks, is pretty buggy, more commands at github/Alexplayrus1/RHater-V2/blob/main/commands.md",
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
   elseif msg==".loopfling" then
     local args = {
    [1] = "/w " .. rankedplr.Name .. " [RHater V2] say a players username to loopfling (can be shortened)",
    [2] = "All"
}
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    loopflingpicking=true
  elseif loopflingpicking==true then
    
    loopflingpicking=false
    while true do
	wait(0.1)
Target = msg -- target name, can be shortened
flinghh = 1000 -- what to set your hipheight to while flinging

loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()

  end
      end
    end)
end)
Button2:AddToolTip("ranks a player (use full username)")



local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Wood","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Wood" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Hexagon")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(100,0,0))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)