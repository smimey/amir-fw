local disabledPickups = {
    GetHashKey("PICKUP_WEAPON_ADVANCEDRIFLE"),
    GetHashKey("PICKUP_WEAPON_APPISTOL"),
    GetHashKey("PICKUP_WEAPON_ASSAULTRIFLE"),
    GetHashKey("PICKUP_WEAPON_ASSAULTRIFLE_MK2"),
    GetHashKey("PICKUP_WEAPON_ASSAULTSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_ASSAULTSMG"),
    GetHashKey("PICKUP_WEAPON_AUTOSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_BAT"),
    GetHashKey("PICKUP_WEAPON_BATTLEAXE"),
    GetHashKey("PICKUP_WEAPON_BOTTLE"),
    GetHashKey("PICKUP_WEAPON_BULLPUPRIFLE"),
    GetHashKey("PICKUP_WEAPON_BULLPUPRIFLE_MK2"),
    GetHashKey("PICKUP_WEAPON_BULLPUPSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_CARBINERIFLE"),
    GetHashKey("PICKUP_WEAPON_CARBINERIFLE_MK2"),
    GetHashKey("PICKUP_WEAPON_COMBATMG"),
    GetHashKey("PICKUP_WEAPON_COMBATMG_MK2"),
    GetHashKey("PICKUP_WEAPON_COMBATPDW"),
    GetHashKey("PICKUP_WEAPON_COMBATPISTOL"),
    GetHashKey("PICKUP_WEAPON_COMPACTLAUNCHER"),
    GetHashKey("PICKUP_WEAPON_COMPACTRIFLE"),
    GetHashKey("PICKUP_WEAPON_CROWBAR"),
    GetHashKey("PICKUP_WEAPON_DAGGER"),
    GetHashKey("PICKUP_WEAPON_DBSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_DOUBLEACTION"),
    GetHashKey("PICKUP_WEAPON_FIREWORK"),
    GetHashKey("PICKUP_WEAPON_FLAREGUN"),
    GetHashKey("PICKUP_WEAPON_FLASHLIGHT"),
    GetHashKey("PICKUP_WEAPON_GRENADE"),
    GetHashKey("PICKUP_WEAPON_GRENADELAUNCHER"),
    GetHashKey("PICKUP_WEAPON_GUSENBERG"),
    GetHashKey("PICKUP_WEAPON_GolfClub"),
    GetHashKey("PICKUP_WEAPON_HAMMER"),
    GetHashKey("PICKUP_WEAPON_HATCHET"),
    GetHashKey("PICKUP_WEAPON_HEAVYPISTOL"),
    GetHashKey("PICKUP_WEAPON_HEAVYSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_HEAVYSNIPER"),
    GetHashKey("PICKUP_WEAPON_HEAVYSNIPER_MK2"),
    GetHashKey("PICKUP_WEAPON_HOMINGLAUNCHER"),
    GetHashKey("PICKUP_WEAPON_KNIFE"),
    GetHashKey("PICKUP_WEAPON_KNUCKLE"),
    GetHashKey("PICKUP_WEAPON_MACHETE"),
    GetHashKey("PICKUP_WEAPON_MACHINEPISTOL"),
    GetHashKey("PICKUP_WEAPON_MARKSMANPISTOL"),
    GetHashKey("PICKUP_WEAPON_MARKSMANRIFLE"),
    GetHashKey("PICKUP_WEAPON_MARKSMANRIFLE_MK2"),
    GetHashKey("PICKUP_WEAPON_MG"),
    GetHashKey("PICKUP_WEAPON_MICROSMG"),
    GetHashKey("PICKUP_WEAPON_MINIGUN"),
    GetHashKey("PICKUP_WEAPON_MINISMG"),
    GetHashKey("PICKUP_WEAPON_MOLOTOV"),
    GetHashKey("PICKUP_WEAPON_MUSKET"),
    GetHashKey("PICKUP_WEAPON_NIGHTSTICK"),
    GetHashKey("PICKUP_WEAPON_PETROLCAN"),
    GetHashKey("PICKUP_WEAPON_PIPEBOMB"),
    GetHashKey("PICKUP_WEAPON_PISTOL"),
    GetHashKey("PICKUP_WEAPON_PISTOL50"),
    GetHashKey("PICKUP_WEAPON_PISTOL_MK2"),
    GetHashKey("PICKUP_WEAPON_POOLCUE"),
    GetHashKey("PICKUP_WEAPON_PROXMINE"),
    GetHashKey("PICKUP_WEAPON_PUMPSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_PUMPSHOTGUN_MK2"),
    GetHashKey("PICKUP_WEAPON_RAILGUN"),
    GetHashKey("PICKUP_WEAPON_RAYCARBINE"),
    GetHashKey("PICKUP_WEAPON_RAYMINIGUN"),
    GetHashKey("PICKUP_WEAPON_RAYPISTOL"),
    GetHashKey("PICKUP_WEAPON_REVOLVER"),
    GetHashKey("PICKUP_WEAPON_REVOLVER_MK2"),
    GetHashKey("PICKUP_WEAPON_RPG"),
    GetHashKey("PICKUP_WEAPON_SAWNOFFSHOTGUN"),
    GetHashKey("PICKUP_WEAPON_SMG"),
    GetHashKey("PICKUP_WEAPON_SMG_MK2"),
    GetHashKey("PICKUP_WEAPON_SMOKEGRENADE"),
    GetHashKey("PICKUP_WEAPON_SNIPERRIFLE"),
    GetHashKey("PICKUP_WEAPON_SNSPISTOL"),
    GetHashKey("PICKUP_WEAPON_SNSPISTOL_MK2"),
    GetHashKey("PICKUP_WEAPON_SPECIALCARBINE"),
    GetHashKey("PICKUP_WEAPON_SPECIALCARBINE_MK2"),
    GetHashKey("PICKUP_WEAPON_STICKYBOMB"),
    GetHashKey("PICKUP_WEAPON_STONE_HATCHET"),
    GetHashKey("PICKUP_WEAPON_STUNGUN"),
    GetHashKey("PICKUP_WEAPON_SWITCHBLADE"),
    GetHashKey("PICKUP_WEAPON_VINTAGEPISTOL"),
    GetHashKey("PICKUP_WEAPON_WRENCH")

}
AddEventHandler('np-spawn:characterSpawned', function ()
    local playerId = PlayerId()
    for _, hash in pairs(disabledPickups) do
        ToggleUsePickupsForPlayer(playerId, hash, false)
    end
end)