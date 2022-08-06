if Config.Vorp then
    IsInMenu = false

    TriggerEvent("menuapi:getData", function(call) 
        MenuData = call 
    end)

    -- Vet Station
    Citizen.CreateThread(function()
        while true do
            local ped = GetPlayerPed()
            local coords = GetEntityCoords(PlayerPedId())
            local sleep = true

            for k, v in pairs(Config.ZonesVet) do
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z,true) <= 2 then
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
            {label = Config.Language[1].text,value = 'vet', desc = Config.Language[2].text}, 
            {label = Config.Language[3].text, value = 'vet2',  desc = Config.Language[4].text}
        }

        MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title = Config.Language[5].text,
            subtext = Config.Language[6].text,
            align = 'left',
            elements = elements
        }, 
        function(data, menu)
            if (data.current.value == 'vet') then
                TriggerServerEvent("angel_vetjob:giveVetStim")
                TriggerEvent("vorp:TipRight", Config.Language[51].text,Config, 2000)
            elseif (data.current.value == 'vet2') then
                TriggerServerEvent("angel_vetjob:giveVetDoghealth")
                TriggerEvent("vorp:TipRight", Config.Language[52].text, 2000)
            end
        end, 
        function(data, menu) 
            menu.close() 
        end)
    end

    RegisterNetEvent("enter:vet")
    AddEventHandler("enter:vet", function()
        SetTextScale(0.5, 0.5)
        -- SetTextFontForCurrentCommand(1)
        local msg = Config.Language[7].text
        local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10,"LITERAL_STRING", msg,Citizen.ResultAsLong())

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
            local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y,v.Pos.z)
            SetBlipSprite(blip, 2555280553, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language[100].text)
        end
    end)
    function OpenVetMenu()
        MenuData.CloseAll()
        IsInMenu = true

    end
end

if Config.GumCore then
    TriggerEvent("gum_menu:getData", function(call) 
        MenuData = call 
    end)

    -- Vet Station
    Citizen.CreateThread(function()
        while true do
            local ped = GetPlayerPed()
            local coords = GetEntityCoords(PlayerPedId())
            local sleep = true

            for k, v in pairs(Config.ZonesVet) do
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z,true) <= 2 then 
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
            {label = Config.Language[1].text,value = 'vet', desc = Config.Language[2].text}, 
            {label = Config.Language[3].text, value = 'vet2',  desc = Config.Language[4].text}
        }
        MenuData.Open('default', GetCurrentResourceName(), 'menuapi', 
        {
            title = Config.Language[5].text,
            subtext = Config.Language[6].text,
            align = 'left',
            elements = elements
        }, 
        function(data, menu)
            if (data.current.value == 'vet') then
                TriggerServerEvent("angel_vetjob:giveVetStim")
                exports['gum_notify']:DisplayLeftNotification( Config.Language[50].text, Config.Language[51].text,Config.Language[53].text, 3000)

            elseif (data.current.value == 'vet2') then
                TriggerServerEvent("angel_vetjob:giveVetDoghealth")
                exports['gum_notify']:DisplayLeftNotification(Config.Language[50].text, Config.Language[52].text, Config.Language[53].text, 3000)

            end
        end, 
        function(data, menu) 
            menu.close() 
        end)
    end

    RegisterNetEvent("enter:vet")
    AddEventHandler("enter:vet", function()
        SetTextScale(0.5, 0.5)
        -- SetTextFontForCurrentCommand(1)
        local msg = Config.Language[7].text
        local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10,"LITERAL_STRING", msg, Citizen.ResultAsLong())

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
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language[100].text)
        end
    end)

end

