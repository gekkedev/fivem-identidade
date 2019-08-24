resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

--resource_type 'gametype' { name = 'Monstra a tua carteira de identidade!' }
description 'Monstra a tua carteira de identidade!'

files {
    'tentei.jpg'
}

client_script 'identidade_client.lua'
server_script 'identidade_server.lua'