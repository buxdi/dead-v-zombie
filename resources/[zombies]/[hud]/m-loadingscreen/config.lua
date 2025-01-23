Config = {}
-- For more info check https://codem.gitbook.io/codem-documentation/

Config.Theme = 'cherry' --  sky, blvck, cherry, kush, mango, proxima
Config.Logo = '' -- Default or URL link
Config.BackgroundImage = 'background.png' -- default or custom image/video
-- Backgrounds can be found in html/assets/background/
-- Config.BackgroundImage = 'background.png'



-- To display on left menu (must be an image)
-- Supports max 2 images
Config.AlbumsThumbnail = {
    {
        source = 'https://media.discordapp.net/attachments/1207115264332931161/1210379854818836490/ZScreenshot_2024-02-21_195113.png?ex=65ea5915&is=65d7e415&hm=a79690d946cc9b59be5deef88f80fa6b82e23aed301400da000448d1be2349b2&=&format=webp&quality=lossless&width=960&height=455', -- Must be a link
    },
    {
        source = 'https://cdn.discordapp.com/attachments/1207115264332931161/1208516566870917251/creepy.jpg?ex=65e391c2&is=65d11cc2&hm=f19a1efa438a7760897be027f89d767999a703bc88ad0218e0fd1bfcc6e66b87&', -- Must be a link
    },
}

Config.Albums = {--[[
    {
        source = 'https://cdn.discordapp.com/attachments/1141886336291307572/1189690044819181608/nle-shoppa.webp?ex=659f1432&is=658c9f32&hm=eb44508d8a97a6b68f855fb621033cfb8b2eb652e9febba0a1b85a098096e5eb&', -- Must be a link
    },
    {
        source = 'https://media.discordapp.net/attachments/1141886311368757269/1179930830282436698/image.png?ex=659742b7&is=6584cdb7&hm=75352c98e81f4ac9a0e831e2bd5f2055d45e7d312594fccaa12f9bac3acdad17&=&format=webp&quality=lossless&width=1070&height=736', -- Must be a link
    },
    {
        source = 'https://cdn.discordapp.com/attachments/1141886311368757269/1189563256805797898/image.png?ex=659e9e1d&is=658c291d&hm=0b4f43d2eb6a394ce3417af4edd2f73b710c4360a6ef04475256006c509ef9e6&', -- Must be a link
    },
    {
        source = 'https://media.discordapp.net/attachments/1141886311368757269/1161340241915957298/image.png?ex=659d74e2&is=658affe2&hm=9cf82caa166141a4954387eece8f218e4286e4c267077c34c8c04524ca9d0188&=&format=webp&quality=lossless&width=1626&height=901', -- Must be a link
    },
    {
        source = 'https://media.discordapp.net/attachments/1141886311368757269/1189371359277625394/image.png?ex=659deb65&is=658b7665&hm=306ec0c4a44d2fff13e4d3bc5c5354d8e984accc12e375e810ab451b445ac25a&=&format=webp&quality=lossless&width=1487&height=903', -- Must be a link
    },
    {
        source = 'https://media.discordapp.net/attachments/1141886311368757269/1185241871124025395/image.png?ex=65982002&is=6585ab02&hm=3030fb119b53cf55caee6e91bcae8bc7aa81413b20b0b79045e99502000ae933&=&format=webp&quality=lossless&width=1330&height=705', -- Must be a link
    },
    {
        source = 'https://media.discordapp.net/attachments/1141886311368757269/1185230484410749040/image.png?ex=65981568&is=6585a068&hm=1152c315442ae60379df2af8646f621abda61d761fa2363382145747be3aaa1b&=&format=webp&quality=lossless&width=1350&height=903', -- Must be a link
    },
    {
        source = 'https://cdn.discordapp.com/attachments/1141886311368757269/1157051077569564754/image.png?ex=659714c9&is=65849fc9&hm=d1b1d5a339f07d886fae3f7e0f0efae5fe66fe35bf8a0052048e260cc76c9ee5&', -- Must be a link
    },
    {
        source = 'https://cdn.discordapp.com/attachments/1141886311368757269/1178732995977424896/image.png?ex=659c21a6&is=6589aca6&hm=d90aabc71f188ecf645158c711ce4658acb5726409e5e9df18adfd144e22c13a&', -- Must be a link
    },
    {
        source = 'https://cdn.discordapp.com/attachments/1141886311368757269/1174809523739971605/image.png?ex=65971621&is=6584a121&hm=6ae171bcabb8e1dfce5564a702629c2e81a2d87955f64175f132a8462123f862&', -- Must be a link
    },]]--
}


Config.EnableHintMessages = false
Config.HintMessages = { --[[
    {
        text= " Mappings et Scripts Inédits : Explorez des endroits magnifiquement conçus grâce à nos mappings exclusifs.",
        time= 8000,
    },
    {
        text= "Réglement du serveur : Chaque joueur entrant dans la ville doit obligatoirement avoir lu les règles.",
        time= 3000,
    },
    {

        text= "Voitures Modées à la Perfection : Parcourez les rues au volant de bolides uniques, modifiés avec une attention obsessionnelle aux détails. ",
        time= 1000,
    }]]--
}

Config.PlayMusicByDefault = false -- if true plays the music when loading screen is active

Config.ButtonLinks = {
    -- ["twitter"] = 'https://twitter.com',
    --["instagram"] = 'https://www.instagram.com/',
    -- ["reddit"] = 'https://www.reddit.com/',
    ["discord"] = 'https://discord.gg/VA6W7KBVXM',
}

Config.ServerName = 'Dead V Zombies'

Config.Language = {
    ["WELCOME"] = ' ',
    ["INSIDE_CITY"] = "BIENVENUE 💬 ",
    ["FOOTAGES"] = ' ',
    ["PATCH_NOTES"] = "BETA 1.0.2 🤖",
    ["PATCH_NOTES_VERSION"] = 'Mises à jours constantes',
    ["LATEST_UPDATES"] = 'Recrutement staff',
    ["FOLLOW_CITY"] = " ",
    ["CITY_LOADING"] = 'Chargement...',
    ["SETTINGS"] = 'Paramètres',
    ["ENABLE_MUSIC"] = 'Activer/désactiver la musique',
    ["SHOW_MENU"] = 'Afficher le menu de gauche',
    ["SHOW_HINT"] = 'Dévoiler un indice',
    ["KEYBINDS_INFO"] = 'Cliquez sur un bouton pour voir sa fonction.',
    ["KEYBINDS_INFO_2"] = 'Certaines affectations de touches peuvent être modifiées dans les paramètres du jeu',
    ["GO_TO"] = 'Changer',
    ["FIVEM_SETTINGS"] = 'ESC>Settings>Keybindings>FiveM',
    ["PRESS"] = 'Cliquez sur',
    ["DOUBLE_PRESS"] = 'Double-cliquez',
    ["COMBINATIONS"] = 'Combinaisons',
    ["KEYBINDS_INFO_3"] = 'Cliquez sur une touche pour voir son affectation.',
    ["KEYBINDS_INFO_4"] = 'Notez que ces affectations de touches sont des raccourcis vers des commandes. Il existe de nombreuses commandes qui ne sont pas encore attribuées dans le jeu.',
    ["COMMANDS"] = 'Commandes',
    ["SHOW_ALL"] = 'Afficher toutes les commandes',
    ["SELECT_COMMAND"] = 'Veuillez choisir une commande',
    ["DISPLAY_BINDING"] = "Montrer l'affectation",
    ["COMMANDS_INFO"] = 'Cliquez sur une commande pour voir sa fonction',
    ["HINT"] = 'Indice',

}

Config.PatchNotes = {
    "Patch notes disponnible sur notre discord: https://discord.gg/VA6W7KBVXM"
}

Config.Keybinds = {
    ["ESC"] = false,
    ["F1"] = {
        ["pressInfo"] = 'Téléphone',
        ["doublePressInfo"] = false,
    },
    ["F2"] = {
        ["pressInfo"] = "Inventaire",
    },
    ["F3"] = false,
    ["F4"] = {
        ["pressInfo"] = "Emotes",
    },
    ["F5"] = false,
    ["F6"] = {
        ["pressInfo"] = 'Menu employé',
    },
    ["F7"] = {
        ["pressInfo"] = 'Menu faction',
    },
    ["F8"] = false,
    ["F9"] = false,
    ["F10"] = false,
    ["F11"] = false,
    ["F12"] = false,
    ["“"] = false,
    ["1"] = {
        ["pressInfo"] = "Inventaire: utiliser slot 1",
    },
    ["2"] = {
        ["pressInfo"] = "Inventaire: utiliser slot 2",

    },
    ["3"] = {
        ["pressInfo"] = "Inventaire: utiliser slot 3",

    },
    ["4"] = {
        ["pressInfo"] = "Inventaire: utiliser slot 4",

    },
    ["5"] = {
        ["pressInfo"] = "Inventaire: utiliser slot 5",

    },
    ["6"] = false,
    ["7"] = false,
    ["8"] = false,
    ["9"] = false,
    ["0"] = false,
    ["-"] = false,
    ["+"] = false,
    ["BACKSPACE"] = false,
    ["TAB"] = false,
    ["Q"] = false,
    ["W"] = false,
    ["E"] = false,
    ["R"] = false,
    ["T"] = false,
    ["Y"] = false,
    ["U"] = {
        ["pressInfo"] = "Tomber au sol",

    },
    ["I"] = false,
    ["O"] = false,
    ["P"] = false,
    ["["] = false,
    ["]"] = false,
    ["ENTER"] = false,
    ["CAPS"] = false,
    ["A"] = false,
    ["S"] = false,
    ["D"] = false,
    ["F"] = false,
    ["G"] = false,
    ["H"] = false,
    ["J"] = false,
    ["K"] = false,
    ["L"] = false,
    [";"] =  false,
    ["@"] =  false,
    ["LSHIFT"] =  false,
    ["Z"] =  false,
    ["X"] =  {
        ["pressInfo"] = "Lever les mains",

    },
    ["C"] =  false,
    ["V"] =  false,
    ["B"] =  {
        ["pressInfo"] = "Pointer du doigt",

    },
    ["N"] =  false,
    ["M"] =  false,
    ["<"] =  false,
    [">"] =  false,
    ["?"] =  false,
    ["RSHIFT"] =  false,
    ["LCTRL"] =  false,
    ["ALT"] =  false,
    ["SPACE"] = false,
    ["ALTGR"] = false,
    ["RCTRL"] = false,
}
-- add only 2 commands here
Config.PreviewCommands = {
    ["hud"]= false,
    ["gfix"]= false,
}

Config.Commands = {
    ["hud"]= false,
    ["gfix"]= false,
    ["e"]= false,
    ["mdt"]= false,
}



