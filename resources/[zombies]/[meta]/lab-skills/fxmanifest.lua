fx_version 'cerulean'

game 'gta5'


ui_page 'html/index.html'

files {
	'html/index.html',
	'html/index.css',
	'html/index.js',
	'html/*.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'html/img/skillpoints/*.png',
	'html/sounds/*.mp4',
	'html/sounds/*.mp3',
	'html/sounds/*.wav',
}

shared_scripts {
	'locales.lua',
	'config.lua',
	'@es_extended/imports.lua',
}

client_scripts{
    'client/main.lua',
}

server_scripts{
	'sql.lua',
    'server/main.lua',
}

lua54 'yes'