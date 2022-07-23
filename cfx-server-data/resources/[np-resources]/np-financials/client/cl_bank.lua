local closedBanks = {}
local listening = false
local isBankInterfaceOpen = false

local bankLocations = {{
    name = "Bank",
    coords = vector3(150.266, -1040.203, 29.374)
}, {
    name = "Bank",
    coords = vector3(-1212.980, -330.841, 37.787)
}, {
    name = "Bank",
    coords = vector3(-2962.582, 482.627, 15.703)
}, {
    name = "Bank",
    coords = vector3(314.187, -278.621, 54.170)
}, {
    name = "Bank",
    coords = vector3(-351.534, -49.529, 49.042)
}, {
    name = "Bank",
    coords = vector3(241.727, 220.706, 106.286)
}, {
    name = "Bank",
    coords = vector3(1176.0833740234, 2706.3386230469, 38.157722473145)
}, {
    name = "Bank",
    coords = vector3(-1318.5, -832.16, 16.98)
}}

-- Display Map Blips
Citizen.CreateThread(function()
    for _, item in pairs(bankLocations) do
        item.blip = AddBlipForCoord(item.coords)
        SetBlipSprite(item.blip, 108)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
    end
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(1175.8, 2706.82, 38.09), 2.95, 0.8, {
        heading = 271,
        minZ = 36.99,
        maxZ = 40.59
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(-2962.62, 482.18, 15.7), 2.95, 0.8, {
        heading = 177,
        minZ = 14.6,
        maxZ = 18.2
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(252.63, 221.23, 106.29), 2.95, 0.8, {
        heading = 70,
        minZ = 105.19,
        maxZ = 108.79
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(242.22, 224.99, 106.29), 2.95, 0.8, {
        heading = 70,
        minZ = 105.19,
        maxZ = 108.79
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(-1213.29, -331.08, 37.78), 2.95, 0.8, {
        heading = 118,
        minZ = 36.58,
        maxZ = 40.18
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(-351.63, -49.67, 49.04), 2.95, 0.8, {
        heading = 71,
        minZ = 47.99,
        maxZ = 51.39
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(313.58, -278.91, 53.92), 2.95, 0.8, {
        heading = 70,
        minZ = 52.87,
        maxZ = 56.27
    })
    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(149.22, -1040.5, 29.37), 2.95, 0.8, {
        heading = 70,
        minZ = 28.32,
        maxZ = 31.72
    })

    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(-112.37, 6469.46, 31.63), 5.2, 1.2, {
        heading = 45,
        minZ = 30.63,
        maxZ = 33.23
    })

    exports["np-polyzone"]:AddBoxZone("bank_zone", vector3(-1308.8, -824.29, 17.14), 1.6, 6.0, {
        heading = 217,
        minZ = 15.94,
        maxZ = 18.74
    })

end)

local function listenForKeypress()
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) and not isBankInterfaceOpen then
                openBankInterface()
            end
            Wait(0)
        end
    end)
end

RegisterCommand('banking', function()
    openBankInterface()
end)

AddEventHandler("np-polyzone:enter", function(zone)
    if zone ~= "bank_zone" then
        return
    end
    exports["np-ui"]:showInteraction("[E] Use Bank")
    listenForKeypress()
end)

AddEventHandler("np-polyzone:exit", function(zone)
    if zone ~= "bank_zone" then
        return
    end
    exports["np-ui"]:hideInteraction()
    listening = false
end)

AddEventHandler("np-ui:application-closed", function(name, data)
    if name ~= "atm" then
        return
    end
    SetNuiFocus(false, false)
    financialAnimation(data.is_atm, false)
    Wait(1400)
    isBankInterfaceOpen = false
    if isInside then
        exports["np-ui"]:showInteraction("[E] Use Bank")
    end
end)

function openBankInterface()
  local stateId = exports['isPed']:isPed('cid')
  local hasBankAccount, accountId = RPC.execute("GetDefaultBankAccount", stateId)
    exports["np-ui"]:hideInteraction()
    financialAnimation(false, true)
    Citizen.Wait(1400)
    isBankInterfaceOpen = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        type = "open",
        character_id = stateId,
        account_id = nil,
        account_name = nil
    })
    -- exports["np-ui"]:openApplication("atm")
end

AddEventHandler('np-island:hideBlips', function(pState)
    for _, loc in pairs(bankLocations) do
        if DoesBlipExist(loc.blip) then
            if pState then
                SetBlipAlpha(loc.blip, 0)
                SetBlipHiddenOnLegend(loc.blip, true)
            else
                SetBlipAlpha(loc.blip, 255)
                SetBlipHiddenOnLegend(loc.blip, false)
            end
        end
    end
end)
