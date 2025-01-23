Config = {}

Config.Locale = 'fr'

--Base
Config.LighterItem = 'lighter' -- Lighter item
Config.Smoke = 38 -- draw smoke from a cigarette, cigar, joint  -- https://docs.fivem.net/docs/game-references/controls/
Config.Throw = 105 -- throw away a cigarette, cigar, joint -- x pour jetter
Config.Mouth = 173 -- from hand to mouth -- fleche du haut a la bouche
Config.inHand = 172 -- From mouth to hands -- fleche du bas a la main

----------------------------------------

--Ciggarate
Config.SmokeMouth = 0.1 -- The size of the smoke from the mouth
Config.SmokeSizeCigarette = 0.02 -- The size of cigarette smoke

Config.CigaretteHangTime = 1000 -- smoke exhalation time
Config.CigaretteSmokingTime = 180000 -- After 3 minutes, the character discards the cigarette
Config.CancelSmoke = true  -- If it is false, smoking will last indefinitely; if it is true, it will end after the Config.CigaretteSmokingTime

Config.ItemCigarette = {    -- Cigarette Items
	'redwcig',
	'marlborocig'
}

Config.CigarettePack = { -- set the pack items here and which items you get from the pack
    {PackItem = "redw",  CigaretteItem = 'redwcig', Amount = 20},
    {PackItem = "marlboro",  CigaretteItem = 'marlborocig', Amount = 20},
}

----------------------------------------

--Cigar
Config.SmokeCigarMouth = 0.2 -- The size of the smoke from the mouth
Config.SmokeSizeCigar = 0.03 -- The size of cigar smoke

Config.CancelSmokeCigar = true -- If it is false, smoking will last indefinitely; if it is true, it will end after the Config.CigarSmokingTime 

Config.CigarHangTime = 1500 -- smoke exhalation time
Config.CigarSmokingTime = 240000 -- After 4 minutes, the character discards the cigar

Config.ItemCigar = {    -- Cigar Items
	'cubancigar',
	'davidoffcigar'
}

----------------------------------------

--Joint
Config.SmokeJointMouth = 0.1 -- The size of the smoke from the mouth
Config.SmokeSizeJoint = 0.04 -- The size of joint smoke

Config.CancelSmokeJoint = true -- If it is false, smoking will last indefinitely; if it is true, it will end after the Config.JointSmokingTime 

Config.JointHangTime = 1000 -- smoke exhalation time
Config.JointSmokingTime = 180000-- After 3 minutes, the character discards the Joint

Config.Rollingpaper = 'rolling_paper'

Config.ItemJoint = {    -- Joint Items
	'joint'
}

Config.ItemWeed = {    -- Weed bag
	'marijuana'
}
----------------------------------------