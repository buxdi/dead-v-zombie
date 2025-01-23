--FiveM's list of Ped Models can be found here: https://docs.fivem.net/docs/game-references/ped-models/
--A list of all the animations can be found here: https://alexguirre.github.io/animations-list/

Config = {}
Config.Invincible = true --Do you want the peds to be invincible?
Config.Frozen = true --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
Config.Stoic = true --Do you want the peds to react to what is happening in their surroundings?
Config.Fade = true-- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
Config.Distance = 70.0 --The distance you want peds to spawn at


--Does the system you use for grabbing coordinates require subracting from the z axis?
--If so, set this to true. You'll have to adjust the coordinates for defaults down - 1 if you set false.
Config.MinusOne = true

Config.PedList = {
	{
		model = "s_m_y_xmech_02",
		coords = vector3(312.97, -1363.17, 31.95), -- first base MECHANIC
		heading = 136.06, 
		gender = "male", 
		animDict = "missmic_4premierejimwaitbef_prem", 
		animName = "wait_base",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "CSB_Johnny_Guns",
		coords = vector3(299.97, -1366.44, 31.87), -- first base MECHANIC
		heading = 238.11, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "IG_Wendy",
		coords = vector3(302.91, -1363.72, 31.89), -- first base MECHANIC
		heading = 232.44, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "IG_Old_Man2",
		coords = vector3(304.18, -1360.64, 31.84), -- first base MECHANIC
		heading = 289.13, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "U_M_Y_Caleb",
		coords = vector3(326.39, -1372.87, 31.90), -- first base MECHANIC
		heading = 158.74, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "CS_Marnie",
		coords = vector3(327.61, -1374.93, 31.90), -- first base MECHANIC
		heading = 45.35, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "CSB_Bogdan",
		coords = vector3(312.58, -1369.75, 31.84), -- first base MECHANIC
		heading = 17.00, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "CSB_Vincent_4",
		coords = vector3(306.79, -1357.97, 31.84), -- first base MECHANIC
		heading = 170.07, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "U_M_M_Juggernaut_03",
		coords = vector3(302.29, -1365.81, 31.90), -- first base MECHANIC
		heading = 59.52, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	{
		model = "MP_M_WareMech_01",
		coords = vector3(316.81, -1364.42, 31.84), -- first base MECHANIC
		heading = 249.44, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    },

	
	{
		model = "s_m_y_armymech_01",
		coords = vec3(-330.5, -134.4, 39.0), -- first base MECHANIC
		heading = 121.8, 
		gender = "male", 
		animDict = "anim@amb@clubhouse@mini@darts@", 
		animName = "wait_idle",
	    isRendered = false,
        ped = nil,
    }
	
}