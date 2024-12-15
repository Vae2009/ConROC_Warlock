ConROC.Warlock = {};

local ConROC_Warlock, ids = ...;
local currentSpecName;
local currentSpecID;

function ConROC:EnableRotationModule()
	self.Description = 'Warlock';
	self.NextSpell = ConROC.Warlock.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	self.lastSpellId = 0;
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warlock.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()
    currentSpecID = ConROC:currentSpec("ID")

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end

ConROC:SpecUpdate()

function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end

local Racial, Spec, Caster, Ability, Rank, Aff_Talent, Demo_Talent, Dest_Talent, Pet, Runes, Buff, Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Ability, ids.Rank, ids.Affliction_Talent, ids.Demonology_Talent, ids.Destruction_Talent, ids.Pet, ids.Runes, ids.Buff, ids.Debuff;

--Info
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConROC:PercentHealth('player');
local _is_PvP = ConROC:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConROC:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConROC:PercentHealth('target');

--Resources
local _Mana, _Mana_Max, _Mana_Percent = ConROC:PlayerPower('Mana');
local _SoulShards = GetItemCount(6265);

--Conditions
local _Queue = 0;
local _Has_Wand = HasWandEquipped();
local _is_moving = ConROC:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
local _enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
local _enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Berserking, _Berserking_RDY = _, _;
local _EscapeArtist, _EscapeArtist_RDY = _, _;
local _Perception, _Perception_RDY = _, _;

function ConROC:Stats()
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConROC:PercentHealth('player');
	_is_PvP = ConROC:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConROC:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConROC:PercentHealth('target');

	_Mana, _Mana_Max, _Mana_Percent = ConROC:PlayerPower('Mana');
	_SoulShards = GetItemCount(6265);

	_Queue = 0;
	_Has_Wand = HasWandEquipped();
	_is_moving = ConROC:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
	_enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
	_enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_Berserking, _Berserking_RDY = ConROC:AbilityReady(Racial.Berserking, timeShift);
	_EscapeArtist, _EscapeArtist_RDY = ConROC:AbilityReady(Racial.EscapeArtist, timeShift);
	_Perception, _Perception_RDY = ConROC:AbilityReady(Racial.Perception, timeShift);
end

function ConROC.Warlock.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	ConROC:Stats();

--Abilities
	local _DrainLife, _DrainLife_RDY = ConROC:AbilityReady(Ability.DrainLife, timeShift);
	   local _DrainLife_DEBUFF = ConROC:TargetAura(_DrainLife, timeShift);
    local _AmplifyCurse, _AmplifyCurse_RDY = ConROC:AbilityReady(Ability.AmplifyCurse, timeShift);
	local _Corruption, _Corruption_RDY = ConROC:AbilityReady(Ability.Corruption, timeShift);
		local _Corruption_DEBUFF = ConROC:TargetAura(_Corruption);
	local _CurseofAgony, _CurseofAgony_RDY = ConROC:AbilityReady(Ability.CurseofAgony, timeShift);
		local _CurseofAgony_DEBUFF = ConROC:TargetAura(_CurseofAgony);
	local _CurseofDoom, _CurseofDoom_RDY = ConROC:AbilityReady(Ability.CurseofDoom, timeShift);
		local _CurseofDoom_DEBUFF = ConROC:TargetAura(_CurseofDoom);
	local _CurseofExhaustion, _CurseofExhaustion_RDY = ConROC:AbilityReady(Ability.CurseofExhaustion, timeShift);
		local _CurseofExhaustion_DEBUFF = ConROC:TargetAura(_CurseofExhaustion);
    local _CurseofRecklessness, _CurseofRecklessness_RDY = ConROC:AbilityReady(Ability.CurseofRecklessness, timeShift);
        local _CurseofRecklessness_DEBUFF = ConROC:TargetAura(_CurseofRecklessness);
	local _CurseofShadow, _CurseofShadow_RDY = ConROC:AbilityReady(Ability.CurseofShadow, timeShift);
        local _CurseofShadow_DEBUFF = ConROC:TargetAura(_CurseofShadow);
    local _CurseofTongues, _CurseofTongues_RDY = ConROC:AbilityReady(Ability.CurseofTongues, timeShift);
		local _CurseofTongues_DEBUFF = ConROC:TargetAura(_CurseofTongues);
	local _CurseoftheElements, _CurseoftheElements_RDY = ConROC:AbilityReady(Ability.CurseoftheElements, timeShift);
		local _CurseoftheElements_DEBUFF = ConROC:TargetAura(_CurseoftheElements);
    local _CurseofWeakness, _CurseofWeakness_RDY = ConROC:AbilityReady(Ability.CurseofWeakness, timeShift);
		local _CurseofWeakness_DEBUFF = ConROC:TargetAura(_CurseofWeakness);
	local _DrainMana, _DrainMana_RDY = ConROC:AbilityReady(Ability.DrainMana, timeShift);
	local _DrainSoul, _DrainSoul_RDY = ConROC:AbilityReady(Ability.DrainSoul, timeShift);
	local _LifeTap, _LifeTap_RDY = ConROC:AbilityReady(Ability.LifeTap, timeShift);
    local _SiphonLife, _SiphonLife_RDY = ConROC:AbilityReady(Ability.SiphonLife, timeShift);
        local _SiphonLife_DEBUFF = ConROC:TargetAura(_SiphonLife);
	local _SummonFelhunter, _SummonFelhunter_RDY = ConROC:AbilityReady(Ability.SummonFelhunter, timeShift);
	local _SummonImp, _SummonImp_RDY = ConROC:AbilityReady(Ability.SummonImp, timeShift);
	local _SummonSuccubus, _SummonSuccubus_RDY = ConROC:AbilityReady(Ability.SummonSuccubus, timeShift);
	local _SummonVoidwalker, _SummonVoidwalker_RDY = ConROC:AbilityReady(Ability.SummonVoidwalker, timeShift);
	local _Conflagrate, _Conflagrate_RDY = ConROC:AbilityReady(Ability.Conflagrate, timeShift);
	local _Hellfire, _Hellfire_RDY = ConROC:AbilityReady(Ability.Hellfire, timeShift);
	local _Immolate, _Immolate_RDY = ConROC:AbilityReady(Ability.Immolate, timeShift);
		local _Immolate_DEBUFF = ConROC:TargetAura(_Immolate, timeShift);
	local _RainofFire, _RainofFire_RDY = ConROC:AbilityReady(Ability.RainofFire, timeShift);
	local _SearingPain, _SearingPain_RDY = ConROC:AbilityReady(Ability.SearingPain, timeShift);
	local _ShadowBolt, _ShadowBolt_RDY = ConROC:AbilityReady(Ability.ShadowBolt, timeShift);
		local _ShadowTrance_BUFF = ConROC:Aura(Buff.ShadowTrance, timeShift);
	local _Shadowburn, _Shadowburn_RDY = ConROC:AbilityReady(Ability.Shadowburn, timeShift);
	local _SoulFire, _SoulFire_RDY = ConROC:AbilityReady(Ability.SoulFire, timeShift);

--Runed
    local _Haunt, _Haunt_RDY = ConROC:AbilityReady(Runes.Haunt, timeShift);
        local _Haunt_DEBUFF = ConROC:TargetAura(_Haunt, timeShift);
    	local _LakeofFire_DEBUFF = ConROC:TargetAura(Runes.LakeofFire, timeShift);
    local _Metamorphosis, _Metamorphosis_RDY = ConROC:AbilityReady(Runes.Metamorphosis, timeShift);
    local _ChaosBolt, _ChaosBolt_RDY = ConROC:AbilityReady(Runes.ChaosBolt, timeShift);
    local _DemonicGrace, _DemonicGrace_RDY = ConROC:AbilityReady(Runes.DemonicGrace, timeShift);
    local _Incinerate, _Incinerate_RDY = ConROC:AbilityReady(Runes.Incinerate, timeShift);
        local _, _, _, _Incinerate_BUFF = ConROC:Aura(_Incinerate, timeShift);
    local _MasterChanneler, _MasterChanneler_RDY = ConROC:AbilityReady(Runes.MasterChanneler, timeShift);
    local _SoulSiphon, _SoulSiphon_RDY = ConROC:AbilityReady(Runes.SoulSiphon, timeShift);

--Pet
    local _SpellLock, _SpellLock_RDY = ConROC:AbilityReady(Pet.SpellLock, timeShift, 'pet');

--Conditions		
	local summoned = ConROC:CallPet();
	local assist = ConROC:PetAssist();
	local tarHasMana = UnitPower('target', Enum.PowerType.Mana);

--Indicators
	ConROC:AbilityBurst(_SoulFire, _SoulFire_RDY);
	ConROC:AbilityBurst(_AmplifyCurse, _AmplifyCurse_RDY and (ConROC:CheckBox(ConROC_SM_Curse_Weakness) or ConROC:CheckBox(ConROC_SM_Curse_Agony)));

    ConROC:AbilityInterrupt(_SpellLock, ConROC:Interrupt() and _SpellLock_RDY)

--Warnings
	if not assist and summoned and _in_combat then
		ConROC:Warnings("Pet is NOT attacking!!!", true);
	end

--Rotations	
	--Demons--
	if ConROC:CheckBox(ConROC_SM_Demon_Felhunter) and _SummonFelhunter_RDY and not summoned then
		return _SummonFelhunter;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Imp) and _SummonImp_RDY and not summoned then
		return _SummonImp;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Succubus) and _SummonSuccubus_RDY and not summoned then
		return _SummonSuccubus;
	end

    if ConROC:CheckBox(ConROC_SM_Demon_Incubus) and sumIncRDY and not summoned then
        return _SummonIncubus;
    end

	if ConROC:CheckBox(ConROC_SM_Demon_Voidwalker) and _SummonVoidwalker_RDY and not summoned then
		return _SummonVoidwalker;
	end

	--spells
    if ConROC.Seasons.IsSoD then --DPS rotation for SoD
        if _LifeTap_RDY and ((_Mana_Percent < 20 and _Player_Percent_Health >= 30) or (_is_moving and _Mana_Percent < 60 and not _Shadowburn_RDY) ) then
            return _LifeTap;
        end

        if (currentSpecID == ids.Spec.Affliction) then
            if not _in_combat and _Incinerate_RDY and not _Incinerate_BUFF then
                return _Incinerate
            end
            if _ShadowBolt_RDY and _ShadowTrance_BUFF then
                return _ShadowBolt;
            end
            if _Haunt_RDY and not _Haunt_DEBUFF then
                return _Haunt;
            end
            if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
                return _Corruption;
            end
            if _DrainLife_RDY and IsSpellKnownOrOverridesKnown(_MasterChanneler) and not _DrainLife_DEBUFF then
                return _DrainLife
            end
            if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF then --and IsSpellKnownOrOverridesKnown() then
                return _Immolate
            end
            if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofRecklessness;
            end
            if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofAgony;
            end
            if _Incinerate_RDY then
                return _Incinerate
            end
            return nil
        end
        --[[
        if (currentSpecID == ids.Spec.Demonology) then
        end
        ]]
        if (currentSpecID == ids.Spec.Destruction) then
            if not _in_combat and _Incinerate_RDY and not _Incinerate_BUFF then
                return _Incinerate
            end
            if _Shadowburn_RDY and (_is_moving or ((_Target_Percent_Health <= 5 and ConROC:Raidmob()) or (_Target_Percent_Health <= 20 and not ConROC:Raidmob()))) then
                return _Shadowburn
            end
            if IsSpellKnownOrOverridesKnown(_LakeofFire) and _RainofFire_RDY and not _LakeofFire_DEBUFF then
                return _RainofFire;
            end
            if _ChaosBolt_RDY then
                return _ChaosBolt;
            end
            if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF then
                return _Immolate
            end
        --Curses
            if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofWeakness;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofAgony;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofRecklessness;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofTongues;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then
                return _CurseofExhaustion;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseoftheElements;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
                return _CurseofShadow;
            end

            if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
                return _CurseofDoom;
            end
            if _Incinerate_RDY then
                return _Incinerate
            end
            return nil
        end

        if _DrainMana_RDY and tarHasMana > 0 and _Mana_Percent < 20 then
            return _DrainMana;
        end
        if _DrainLife_RDY and _Player_Percent_Health <= 30 then
            return _DrainLife;
        end
        if _ShadowBolt_RDY and _ShadowTrance_BUFF then
            return _ShadowBolt;
        end
        if _Haunt_RDY and not _Haunt_DEBUFF then
            return _Haunt;
        end
        if lastSpellId == _Incinerate and _Immolate_RDY and not _Immolate_DEBUFF then
            return _Immolate
        end
        if _DrainLife_RDY and IsSpellKnownOrOverridesKnown(_MasterChanneler) and not _DrainLife_DEBUFF then
            return _DrainLife
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Corruption;
        end

        --Curses
        if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofWeakness;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofAgony;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofRecklessness;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofTongues;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then 
            return _CurseofExhaustion;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseoftheElements;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofShadow;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
            return _CurseofDoom;
        end
        if _Incinerate_RDY and not _Incinerate_BUFF then
            return _Incinerate
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF then --and IsSpellKnownOrOverridesKnown() then
            return _Immolate
        end
        if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
            return _ShadowBolt;
        end
    else --not SoD
    	if _LifeTap_RDY and _Mana_Percent < 20 and _Player_Percent_Health >= 30 then
    		return _LifeTap;
    	end

    	if _DrainMana_RDY and tarHasMana > 0 and _Mana_Percent < 20 then
    		return _DrainMana;
    	end
    	if _DrainLife_RDY and _Player_Percent_Health <= 30 then
    		return _DrainLife;
    	end
    	if _ShadowBolt_RDY and _ShadowTrance_BUFF then
            return _ShadowBolt;
        end

        if _Conflagrate_RDY and _Immolate_DEBUFF then
            return _Conflagrate;
        end

        if _Shadowburn_RDY and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then
            return _Shadowburn;
        end

        if _DrainSoul_RDY and _SoulShards < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then --Soul Shard counter needed.
            return _DrainSoul;
        end

        if _DrainMana_RDY and tarHasMana > 0 and _Mana_Percent < 20 then
            return _DrainMana;
        end

        if _LifeTap_RDY and _Mana_Percent < 20 and _Player_Percent_Health >= 30 then
            return _LifeTap;
        end

        if ConROC_AoEButton:IsVisible() and _Hellfire_RDY and inMelee and _Player_Percent_Health >= 30 then
            return _Hellfire;
        end

        if ConROC_AoEButton:IsVisible() and _RainofFire_RDY then
            return _RainofFire;
        end

        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Corruption;
        end

        --Curses
        if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofWeakness;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofAgony;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofRecklessness;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofTongues;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then 
            return _CurseofExhaustion;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseoftheElements;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofShadow;
        end

        if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
            return _CurseofDoom;
        end

        if ConROC:CheckBox(ConROC_SM_Debuff_SiphonLife) and _SiphonLife_RDY and not _SiphonLife_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _SiphonLife;
        end

        if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Immolate;
        end

        if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and (_Mana_Percent <= 20 or _Target_Percent_Health <= 5) then
            return Caster.Shoot;
        end

        if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
            return _ShadowBolt;
        end

        if ConROC:CheckBox(ConROC_SM_Spell_SearingPain) and _SearingPain_RDY then
            return _SearingPain;
        end
     return nil;
    end
--[[
    if IsEquippedItem(40432) and not UnitAffectingCombat("player") and iothCount <=9 and _Player_Percent_Health >= 30 and ConROC:CheckBox(ConROC_SM_Option_PrePull) and ConROC:TarHostile() and ConROC:IsGlyphActive(63320) then
		return _LifeTapRank1
	elseif not (sotdBUFF or lifeTapBUFF) and not UnitAffectingCombat("player") and _Player_Percent_Health >= 30 and ConROC:TarHostile() and ConROC:IsGlyphActive(63320) then
		return _LifeTapRank1;
	end

	if (currentSpecID == ids.Spec.Affliction) then
		if _ShadowBolt_RDY and not UnitAffectingCombat("player") then
			return _ShadowBoltRank1
		end

		if _ShadowBolt_RDY and _ShadowTrance_BUFF then
			return _ShadowBolt;
		end

		if _DrainSoul_RDY and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then
			return _DrainSoul;
		end 
		
		if ConROC:TalentChosen(Spec.Affliction, Aff_Talent.UnstableAffliction) and unsAffRDY and not unsAffDEBUFF then
			return _UnstableAffliction;
		end

		if ConROC:TalentChosen(Spec.Affliction, Aff_Talent.Haunt) and hauntRDY and not hauntDEBUFF then
			return _Haunt;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Corruption;
		end

		--Curses
		if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
			return _CurseofWeakness;
		end
		
		if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
			return _CurseofAgony;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
			return _CurseofTongues;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then 
			return _CurseofExhaustion;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
			return _CurseoftheElements;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
			return _CurseofDoom;
		end	

		-- Metamorphosis 
		if ConROC:CheckBox(ConROC_SM_Option_Metamorphosis) and metaRDY and ConROC:TalentChosen(Spec.Demonology, Demo_Talent.Metamorphosis) and inMelee then
			return _Metamorphosis;
		end
		
		if _Conflagrate_RDY and _Immolate_DEBUFF or sflameDEBUFF then
			return _Conflagrate;
		end
		
		if cBoltRDY then
			return _ChaosBolt;
		end
		
		if incRDY and _Immolate_DEBUFF then
			return _Incinerate;
		end
		
		if _Shadowburn_RDY and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then
			return _Shadowburn;
		end
		
		if _DrainSoul_RDY and _SoulShards < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then --Soul Shard counter needed.
			return _DrainSoul;
		end

		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_SeedofCorruption) and seedRDY and not seedDEBUFF then
			return _SeedofCorruption;
		end

		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Hellfire) and _Hellfire_RDY and inMelee and _Player_Percent_Health >= 30 then
			return _Hellfire;
		end
		
		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_RainofFire) and _RainofFire_RDY then
			return _RainofFire;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Immolate;
		end

		if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and (_Mana_Percent <= 20 or _Target_Percent_Health <= 5) then
			return Caster.Shoot;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
			return _ShadowBolt;
		end
		
		if ConROC:CheckBox(ConROC_SM_Spell_SearingPain) and _SearingPain_RDY then
			return _SearingPain;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Corruption;
		end
	elseif (currentSpecID == ids.Spec.Demonology) then
		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
			return _CurseofDoom;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Corruption;
		end		
		
		if _SoulFire_RDY and decBUFF then
			return _SoulFire
		end
		if incRDY and mcoreBUFF then
			return _Incinerate;
		end

		if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
			return _ShadowBolt;
		end
	elseif (currentSpecID == ids.Spec.Destruction) then
		if ConROC_AoEButton:IsVisible() then
			if ConROC:CheckBox(ConROC_SM_AoE_SeedofCorruption) and seedRDY and not seedDEBUFF then
				return _SeedofCorruption;
			end
			if sfuryRDY then
				return _Shadowfury;
			end
			if sumInfernoRDY then
				return _Inferno;
			end
			if ConROC:CheckBox(ConROC_SM_AoE_Hellfire) and _Hellfire_RDY and inMelee and _Player_Percent_Health >= 30 then
				return _Hellfire;
			end			
			if ConROC:CheckBox(ConROC_SM_AoE_RainofFire) and _RainofFire_RDY then
				return _RainofFire;
			end
			if sflameRDY and inMelee then
				return _ShadowFlame;
			end
		end
		if _SoulFire_RDY and not UnitAffectingCombat("player") then
			return _SoulFire
		end

		if _is_moving and ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Corruption;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then 
			return _CurseofDoom;
		end
		if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
			return _CurseofAgony;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
			return _Immolate;
		end

		if _Conflagrate_RDY and _Immolate_DEBUFF or sflameDEBUFF then
			return _Conflagrate;
		end
		
		if cBoltRDY and currentSpell ~= _Immolate then
			return _ChaosBolt;
		end
		
		if incRDY and _Immolate_DEBUFF and currentSpell ~= _Immolate then
			return _Incinerate;
		end

		if _DrainSoul_RDY and _SoulShards < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then --Soul Shard counter needed.
			return _DrainSoul;
		end
    elseif _Player_Level < 10 then
        if _ShadowBolt_RDY and not UnitAffectingCombat("player") then
            return _ShadowBoltRank
        end
        if _ShadowBolt_RDY and _ShadowTrance_BUFF then
            return _ShadowBolt;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Corruption;
        end
        if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofWeakness;
        end
        
        if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then 
            return _CurseofAgony;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Immolate;
        end
        if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
            return _ShadowBolt;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
            return _Corruption;
        end
        return nil;
	end
	return nil;
    --]]
end

function ConROC.Warlock.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	ConROC:Stats();

--Abilities
	local _DrainLife, _DrainLife_RDY = ConROC:AbilityReady(Ability.DrainLife, timeShift);
	local _DemonArmor, _DemonArmor_RDY = ConROC:AbilityReady(Ability.DemonArmor, timeShift);
		local _DemonArmor_BUFF = ConROC:Aura(_DemonArmor, timeShift);
	local _HealthFunnel, _HealthFunnel_RDY = ConROC:AbilityReady(Ability.HealthFunnel, timeShift);
	local _SoulLink, _SoulLink_RDY = ConROC:AbilityReady(Ability.SoulLink, timeShift);
		local _SoulLink_BUFF = ConROC:Aura(_SoulLink, timeShift);

--Conditions
	local petPh = ConROC:PercentHealth('pet');
	local summoned = ConROC:CallPet();

--Rotations	
	if _DemonArmor_RDY and not _DemonArmor_BUFF then
		return _DemonArmor;
	end

	if _SoulLink_RDY and not _SoulLink_BUFF then
		return _SoulLink;
	end

	if _DrainLife_RDY and _Player_Percent_Health <= 30 then
		return _DrainLife;
	end

	if _HealthFunnel_RDY and petPh <= 25 and _Player_Percent_Health >= 50 and not ConROC:TarYou() then
		return _HealthFunnel;
	end
return nil;
end