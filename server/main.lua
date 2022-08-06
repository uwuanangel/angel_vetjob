local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("angel_vetjob:checkjob")
AddEventHandler("angel_vetjob:checkjob", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'vet' then
        TriggerClientEvent('angel_vetjob:open2', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont have a Veterinary License", 4000) -- from server side
    end
end)

RegisterServerEvent("angel_vetjob:giveVetStim")
AddEventHandler("angel_vetjob:giveVetStim", function()
    local _source = source
    if count == nil then
        Count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "stim", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
        end
    end)
end)

RegisterServerEvent("angel_vetjob:giveVetDoghealth")
AddEventHandler("angel_vetjob:giveVetDoghealth", function()
    local _source = source
    if count == nil then
        Count = 3
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "Health_For_Dog", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
        end
    end)
end)
