fx_version 'cerulean'
lua54 'yes'
game 'gta5'
version '1.0.0'
description 'lab-pet'
author 'zhonnz'


client_scripts {
    'client/functions.lua'
}

server_scripts {
	'sql.lua',
	'server/main.lua'
}

shared_scripts {
	'locales.lua',
	'config.lua'
}

shared_script '@es_extended/imports.lua'

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/*.ttf',
    'nui/*.png',
    'nui/*.jpg',
    'nui/*.css',
	'stream/*.ytd',
    'nui/*.js',
    'nui/*.mp3',
    'nui/img/*.png',
    'nui/img/*.jpg',
    'nui/sounds/*.ogg',
    'nui/sounds/*.mp3'
}

escrow_ignore {
    'config.lua',
    'locales.lua',
    'sql.lua',
    'stream/*.ytd'
}
 