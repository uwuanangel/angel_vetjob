if Config.Vorp then 
    print("YOU ARE RUNNING VORP CORE VERSION!")
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
        if job == Config.Job then
            TriggerClientEvent('angel_vetjob:open2', _source)
        else
            TriggerClientEvent("vorp:Tip", _source, "You dont have a Veterinary License", 4000) -- from server side
        end
    end)
    
    RegisterServerEvent("angel_vetjob:giveVetStim")
    AddEventHandler("angel_vetjob:giveVetStim", function()
        local _source = source
        local Character = VorpCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  5
        local total = money - take
        local amount = Config.amount
        local canCarry = VorpInv.canCarryItems(_source, amount)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    VorpInv.addItem(_source, Config.GoldElixir, amount)
                else
                    TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
                end
            else
                TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
            end
        end)

    RegisterServerEvent("angel_vetjob:giveHorseHealth")
    AddEventHandler("angel_vetjob:giveHorseHealth", function()
        local _source = source
        local Character = VorpCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        local canCarry = VorpInv.canCarryItems(_source, amount)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    VorpInv.addItem(_source, Config.HorseHealth, amount)
                else
                    TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
                end
            else
                TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
            end
        end)

    RegisterServerEvent("angel_vetjob:giveHorseStamina")
    AddEventHandler("angel_vetjob:giveHorseStamina", function()
        local _source = source
        local Character = VorpCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        local canCarry = VorpInv.canCarryItems(_source, amount)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    VorpInv.addItem(_source, Config.HorseStamina, amount)
                else
                    TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
                end
            else
                TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
            end
        end)
    
    RegisterServerEvent("angel_vetjob:giveVetDoghealth")
    AddEventHandler("angel_vetjob:giveVetDoghealth", function()
        local _source = source
        local Character = VorpCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        local canCarry = VorpInv.canCarryItems(_source, amount)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    VorpInv.addItem(_source, Config.PetHealth, amount)
                else
                    TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
                end
            else
                TriggerClientEvent("vorp:TipRight", _source, "You have no Inventory space", 3000)
            end
        end)
    

if Config.GumCore then 
    print("YOU ARE RUNNING GUM CORE VERSION!")
    local gumCore = {}

    TriggerEvent("getCore",function(core)
        gumCore = core
    end)
    gumInv = exports.gum_inventory:gum_inventoryApi()


    RegisterServerEvent("angel_vetjob:checkjob")
    AddEventHandler("angel_vetjob:checkjob", function()   
        local _source = source
        local Character = gumCore.getUser(_source).getUsedCharacter
        local job = Character.job
        if job == Config.Job then
            TriggerClientEvent('angel_vetjob:open2', _source)
        else
            TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "You don't have the vet job",'interaction', 3000)        
        end
    end)

    RegisterServerEvent("angel_vetjob:giveVetStim")
    AddEventHandler("angel_vetjob:giveVetStim", function()
        local _source = source
        local Character = gumCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        TriggerEvent("gumCore:canCarryItems", tonumber(_source), amount, function(canCarry)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    gumInv.addItem(_source, Config.GoldElixir, amount)
                else
                    TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "Not enough money",'interaction', 3000)        

                end
            else
                TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "You have no Inventory space",'interaction', 3000)        
            end
        end)
    end)

    RegisterServerEvent("angel_vetjob:giveHorseHealth")
    AddEventHandler("angel_vetjob:giveHorseHealth", function()
        local _source = source
        local Character = gumCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        TriggerEvent("gumCore:canCarryItems", tonumber(_source), amount, function(canCarry)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    gumInv.addItem(_source, Config.HorseHealth, amount)
                else
                    TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "Not enough money",'interaction', 3000)        

                end
            else
                TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "You have no Inventory space",'interaction', 3000)        
            end
        end)
    end)

    RegisterServerEvent("angel_vetjob:giveHorseStamina")
    AddEventHandler("angel_vetjob:giveHorseHorseStamina", function()
        local _source = source
        local Character = gumCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        TriggerEvent("gumCore:canCarryItems", tonumber(_source), amount, function(canCarry)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    gumInv.addItem(_source, Config.HorseStamina, amount)
                else
                    TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "Not enough money",'interaction', 3000)        

                end
            else
                TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "You have no Inventory space",'interaction', 3000)        
            end
        end)
    end)

    RegisterServerEvent("angel_vetjob:giveVetDoghealth")
    AddEventHandler("angel_vetjob:giveVetDoghealth", function()
        local _source = source
        local Character = gumCore.getUser(source).getUsedCharacter
        local money = Character.money
        local take =  Config.price
        local total = money - take
        local amount = Config.amount
        TriggerEvent("gumCore:canCarryItems", tonumber(_source), amount, function(canCarry)
            if canCarry then
                if total >= 0 then
                    Character.removeCurrency(0, take)
                    gumInv.addItem(_source, Config.PetHealth, amount)
                else
                    TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "Not enough money",'interaction', 3000)        

                end
            else
                TriggerClientEvent("gum_notify:notify", _source, "NOTIFY", "You have no Inventory space",'interaction', 3000)        
            end
        end)
    end)
end
end
