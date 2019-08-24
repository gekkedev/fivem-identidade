RegisterNetEvent("mostrarid")
AddEventHandler('mostrarid', function(source, args)
    print(args)
    if (source > 0 && args > 0) then --source > 0 = sent by a player
        -- Use -1 for "targetPlayer" if you want the event to trigger on all connected clients.
        TriggerClientEvent("mostrarid_aqui", args, {
            args = {
                GetPlayerName(source)
            }
        })
    end
end, false)