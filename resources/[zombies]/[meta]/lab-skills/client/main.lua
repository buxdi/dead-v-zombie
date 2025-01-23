ESX = exports["es_extended"]:getSharedObject()


--CAMERAS
cam = nil
cam2 = nil
trackMode = nil
trackEntity = nil
trackOffset = nil
trackCam = false 
isFirst = true

local HaveHealthRegen = false 
local StartHPRegeneration = 0
local StopHPRegeneration = 0
local HealthRegenTime = 0
local HaveArmorRegen = false 
local StartArmorRegeneration = 0
local StopArmorRegeneration = 0
local ArmorRegenTime = 0
local HaveA_Speed = false
local HaveAddSwimSpeed = false
local HaveA_DriveSpeed = false
local AddCarSpeed = 0
local CarSpeedModified = false
local HaveAddFlyingSpeed = false
local AddFlyingSpeed = 0
local FlyingSpeedModified = false
local HaveA_BoatSpeed = false
local A_BoatSpeed = 0
local BoatSpeedModified = false
----
local HaveA_SprintStTime = false
local AddStamina = 0
local RestoreStaminaPoint = 100.0
local HaveA_StaminaSavingTime = false
local A_StaminaSaving = 0
local RecoveryStaminaPoint = 1.0
local StartAddHPTimer = false
local StartA_ArmorTimer = false
local StartHealthRegenTimer = false
local StartArmorRegenTimer = false



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()

    Citizen.Wait(1000)
    loadSkills()
end)



--Threads 

Citizen.CreateThread(function()
  while true do
    if Config.TimerEarnXP then
      Wait(Config.TimerEarnXP_Time)
      TriggerServerEvent('lab-skill:server:earnXP', Config.TimerEarnXP_Amount)
    else
      Wait(0)
    end
  end
end)

-- Button F6

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsControlPressed(1, 167) then
            if isFirst then
                zoomPlayer(true)
                SetDisplay(true)
                SetNuiFocus(true,true)
                isFirst = false
                FreezeEntityPosition(PlayerPedId(), true)
              else
                zoomPlayer(false)
                isFirst = true      
                SetDisplay(false)
                SetNuiFocus(false,false)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

--Commands

RegisterCommand('skills', function ()
    if isFirst then
      zoomPlayer(true)
      SetDisplay(true)
      SetNuiFocus(true,true)
      isFirst = false
      FreezeEntityPosition(PlayerPedId(), true)
    else
      zoomPlayer(false)
      isFirst = true      
      SetDisplay(false)
      SetNuiFocus(false,false)
      FreezeEntityPosition(PlayerPedId(), false)

    end
end)

RegisterKeyMapping('skills', '', 'keyboard', 'F7')

RegisterCommand('loadskills', function ()
  loadSkills()
end)


RegisterKeyMapping('skills', 'Open the skills system', 'keyboard', 'END')



-- Functions

SetDisplay = function (bool)
  if bool then
    local PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('lab-skills:server:getSkillsInfo', function (info)
      
      ESX.TriggerServerCallback('lab-skills:server:getOwnSkills', function (skilldata,firstname,lastname)
        SendNUIMessage({
          type = "openSkillScreen",
          skills = Config.Skills,
          playerName = firstname .. ' '.. lastname,
          playerJob = PlayerData.job.label,
          skilldata = skilldata,
          skillInfo = info,
          Locales = Locales,
          Skillconfig = Config.Skills
        })
      end)
    end)
  else
    SendNUIMessage({
      type = "closeScreen",
    })
  end
end

loadSkills = function ()
    --print('skills be loading')
  ResetAvailable = true

  ESX.TriggerServerCallback("lab-skills:server:getAllSkills", function(data)

      local ped = PlayerPedId()
      local pedId = PlayerId()

      for k, v in pairs(data) do
           if v.skill_name == "A_HealthRegens" then
              StartHPRegeneration = v.skillValue_1
              StopHPRegeneration = v.skillValue_2
              HealthRegenTime = v.skillValue_3 * 1000
              HaveHealthRegen = true
          end
          if v.skill_name == "A_ArmorRegen" then 

              StartArmorRegeneration = v.skillValue_1
              StopArmorRegeneration = v.skillValue_2
              ArmorRegenTime = v.skillValue_3 * 1000
              HaveArmorRegen = true       
                                 
          end
          if v.skill_name == "A_Speed" then 

              AddRunningSpeed(v.skillValue_1)  
              HaveA_Speed = true

          end
          if v.skill_name == "A_SwimSpeed" then 

              A_SwimSpeed(v.skillValue_1) 
              HaveAddSwimSpeed = true      

          end
          if v.skill_name == "A_UnderwaterTime" then 

              AddUnderWater(v.skillValue_1)
              HaveA_UnderwaterTime = true      

          end
          if v.skill_name == "A_DriveSpeed" then 

              AddCarSpeed = v.skillValue_1
              HaveA_DriveSpeed = true

          end
          if v.skill_name == "A_BoatSpeed" then 

              A_BoatSpeed = v.skillValue_1
              HaveA_BoatSpeed = true
              
          end
          if v.skill_name == "A_SprintSt" then

              HaveA_SprintStTime = true
              AddStamina = v.skillValue_1

          end    
          if v.skill_name == "A_StaminaSaving" then

              HaveA_StaminaSavingTime = true
              A_StaminaSaving = v.skillValue_1

          end   
      end
  end)
end


zoomPlayer = function(bool) 
  
  local ped = PlayerPedId()
  local pcoords = GetEntityCoords(ped)
  if bool then
    trackOffset = Config.CameraOffsetEnd
    trackEntity = ped

    offsetEnd = GetOffsetFromEntityInWorldCoords(trackEntity, Config.CameraOffsetEnd)
    offsetStart = GetOffsetFromEntityInWorldCoords(trackEntity, Config.CameraOffsetStart)
    camTime = Config.CameraTransitionTime

    -- SetTimecycleModifier('METRO_Tunnels')
    SetTimecycleModifierStrength(3.0)
    FreezeEntityPosition(ped, true)

 

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", offsetStart, 0.0 ,0.0, 0, 60.00, false, 0)
    PointCamAtEntity(cam, trackEntity, 0,0,0, true)
    FreezeEntityPosition(ped, false)
    SetCamFov(cam, Config.StartFOV)
    SetCamActiveWithInterp(cam, cam2, camTime, true, true)
    RenderScriptCams(true, false, 1, true, true)

  


    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", offsetEnd, 0.0 ,0.0, 0, 60.00, false, 0)
    PointCamAtEntity(cam2, trackEntity, 0,0,0, true)
    SetCamFov(cam2, Config.EndFOV)
    SetCamActiveWithInterp(cam2, cam, camTime, true, true)
  

    Citizen.CreateThread(function()

      Citizen.Wait(camTime)
      if DoesCamExist(cam) then
        DestroyCam(cam, true)
      end
    end)
  else
    SetArtificialLightsState(false)
    NetworkClearClockTimeOverride()
    SetTimecycleModifier('default')
    if DoesCamExist(cam) then
      DestroyCam(cam, true)
    end
    if DoesCamExist(cam2) then
      DestroyCam(cam2, true)
    end
    RenderScriptCams(false, false, 1, true, true)
    FreezeEntityPosition(ped, false)
  end
  playerZoomed = bool
  if bool then
    Citizen.Wait(camTime)
  end
  trackCam = bool
end
-- SetAnim("creatures@rottweiler@move", "dead_right", NetworkGetEntityFromNetworkId(k))
loadAnimDict = function(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

SetAnim = function(animName, animID, targetPed)
    loadAnimDict(animName)
    TaskPlayAnim(targetPed, animName, animID, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
end



-- RegisterCommand('setanim', function(source,args)
--     -- if nearbyPed ~= nil then
--         if args[1] == "pet" then
--             print(args[2], args[3],NetworkGetEntityFromNetworkId(nearbyPed) )
--             ClearPedTasksImmediately(NetworkGetEntityFromNetworkId(nearbyPed) )
--             SetAnim(args[2], args[3], NetworkGetEntityFromNetworkId(nearbyPed))
--         end
--         if args[1] == "player" then
--             print(args[2], args[3],PlayerPedId())
--             ClearPedTasksImmediately(PlayerPedId())
--             SetAnim(args[2], args[3], PlayerPedId())
--         end
-- end)


levelup_marker = function(bool)
    markerDisplay = bool
    Citizen.CreateThread(function()
        while true do
            Wait(2)
            --print('LEvel up makrer=>', markerDisplay)
            TriggerClientEvent('esx:showNotification', source, '+1 LVL')
            if markerDisplay then
                if not HasStreamedTextureDictLoaded("levelup") then
                    RequestStreamedTextureDict("levelup", true)
                    while not HasStreamedTextureDictLoaded("levelup") do
                        Wait(1)
                    end
                end
                DrawMarker(9,GetEntityCoords(PlayerPedId()).x,GetEntityCoords(PlayerPedId()).y,GetEntityCoords(PlayerPedId()).z+ 1.01, 0.0, 0.0, 0.0, 85.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255,255,255, 255,false, false, 2, false, "levelup", "levellogo", false)
            else
                return
            end
        end
        -- if not markerDisplay then break end
    end)
end

-- Nuı callbacks

RegisterNUICallback('closeScreen', function (data,cb)
  zoomPlayer(false)
  isFirst = true      
  SetDisplay(false)
  SetNuiFocus(false,false)
end)

RegisterNUICallback('boughtSkill', function (data,cb)
    TriggerServerEvent('lab-skills:server:updateSkills',data.skillID,data.skillPoint)
    TriggerEvent('lab-skills:client:updateSkill', data.skillID)
    if data.skillID == "StaminaSkill1" or data.skillID == "StaminaSkill2" or data.skillID == "StaminaSkill3" or data.skillID == "StaminaSkill4" then
        SetAnim("anim@arena@celeb@flat@solo@no_props@", "jump_d_player_a", PlayerPedId())
        Wait(3500)
        ClearPedTasksImmediately(PlayerPedId())
    end
    if data.skillID == "HealthSkill1" or data.skillID == "HealthSkill2" or data.skillID == "HealthSkill3" then
        SetAnim("anim@mp_fm_event@intro", "beast_transform", PlayerPedId())
        Wait(3500)
        ClearPedTasksImmediately(PlayerPedId())
    end
    if data.skillID == "HealthSkill4" or data.skillID == "HealthSkill5" then
        SetAnim("anim@mp_juggernaut@", "idle_intro", PlayerPedId())
        Wait(3500)
        ClearPedTasksImmediately(PlayerPedId())
    end
    if data.skillID == "UnderWaterSkill1" or data.skillID == "UnderWaterSkill2" or data.skillID == "UnderWaterSkill3-" then
        SetAnim("rcmepsilonism8", "think", PlayerPedId())
        Wait(2500)
        ClearPedTasksImmediately(PlayerPedId())
    end
end)




--Events 


RegisterNetEvent('lab-skill:client:updateXP')  
AddEventHandler('lab-skill:client:updateXP', function(earned)
  --print('[ lab-skill:client:updateXP ]')
  local Player = ESX.GetPlayerData()
    
  ESX.TriggerServerCallback('lab-skills:server:getSkillsInfo', function (data)
        --print('GetSkill => ', data, json.encode(data))
        -- QBCore.Functions.Notify('You have earned: '..earned..' Skill Experience!')
        --print(data.skillxp,data.lastxp )
        if tonumber(data.skillxp) >= tonumber(data.lastxp) then
            currentlevel = data.lastxp
            data.lastxp = math.ceil( 100 + (currentlevel * ((Config.LevelingDifficulty + 100) * 0.01)) )
            data.currentlevel = data.currentlevel + 1
            levelUpNotify("sd","success", data.currentlevel)
            TriggerServerEvent('lab-skills:server:uptadeCurrentInfo', data.currentlevel, data.lastxp, Config.SkillPointsPerLevel)
            if Config.LevelupEffect then
                local dict = Config.LevelUPEffect_dictName
                local particleName =  Config.LevelUPEffect_particlename
                levelup_marker(true)
                Citizen.CreateThread(function()
                    RequestNamedPtfxAsset(dict)
                    while not HasNamedPtfxAssetLoaded(dict) do
                        Citizen.Wait(0)
                    end
                    local ped = PlayerPedId()
                    
                    local a = 0
                    while a < 5 do
                     
                        local x,y,z = table.unpack(GetEntityCoords(ped, true))
                        -- Tell the game that we want to use a specific dictionary for the next particle native.
                        UseParticleFxAssetNextCall(dict)
                        -- Create a new non-looped particle effect, we don't need to store the particle handle because it will
                        -- automatically get destroyed once the particle has finished it's animation (it's non-looped).
                        StartParticleFxNonLoopedAtCoord(particleName, x, y, z, 0.0, 0.0, 0.0, 0.2, false, false, false)
                        -- DrawMarker(9,GetEntityCoords(PlayerPedId()).x,GetEntityCoords(PlayerPedId()).y,GetEntityCoords(PlayerPedId()).z+ 1.01, 0.0, 0.0, 0.0, 85.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255,255,255, 255,false, false, 2, true, "petshop", "img", false)
                        
                        a = a + 1
                        
                        -- Wait 500ms before triggering the next particle.
                        Citizen.Wait(500)
                    end
                end)
                Wait(3200)
                levelup_marker(false)
            end
        end
    end)
end)




levelUpNotify = function(message , status,level)
  SendNUIMessage({
    type = "levelUp",
    message = message,
    status = status,
    level = level,
  })
end

systemNotify = function(message , status)
  SendNUIMessage({
    type = "systemNotify",
    message = message,
    status = status,
  })
end

--

--- HEALTH REGENERATION
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveHealthRegen == true then 
            local ped = PlayerPedId()
            local nowhp = GetEntityHealth(ped)
            if nowhp < StartHPRegeneration + 100 then
                StartHealthRegenTimer = true
            end
            if StartHealthRegenTimer == true then

                Citizen.Wait(HealthRegenTime)
                SetEntityHealth(ped, nowhp + 1)

                if nowhp >= StopHPRegeneration + 100 then
                    StartHealthRegenTimer = false
                end
            end 
        else
            Citizen.Wait(1000)
        end
    end
end)
-- END

--- ARMOR REGENERATION
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveArmorRegen == true then 
            local ped = PlayerPedId()
            local nowarmor = GetPedArmour(ped)
            if nowarmor < StartArmorRegeneration then
                StartArmorRegenTimer = true
            end
            if StartArmorRegenTimer == true then

                Citizen.Wait(ArmorRegenTime)
                SetPedArmour(ped, nowarmor + 1)

                if nowarmor >= StopArmorRegeneration then
                    StartArmorRegenTimer = false
                end
            end 
        else
            Citizen.Wait(1000)
        end
    end
end)
-- END

--- CAR DRIVING SPEED
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if HaveA_DriveSpeed == true then
            local ped = PlayerPedId()
            if GetVehiclePedIsIn(ped, false) ~= 0 then
                if IsThisModelACar(GetEntityModel(GetVehiclePedIsIn(ped, false))) == 1 then
                    if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
                        if CarSpeedModified ~= true then
                            ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, false), AddCarSpeed)
                            CarSpeedModified = true
                        end
                    end
                end
            elseif GetVehiclePedIsIn(ped, false) == 0 then
                if CarSpeedModified == true then
                    ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, true), 0.0)
                    CarSpeedModified = false
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)
--- END

--- BOAT SPEED
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if HaveA_BoatSpeed == true then
            local ped = PlayerPedId()
            if GetVehiclePedIsIn(ped, false) ~= 0 then
                if IsThisModelABoat(GetEntityModel(GetVehiclePedIsIn(ped, false))) == 1 then
                    if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
                        if BoatSpeedModified ~= true then
                            ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, false), A_BoatSpeed)
                            BoatSpeedModified = true
                        end
                    end
                end
            elseif GetVehiclePedIsIn(ped, false) == 0 then
                if BoatSpeedModified == true then
                    ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, true), 0.0)
                    BoatSpeedModified = false
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)
--- END



function AddRunningSpeed(speed)
    local pedId = PlayerId()
    --print('addRunningspeed', speed,pedId)
    -- SetPedMoveRateOverride(pedId, speed)
    SetRunSprintMultiplierForPlayer(pedId, speed)
end

function A_SwimSpeed(speed)
    local pedId = PlayerId()

    SetSwimMultiplierForPlayer(pedId, tonumber(speed))
end

function AddUnderWater(underwater)
    local ped = PlayerPedId()
    --print('Add underwater time => ', underwater)
    SetPedMaxTimeUnderwater(ped, (tonumber(underwater) + .0))
end
--- END


--- MORE STAMINA
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1)


        if HaveA_SprintStTime == true then
            local ped = PlayerPedId()
            local pedId = PlayerId()
            local Stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(pedId))

            if IsPedSprinting(ped) then

                if Stamina < RestoreStaminaPoint then

                    RestoreStaminaPoint = RestoreStaminaPoint - 10.0
                    SetPlayerStamina(pedId, Stamina + (AddStamina + .0))

                end
            end
        end  
    end
end)
--- END



--- STAMINA RECOVERY
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(700)

        if HaveA_StaminaSavingTime == true then
            local ped = PlayerPedId()
            local pedId = PlayerId()
            local Stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(pedId))

            if not IsPedSprinting(ped) then

                if Stamina > RestoreStaminaPoint then
            
                    RestoreStaminaPoint = RestoreStaminaPoint + 10.0
                    SetPlayerStamina(pedId, Stamina + (A_StaminaSaving + .0))

                end
            end
        end  
    end
end)


-- update Side (ingame)
RegisterNetEvent('lab-skills:client:updateSkill', function(skillID)
    for indexSkills, valueSkills in pairs(Config.Skills) do
        if valueSkills.skill == skillID then
            for i, v in pairs(valueSkills.SkillEffects) do
                print('[ UPDATED ABILITIES ] ', i,v)
                if i == "A_HealthRegen" then 
                    if HaveHealthRegen == true then
                        ESX.TriggerServerCallback("lab-skills:getAbilities", function(data)
                            for k,v in pairs(data) do
                                if v.skill_nami == "A_HealthRegen" then

                                    if v.Start_Regeneration == nil then
                                        StartHPRegeneration = v.skillValue_1
                                    else
                                        StartHPRegeneration = v.Start_Regeneration
                                    end
                                    if v.Stop_Regeneration == nil then
                                        StopHPRegeneration = v.skillValue_2
                                    else
                                        StopHPRegeneration = v.Stop_Regeneration
                                    end
                                    if v.RegenerationSpeed == nil then
                                        HealthRegenTime = v.skillValue_3
                                    else
                                        HealthRegenTime = v.RegenerationSpeed * 1000
                                    end

                                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, StartHPRegeneration, StopHPRegeneration, HealthRegenTime)
                                end
                            end
                        end)
                    else
                        StartHPRegeneration = v.Start_Regeneration
                        StopHPRegeneration = v.Stop_Regeneration
                        HealthRegenTime = v.RegenerationSpeed * 1000

                        HaveHealthRegen = true
                        TriggerServerEvent('lab-skills:server:saveSkillValues', i, StartHPRegeneration, StopHPRegeneration, HealthRegenTime)
                    end
                end
                if i == "A_ArmorRegen" then 

                    if HaveArmorRegen == true then
                        ESX.TriggerServerCallback("lab-skills:getAbilities", function(data)
                            for k,v in pairs(data) do
                                if v.skill_nami == "A_ArmorRegen" then

                                    if v.Start_Regeneration == nil then
                                        StartArmorRegeneration = v.skillValue_1
                                    else
                                        StartArmorRegeneration = v.Start_Regeneration
                                    end
                                    if v.Stop_Regeneration == nil then
                                        StopArmorRegeneration = v.skillValue_2
                                    else
                                        StopArmorRegeneration = v.Stop_Regeneration
                                    end
                                    if v.RegenerationSpeed == nil then
                                        ArmorRegenTime = v.skillValue_3
                                    else
                                        ArmorRegenTime = v.RegenerationSpeed * 1000
                                    end

                                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, StartArmorRegeneration, StopArmorRegeneration, ArmorRegenTime)
                                end
                            end
                        end)
                    else
                        StartArmorRegeneration = v.Start_Regeneration
                        StopArmorRegeneration = v.Stop_Regeneration
                        ArmorRegenTime = v.RegenerationSpeed * 1000
                        HaveArmorRegen = true   
                        TriggerServerEvent('lab-skills:server:saveSkillValues', i, StartArmorRegeneration, StopArmorRegeneration, ArmorRegenTime)
                    end

                end
                if i == "A_Speed" then

                    AddRunningSpeed(v)
                    HaveA_Speed = true
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_SwimSpeed" then 

                    A_SwimSpeed(v)
                    HaveAddSwimSpeed = true
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_UnderwaterTime" then 
                    AddUnderWater(v)
                    HaveA_UnderwaterTime = true
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_DriveSpeed" then 

                    AddCarSpeed = v
                    HaveA_DriveSpeed = true
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_BoatSpeed" then 

                    A_BoatSpeed = v
                    HaveA_BoatSpeed = true 
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_SprintSt" then

                    HaveA_SprintStTime = true
                    AddStamina = v
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
                if i == "A_StaminaSaving" then

                    HaveA_StaminaSavingTime = true
                    A_StaminaSaving = v
                    TriggerServerEvent('lab-skills:server:saveSkillValues', i, v)

                end
            end
        end
    end
end)