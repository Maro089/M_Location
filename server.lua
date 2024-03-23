ESX.RegisterServerCallback("checkmoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getAccount('money')
    local cost = 150

    if money.money >= cost then
        cb(true)
        xPlayer.removeMoney(cost)
        TriggerClientEvent("esx:showNotification", source, 'Vous avez louer un véhicule')
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent')
    end
end)
