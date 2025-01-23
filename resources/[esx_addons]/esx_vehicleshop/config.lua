Config                            = {}
Config.DrawDistance               = 10
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 0

Config.Locale = GetConvar('esx:locale', 'fr')

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.OxInventory = ESX.GetConfig().OxInventory

Config.Blip = {
	show = true,
	Sprite = 326,
	Display = 4,
	Scale = 0.8
}

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(312.6, -1363.5, 30.9),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	ShopInside = {
		Pos     = vector3(305.1, -1368.0, 31.8),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 138.8,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(267.1, -1446.4, 29.1),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 232.4,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(0,0,0),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(0,0,0),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = vector3(0,0,0),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = -1
	}

}
