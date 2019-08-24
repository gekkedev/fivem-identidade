-- FiveM Identidade Mod (ID card)
-- (c) 2019 by gekkedev
RegisterCommand('mostrarid', function(source, args)
    local targetped = GetPedInFront()
    if targetped ~= 0 then
        local targetplayer = GetPlayerFromPed(targetped)
        if targetPlayer ~= -1 then
            TriggerEvent('chat:addMessage', {
                args = { 'Tu mostra tua carteira de identidade...' }
            })
            TriggerServerEvent("mostrarid", PlayerId(), GetPlayerServerId(targetplayer))
        else
            TriggerEvent('chat:addMessage', {
                args = { 'Error 2!' }
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            args = { 'No jogador aqui!' }
        })
    end
    TriggerServerEvent("mostrarid", PlayerId(), "test")
end, false)

local show = false
RegisterNetEvent("mostrarid_aqui")
AddEventHandler('mostrarid_aqui', function(source, args)
    show = true
    AddTextEntry('IDENTIDATE_LABEL', "teste")
    local txd = CreateRuntimeTxd('identidade')
    local retval = CreateRuntimeTextureFromImage(txd, 'identidade_img', 'tentei.jpg');

    Citizen.CreateThread(function()
        while show do
            Wait(0)
            DrawSprite('identidade', 'identidade_img', 0.15, 0.15, 0.25, 0.25, 0.0, 255, 255, 255, 255)
            -- when drawing
            --SetTextFont(2)
            SetTextColour(1, 2, 255, 255)
            SetTextScale(0.4, 0.4)
            BeginTextCommandDisplayText('IDENTIDATE_LABEL')
            EndTextCommandDisplayText(0.1, 0.08)
            if IsControlJustPressed(0, 177) then
                show = false
            end
        end
    end)
end, false)

-- GetPedInFront & GetPlayerFromPed
-- 
-- Copyright 2017 xander1998 <xander.harrison77@gmail.com>
-- 
-- The following code is a derivative work of the code from cuff-handsup (https://github.com/xander1998/cuff-handsup), 
-- which is licensed under the terms of the GNU General Public License v3.0.
function GetPedInFront()
    local player = PlayerId()
    local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

function GetPlayerFromPed(ped)
	for a = 0, 64 do
		if GetPlayerPed(a) == ped then
			return a
		end
	end
	return -1
end