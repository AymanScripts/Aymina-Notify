local notifyPosition = Config.DefaultPosition

local function SendNotification(data)
    local notifyType = Config.Notifications[data.type] or Config.Notifications.info

    SendNUIMessage({
        action = "showNotify",
        text = data.description or "",
        type = data.type,
        title = data.title or "",
        description = data.description or "",
        duration = notifyType.duration,
        position = notifyPosition,
        icon = notifyType.icon,
        iconColor = notifyType.color
    })
end

RegisterNetEvent('custom_notify:display')
AddEventHandler('custom_notify:display', function(data)
    SendNotification(data)
end)

exports("SendNotification", function(data)
    SendNotification(data)
end)




RegisterCommand('sendNotify', function(source, args, rawCommand)
    -- Check if there are enough arguments
    if #args >= 3 then
        local type = args[1]  -- The first argument will be the type
        local title = args[2] -- The second argument will be the title
        local description = table.concat(args, " ", 3)  -- Combine the rest of the arguments as the description

        -- Send the notification
        exports['Notify']:SendNotification({
            type = type,
            title = title,
            description = description
        })
    else
        -- Error message if not enough arguments are provided
        print("Usage: /sendNotify [type] [title] [description]")
    end
end, false)
