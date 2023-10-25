function Check_civilian_killed_by_player(attacker_unit, damage_info)
    if alive(attacker_unit) and attacker_unit == managers.player:player_unit() and damage_info then
        if damage_info.result.type == "death" then
            CivKillsTracker.values.civs_killed_new = CivKillsTracker.values.civs_killed_new + 1
            log("Civilians killed: " .. tonumber(CivKillsTracker.values.civs_killed_new))
        end
    end
end

Hooks:PostHook(CivilianDamage, "_on_damage_received", "KilledCiviliansTracker", function(self, damage_info)
    Check_civilian_killed_by_player(damage_info.attacker_unit, damage_info)
end)