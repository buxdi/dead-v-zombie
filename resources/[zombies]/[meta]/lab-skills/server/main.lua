ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('lab-skills:server:getOwnSkills', function (source,cb)
    local ply = ESX.GetPlayerFromId(source)
    local data = ExecuteSql("SELECT * FROM `users` WHERE `identifier` = '"..ply.identifier.."'")
    data = data[1]
    if json.decode(data.ownedskills) == nil then
        data.ownedskills = {}
    else
        data.ownedskills = json.decode(data.ownedskills)
    end
    cb(data.ownedskills, getPlayerFirstName(source), getPlayerLastName(source))
end)


getPlayerFirstName = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local firstname = ExecuteSql("SELECT firstname FROM users WHERE identifier = '"..xPlayer.identifier.."'")
    return firstname[1].firstname
end

getPlayerLastName = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local lastname = ExecuteSql("SELECT lastname FROM users WHERE identifier = '"..xPlayer.identifier.."'")
    return lastname[1].lastname
end


ESX.RegisterServerCallback('lab-skills:server:getAllSkills', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)

    data = ExecuteSql("SELECT * FROM lab_skills WHERE identifier = '"..Player.identifier.."'")
    cb(data)
end)

ESX.RegisterServerCallback('lab-skills:server:getSkillsInfo', function (source,cb)
    local Player =ESX.GetPlayerFromId(source)
    local info = ExecuteSql("SELECT `skillsinfo` FROM `users` WHERE `identifier` = '"..Player.identifier.."'")
    --print(info)
    if info ~= nil then
        --print(json.decode(info[1].skillsinfo) ~= nil)
        if json.decode(info[1].skillsinfo) ~= nil then
            cb(json.decode(info[1].skillsinfo))
        else
            --print("Setting new xp")
            TriggerEvent('lab-skills:server:createSkillInfo', source)
        end
    else
        --print('[LAB-SKILLS] Import to sql file!')
    end   
end)


RegisterServerEvent('lab-skills:server:createSkillInfo')
AddEventHandler('lab-skills:server:createSkillInfo', function(source)
    local Player = ESX.GetPlayerFromId(source)
    info = {}
    info.skillpoints = 1
    info.skillxp = 0
    info.lastxp = 100
    info.currentlevel = 0
    ExecuteSql("UPDATE users SET skillsinfo='"..json.encode(info).."'WHERE identifier = '"..Player.identifier.."'")
end)



RegisterNetEvent('lab-skills:server:updateSkills', function (skillID, newPoint)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    
    local data = ExecuteSql("SELECT `ownedskills` FROM users WHERE identifier = '"..Player.identifier.."'")

    local ownedskills = json.decode(data[1].ownedskills)

    if ownedskills == nil then
        ownedskills = {}
    end
    --print('Owned save skills => ',ownedskills)
    for _,v in pairs(ownedskills) do
        if v == skillID then
            return;
        end
    end

    table.insert(ownedskills, skillID)

    ExecuteSql("UPDATE `users` SET ownedskills = '"..json.encode(ownedskills).."' WHERE `identifier` = '"..Player.identifier.."'")
    TriggerEvent('lab-skills:server:removePoint',newPoint, Player.identifier)
end)


RegisterNetEvent('lab-skills:server:removePoint', function(pointAmount,cid)
    --print('removePoint =>', pointAmount,cid)
    local info = ExecuteSql("SELECT skillsinfo FROM users WHERE identifier = '"..cid.."'")
    if info ~= nil then
        if json.decode(info[1].skillsinfo) ~= nil then
            info = json.decode(info[1].skillsinfo)
        else
            info = {}
        end
    else
        info = {}
    end   
    --print('uptaded point =>',info.skillpoints - pointAmount, info.skillpoints , pointAmount)
    info.skillpoints = info.skillpoints - pointAmount
    ExecuteSql("UPDATE users SET skillsinfo = '"..json.encode(info).."' WHERE identifier = '"..cid.."'")
end)

RegisterNetEvent('lab-skills:server:saveSkillValues', function(skillID, skillValue_1, skillValue_2, skillValue_3)
    --print('[ saveSkillValues ]', skillID, skillValue_1, skillValue_2, skillValue_3)
    local src = source
    local Player =ESX.GetPlayerFromId(src)

    local Have = false
    local id = nil

    if skillValue_1 == nil then
        skillValue_1 = 0
    end
    if skillValue_2 == nil then
        skillValue_2 = 0
    end
    if skillValue_3 == nil then
        skillValue_3 = 0
    end 

    local data = ExecuteSql("SELECT * FROM lab_skills WHERE identifier = '"..Player.identifier.."'")

    if data ~= nil then
        for k,v in pairs(data) do
            if v.skill_name == skillID then
                Have = true
                ExecuteSql("UPDATE `lab_skills` SET skillValue_1 = '"..skillValue_1.."', skillValue_2 = '"..skillValue_2.."', skillValue_3 = '"..skillValue_3.."' WHERE `id` = '"..v.id.."'")
            end
        end
    end
    if Have == false then
        ExecuteSql("INSERT INTO `lab_skills` (`identifier`, `skill_name`, `skillValue_1`, `skillValue_2`, `skillValue_3`) VALUES ('"..Player.identifier.."','"..skillID.."','"..skillValue_1.."','"..skillValue_2.."','"..skillValue_3.."')")
    end
end)

RegisterNetEvent('lab-skill:server:earnXP', function(amount)
    local src  = source
    local Player = ESX.GetPlayerFromId(src)
    if Player then
        local info = ExecuteSql("SELECT skillsinfo FROM users WHERE identifier = '"..Player.identifier.."'")
        if info ~= nil then
            if json.decode(info[1].skillsinfo) ~= nil then
                info = json.decode(info[1].skillsinfo)
            else
                info = {}
            end
        else
            info = {}
        end   
        info.skillxp = info.skillxp + amount
        ExecuteSql("UPDATE users SET skillsinfo='"..json.encode(info).."' WHERE identifier = '"..Player.identifier.."'")
        TriggerClientEvent('lab-skill:client:updateXP', src, amount)
    end
end)



RegisterServerEvent('lab-skills:server:uptadeCurrentInfo', function(currentlevel, lastxp, skillpoints)
    local Player =ESX.GetPlayerFromId(source)
        
    local info = ExecuteSql("SELECT skillsinfo FROM users WHERE identifier = '"..Player.identifier.."'")
    if info ~= nil then
        if json.decode(info[1].skillsinfo) ~= nil then
            info = json.decode(info[1].skillsinfo)
        else
            info = {}
        end
    else
        info = {}
    end   
    info.currentlevel = currentlevel
    info.lastxp = lastxp
    info.skillpoints = info.skillpoints + skillpoints
    ExecuteSql("UPDATE users SET skillsinfo='"..json.encode(info).."' WHERE identifier = '"..Player.identifier.."'")
end)