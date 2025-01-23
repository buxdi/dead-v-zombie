fx_version "cerulean"
games {"gta5"}

version '1.0.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'server/main.lua'
}

shared_script '@es_extended/imports.lua'