-- TODO: Gotta be a better way of going about this... it changes for everyone even if only one character has it? lmao

local function ApplyMastersFlourishState(character, enabled)
    local function apply(statName)
        local stat = Ext.Stats.Get(statName)
        if not stat then return end

        if enabled then
            stat.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"
            stat.Cost = ""
        else
            stat.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"
            stat.Cost = "BardicInspiration:1"
        end

        stat:Sync()
    end

    apply("Goon_Interrupt_BladeFlourish_Defensive")
    apply("Goon_Interrupt_BladeFlourish_Mobile")
    apply("Goon_Interrupt_BladeFlourish_Slashing")
end

Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(character, status, causee, _)
    if status == "MASTERS_FLOURISH" then
        if Osi.HasPassive(character, "MastersFlourish") == 1 then
            ApplyMastersFlourishState(character, true)
        end
    end
end)

Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(character, status, causee, _)
    if status == "MASTERS_FLOURISH" then
        if Osi.HasPassive(character, "MastersFlourish") == 1 then
            ApplyMastersFlourishState(character, false)
        end
    end
end)

Ext.Osiris.RegisterListener("GainedControl", 1, "after", function(character)
    if Osi.HasPassive(character, "MastersFlourish") == 1 then
        ApplyMastersFlourishState(character, Osi.HasActiveStatus(character, "MASTERS_FLOURISH") == 1)
    end
end)