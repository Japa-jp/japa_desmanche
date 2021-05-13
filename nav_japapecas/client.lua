-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "porta" then
		TriggerServerEvent("peças-vender","porta")
	elseif data == "capo" then
		TriggerServerEvent("peças-vender","capo")
	elseif data == "porta-malas" then
		TriggerServerEvent("peças-vender","porta-malas")


	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local japa = 500
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1370.84,-2068.95,52.01,true)
		if distance <= 15 then
			japa = 5
			DrawMarker(21,1370.84,-2068.95,52.01-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
			if distance <= 1.2 then
				japa = 5
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
		Wait(japa)
	end
end)