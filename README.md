# Aymina-Notify
An custom notification script made by Aymina-Development.

## Dependencies
None

## Installation

Step-1
Put the script in your resources.

Step-2
implement the exports in your scripts

## Configuration
Every thing is changeable in the config.lua
```
Config = {}

Config.DefaultPosition = "top-middle"

Config.Notifications = {
    success = {
        duration = 3000,
        icon = 'fa-check-circle',
        iconColor = '#28a745',
        backgroundColor = '#252323',
        textColor = '#ffffff',
        progressBarColor = '#28a745',
        leftBorderColor = '#28a745'
    },
    
    error = {
        duration = 3000,
        icon = 'fa-times-circle',
        iconColor = '#dc3545',
        backgroundColor = '#252323',
        textColor = '#ffffff',
        progressBarColor = '#dc3545',
        leftBorderColor = '#dc3545'
    },
    info = {
        duration = 5000,
        icon = 'fa-info-circle',
        iconColor = '#17a2b8',
        backgroundColor = '#252323',
        textColor = '#ffffff',
        progressBarColor = '#17a2b8',
        leftBorderColor = '#17a2b8'
    },
    warning = {
        duration = 4000,
        icon = 'fa-exclamation-triangle',
        iconColor = '#ffc107',
        backgroundColor = '#252323',
        textColor = '#ffffff',
        progressBarColor = '#ffc107',
        leftBorderColor = '#ffc107'
    }
}
```
## Exports
Use the exports in your extern scripts
```
client:

exports['Aymina-Notify']:SendNotification({
    type = "",
    title = "",
    description = ""
})

server:

TriggerClientEvent('Aymina-Notify:send', playerId, {
    type = "",
    title = "",
    description = ""
})
```
