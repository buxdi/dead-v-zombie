Crafting = {
    Command = 'craftweapon',
    CommandShow = 'showCrafting',
    CommandGive = 'givecraftingxp',
    PermissionCommand = {'admin'},
    PropBench = 'gr_prop_gr_bench_03b',
    EnableDebug = false,
    XpSystem = true,
    ExperiancePerCraft = 1,
    Weapon = {
        ["v_ret_gc_ammo5"] = {
            itemCode = 'ammo-9',
            itemName = 'Munition 9mm',
            requiredJob = false,
            requiredXp = 3,
            requiredTime = 15000,
            weapon = false,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Cuivre', itemName = "copper", quantity = 5},
                {label = 'Poudre noire', itemName = "gunpowder", quantity = 10}
            }
        },
        ["v_ret_gc_ammo4"] = {
            itemCode = 'ammo-rifle',
            itemName = 'Munition 7.2mm',
            requiredJob = false,
            requiredXp = 3,
            requiredTime = 15000,
            weapon = false,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Cuivre', itemName = "copper", quantity = 8},
                {label = 'Poudre noire', itemName = "gunpowder", quantity = 13}
            }
        },
        ["v_ret_gc_ammo3"] = {
            itemCode = 'ammo-shotgun',
            itemName = 'Munition c.12',
            requiredJob = false,
            requiredXp = 3,
            requiredTime = 15000,
            weapon = false,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Ferraille', itemName = "scrapmetal", quantity = 6},
                {label = 'Poudre noire', itemName = "gunpowder", quantity = 12}
            }
        },
        ["w_pi_pistol"] = {
            itemCode = 'WEAPON_PISTOL',
            itemName = 'Pistol',
            requiredJob = false,
            requiredXp = 10,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 5},
                {label = 'Fer', itemName = "iron", quantity = 10},
                {label = 'Ressort', itemName = "spring", quantity = 10},
                {label = 'clou', itemName = "screw", quantity = 10},
            }
        },
        ["w_ar_assaultrifle"] = {
            itemCode = 'weapon_assaultrifle',
            itemName = 'AK-47',
            requiredJob = false,
            requiredXp = 30,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 100},
                {label = 'Aluminium', itemName = "scrap_aluminium", quantity = 30},
                {label = 'Cuivre', itemName = "copper", quantity = 30},
                {label = 'Fer', itemName = "iron", quantity = 30},
                {label = 'Ressort', itemName = "spring", quantity = 10},
                {label = 'clou', itemName = "screw", quantity = 20},
                {label = 'Chutes de bois', itemName = "wood_scrap", quantity = 20},
            }
        },
        ["w_me_hatchet"] = {
            itemCode = 'WEAPON_HATCHET',
            itemName = 'Hache',
            requiredJob = false,
            requiredXp = 1,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Fer', itemName = "iron", quantity = 5},
                {label = 'clou', itemName = "screw", quantity = 4},
                {label = 'Chutes de bois', itemName = "wood_scrap", quantity = 3},
            }
        },
        ["prop_ld_w_me_machette"] = {
            itemCode = 'WEAPON_MACHETE',
            itemName = 'Machette',
            requiredJob = false,
            requiredXp = 2,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Fer', itemName = "iron", quantity = 8},
                {label = 'clou', itemName = "screw", quantity = 4},
                {label = 'Chutes de bois', itemName = "wood_scrap", quantity = 1},
            }
        },
        ["w_me_hammer"] = {
            itemCode = 'WEAPON_HAMMER',
            itemName = 'Marteau',
            requiredJob = false,
            requiredXp = 0,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Fer', itemName = "iron", quantity = 2},
                {label = 'clou', itemName = "screw", quantity = 1},
                {label = 'Chutes de bois', itemName = "wood_scrap", quantity = 2},
            }
        },
        ["w_ex_molotov"] = {
            itemCode = 'WEAPON_MOLOTOV',
            itemName = 'Molotov',
            requiredJob = false,
            requiredXp = 25,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Essence', itemName = "gas", quantity = 10},
            }
        },
        ["w_sg_sawnoff"] = {
            itemCode = 'WEAPON_SAWNOFFSHOTGUN',
            itemName = 'Cannon scie',
            requiredJob = false,
            requiredXp = 25,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 30},
                {label = 'Aluminium', itemName = "scrap_aluminium", quantity = 10},
                {label = 'Fer', itemName = "iron", quantity = 10},
                {label = 'Ressort', itemName = "spring", quantity = 10},
                {label = 'clou', itemName = "screw", quantity = 10},
            }
        },
        ["w_sb_microsmg"] = {
            itemCode = 'WEAPON_MICROSMG',
            itemName = 'Mac-10',
            requiredJob = false,
            requiredXp = 25,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 30},
                {label = 'Aluminium', itemName = "scrap_aluminium", quantity = 10},
                {label = 'Fer', itemName = "iron", quantity = 10},
                {label = 'Ressort', itemName = "spring", quantity = 10},
                {label = 'clou', itemName = "screw", quantity = 10},
            }
        },
        ["prop_bomb_01_s"] = {
            itemCode = 'WEAPON_STICKYBOMB',
            itemName = 'C-4',
            requiredJob = false,
            requiredXp = 25,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 5},
                {label = 'Aluminium', itemName = "scrap_aluminium", quantity = 30},
                {label = 'Poudre noire', itemName = "gunpowder", quantity = 200},
            }
        },
        ["hei_prop_heist_drill"] = {
            itemCode = 'drill',
            itemName = 'Foreuse',
            requiredJob = false,
            requiredXp = 25,
            requiredTime = 15000,
            weapon = true,
            allowlistJob = {},
            ItemRequired = {
                {label = 'Pièce-détachée', itemName = "weaponparts", quantity = 3},
                {label = 'Feraille', itemName = "scrap_metal", quantity = 20},
                {label = 'Fer', itemName = "iron", quantity = 20},
                {label = 'Ressort', itemName = "spring", quantity = 20},
                {label = 'Clou', itemName = "screw", quantity = 20},
            }
        },
    }
}