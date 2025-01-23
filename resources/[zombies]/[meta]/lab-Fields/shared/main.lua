Config = {}

Config.BlipSize = 0.8 -- Size of the blips.

Config.PropOutline = true -- Enable if you want field props to be outlined when close.

-- Configure anything except: spawnedPlants, DrugPlantsA and DrugCoords. These shall never be touched!
Config.Fields = {
    {
        FieldCoords = vector3(3469.028564, 2587.872558, 15.457154),
        label = 'Tradescantia sauvage', 
        itemName = 'tradescantia', 
        amount = {Min = 1, Max = 5},
        jobs = false,
        neededJobs = false,
        DrugProp = 'prop_cs_plant_01',
        duration = 1000,
        animDict= 'random@domestic',
        anim = 'pickup_low',
        blip = true,
        blipSprite = 836,
        blipColour = 50,
        blipRadius = true,
        spawnedPlants = 0, DrugPlantsA = {}, DrugCoords = nil
    },
    {
        FieldCoords = vector3(2395.991210, 3060.421875, 48.151612),
        label = 'Ancienne ferraillerie',
        itemName = 'scrap_aluminium',
        amount = {Min = 1, Max = 3},
        jobs = false,
        neededJobs = false,
        DrugProp = 'prop_rub_scrap_06',
        duration = 1000,
        animDict= 'random@domestic',
        anim = 'pickup_low',
        blip = true,
        blipSprite = 467,
        blipColour = 39,
        blipRadius = true,
        spawnedPlants = 0, DrugPlantsA = {}, DrugCoords = nil
    },
}

-- Configure anything to your liking.
Config.Labs = {
    --[[{
        LabCoords = vector3(1391.84, 3605.88, 38.96),
        neededLabel = 'Tradescantia',
        givenLabel = 'Laboratoire abandonné',
        neededItem = 'tradescantia',
        neededAmount = 5,
        givenItem = 'morphine',
        givenAmount = {Min = 1, Max = 5},
        jobs = false,
        neededJobs = false,
        duration = 12000, 
        animDict= 'missmechanic',
        anim = 'work2_base',
        blip = true,
        blipSprite = 0,
        blipColour = 26,
        blipRadius = true
    },
    {
        LabCoords = vector3(2433.88, 4969.2, 42.36),
        neededLabel = 'Ferraille',
        givenLabel = 'Fonderie',
        neededItem = 'scrap_aluminium',
        neededAmount = 100,
        givenItem = 'aliminium_plate',
        givenAmount = {Min = 1, Max = 1},
        jobs = false,
        neededJobs = false,
        duration = 12000,
        animDict= 'missmechanic',
        anim = 'work2_base',
        blip = true,
        blipSprite = 0,
        blipColour = 26,
        blipRadius = true
    },]]--
}
