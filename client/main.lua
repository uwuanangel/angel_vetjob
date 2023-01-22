if Config.Vorp then
    
    IsInMenu = false
    
    TriggerEvent("menuapi:getData", function(call)
        MenuData = call
    end)
    
    function OpenVetMenu()
        MenuData.CloseAll()
        IsInMenu = true
    
    end
    
    -- Vet Station
    Citizen.CreateThread(function()
        while true do
            local ped = GetPlayerPed()
            local coords = GetEntityCoords(PlayerPedId())
            local sleep = true
    
            for k,v in pairs(Config.ZonesVet) do
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                    sleep = false
                    TriggerEvent("enter:vet")
                    if WhenKeyJustPressed(Key) then
                        TriggerServerEvent("angel_vetjob:checkjob")
                    end
                end
            end
            Citizen.Wait(5)
            
            if sleep then
                Wait(1000)
            end
        end
    end)
    
    function OpenVetMenu()
        MenuData.CloseAll()
        local elements = {
            {label = "Horse Boost Elixir", value = 'vet' , desc = "Stamina Boost For Horse"},
            {label = "Dog Medicine", value = 'vet2' , desc = "Dog Medicine"},
            {label = "Horse Health Elixir", value = 'vet3' , desc = "Horse Medicine"},
            {label = "Horse Gold Elixir", value = 'vet4' , desc = "Gold Cores For Horse"},
        }
       MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = "Vet Shop",
            subtext    = "Buy Vet Supplies",
            align    = 'left',
            elements = elements,
        },
        function(data, menu)
            if (data.current.value == 'vet') then 
                TriggerServerEvent("angel_vetjob:giveVetStim")
                TriggerEvent("vorp:TipRight", "You Bought Horse Gold Elixir", 2000)
            elseif (data.current.value == 'vet2') then 
                TriggerServerEvent("angel_vetjob:giveVetDoghealth")
                TriggerEvent("vorp:TipRight", "You Bought Dog Medicine", 2000)
            elseif (data.current.value == 'vet3') then 
                TriggerServerEvent("angel_vetjob:giveVetHorseHealth")
                TriggerEvent("vorp:TipRight", "You Bought Horse Health Elixir", 2000)
            elseif (data.current.value == 'vet4') then 
                TriggerServerEvent("angel_vetjob:giveVetHorseStamina")
                TriggerEvent("vorp:TipRight", "You Bought Horse Boost Elixir", 2000)
            end
        end,
        function(data, menu)
            menu.close()
        end)
    end
    
    
    RegisterNetEvent("enter:vet")
    AddEventHandler("enter:vet", function()
        SetTextScale(0.5, 0.5)
        --SetTextFontForCurrentCommand(1)
        local msg = "~q~ Press ~e~ G ~q~ To Access The Vet Shop"
        local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    
        Citizen.InvokeNative(0xFA233F8FE190514C, str)
        Citizen.InvokeNative(0xE9990552DEC71600)
    end)
    
    RegisterNetEvent("angel_vetjob:open2")
    AddEventHandler("angel_vetjob:open2", function(cb)
        OpenVetMenu()
    end)
    
    function WhenKeyJustPressed(Key)
        if Citizen.InvokeNative(0x580417101DDB492F, 0, Key) then
            return true
        else
            return false
        end
    end
    
    Citizen.CreateThread(function()
        for k, v in pairs(Config.ZonesVet) do
            local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
            SetBlipSprite(blip, 2555280553, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Veterinary")
        end
    end)
    end
    
    if Config.Gumcore then
        
            IsInMenu = false
            
            TriggerEvent("menuapi:getData", function(call)
                MenuData = call
            end)
            
            function OpenVetMenu()
                MenuData.CloseAll()
                IsInMenu = true
            
            end
            
            -- Vet Station
            Citizen.CreateThread(function()
                while true do
                    local ped = GetPlayerPed()
                    local coords = GetEntityCoords(PlayerPedId())
                    local sleep = true
            
                    for k,v in pairs(Config.ZonesVet) do
                        if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                            sleep = false
                            TriggerEvent("enter:vet")
                            if WhenKeyJustPressed(Key) then
                                TriggerServerEvent("angel_vetjob:checkjob")
                            end
                        end
                    end
                    Citizen.Wait(5)
                    
                    if sleep then
                        Wait(1000)
                    end
                end
            end)
            
            function OpenVetMenu()
                MenuData.CloseAll()
                local elements = {
                    {label = "Horse Boost Elixir", value = 'vet' , desc = "Stamina Boost For Horse"},
                    {label = "Pet Bandages", value = 'vet2' , desc = "Dog Medicine"},
                    {label = "Horse Health Elixir", value = 'vet3' , desc = "Horse Medicine"},
                    {label = "Horse Gold Elixir", value = 'vet4' , desc = "Gold Cores For Horse"},
                }
               MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
                {
                    title    = "Vet Shop",
                    subtext    = "Buy Vet Supplies",
                    align    = 'left',
                    elements = elements,
                },
                function(data, menu)
                    if (data.current.value == 'vet') then 
                        TriggerServerEvent("angel_vetjob:giveVetStim")
                        exports['gum_notify']:DisplayLeftNotification( "You Received Horse Gold Elixir", 3000)
                    elseif (data.current.value == 'vet2') then 
                        TriggerServerEvent("angel_vetjob:giveVetDoghealth")
                        exports['gum_notify']:DisplayLeftNotification( "You Received Pet Bandages", 3000)
                    elseif (data.current.value == 'vet3') then 
                        TriggerServerEvent("angel_vetjob:giveVetHorseHealth")
                        exports['gum_notify']:DisplayLeftNotification( "You Received Horse Boost Elixir", 3000)
                    elseif (data.current.value == 'vet4') then 
                        TriggerServerEvent("angel_vetjob:giveVetHorseStamina")
                        TriggerEvent("vorp:TipRight", "You Received Horse Boost Elixir", 2000)
                    end
                end,
                function(data, menu)
                    menu.close()
                end)
            end
            
            
            RegisterNetEvent("enter:vet")
            AddEventHandler("enter:vet", function()
                SetTextScale(0.5, 0.5)
                --SetTextFontForCurrentCommand(1)
                local msg = "~q~ Press ~e~ G ~q~ To Access The Vet Shop"
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
            
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
            end)
            
            RegisterNetEvent("angel_vetjob:open2")
            AddEventHandler("angel_vetjob:open2", function(cb)
                OpenVetMenu()
            end)
            
            function WhenKeyJustPressed(Key)
                if Citizen.InvokeNative(0x580417101DDB492F, 0, Key) then
                    return true
                else
                    return false
                end
            end
            
            Citizen.CreateThread(function()
                for k, v in pairs(Config.ZonesVet) do
                    local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
                    SetBlipSprite(blip, 2555280553, 1)
                    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Veterinary")
                end
            end)
            
        end
