local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("goto", function(source, args, raw)
	if args[1] ~= nil then
		local postalCode = args[1]
		setWaypoint(postalCode)
	else
		QBCore.Functions.Notify('No Postal', 'error')
	end
end, false)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/goto', 'Marks A Postal To Go To',)
end)

function setWaypoint(postalCode)
	local postalCode_coords = vector2(0,0)
	for i = 1, #Config.postalcodes, 1 do
		if Config.postalcodes[i].code == postalCode then
			postalCode_coords = vector2(Config.postalcodes[i].x, Config.postalcodes[i].y)
		end
	end
	
	if postalCode_coords.x ~= 0.0 and postalCode_coords.y ~= 0.0 then
		SetNewWaypoint(postalCode_coords.x, postalCode_coords.y)
	else
		QBCore.Functions.Notify('No Postal', 'error')
	end
	
end