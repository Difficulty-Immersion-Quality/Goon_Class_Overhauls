-- Master's Flourish
Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(character, status, causee, _)
	if status == "MASTERS_FLOURISH" then
        
		local DefensiveInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Defensive")
		local MobileInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Mobile")
		local SlashingInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Slashing")

		DefensiveInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"
		MobileInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"
		SlashingInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"

		DefensiveInterrupt.Cost = ""
		MobileInterrupt.Cost = ""
		SlashingInterrupt.Cost = ""

		DefensiveInterrupt:Sync()
		MobileInterrupt:Sync()
		SlashingInterrupt:Sync()
	end
end)

-- Master's Flourish Removal
Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(character, status, causee, _)
	if status == "MASTERS_FLOURISH" then

		local DefensiveInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Defensive")
		local MobileInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Mobile")
		local SlashingInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Slashing")

		DefensiveInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"
		MobileInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"
		SlashingInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"

		DefensiveInterrupt.Cost = "BardicInspiration:1"
		MobileInterrupt.Cost = "BardicInspiration:1"
		SlashingInterrupt.Cost = "BardicInspiration:1"

		DefensiveInterrupt:Sync()
		MobileInterrupt:Sync()
		SlashingInterrupt:Sync()
	end
end)

-- Master's Flourish Adjustments
Ext.Osiris.RegisterListener("GainedControl", 1, "after", function(character)
	if Osi.HasActiveStatus(character,"MASTERS_FLOURISH") == 1 then

		local DefensiveInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Defensive")
		local MobileInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Mobile")
		local SlashingInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Slashing")

		DefensiveInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"
		MobileInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"
		SlashingInterrupt.TooltipDamageList = "DealDamage(1d6, MainWeaponDamageType)"

		DefensiveInterrupt.Cost = ""
		MobileInterrupt.Cost = ""
		SlashingInterrupt.Cost = ""

		DefensiveInterrupt:Sync()
		MobileInterrupt:Sync()
		SlashingInterrupt:Sync()
		
	elseif Osi.HasActiveStatus(character,"MASTERS_FLOURISH") == 0 then

		local DefensiveInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Defensive")
		local MobileInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Mobile")
		local SlashingInterrupt = Ext.Stats.Get("Goon_Interrupt_BladeFlourish_Slashing")

		DefensiveInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"
		MobileInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"
		SlashingInterrupt.TooltipDamageList = "DealDamage(LevelMapValue(BardicInspiration), MainWeaponDamageType)"

		DefensiveInterrupt.Cost = "BardicInspiration:1"
		MobileInterrupt.Cost = "BardicInspiration:1"
		SlashingInterrupt.Cost = "BardicInspiration:1"

		DefensiveInterrupt:Sync()
		MobileInterrupt:Sync()
		SlashingInterrupt:Sync()
	end
end)