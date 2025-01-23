function CreatePeds()
    Wait(1000)
    local npc = exports['rep-talkNPC']:CreateNPC({
        npc = 'mp_m_avongoon',
        coords = vec4(340.4, -1390.9, 31.5, 161.5),
        name = 'Peter',
        animName = "mini@strip_club@idles@bouncer@base",
        animDist = "base",
        tag = "Tuto",
        color = "blue.7",
        startMSG = 'Salut à toi survivant ! bienvenue dans ce monde post-apocalyptique infesté de zombies ! Prêt à apprendre comment survivre ?'
    }, {
        [1] = {
            label = "Salut ! Ouais, je suis prêt. Par où commencer ?",
            shouldClose = false,
            action = function()
                animDist = "base",
                exports['rep-talkNPC']:updateMessage("Dans les zones sûres, tu découvriras différents établis pour forger ton matos de survie face aux zombies. Mais attention, les matières premières se font rares, donc il va falloir jouer les explorateurs et les dénicher par toi-même. Garde l\'œil ouvert, c\'est la survie ! 🧟‍♂️🛠️")
            end
        },
        [2] = {
            label = "Caches abandonnées en ville.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("Dans la ville, tu trouveras des caches abandonnées contenant des objets utiles. Explore les rues et les bâtiments pour dénicher ces caches. Elles peuvent renfermer des équipements précieux, des fournitures médicales et bien plus encore. Sois attentif aux signes indiquant la présence d\'une cache et assure-toi de fouiller chaque coin pour maximiser tes chances de trouver des objets utiles. Bonne chasse aux trésors, survivant ! 🗺️🔍🧟‍♂️")
            end
        },
        [3] = {
            label = "L'importance des sacs achetables en zones sûres.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("Pour éviter de perdre tout ton équipement en cas de problème, pense à acheter un sac en zone sûre. Ces sacs restent sur place même si tu te fais attaquer par des zombies. Si tu meurs, tu pourras retourner chercher ton sac pour récupérer tes affaires. Assure-toi d\'investir dans un sac solide pour sécuriser tes biens. Bonne chance dans ta quête de survie ! 🎒🔒🧟‍♂️")
            end
        },
        [4] = {
            label = "Comment me soigner en cas d'attaque de zombies ?",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("Lorsque les zombies te touchent, ton stress augmentera et ton système immunitaire sera mis à rude épreuve. Voici ce que tu peux faire :\n\n1. **Gérer le stress :** Prends régulièrement des pauses pour fumer et réduire ton stress. Cela te permettra de rester concentré et de faire face aux défis.\n\n2. **Système immunitaire :** En cas de baisse du système immunitaire, assure-toi d\'avoir de l\'antidote sur toi. Utilise-le rapidement pour contrer les effets néfastes et maintenir ta santé. Explore les zones pour trouver des ingrédients essentiels à la fabrication d\'antidotes, comme la plante tradescandia sauvage. Tu peux également te rendre à l\'hôpital où un docteur peut te soigner. Bonne chance, et n\'oublie pas que la survie dépend de ta capacité à gérer ton stress et à maintenir ta santé au top. 🧟‍♂️💊🚬")
            end
        },
        [5] = {
            label = "La recherche d'aluminium.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("L\'aluminium est la base pour la fabrication d\'armes. Tu ne le trouveras qu\'à l\'ancienne féraille. Explore cet endroit stratégique pour collecter l\'aluminium nécessaire à la création d\'armes. Bonne chasse aux ressources, survivant ! 🔧🏭🧟‍♂️")
            end
        },
        [6] = {
            label = "La récolte de tradescandia sauvage.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("La tradescandia sauvage est une plante rare et essentielle pour la fabrication d\'antidotes. Cherche cette plante en quantité dans les zones de tradescandia sauvage. Une fois que tu as suffisamment de tradescandia, dirige-toi vers un établi pour créer des antidotes et maintenir ton système immunitaire au top. Bonne récolte, explorateur ! 🌿💊🧟‍♂️")
            end
        },
        [7] = {
            label = "Le docteur à l'hôpital.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:updateMessage("À l\'hôpital, tu trouveras un docteur qui peut te soigner. Si tu es blessé, n\'hésite pas à consulter le docteur pour retrouver la forme. Les soins médicaux peuvent faire la différence entre la vie et la mort dans ce monde infesté de zombies. Bonne santé, survivant ! 🏥💉🧟‍♂️")
            end
        },
        [8] = {
            label = "Partir",
            shouldClose = true,
            action = function()
                TriggerEvent('rep-talkNPC:client:close')
            end
        }
    })
end

CreatePeds()


-- below is what we used in the featured video for our sanitation job
-- function CreatePeds()
--         Boss = exports['rep-talkNPC']:CreateNPC({
--             npc = 's_m_y_garbage',
--             coords = vector3(Config.BossLocation.x, Config.BossLocation.y, Config.BossLocation.z - 1.0),
--             heading = Config.BossLocation.w,
--             name = 'Brook Stream',
--             animScenario = 'WORLD_HUMAN_CLIPBOARD',
--             position = "Environmental Worker",
--             color = "#00736F",
--             startMSG = 'Hello, how can I assist you?'
--         }, {
--             [1] = {
--                 label = "How does this job work?",
--                 shouldClose = false,
--                 action = function()
--                     exports['rep-talkNPC']:changeDialog({
--                         label = "Hello, are you new here? I will guide you! \n \n First, you need to have a tablet. Then take the job here. \n \n You can work faster with your homies. You guys can go up to 4 people and will have to go to 2 districts in the city in one trip. \n \n Oh, a tip is that the food from Cafe Meow Uwu will help you stay alert to achieve better work efficiency.",
--                         shouldClose = false,
--                         elements = {
--                             [1] = {
--                                 label = "I want to start working",
--                                 shouldClose = false,
--                                 action = function()
--                                     if onDuty == false then
--                                         if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "sani" then
--                                             exports['rep-talkNPC']:updateMessage(
--                                                 "Now turn on your tablet to find or create a group for yourself!")
--                                             Wait(1000)
--                                             TriggerEvent('rep-talkNPC:client:close')
--                                             TriggerEvent('rep-sanitation:client:duty')
--                                         else
--                                             Notification(Config.Lang['error_ownjob'].label,
--                                                 Config.Lang['error_ownjob'].type, Config.Lang['error_ownjob'].time)
--                                         end
--                                     else
--                                         exports['rep-talkNPC']:updateMessage("You already have this job")
--                                     end
--                                 end
--                             },
--                             [2] = {
--                                 label = "Oh, it doesn't seem to suit me",
--                                 shouldClose = true,
--                                 action = function()
--                                 end
--                             }
--                         }
--                     })
--                 end
--             },
--             [2] = {
--                 label = "I want to take/quit the job",
--                 shouldClose = false,
--                 action = function()
--                     if onDuty == true then
--                         exports['rep-talkNPC']:updateMessage("It's sad to say goodbye to you")
--                         Wait(2000)
--                         TriggerEvent('rep-sanitation:client:offduty')
--                         TriggerEvent('rep-talkNPC:client:close')
--                     else
--                         if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "sani" then
--                             exports['rep-talkNPC']:updateMessage(
--                                 "Now turn on your tablet to find or create a group for yourself!")
--                             Wait(2000)
--                             TriggerEvent('rep-talkNPC:client:close')
--                             TriggerEvent('rep-sanitation:client:duty')
--                         else
--                             Notification(Config.Lang['error_ownjob'].label, Config.Lang['error_ownjob'].type,
--                                 Config.Lang['error_ownjob'].time)
--                         end
--                     end
--                 end
--             },
--             [3] = {
--                 label = "I want to exchange recyclable materials",
--                 shouldClose = true,
--                 action = function()
--                     TriggerEvent('rep-sanitation:client:tranfer')
--                 end
--             },
--             [4] = {
--                 label = "I'm just passing by",
--                 shouldClose = true,
--                 action = function()
--                 end
--             }
--         })
-- end
