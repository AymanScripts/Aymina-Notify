RegisterNetEvent('custom_notify:send')
AddEventHandler('custom_notify:send', function(target, data)
    if not target or target == -1 then return end

    local notifyType = Config.Notifications[data.type] or Config.Notifications.info
    TriggerClientEvent('custom_notify:display', target, {
        type = data.type,
        title = data.title,
        description = data.description,
        duration = notifyType.duration,
        icon = notifyType.icon,
        iconColor = notifyType.color
    })
end)

exports("SendServerNotification", function(target, data)
    TriggerClientEvent('custom_notify:display', target, data)
end)
