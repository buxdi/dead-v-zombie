fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

ui_page 'html/ui.html'

client_scripts {
    'client/main.lua',
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'config.lua',
}

files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/app.js',
}