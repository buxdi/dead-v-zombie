Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                      = ESX.GetConfig().EnableDebug
Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 0  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus              = true -- Save Death Status?
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale = GetConvar('esx:locale', 'fr')

Config.DistressBlip = {
	Sprite = 310,
	Color = 48,
	Scale = 2.0
}

Config.EarlyRespawnTimer          = 45000 * 1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 60 -- time til the player bleeds out

Config.EnablePlayerManagement     = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 0

Config.OxInventory                = ESX.GetConfig().OxInventory
Config.RespawnPoints = {
	{coords = vector3(286.074738, -1350.672486, 24.528198), heading = 317.480316}, -- LS Funerarium
	--{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06} -- Sandy Shores
}

Config.PharmacyItems = {
	--[[{
		title = "Medikit",
		item = "medikit"
	},
	{
		title = "Bandage",
		item = "bandage"
	},]]--
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {},

		AmbulanceActions = {
			--vector3(270.5, -1363.0, 23.5)
		},

		Pharmacies = {
			--vector3(230.1, -1366.1, 38.5)
		},

		Vehicles = {
			--[[{
				Spawner = vector3(307.7, -1433.4, 30.0),
				InsideShop = vector4(452.3055, -1360.1731, 43.5538, 319.1165),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(297.2, -1429.5, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(294.0, -1433.1, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}]]--
		},

		Helicopters = {
			--[[{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector4(343.7769, -1423.0913, 76.1742, 322.8178),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0},
					{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}]]--
		},

		FastTravels = {
			{
				From = vector3(275.894500, -1361.498902, 24.528198), -- LS Funerarium
				To = {coords = vector3(342.276916, -1397.723022, 31.498168), heading = 45.354328},
				Marker = {type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(343.793396, -1398.843994, 32.498168),
				To = {coords = vector3(273.824188, -1359.982422, 23.528198), heading = 45.354328},
				Marker = {type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {}

	}
}

Config.AuthorizedVehicles = {
	car = {
		--[[ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}]]--
	},

	helicopter = {
		ambulance = {},

		doctor = {
			--{model = 'buzzard2', price = 150000}
		},

		chief_doctor = {
			--{model = 'buzzard2', price = 150000},
			--{model = 'seasparrow', price = 300000}
		},

		boss = {
			--{model = 'buzzard2', price = 10000},
			--{model = 'seasparrow', price = 250000}
		}
	}
}
