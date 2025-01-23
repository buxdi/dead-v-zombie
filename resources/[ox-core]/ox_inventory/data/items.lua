return {
    ['testburger'] = {
        label = 'Test Burger',
        weight = 220,
        degrade = 60,
        client = {
            status = {hunger = 200000},
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            export = 'ox_inventory_examples.testburger'
        },
        server = {
            export = 'ox_inventory_examples.testburger',
            test = 'what an amazingly delicious burger, amirite?'
        },
        buttons = {
            {
                label = 'Lick it',
                action = function(slot)
                    print('You licked the burger')
                end
            }, {
                label = 'Squeeze it',
                action = function(slot)
                    print('You squeezed the burger :(')
                end
            }, {
                label = 'What do you call a vegan burger?',
                group = 'Hamburger Puns',
                action = function(slot) print('A misteak.') end
            }, {
                label = 'What do frogs like to eat with their hamburgers?',
                group = 'Hamburger Puns',
                action = function(slot) print('French flies.') end
            }, {
                label = 'Why were the burger and fries running?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('Because they\'re fast food.')
                end
            }
        },
        consume = 0.3
    },

    ['bandage'] = {
        label = 'Bandage',
        weight = 115,
        client = {
            anim = {
                dict = 'missheistdockssetup1clipboard@idle_a',
                clip = 'idle_a',
                flag = 49
            },
            prop = {
                model = 'prop_rolled_sock_02',
                pos = vec3(-0.14, -0.14, -0.08),
                rot = vec3(-50.0, -50.0, 0.0)
            },
            disable = {move = true, car = true, combat = true},
            usetime = 2500
        }
    },

    ['black_money'] = {label = 'Dirty Money'},

    ['burger'] = {
        label = 'Hamburger',
        weight = 10,
        client = {
            status = {hunger = 1000000},
            anim = 'eating',
            prop = 'burger',
            usetime = 2500
        }
    },

    ['cola'] = {
        label = 'eCola',
        weight = 350,
        client = {
            status = {thirst = 1000000},
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {
                model = 'prop_ecola_can',
                pos = vec3(0.01, 0.01, 0.06),
                rot = vec3(5.0, 5.0, -180.5)
            },
            usetime = 2500,
            notification = 'You quenched your thirst with cola'
        }
    },

    ['parachute'] = {
        label = 'Parachute',
        weight = 8000,
        stack = false,
        client = {
            anim = {dict = 'clothingshirt', clip = 'try_shirt_positive_d'},
            usetime = 1500
        }
    },

    ['garbage'] = {label = 'Garbage'},

    ['paperbag'] = {
        label = 'Paper Bag',
        weight = 1,
        stack = false,
        close = false,
        consume = 0
    },

    ['identification'] = {label = 'Identification'},

    ['panties'] = {
        label = 'Knickers',
        weight = 10,
        consume = 0,
        client = {
            status = {thirst = -100000, stress = -25000},
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {
                model = 'prop_cs_panties_02',
                pos = vec3(0.03, 0.0, 0.02),
                rot = vec3(0.0, -13.5, -1.5)
            },
            usetime = 2500
        }
    },

    ['lockpick'] = {label = 'Lockpick', weight = 160},

    ['phone'] = {
        label = 'Telephone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function()
                        return exports.npwd:setPhoneDisabled(false)
                    end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function()
                        return exports.npwd:setPhoneDisabled(true)
                    end)
                end
            end
        }
    },

    ['money'] = {label = 'Money'},

    ['mustard'] = {
        label = 'Mustard',
        weight = 500,
        client = {
            status = {hunger = 25000, thirst = 25000},
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {
                model = 'prop_food_mustard',
                pos = vec3(0.01, 0.0, -0.07),
                rot = vec3(1.0, 1.0, -1.5)
            },
            usetime = 2500,
            notification = 'You.. drank mustard'
        }
    },

    ['water'] = {
        label = 'Bouteille d\'eau',
        weight = 1000,
        client = {
            status = {thirst = 1000000},
            anim = {dict = 'mp_player_intdrink', clip = 'loop_bottle'},
            prop = {
                model = 'prop_ld_flow_bottle',
                pos = vec3(0.03, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            },
            usetime = 2500,
            cancel = true
        }
    },

    ['radio'] = {
        label = 'Radio',
        weight = 100,
        stack = true,
        close = true,
        client = {
            export = 'ac_radio.openRadio',
            remove = function(total)
                -- Disconnets a player from the radio when all his radio items are removed.
                if total < 1 and GetConvar('radio_noRadioDisconnect', 'true') == 'true' then
                    exports.ac_radio:leaveRadio()
                end
            end
        }
    },

    ['armour'] = {
        label = 'Gillet parre-balle',
        weight = 3000,
        stack = false,
        client = {
            anim = {dict = 'clothingshirt', clip = 'try_shirt_positive_d'},
            usetime = 3500
        }
    },

    ['clothing'] = {label = 'Clothing', consume = 0},

    ['mastercard'] = {label = 'Mastercard', stack = false, weight = 0},

    ['scrapmetal'] = {label = 'Ferraille', weight = 30},

    ['scrap_aluminium'] = {label = 'Aluminium', weight = 30},

    ['metal_plate'] = {label = 'Plaque de metal', weight = 30},

    ["alive_chicken"] = {
        label = "Living chicken",
        weight = 1,
        stack = true,
        close = true
    },

    ["blowpipe"] = {label = "Blowtorch", weight = 2, stack = true, close = true},

    ['bread'] = {
        label = 'Croissant',
        weight = 10,
        client = {
            status = {hunger = 1000000},
            anim = 'eating',
            prop = 'burger',
            usetime = 2500
        }
    },
    ["carokit"] = {label = "Kit carosserie", weight = 3, stack = true, close = true},

    ["carotool"] = {label = "Outils carrosserie", weight = 2, stack = true, close = true},

    ["clothe"] = {label = "Cloth", weight = 1, stack = true, close = true},

    ["copper"] = {label = "Copper", weight = 1, stack = true, close = true},

    ["cutted_wood"] = {
        label = "Cut wood",
        weight = 1,
        stack = true,
        close = true
    },

    ["diamond"] = {label = "Diamond", weight = 100, stack = true, close = true},

    ["gas"] = {label = "Bidon d\'essence", weight = 3000, stack = true, close = true},

    ["fabric"] = {label = "Fabric", weight = 100, stack = true, close = true},

    ["fish"] = {label = "Fish", weight = 400, stack = true, close = true},

    ["fixkit"] = {label = "Kit de reparation", weight = 600, stack = true, close = true},

    ["fixtool"] = {
        label = "Outils de reparation",
        weight = 600,
        stack = true,
        close = true
    },

    ["gazbottle"] = {
        label = "Bouteille de gas",
        weight = 1000,
        stack = true,
        close = true
    },

    ["gold"] = {label = "Or", weight = 1, stack = true, close = true},

    ["iron"] = {label = "Fer", weight = 1, stack = true, close = true},

    ["marijuana"] = {
        label = "Cannabis",
        weight = 100,
        stack = true,
        close = true
    },

    ["medikit"] = {label = "Medikit", weight = 2000, stack = true, close = true},

    ["packaged_chicken"] = {
        label = "Chicken fillet",
        weight = 1,
        stack = true,
        close = true
    },

    ["packaged_plank"] = {
        label = "Packaged wood",
        weight = 10,
        stack = true,
        close = true
    },

    ["petrol"] = {label = "Pétrole", weight = 3000, stack = true, close = true},

    ["petrol_raffin"] = {
        label = "Pétrole rafinne",
        weight = 100,
        stack = true,
        close = true
    },

    ["slaughtered_chicken"] = {
        label = "Slaughtered chicken",
        weight = 100,
        stack = true,
        close = true
    },

    ["stone"] = {label = "Stone", weight = 1, stack = true, close = true},

    ["washed_stone"] = {
        label = "Pierre lavée",
        weight = 1,
        stack = true,
        close = true
    },

    ["wood"] = {label = "Bois", weight = 1, stack = true, close = true},

    ["wool"] = {label = "Wool", weight = 1, stack = true, close = true},

    ["tradescantia"] = {
        label = "Tradescantia",
        weight = 10,
        stack = true,
        close = true
    },

    ["weaponparts"] = {
        label = "Pièce détachée",
        weight = 10,
        stack = true,
        close = true
    },

    ["spring"] = {label = "Ressort", weight = 10, stack = true, close = true},

    ["screw"] = {label = "Clou", weight = 10, stack = true, close = true},

    ["gunpowder"] = {
        label = "Poudre noir",
        weight = 10,
        stack = true,
        close = true
    },

    ["wood_scrap"] = {
        label = "Morceau de bois",
        weight = 10,
        stack = true,
        close = true
    },

    ['bag'] = {
        label = 'Sac',
        weight = 0,
        stack = false,
        close = true,
        description = '',
        client = {
            export = 'renzu_bag.useItem',
            disable = { move = true, car = true, combat = true },
            usetime = 1,
            remove = function(total)
                if _G.bagID then
                    SetPedComponentVariation(cache.ped,5,_G.bagID,0,2)
                    _G.bagID = nil
                end
            end
        },
        buttons = {
            {
                label = 'Mettre / Enlever Sac',
                action = function(slot)
                    print(_G.bagID,'_G.bagID')
                    if _G.bagID == nil then
                        _G.bagID = GetPedDrawableVariation(cache.ped, 5)
                        TriggerEvent('renzu_bag:Wearbag', slot)
                    else
                        SetPedComponentVariation(cache.ped,5,_G.bagID,0,2)
                        _G.bagID = nil
                    end
                end
            }
        },
    },

    ["lighter"] = {label = "Briquet", weight = 10, stack = true, close = true},

    ["tabacblond"] = {label = "Tabac Blond", weight = 10, stack = true, close = true},

    ["tabacbrun"] = {label = "Tabac Brun", weight = 10, stack = true, close = true},
    
    ["tabacblondsec"] = {label = "Tabac Blond Séché", weight = 10, stack = true, close = true},
    
    ["tabacbrunsec"] = {label = "Tabac Brun Séché", weight = 10, stack = true, close = true},
   
    ["rolling_paper"] = {label = "Feuilles a rouler", weight = 10, stack = true, close = true},
    
    ["redw"] = {label = "Paquet de RedWood", weight = 30, stack = true, close = true},
    
    ["marlboro"] = {label = "Paquet de Yukon", weight = 30, stack = true, close = true},

    ["redwcig"] = {label = "Cigarette RedWood", weight = 10, stack = true, close = true},

    ["marlborocig"] = {label = "Cigarette Yukon", weight = 10, stack = true, close = true},

    ["cubancigar"] = {label = "Cigarre Cubain", weight = 20, stack = true, close = true},

    ["davidoffcigar"] = {label = "Cigarre Davidoff", weight = 20, stack = true, close = true},

    ["bbq_prop"] = {label = "Barbecue", weight = 9000, stack = true, close = true},

    ["raw_meat"] = {label = "Steak crue", weight = 9000, stack = true, close = true},

    ["hotdog"] = {label = "Hotdog", weight = 9000, stack = true, close = true},

    ["raw_sausage"] = {label = "Saucisse crue", weight = 9000, stack = true, close = true},

    ["food_oil"] = {label = "Huile de friture", weight = 9000, stack = true, close = true},

    ["hotdog_bun"] = {label = "Bun", weight = 9000, stack = true, close = true},

    ["steak"] = {label = "Barbecue", weight = 9000, stack = true, close = true},

    ["prop_tool_box_06"] = {label = "Outils de cuisine", weight = 500, stack = true, close = true},

	["joint"] = {
		label = "joint",
		weight = 10,
		stack = true,
		close = true,
	},

	["banana_kush_bag"] = {
		label = "Cannabis banana kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["banana_kush_joint"] = {
		label = "joint banana kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["og_kush_joint"] = {
		label = "joint og kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_dream_bag"] = {
		label = "Cannabis blue dream",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_dream_joint"] = {
		label = "joint blue dream",
		weight = 1,
		stack = true,
		close = true,
	},

	["gitanes"] = {
		label = "Cigarettes Yukon",
		weight = 30,
		stack = true,
		close = true,
	},

	["purple_haze_bag"] = {
		label = "Cannabis purple haze",
		weight = 1,
		stack = true,
		close = true,
	},

	["purple_haze_joint"] = {
		label = "joint purple haze",
		weight = 1,
		stack = true,
		close = true,
	},

	["og_kush_bag"] = {
		label = "Cannabis og kush",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["malbora"] = {
		label = "Cigarettes Redwood",
		weight = 30,
		stack = true,
		close = true,
	},

    ['facemask'] = {
        label = 'Masque de protection',
        description = 'Protégez-vous de la transmision de virus',
        weight = 115,
        consume = 0.2,
        client = {
            export = 'renzu_illness.faceMask',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['multivitamins'] = {
        label = 'Z-antidote',
        description = 'Multivitamins contain micronutrients to help your overall health.',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['diatabs'] = {
        label = 'Fucca',
        description = 'Aide à réduire la diarrhée',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['acetaminophen'] = {
        label = 'Acetaminophen',
        description = 'Aide à réduire la fièvre causée par la dengue',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    ['offlotion'] = {
        label = 'Anti moustiques',
        description = 'Aide à éloigner les moustiques',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['antihistamine'] = {
        label = 'Anti Histaminique',
        description = 'Les antihistaminiques sont des médicaments qui traitent la rhinite allergique, le rhume commun, la grippe et d\'autres allergies comme la varicelle.',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['ambroxol'] = {
        label = 'Ambroxol',
        description = 'Ambroxol est utilisé pour les conditions où il y a beaucoup de mucus épais dans les voies respiratoires.',
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['baraclude'] = {
        label = 'Baraclude',
        description = 'Aide à réduire la quantité de virus de l\'hépatite B dans votre corps',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['metronidazole'] = {
        label = 'Metronidazole',
        description = 'Metronidazole est un antibiotique utilisé pour traiter une grande variété d\'infections, comme le tétanos.',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },
    
    ['molnupiravir'] = {
        label = 'Molnupiravir',
        description = 'Molnupiravir est autorisé pour le traitement du COVID-19 léger à modéré chez les adultes de 18 ans et plus.',
        weight = 115,
        client = {
            export = 'renzu_illness.useItem',
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            disable = { move = true, car = true, combat = true },
            usetime = 2500,
        }
    },

    ['drill'] = {
        label = 'Foreuse',
        weight = 4000,
        stack = false,
        close = false,
        consume = 0
    },

    ['storage'] = {
        label = 'Coffre fort',
        weight = 4000,
        stack = false,
        close = false,
        consume = 0
    },

    ['keys'] = {
        label = "Clé de voiture",
        weight = 15,
    },

     
}