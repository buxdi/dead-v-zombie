ESX = exports["es_extended"]:getSharedObject()

players = {}

RegisterServerEvent("esx_zombiesystem:newplayer")
AddEventHandler("esx_zombiesystem:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("esx_zombiesystem:clear", -1)
end)

RegisterServerEvent('esx_zombiesystem:moneyloot')
AddEventHandler('esx_zombiesystem:moneyloot', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(50, 850)
    xPlayer.addMoney(random)
    --TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. random .. ' dollars'))
end)

RegisterServerEvent('esx_zombiesystem:itemloot')
AddEventHandler('esx_zombiesystem:itemloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(1,3)
    if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        --TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. item))
    else
        xPlayer.showNotification('~r~Inventaire plein !')
    end
end)

RegisterServerEvent('esx_zombiesystem:weaponloot')
AddEventHandler('esx_zombiesystem:weaponloot', function(weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(weapon, 1) then
        xPlayer.addInventoryItem(weapon, 1)
        --TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~b~' .. item))
        if weapon == 'WEAPON_PISTOL' then
            if xPlayer.canCarryItem('ammo-9', 16) then
                xPlayer.addInventoryItem('ammo-9', 16)
            end
        end
    else
        xPlayer.showNotification('~r~Inventaire plein !')
    end
end)


entitys = {}

RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
	TriggerClientEvent("ZombieSync", -1, entity)
	table.insert(entitys, entity)
end)

-- xp for kills
AddEventHandler("baseevents:onPlayerKilled", function(killer, reason)
    TriggerClientEvent('esx_xp:Add', killer, 250)
end)
