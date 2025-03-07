function SendNotification(data)
    local notifyType = Config.Notifications[data.type] or Config.Notifications.info

    -- Send the notification to the NUI (browser-side)
    SendNUIMessage({
        action = 'showNotify',
        title = data.title or '',
        description = data.description or '',
        type = data.type,
        duration = notifyType.duration,
        icon = notifyType.icon,
        iconColor = notifyType.iconColor,
        backgroundColor = notifyType.backgroundColor,
        textColor = notifyType.textColor,
        progressBarColor = notifyType.progressBarColor,
        leftBorderColor = notifyType.leftBorderColor
    })
end

exports("SendNotification", function(data)
    SendNotification(data)
end)

RegisterNetEvent('Aymina-Notify:display')
AddEventHandler('Aymina-Notify:display', function(data)
    SendNotification(data)
end)

Citizen.CreateThread(function()
    SendNUIMessage({
        action = 'setConfig',
        config = Config
    })
end)




RegisterCommand('sendNotify', function(source, args, rawCommand)
    if #args >= 3 then
        local type = args[1]  
        local title = args[2] 
        local description = table.concat(args, " ", 3)  

        -- Send the notification client-side
        exports['Aymina-Notify']:SendNotification({
            type = type,
            title = title,
            description = description
        })
    else
        print("Usage: /sendNotify [type] [title] [description]")
    end
end, false)

