-- this script create or emulate stash logic to your item when its used. its unique to its Serial Number
-- my original plan for item based stash is the ox container, but there seems no way to Create new item container from other resource yet as for now. (or educate me, its faster if container is used but there will no probably a prop when its dropped. will use the ox drop system logic)
Config = {
	useShop = true, -- Do you want a Shop for Bags? 
	Shopcoord = vec3(302.716492, -1364.610962, 31.908448),
	item = { -- item based prop inventory
		[1] = {
			item = 'bag',
			slots = 20,
			componentid = 45, -- bag componentid SetPedComponentVariation(cache.ped,5,id,0,2)
			weights = 10000,
			model = 'ba_prop_battle_bag_01a', -- prop model
			label = 'Sac de combat', -- label of the item
			price = 450,
			image = 'bag' -- item name of image in ox /web/build/images/bag.png, make sure to put one there
		},
		[2] = {
			item = 'bag',
			slots = 25,
			weights = 20000,
			model = 'xm_prop_x17_bag_med_01a', -- prop model
			label = 'Sac de secouriste', -- label of the item
			price = 1200,
			image = 'medicbag' -- item name of image in ox /web/build/images/bag.png, make sure to put one there
		},
		[3] = {
			item = 'bag',
			slots = 35,
			weights = 40000,
			model = 'prop_mb_crate_01a', -- prop model
			label = 'Caisse de stockage', -- label of the item
			price = 3000,
			image = 'weaponcrate' -- item name of image in ox /web/build/images/bag.png, make sure to put one there
		},
		[4] = {
			item = 'bag',
			slots = 20,
			weights = 20000,
			model = 'prop_ld_suitcase_02', -- prop model
			label = 'Valise de businessman', -- label of the item
			price = 2500,
			image = 'suitcase' -- item name of image in ox /web/build/images/bag.png, make sure to put one there
		},
		-- another prop model?
		-- just insert another here
		-- item name can be bag too with another model, we used metadas for labels too as ox_inventory support it , magnificent. so other name like Suitcase or etc. will still work on bag item name with different label name and datas
	}
}