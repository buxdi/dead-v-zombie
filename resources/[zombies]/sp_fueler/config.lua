Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

	PetrolFarm = {
		Pos   = {x = 696.413, y = 2889.107, z = 49.0},
		Size  = {x = 15.5, y = 15.5, z = 4.5},
		Color = {r = 0, g = 0, b = 0},
		Name  = "Oil harvest",
		Type  = 1
	},


	TraitementPetrol = {
		Pos   = {x = 2746.750, y = 1653.339, z = 23.0},
		Size  = {x = 15.5, y = 15.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Oil processing",
		Type  = 1
	},

	TraitementRaffin = {
		Pos   = {x = 2765.624, y = 1709.929, z = 23.0},
		Size  = {x = 15.5, y = 15.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Refined petroleum processing",
		Type  = 1
	},
	
	SellFarm = {
		Pos   = {x = 664.81, y = 271.69, z = 101.70},
		Size  = {x = 10.0, y = 10.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Sale of products",
		Type  = 1
	},

	FuelerActions = {
		Pos   = {x = 2890.645, y = 4391.536, z = 49.4},
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Action point",
		Type  = 27
	 },
	  
	VehicleSpawner = {
		Pos   = {x = 2899.537, y = 4398.668, z = 49.4},
		Size = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Garage véhicule",
		Type  = 27
	},

	VehicleSpawnPoint = {
		Pos   = {x = 2899.626, y = 4382.079, z = 49.5},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 2909.202, y = 4365.562, z = 49.4},
		Size  = {x = 5.0, y = 5.0, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Name  = "Store your vehicle",
		Type  = 27
	}

}

