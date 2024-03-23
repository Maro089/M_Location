fx_version "adamant"
game "gta5"
lua54 'yes'

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    "client.lua",
    "config.lua"
}

server_scripts {
    "server.lua"
}
