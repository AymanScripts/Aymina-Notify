local notifyPosition = Config.DefaultPosition

function SendNotification(data)
    local notifyType = Config.Notifications[data.type] or Config.Notifications.info

    
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
        leftBorderColor = notifyType.leftBorderColor,
        position = notifyPosition,
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

RegisterCommand('setNotifyPosition', function(source, args, rawCommand)
    local newPosition = args[1]
    local validPositions = {
        ["top-right"] = true, ["top-middle"] = true, ["top-left"] = true,
        ["middle-right"] = true, ["middle-left"] = true,
        ["bottom-right"] = true, ["bottom-middle"] = true, ["bottom-left"] = true
    }

    if validPositions[newPosition] then
        notifyPosition = newPosition
        print("Notification position set to: " .. newPosition)
    else
        print("Invalid position. Available positions: top-right, top-middle, top-left, middle-right, middle-left, bottom-right, bottom-middle, bottom-left")
    end
end, false)
