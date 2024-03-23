Citizen.CreateThread(function()
    local interval = 750
    while true do
        local pos = GetEntityCoords(PlayerPedId())
        local dest = table.unpack(Config.PositionMenu)
        local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dest.x, dest.y, dest.z, true)

        if distance <= 3.0 then
            interval = 0
        else
            interval = 750
        end

        if distance <= 3.0 then
            DrawMarker(23, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 180, false,
                true,
                nil, false, nil, nil, false)
        end
        if distance <= 2.0 then
            AddTextEntry("Help", "Appui sur ~INPUT_CONTEXT~ pour louer un véhicule")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                lib.registerContext({
                    id = 1,
                    title = 'Location Véhicule',
                    options = {
                        {
                            title = Config.Veh,
                            description = 'Louer un véhicule',
                            onSelect = function()
                                ESX.TriggerServerCallback("checkmoney", function(data)
                                    if data then
                                        local model = GetHashKey(Config.Veh)
                                        RequestModel(model)
                                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                                        local blista = CreateVehicle(model, table.unpack(Config.SpawnVeh), 239.0, true,
                                            false)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), blista, -1)
                                    end
                                end)
                            end,
                            metadata = {
                                { label = 'Prix', value = '150$' }
                            }
                        }
                    }
                })
                lib.showContext(1)
            end
        end
        Wait(interval)
    end
end)

Citizen.CreateThread(function()
    local blips = AddBlipForCoord(table.unpack(Config.Blips))

    SetBlipSprite(blips, 545)
    SetBlipColour(blips, 38)
    SetBlipScale(blips, 0.7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Location véhicule')
    EndTextCommandSetBlipName(blips)
end)
