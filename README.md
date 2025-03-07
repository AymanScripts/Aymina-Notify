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
Config.Notifications = {
    success = {
        icon = "fa-check-circle",
        color = "#28a745",
        duration = 5000,
        fontColor = "#FFFFFF",  
        backgroundColor = "#252323",  
        fontFamily = "Poppins, sans-serif"  
    },
    error = {
        icon = "fa-times-circle",
        color = "#dc3545",
        duration = 5000,
        fontColor = "#FFFFFF",  
        backgroundColor = "#252323",  
        fontFamily = "Poppins, sans-serif"  
    },
    info = {
        icon = "fa-info-circle",
        color = "#17a2b8",
        duration = 5000,
        fontColor = "#FFFFFF",  
        backgroundColor = "#252323",  
        fontFamily = "Poppins, sans-serif"  
    },
    warning = {
        icon = "fa-exclamation-triangle",
        color = "#ffc107",
        duration = 5000,
        fontColor = "#FFFFFF", 
        backgroundColor = "#252323",  
        fontFamily = "Poppins, sans-serif"  
    },
}
```
## Exports
Use the exports in your extern scripts
```
client:

exports['Notify']:SendNotification({
    type = "",
    title = "",
    description = ""
})

server:

exports['Notify']:SendServerNotification(playerId, {
    type = "",
    title = "",
    description = ""
})
```
