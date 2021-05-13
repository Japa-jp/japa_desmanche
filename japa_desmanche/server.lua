-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD : ! Jp#2263 | https://discord.gg/HEtBSAJuJU
-----------------------------------------------------------------------------------------------------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emp = {}

Tunnel.bindInterface('japa_desmanche',emp)


function emp.japacheckperm()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id,'mindmaster.permissao') 
end

function emp.japacheckcarro()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,work = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
				if #vehicle <= 0 then
					TriggerClientEvent("Notify",source,"importante","Veículo não encontrado na lista do proprietário.",8000)
					return
				end
				if parseInt(vehicle[1].detido) == 1 then
					TriggerClientEvent("Notify",source,"aviso","Veículo encontra-se apreendido na seguradora.",8000)
					return
				end
				if banned then
					TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem ser desmanchados.",8000)
					return
				end
				
			end
			return true					
		end
	end
end

function emp.jpcheckpegarporta()
	local source = source
	local user_id = source
	vRP.giveInventoryItem(user_id,'porta',1)
end

function emp.jpcheckpegarcapo()
	local source = source
	local user_id = source
	vRP.giveInventoryItem(user_id,'capo',1)
end

function emp.jpcheckpegarmalas()
	local source = source
	local user_id = source
	vRP.giveInventoryItem(user_id,'porta-malas',1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD : ! Jp#2263 | https://discord.gg/HEtBSAJuJU
-----------------------------------------------------------------------------------------------------------------------------------------
