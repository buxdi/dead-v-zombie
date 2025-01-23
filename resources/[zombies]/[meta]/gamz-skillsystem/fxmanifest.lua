fx_version 'cerulean'

game 'gta5'

lua54 'yes'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'config.lua',
    'client/functions.lua'
}

exports {
    "SkillMenu",
    "UpdateSkill",
    "GetCurrentSkill"
}

shared_script '@es_extended/imports.lua'

