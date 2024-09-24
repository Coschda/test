-- Stand Roller

local StandTab = Window:MakeTab({
    Name = "Stand Roller",
    PremiumOnly = false
})

StandTab:AddToggle({
    Name = "Activate Stand Farming",
    Default = false,
    Callback = function(Value)
        print(Value)
    end    
})
    
function LearnSkill()
    game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill",{["Skill"] = "Worthiness V",["SkillTreeType"] = "Character"})
end
    
function UseArrow()
    local player = game:GetService("Players").LocalPlayer
    local backpack = player.Backpack
    local tool = backpack:FindFirstChild("Mysterious Arrow")
    
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if tool and humanoid then
        humanoid:EquipTool(tool)
        tool:Activate()
        task.wait(1)
        player.Character.RemoteFunction:InvokeServer("EndDialogue",{["NPC"] = "Mysterious Arrow", ["Option"] = "Option1", ["Dialogue"] = "Dialogue2"})
    end
end
    
function PrintGUI()
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local function printGuiElements(object, indentLevel)
        indentLevel = indentLevel or 0  -- Niveau d'indentation pour afficher les hiérarchies
        print(string.rep(" ", indentLevel) .. object.Name .. " (" .. object.ClassName .. ")")
        for _, child in pairs(object:GetChildren()) do
            printGuiElements(child, indentLevel + 2)  -- Appelle la fonction pour chaque enfant
        end
    end
    for _, guiElement in pairs(playerGui:GetChildren()) do
        printGuiElements(guiElement)
    end
end
StandTab:AddButton({
    Name = "Learn Worthiness II",
    Callback = function()
        --LearnSkill()
        end    
})
    
StandTab:AddButton({
    Name = "Use Arrow",
    Callback = function()
        --UseArrow()
        end    
})
end
    
StandTab:AddButton({
    Name = "Print GUI",
    Callback = function()
        --PrintGUI()
        end    
})
    
StandTab:AddToggle({
    Name = "Stop on Skins",
    Default = true,
    Callback = function(Value)
        end    
})