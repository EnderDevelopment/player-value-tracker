local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('fivemscript:updateValue')
AddEventHandler('fivemscript:updateValue', function(value)
    ESX.ShowNotification('Your value is now: ' .. value)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then -- E key
            TriggerServerEvent('fivemscript:getValue')
        end
    end
end)