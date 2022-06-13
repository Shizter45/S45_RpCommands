
RegisterCommand('911', function(source, args)
    local msg = table.concat(args, ' ')
    Notify('~g~[SUCCESS]~w~ ')
    TriggerServerEvent('S45RPCMDS:911Alert', msg)
end, false)

RegisterCommand('delveh', function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(veh)
end, false)

RegisterNetEvent('S45RPCMDS:911AlertReturn')
AddEventHandler('S45RPCMDS:911AlertReturn', function(msg)
    Wait(5000) -- waits 5 seconds to run
    local coord = GetEntityCoords(PlayerPedId())
    if IsPedInAnyPoliceVehicle(PlayerPedId()) then
        local callBlip = AddBlipForCoord(coord.x, coord.y, coord.z)
        SetBlipSprite(callBlip, Config.BlipSprite)
        SetBlipColour(callBlip, Config.BlipColor)
        SetBlipAlpha(callBlip, 255)
        SetBlipDisplay(callBlip, 2)
        SetBlipScale(callBlip, 1.5)
        AddTextEntry('CALLBLIP', '911 Call')
        BeginTextCommandSetBlipName('CALLBLIP')
        EndTextCommandSetBlipName(callBlip)
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
        Notify(msg)
        Wait(60000)
        SetBlipSprite(callBlip, 2)
    end
end)

-- DO NOT TOUCH
function Notify(str)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(str)
    DrawNotification(true, false)
end

function helpTxt(msg)
    SetTextComponentFormat('STRING')
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end