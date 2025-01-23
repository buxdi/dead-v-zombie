Config = {}
Config.Locale = 'fr'

Config.HealingTimer = 45 -- Time in seconds
Config.ReceptionPos = vector3(281.103302, -1340.360474, 24.528198)
Config.Price = 0
Config.Society = "society_ambulance"


Config.Beds = {
    {
        Loc = vec3(284.083526, -1338.606568, 24.572876),
        OffSet = vector3(0.0, 0.0, 0.9),
        Heading = 325.984252
    }
}

Config.DoctorPos = vector3(282.672516, -1335.626342, 24.528198)

-- For now TaskGoToCoord does not work in the interiors, not sure why, I will be testing it in the future
Config.CheckPoints = {
    vec3(283.147248, -1338.474732, 24.528198)
}