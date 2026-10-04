local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('fivemscript:getValue', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT value FROM ' .. Config.Database.TableName .. ' WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result then
            cb(result)
            TriggerClientEvent('fivemscript:updateValue', source, result)
        else
            MySQL.Async.execute('INSERT INTO ' .. Config.Database.TableName .. ' (player_id, value) VALUES (@player_id, @value)', {
                ['@player_id'] = playerId,
                ['@value'] = Config.Settings.DefaultValue
            }, function(rowsChanged)
                cb(Config.Settings.DefaultValue)
                TriggerClientEvent('fivemscript:updateValue', source, Config.Settings.DefaultValue)
            end)
        end
    end)
end)

RegisterServerEvent('fivemscript:getValue')
AddEventHandler('fivemscript:getValue', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT value FROM ' .. Config.Database.TableName .. ' WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result then
            TriggerClientEvent('fivemscript:updateValue', _source, result)
        else
            MySQL.Async.execute('INSERT INTO ' .. Config.Database.TableName .. ' (player_id, value) VALUES (@player_id, @value)', {
                ['@player_id'] = playerId,
                ['@value'] = Config.Settings.DefaultValue
            }, function(rowsChanged)
                TriggerClientEvent('fivemscript:updateValue', _source, Config.Settings.DefaultValue)
            end)
        end
    end)
end)