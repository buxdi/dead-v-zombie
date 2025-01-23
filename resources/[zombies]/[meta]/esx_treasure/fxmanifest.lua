fx_version 'cerulean'
game 'gta5'

description 'ESX Treasure'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}

shared_script '@es_extended/imports.lua'