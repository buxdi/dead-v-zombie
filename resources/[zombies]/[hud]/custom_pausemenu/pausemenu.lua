
ESX = exports["es_extended"]:getSharedObject()


function AddTextEntry(k, v)
   Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), k, v)
end

local map_category = "Carte de Los Santos"
local game_category = "Quitter"
local disconnect_submenu = "Retourner à la liste des serveurs"
local closegame_submenu = "Quitter FiveM et revenir au bureau"
local info_category = "Journaux"
local statistics_category = "Statistiques"
local settings_category = "Paramètres"
local gallery_category = "Galerie"
local rockstar_editor_category = "∑ Éditeur"
local fivem_key_config_submenu = "Touches FiveM"

AddTextEntry('PM_SCR_MAP', map_category)
AddTextEntry('PM_SCR_GAM', game_category)
AddTextEntry('PM_PANE_LEAVE', disconnect_submenu)
AddTextEntry('PM_PANE_QUIT', closegame_submenu)
AddTextEntry('PM_SCR_INF', info_category)
AddTextEntry('PM_SCR_STA', statistics_category)
AddTextEntry('PM_SCR_SET', settings_category)
AddTextEntry('PM_SCR_GAL', gallery_category)
AddTextEntry('PM_SCR_RPL', rockstar_editor_category)
AddTextEntry('PM_PANE_CFX', fivem_key_config_submenu)

Citizen.CreateThread(function()
   while true do
      Wait(10000)

      while ESX.GetPlayerData().job == nil do
         Wait(1000)
      end

      local playerData = ESX.PlayerData
      local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
      local job = ESX.GetPlayerData().job.label
      local firstName = ESX.GetPlayerData().firstName
      local lastName = ESX.GetPlayerData().lastName
      local grade = ESX.GetPlayerData().job.grade
      local fivem_title = "~l~| ~c~" .. id .. "~l~ |~c~ " .. firstName .. " " .. lastName .. "~c~ ~l~|~c~ " .. job .. " ~l~|~"
      AddTextEntry('FE_THDR_GTAO', fivem_title)
   end
end)
