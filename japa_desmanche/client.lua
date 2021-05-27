-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD : ! Jp#2263 | https://discord.gg/HEtBSAJuJU
-----------------------------------------------------------------------------------------------------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

emp = Tunnel.getInterface('japa_desmanche')

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEL
-----------------------------------------------------------------------------------------------------------------------------------------

local etapa = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- COORDENADAS
-----------------------------------------------------------------------------------------------------------------------------------------

local desmanche = {
   [1] = {1376.17, -2063.85, 52.0},
--    [2] = {1368.89, -2069.29, 52.0},
--    [3] = {1358.17, -2068.29, 52.0} -- se quiser colocar uma segunda coordenada é so seguir o padrão
}

local texto = {1375.84,-2063.69,53.2}


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES 
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    
    while true do 

        local source = source
        local ped = PlayerPedId()
        local carro = GetVehiclePedIsIn(ped, true)
        local x,y,z = vRP.getPosition(source)
        
        for k,v in pairs(desmanche) do

            local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),v[1],v[2],v[3],true)

            if dist > 5 then
                Wait(1000)
            else
                DrawMarker(27, v[1],v[2],v[3]-0.96, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 0.5, 255, 0, 0, 50, false, false, 0, true)
                if dist <= 2 and etapa == 0 then
                    msg('APERTE ~b~E~w~ PARA COMEÇAR O DESMANCHE',4,0.5,0.93,0.50,255,255,255,180) 
                    if IsControlJustPressed(0, 46) and emp.japacheckcarro() and etapa == 0 then
                        etapa = 1
                        SetEntityCoords(carro, 1376.32, -2064.28, 52.0-1)
                        SetEntityHeading(carro, 39.45)
                        FreezeEntityPosition(carro, true)
                        for i = 0 , 7 do
                            SetVehicleDoorOpen(carro, i, false, true)
                        end
                    end 
                end
            end

            if etapa == 1 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist > 3 then
                    Wait(1000)
                else
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER A PORTA DO MOTORISTA~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1374.24,-2064.1,52.0-1,true)
                        SetEntityHeading(ped, 248.7)
                        vRP._playAnim(false,{{"anim@amb@business@weed@weed_inspecting_lo_med_hi@","weed_crouch_checkingleaves_idle_01_inspector"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 0, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 2
                        emp.jpcheckpegarporta()
                    end
                end
            end
            
            if etapa == 2 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist <= 3 then
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER A PORTA DO PASSAGEIRO DA FRENTE~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1376.21,-2062.26, 52.0-1,true)
                        SetEntityHeading(ped, 194.9)
                        vRP._playAnim(false,{{"anim@amb@business@weed@weed_inspecting_lo_med_hi@","weed_crouch_checkingleaves_idle_01_inspector"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 1, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 3
                        emp.jpcheckpegarporta()
                    end
                end
            end

            if etapa == 3 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist <= 3 then
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER A PORTA ESQUERDA DE TRÁS~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1374.96,-2064.73,52.0-1,true)
                        SetEntityHeading(ped, 242.8)
                        vRP._playAnim(false,{{"anim@amb@business@weed@weed_inspecting_lo_med_hi@","weed_crouch_checkingleaves_idle_01_inspector"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 2, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 4
                        emp.jpcheckpegarporta()
                    end
                end
            end
            
            if etapa == 4 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist <= 3 then
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER A PORTA DIREITA DE TRÁS~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1377.17,-2063.18,52.0-1,true)
                        SetEntityHeading(ped, 191.0)
                        vRP._playAnim(false,{{"anim@amb@business@weed@weed_inspecting_lo_med_hi@","weed_crouch_checkingleaves_idle_01_inspector"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 3, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 5
                        emp.jpcheckpegarporta()
                    end
                end
            end

            if etapa == 5 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist <= 3 then
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER CAPO~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1374.67,-2064.19,52.0-1,true)
                        SetEntityHeading(ped, 311.5)
                        vRP._playAnim(false,{{'mini@repair',"fixing_a_ped"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 4, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 6
                        emp.jpcheckpegarcapo()
                    end
                end
            end

            if etapa == 6 then
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),texto[1],texto[2],texto[3],true)
                if dist <= 3 then
                    DrawText3Ds(texto[1],texto[2],texto[3]-1,' ~g~ PRESSIONE~w~ ~h~[E]~h~ ~g~PARA REMOVER O PORTA-MALAS~w~')
                    if IsControlJustPressed(0, 46) then
                        SetEntityCoords(ped,1378.15,-2066.41,52.0-1,true)
                        SetEntityHeading(ped, 41.9)
                        vRP._playAnim(false,{{'mini@repair',"fixing_a_ped"}},false)
                        Wait(3000)
                        vRP._stopAnim()
                        SetVehicleDoorBroken(carro, 5, false)
                        Wait(200)
                        ClearAreaOfEverything(x, y, z, 20.0, false, false, false, false)
                        etapa = 0
                        TriggerEvent('Notify','sucesso','Você desmanchou o veículo tome seu dinheiro pela carcaça do carro')
                        emp.jpcheckpegarmalas()
                        TriggerServerEvent("desmancheVehicles")
                    end
                end
            end 
        end
        Wait(1)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTRAS FUNÇÕES 
-----------------------------------------------------------------------------------------------------------------------------------------

function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end

function msg(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD : ! Jp#2263 | https://discord.gg/HEtBSAJuJU
-----------------------------------------------------------------------------------------------------------------------------------------
