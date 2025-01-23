Config = {}
Config.DrawDistance = 100.0
Config.IsMoneyDirtyMoney = false -- If true, the money you get from treasure crates will be given in dirty money. If false, the player will get normal cash money.
Config.ContainerModel = "prop_box_wood05a" -- Crate model.
Config.ShowBlips = true -- If true crate blips are shown on the map.
Config.OnePersonOpen = true -- If true, a crate that was once open can't be opened again by anybody (1 use). If false, the crate can be opened once by everybody (1 use/person).
Config.MarkerCircle = -1 -- Marker type. Set to 1 if you want the marker visible or to -1 if you want it invisible

Config.Treasure = {
    Treasure1 = {
        Name = "Weapon crafter crate", -- Each crate must have a unique name
        Pos = {x = 3511.36, y = 2538.47, z = 7.53}, -- Position on the map
        Size = {x = 3.0, y = 3.0, z = 1.0}, -- Marker size (even if invisible)
        Color = {r = 204, g = 204, b = 0}, -- Maker color
        Type = Config.MarkerCircle, -- Marker type. defined above
        Money = 500, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'weaponparts', -- Item name (make sure to use the name from the DB)
                Amount = 100 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'bandage', -- The item's name
                Amount = 4 -- The amount
            },
            Item3 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 3 -- The amount
            },
            Item4 = { -- Another item
                Name = 'burger', -- The item's name
                Amount = 3 -- The amount
            },
            Item5 = { -- Another item
                Name = 'scrapmetal', -- The item's name
                Amount = 50 -- The amount
            }

        },
        Weapons = { -- Array of weapons given
        }
    },
    -- If you don't want the crate to give items or weapons, just leave the Items and Weapons array empty
    -- If you don't want the crate to give money, set the money to 0, DON'T GO INTO NEGATIVE
    -- See examples below

    Treasure2 = {
        Name = "Survivor crate",
        Pos = {x = 3299.19, y = 5202.89, z = 17.17},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 0, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Another item
                Name = 'medikit', -- The item's name
                Amount = 5 -- The amount
            },
            Item2 = { -- Another item
                Name = 'armour', -- The item's name
                Amount = 1 -- The amount
            },
            Item3 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 10 -- The amount
            },
            Item4 = { -- Another item
                Name = 'burger', -- The item's name
                Amount = 10 -- The amount
            },
            Weapon1 = { -- Weapon
                Name = 'weapon_knife', -- The weapon's name (can be found in es_extended/config.weapons.lua)
                Ammo = 1 -- Amount of ammo
            }
        },
        Weapons = { -- Array of weapons given
        }
    },

    Treasure3 = {
        Name = "Pistol crate",
        Pos = {x = 1443.29, y = 6333.99, z = 22.89},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 0, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Another item
                Name = 'bandage', -- The item's name
                Amount = 6 -- The amount
            },
            Item2 = { -- Another item
                Name = 'ammo-9', -- The item's name
                Amount = 45 -- The amount
            },
            Item3 = { -- Another item
                Name = 'cubancigar', -- The item's name
                Amount = 4 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
            Weapon1 = { -- Weapon
                Name = 'weapon_snspistol', -- The weapon's name (can be found in es_extended/config.weapons.lua)
                Ammo = 1 -- Amount of ammo
            }
        }
    },

    Treasure4 = {
        Name = "Man of the woods crate",
        Pos = {x = -575.88, y = 5953.77, z = 21.89},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 500, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'radio', -- Item name (make sure to use the name from the DB)
                Amount = 2 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'bandage', -- The item's name
                Amount = 6 -- The amount
            },
            Item3 = { -- Another item
                Name = 'medikit', -- The item's name
                Amount = 1 -- The amount
            },
            Item4 = { -- Another item
                Name = 'cubancigar', -- The item's name
                Amount = 8 -- The amount
            },
            Item5 = { -- Another item
                Name = 'gas', -- The item's name
                Amount = 4 -- The amount
            },
            Item6 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 6 -- The amount
            },
            Item7 = { -- Another item
                Name = 'burger', -- The item's name
                Amount = 6 -- The amount
            },
            Item8 = { -- Another item
                Name = 'scrap_aluminium', -- The item's name
                Amount = 50 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
        }
    },

    Treasure5 = {
        Name = "Pharmacie crate",
        Pos = {x = -767.10, y = 4335.09, z = 147.21},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 0, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'multivitamins', -- Item name (make sure to use the name from the DB)
                Amount = 4 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'diatabs', -- The item's name
                Amount = 2 -- The amount
            },
            Item3 = { -- Another item
                Name = 'acetaminophen', -- The item's name
                Amount = 2 -- The amount
            },
            Item4 = { -- Another item
                Name = 'antihistamine', -- The item's name
                Amount = 2 -- The amount
            },
            Item5 = { -- Another item
                Name = 'ambroxol', -- The item's name
                Amount = 2 -- The amount
            },
            Item6 = { -- Another item
                Name = 'baraclude', -- The item's name
                Amount = 2 -- The amount
            },
            Item7 = { -- Another item
                Name = 'metronidazole', -- The item's name
                Amount = 2 -- The amount
            },
            Item8 = { -- Another item
                Name = 'molnupiravir', -- The item's name
                Amount = 2 -- The amount
            },
            Item9 = { -- Another item
                Name = 'medikit', -- The item's name
                Amount = 2 -- The amount
            },
            Item10 = { -- Another item
                Name = 'ambroxol', -- The item's name
                Amount = 2 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
        }
    },

    Treasure6 = {
        Name = "Gun powder crate",
        Pos = {x = 246.25, y = 370.13, z = 104.80},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 500, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'weaponparts', -- Item name (make sure to use the name from the DB)
                Amount = 30 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'medikit', -- The item's name
                Amount = 2 -- The amount
            },
            Item3 = { -- Another item
                Name = 'gunpowder', -- The item's name
                Amount = 200 -- The amount
            },
            Item4 = { -- Another item
                Name = 'copper', -- The item's name
                Amount = 100 -- The amount
            },
            Item5 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 6 -- The amount
            },
            Item6 = { -- Another item
                Name = 'burger', -- The item's name
                Amount = 6 -- The amount
            },
            Item7 = { -- Another item
                Name = 'bandage', -- The item's name
                Amount = 6 -- The amount
            },
            Item8 = { -- Another item
                Name = 'ammo-9', -- The item's name
                Amount = 40 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
            Weapon1 = { -- Weapon
                Name = 'weapon_wrench', -- The weapon's name (can be found in es_extended/config.weapons.lua)
                Ammo = 1 -- Amount of ammo
            }
        }
    },

    Treasure7 = {
        Name = "Boat crate",
        Pos = {x = 1235.09, y = -2918.19, z = 28.75},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 500, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'lockpick', -- Item name (make sure to use the name from the DB)
                Amount = 5 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'paperbag', -- The item's name
                Amount = 2 -- The amount
            },
            Item3 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 10 -- The amount
            },
            Item4 = { -- Another item
                Name = 'burger', -- The item's name
                Amount = 10 -- The amount
            },
            Item5 = { -- Another item
                Name = 'ammo-9', -- The item's name
                Amount = 25 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
            Weapon1 = { -- Weapon
                Name = 'weapon_combatpistol', -- The weapon's name (can be found in es_extended/config.weapons.lua)
                Ammo = 1 -- Amount of ammo
            }
        }
    },

    Treasure8 = {
        Name = "Weed dealer's crate",
        Pos = {x = -1165.29, y = -1566.74, z = 3.51},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type = Config.MarkerCircle,
        Money = 1000, -- Money given
        Items = { -- Array of items given
            Item1 = { -- Item
                Name = 'weaponparts', -- Item name (make sure to use the name from the DB)
                Amount = 20 -- How many of this item you want to give
            },
            Item2 = { -- Another item
                Name = 'medikit', -- The item's name
                Amount = 3 -- The amount
            },
            Item3 = { -- Another item
                Name = 'diamond', -- The item's name
                Amount = 2 -- The amount
            },
            Item4 = { -- Another item
                Name = 'gold', -- The item's name
                Amount = 4 -- The amount
            },
            Item5 = { -- Another item
                Name = 'water', -- The item's name
                Amount = 10 -- The amount
            },
            Item6 = { -- Another item
                Name = 'bread', -- The item's name
                Amount = 10 -- The amount
            }
        },
        Weapons = { -- Array of weapons given
            Weapon1 = { -- Weapon
                Name = 'weapon_crowbar', -- The weapon's name (can be found in es_extended/config.weapons.lua)
                Ammo = 2 -- Amount of ammo
            }
        }
    }
}
