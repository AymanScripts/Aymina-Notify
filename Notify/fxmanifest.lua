fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Aymina-Development'
description 'Custom notify by Aymina-Development'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script {'config.lua'}
client_script 'client.lua'
server_script 'server.lua'
