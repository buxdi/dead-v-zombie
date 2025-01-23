ESX = exports["es_extended"]:getSharedObject()
-- Success server event
RegisterServerEvent('esx_crafting:CraftingSuccess')
AddEventHandler('esx_crafting:CraftingSuccess', function(CraftItem)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = Crafting.Items[CraftItem]
    for itemname, v in pairs(item.needs) do
        xPlayer.removeInventoryItem(itemname, v.count)
    end
        xPlayer.addInventoryItem(CraftItem, 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = "Ubalil jsi "..item.label.." !"})
end)

RegisterServerEvent('esx_crafting:CraftingFailed')
AddEventHandler('esx_crafting:CraftingFailed', function(CraftItem)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = Crafting.Items[CraftItem]
        for itemname, v in pairs(item.needs) do
            xPlayer.removeInventoryItem(itemname, v.count)
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Rozsypal jsi to hnupe'})
end)



ESX.RegisterServerCallback('esx_crafting:HasTheItems', function(source, cb, CraftItem)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = Crafting.Items[CraftItem]
    for itemname, v in pairs(item.needs) do
        if xPlayer.getInventoryItem(itemname).count < v.count then
            cb(false)
        end
    end
    cb(true)
end)
