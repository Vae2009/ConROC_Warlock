ConROC.Warlock = {};

local ConROC_Warlock, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = 'Warlock';
	self.NextSpell = ConROC.Warlock.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	if ConROCSpellmenuClass == nil then
		ConROC:SpellmenuClass();
	end
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warlock.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

local Racial, Spec, Caster, Ability, Rank, Aff_Talent, Demo_Talent, Dest_Talent, Pet, Engrave, Runes, Buff, Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Ability, ids.Rank, ids.Affliction_Talent, ids.Demonology_Talent, ids.Destruction_Talent, ids.Pet, ids.Engrave, ids.Runes, ids.Buff, ids.Debuff;

--Info
local _Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
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
local _enemies_in_30yrds, _target_in_30yrds = ConROC:Targets("30");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Berserking, _Berserking_RDY = _, _;
local _EscapeArtist, _EscapeArtist_RDY = _, _;
local _Perception, _Perception_RDY = _, _;

function ConROC:Stats()
	_Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
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
	_enemies_in_30yrds, _target_in_30yrds = ConROC:Targets("30");
	_can_Execute = _Target_Percent_Health < 20;

	_Berserking, _Berserking_RDY = ConROC:AbilityReady(Racial.Berserking, timeShift);
	_EscapeArtist, _EscapeArtist_RDY = ConROC:AbilityReady(Racial.EscapeArtist, timeShift);
	_Perception, _Perception_RDY = ConROC:AbilityReady(Racial.Perception, timeShift);
end

function ConROC.Warlock.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedSpells);
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
	local _Backdraft_BUFF = ConROC:Aura(Buff.Backdraft, timeShift);
	local _ChaosBolt, _ChaosBolt_RDY = ConROC:AbilityReady(Runes.ChaosBolt, timeShift);
	local _Decimation_BUFF = ConROC:Aura(Buff.Decimation, timeShift);
	local _DemonCharge, _DemonCharge_RDY = ConROC:AbilityReady(Runes.DemonCharge, timeShift);
		local _, _DemonCharge_RANGE = ConROC:Targets(_DemonCharge);
	local _DemonicGrace, _DemonicGrace_RDY = ConROC:AbilityReady(Runes.DemonicGrace, timeShift);
	local _DemonicHowl, _DemonicHowl_RDY = ConROC:AbilityReady(Runes.DemonicHowl, timeShift);
    local _Haunt, _Haunt_RDY = ConROC:AbilityReady(Runes.Haunt, timeShift);
        local _Haunt_DEBUFF = ConROC:TargetAura(_Haunt, timeShift);
	local _ImmolationAura, _ImmolationAura_RDY = ConROC:AbilityReady(Runes.ImmolationAura, timeShift);
		local _ImmolationAura_FORM = ConROC:Form(_ImmolationAura);
	local _Incinerate, _Incinerate_RDY = ConROC:AbilityReady(Runes.Incinerate, timeShift);
        local _Incinerate_BUFF = ConROC:Aura(_Incinerate, timeShift);
	local _Menace, _Menace_RDY = ConROC:AbilityReady(Runes.Menace, timeShift);
	local _Metamorphosis, _Metamorphosis_RDY = ConROC:AbilityReady(Runes.Metamorphosis, timeShift);
		local _Metamorphosis_FORM = ConROC:Form(_Metamorphosis);
	local _ShadowCleave, _ShadowCleave_RDY = ConROC:AbilityReady(Runes.ShadowCleave, timeShift);
	local _Shadowflame, _Shadowflame_RDY = ConROC:AbilityReady(Runes.Shadowflame, timeShift);
		local _Shadowflame_DEBUFF = ConROC:TargetAura(_Shadowflame, timeShift);
	local _SummonFelguard, _SummonFelguard_RDY = ConROC:AbilityReady(Runes.SummonFelguard, timeShift);
	local _UnstableAffliction, _UnstableAffliction_RDY = ConROC:AbilityReady(Runes.UnstableAffliction, timeShift);
		local _UnstableAffliction_DEBUFF = ConROC:TargetAura(_UnstableAffliction, timeShift);

--Pet
    local _SpellLock, _SpellLock_RDY = ConROC:AbilityReady(Pet.SpellLock, timeShift, 'pet');

--Conditions		
	local _Pet_summoned = ConROC:CallPet();
	local assist = ConROC:PetAssist();
	local tarHasMana = UnitPower('target', Enum.PowerType.Mana);

--Indicators
	ConROC:AbilityMovement(_DemonCharge, _DemonCharge_RDY and _DemonCharge_RANGE);
	ConROC:AbilityTaunt(_DemonicHowl, _DemonicHowl_RDY and _enemies_in_30yrds >= 3);
	ConROC:AbilityTaunt(_Menace, _Menace_RDY and not ConROC:TarYou());

	ConROC:AbilityBurst(_AmplifyCurse, _AmplifyCurse_RDY and (ConROC:CheckBox(ConROC_SM_Curse_Weakness) or ConROC:CheckBox(ConROC_SM_Curse_Agony)));

    ConROC:AbilityInterrupt(_SpellLock, ConROC:Interrupt() and _SpellLock_RDY)

--Warnings
	if not assist and _Pet_summoned and _in_combat then
		ConROC:Warnings("Pet is NOT attacking!!!", true);
	end

--Rotations
	repeat
		while(true) do
			--Mana--
			if ConROC:CheckBox(ConROC_SM_Mana_DrainMana) and _DrainMana_RDY and tarHasMana > 0 and _Mana_Percent < 20 then
				tinsert(ConROC.SuggestedSpells, _DrainMana);
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Mana_LifeTap) and _LifeTap_RDY and ((_Mana_Percent < 20 and _Player_Percent_Health >= 30) or (_is_moving and _Mana_Percent < 60 and not _Shadowburn_RDY) ) then
				tinsert(ConROC.SuggestedSpells, _LifeTap);
				_Mana_Percent = _Mana_Percent + 5;
				_Player_Percent_Health = _Player_Percent_Health - 10;
				_Queue = _Queue + 1;
				break;
			end

			--Demons--
			if ConROC:CheckBox(ConROC_SM_Demon_Felhunter) and _SummonFelhunter_RDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonFelhunter);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Demon_Imp) and _SummonImp_RDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonImp);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Demon_Succubus) and _SummonSuccubus_RDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonSuccubus);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Demon_Incubus) and sumIncRDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonIncubus);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Demon_Voidwalker) and _SummonVoidwalker_RDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonVoidwalker);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC:CheckBox(ConROC_SM_Demon_Felguard) and _SummonFelguard_RDY and not _Pet_summoned then
				tinsert(ConROC.SuggestedSpells, _SummonFelguard);
				_Pet_summoned = true;
				_Queue = _Queue + 1;
				break;
			end

			--SoD--
			if ConROC.Seasons.IsSoD then
				if _Metamorphosis_FORM then
					if _ImmolationAura_RDY and not _ImmolationAura_FORM then
						tinsert(ConROC.SuggestedSpells, _ImmolationAura);
						_ImmolationAura_FORM = true;
						_Queue = _Queue + 1;
						break;
					end

					if _Incinerate_RDY and not _Incinerate_BUFF then
						tinsert(ConROC.SuggestedSpells, _Incinerate);
						_Incinerate_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC_AoEButton:IsVisible() and _enemies_in_10yrds >= 3 then
						if _RainofFire_RDY and ConROC:RuneEquipped(Engrave.LakeofFire , "chest") then
							tinsert(ConROC.SuggestedSpells, _RainofFire);
							_RainofFire_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						if _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF then
							tinsert(ConROC.SuggestedSpells, _CurseoftheElements);
							_CurseoftheElements_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if _Shadowflame_RDY and currentSpell ~= _Shadowflame and not _Shadowflame_DEBUFF then
							tinsert(ConROC.SuggestedSpells, _Shadowflame);
							_Shadowflame_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if _Hellfire_RDY and _enemies_in_10yrds >= 3 and _Player_Percent_Health >= 30 then
							tinsert(ConROC.SuggestedSpells, _Hellfire);
							_Hellfire_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						tinsert(ConROC.SuggestedSpells, 26008); --Waiting Spell Icon
						_Queue = _Queue + 3;
						break;
					end

					if _SearingPain_RDY and not _target_in_melee then
						tinsert(ConROC.SuggestedSpells, _SearingPain);
						_target_in_melee = true;
						_Queue = _Queue + 1;
						break;
					end

					--Curses--
					if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseofWeakness);
						_CurseofWeakness_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseofAgony);
						_CurseofAgony_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseofRecklessness);
						_CurseofRecklessness_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseofTongues);
						_CurseofTongues_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then
						tinsert(ConROC.SuggestedSpells, _CurseofExhaustion);
						_CurseofExhaustion_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseoftheElements);
						_CurseoftheElements_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
						tinsert(ConROC.SuggestedSpells, _CurseofShadow);
						_CurseofShadow_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then
						tinsert(ConROC.SuggestedSpells, _CurseofDoom);
						_CurseofDoom_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if _DemonicGrace_RDY then
						tinsert(ConROC.SuggestedSpells, _DemonicGrace);
						_DemonicGrace_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _DrainLife_RDY and ConROC:RuneEquipped(Engrave.MasterChanneler, "chest") and not _DrainLife_DEBUFF and not ConROC:CreatureType("Mechanical") then
						tinsert(ConROC.SuggestedSpells, _DrainLife);
						_DrainLife_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and currentSpell ~= _Immolate and not _Immolate_DEBUFF and not _Shadowflame_DEBUFF and not _UnstableAffliction_DEBUFF then
						tinsert(ConROC.SuggestedSpells, _Immolate);
						_Immolate_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption then
						tinsert(ConROC.SuggestedSpells, _Corruption);
						_Corruption_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if _ShadowCleave_RDY then
						tinsert(ConROC.SuggestedSpells, _ShadowCleave);
						_ShadowCleave_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _SearingPain_RDY then
						tinsert(ConROC.SuggestedSpells, _SearingPain);
						_Queue = _Queue + 1;
						break;
					end
				else
					if ConROC_AoEButton:IsVisible() then
						if _enemies_in_30yrds >= 6 then
							if _Incinerate_RDY and not _Incinerate_BUFF then
								tinsert(ConROC.SuggestedSpells, _Incinerate);
								_Incinerate_BUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if _RainofFire_RDY and ConROC:RuneEquipped(Engrave.LakeofFire , "chest") then
								tinsert(ConROC.SuggestedSpells, _RainofFire);
								_RainofFire_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF then
								tinsert(ConROC.SuggestedSpells, _CurseoftheElements);
								_CurseoftheElements_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if _Shadowflame_RDY and currentSpell ~= _Shadowflame and not _Immolate_DEBUFF and not _Shadowflame_DEBUFF then
								tinsert(ConROC.SuggestedSpells, _Shadowflame);
								_Shadowflame_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if _Hellfire_RDY and _enemies_in_10yrds >= 3 and _Player_Percent_Health >= 30 then
								tinsert(ConROC.SuggestedSpells, _Hellfire);
								_Hellfire_RDY = false;
								_Queue = _Queue + 1;
								break;
							end
						elseif _enemies_in_30yrds >= 3 then
							if _Corruption_RDY and ConROC:TalentChosen(Spec.Affliction, Aff_Talent.Nightfall) and not _Corruption_DEBUFF and currentSpell ~= _Corruption then
								tinsert(ConROC.SuggestedSpells, _Corruption);
								_Corruption_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if _ShadowBolt_RDY and ConROC:RuneEquipped(Engrave.ShadowBoltVolley, "hands") then
								tinsert(ConROC.SuggestedSpells, _ShadowBolt);
								_Queue = _Queue + 1;
								break;
							end
						end
					else
						if _Shadowburn_RDY and ((_Target_Percent_Health <= 5 and ConROC:Raidmob()) or (_Target_Percent_Health <= 20 and not ConROC:Raidmob())) then
							tinsert(ConROC.SuggestedSpells, _Shadowburn);
							_Shadowburn_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						if _Incinerate_RDY and not _Incinerate_BUFF then
							tinsert(ConROC.SuggestedSpells, _Incinerate);
							_Incinerate_BUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Debuff_Shadowflame) and _Shadowflame_RDY and currentSpell ~= _Shadowflame and not _Immolate_DEBUFF and not _Shadowflame_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _Shadowflame);
							_Shadowflame_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _Corruption);
							_Corruption_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Debuff_UnstableAffliction) and _UnstableAffliction_RDY and currentSpell ~= _UnstableAffliction and not _Immolate_DEBUFF and not _UnstableAffliction_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _UnstableAffliction);
							_UnstableAffliction_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						--Curses--
						if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseofWeakness);
							_CurseofWeakness_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseofAgony);
							_CurseofAgony_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseofRecklessness);
							_CurseofRecklessness_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseofTongues);
							_CurseofTongues_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then
							tinsert(ConROC.SuggestedSpells, _CurseofExhaustion);
							_CurseofExhaustion_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseoftheElements);
							_CurseoftheElements_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _CurseofShadow);
							_CurseofShadow_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then
							tinsert(ConROC.SuggestedSpells, _CurseofDoom);
							_CurseofDoom_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if _Haunt_RDY and not _Haunt_DEBUFF then
							tinsert(ConROC.SuggestedSpells, _Haunt);
							_Haunt_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and currentSpell ~= _Immolate and not _Immolate_DEBUFF and not _Shadowflame_DEBUFF and not _UnstableAffliction_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _Immolate);
							_Immolate_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Debuff_SiphonLife) and _SiphonLife_RDY and not _SiphonLife_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
							tinsert(ConROC.SuggestedSpells, _SiphonLife);
							_SiphonLife_DEBUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if _DrainLife_RDY and ConROC:RuneEquipped(Engrave.MasterChanneler, "chest") and not _DrainLife_DEBUFF and not ConROC:CreatureType("Mechanical") then
							tinsert(ConROC.SuggestedSpells, _DrainLife);
							_DrainLife_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						if _Conflagrate_RDY and _Immolate_DEBUFF and ConROC:RuneEquipped(Engrave.Backdraft, "head") and not _Backdraft_BUFF then
							tinsert(ConROC.SuggestedSpells, _Conflagrate);
							_Backdraft_BUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if _SoulFire_RDY and ConROC:RuneEquipped(Engrave.Decimation, "feet") and _Decimation_BUFF then
							tinsert(ConROC.SuggestedSpells, _SoulFire);
							_Queue = _Queue + 1;
							break;
						end

						if _ChaosBolt_RDY then
							tinsert(ConROC.SuggestedSpells, _ChaosBolt);
							_ChaosBolt_RDY = false;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Filler_ShadowBolt) and _ShadowBolt_RDY then
							tinsert(ConROC.SuggestedSpells, _ShadowBolt);
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Filler_Incinerate) and _Incinerate_RDY then
							tinsert(ConROC.SuggestedSpells, _Incinerate);
							_Incinerate_BUFF = true;
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_Filler_SearingPain) and _SearingPain_RDY then
							tinsert(ConROC.SuggestedSpells, _SearingPain);
							_Queue = _Queue + 1;
							break;
						end
					end
				end
			else --not SoD
				--Curses--
				if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and _CurseofWeakness_RDY and not _CurseofWeakness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseofWeakness);
					_CurseofWeakness_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Agony) and _CurseofAgony_RDY and not _CurseofAgony_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseofAgony);
					_CurseofAgony_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Recklessness) and _CurseofRecklessness_RDY and not _CurseofRecklessness_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseofRecklessness);
					_CurseofRecklessness_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and _CurseofTongues_RDY and not _CurseofTongues_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseofTongues);
					_CurseofTongues_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and _CurseofExhaustion_RDY and not _CurseofExhaustion_DEBUFF then
					tinsert(ConROC.SuggestedSpells, _CurseofExhaustion);
					_CurseofExhaustion_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Elements) and _CurseoftheElements_RDY and not _CurseoftheElements_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseoftheElements);
					_CurseoftheElements_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Shadow) and _CurseofShadow_RDY and not _CurseofShadow_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _CurseofShadow);
					_CurseofShadow_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Curse_Doom) and _CurseofDoom_RDY and not _CurseofDoom_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 75) or (not ConROC:Raidmob() and _Target_Percent_Health == 100)) then
					tinsert(ConROC.SuggestedSpells, _CurseofDoom);
					_CurseofDoom_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _ShadowBolt_RDY and _ShadowTrance_BUFF then
					tinsert(ConROC.SuggestedSpells, _ShadowBolt);
					_ShadowTrance_BUFF = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Shadowburn_RDY and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then
					tinsert(ConROC.SuggestedSpells, _Shadowburn);
					_Shadowburn_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _DrainSoul_RDY and _SoulShards < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and _Target_Percent_Health <= 5) or (not ConROC:Raidmob() and _Target_Percent_Health <= 20)) then --Soul Shard counter needed.
					tinsert(ConROC.SuggestedSpells, _DrainSoul);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and _Hellfire_RDY and _enemies_in_10yrds >= 3 and _Player_Percent_Health >= 30 then
					tinsert(ConROC.SuggestedSpells, _Hellfire);
					_Hellfire_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and _RainofFire_RDY and _enemies_in_30yrds >= 3 then
					tinsert(ConROC.SuggestedSpells, _RainofFire);
					_RainofFire_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and _Corruption_RDY and not _Corruption_DEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _Corruption);
					_Corruption_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_SiphonLife) and _SiphonLife_RDY and not _SiphonLife_DEBUFF and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _SiphonLife);
					_SiphonLife_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and _Immolate_RDY and not _Immolate_DEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and _Target_Percent_Health >= 5) or (not ConROC:Raidmob() and _Target_Percent_Health >= 20)) then
					tinsert(ConROC.SuggestedSpells, _Immolate);
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and (_Mana_Percent <= 20 or _Target_Percent_Health <= 5) then
					tinsert(ConROC.SuggestedSpells, Caster.Shoot);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and _ShadowBolt_RDY then
					tinsert(ConROC.SuggestedSpells, _ShadowBolt);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Spell_SearingPain) and _SearingPain_RDY then
					tinsert(ConROC.SuggestedSpells, _SearingPain);
					_Queue = _Queue + 1;
					break;
				end
			end

			tinsert(ConROC.SuggestedSpells, 26008); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
return nil;
end

function ConROC.Warlock.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedDefSpells);
	ConROC:Stats();

--Abilities
	local _DrainLife, _DrainLife_RDY = ConROC:AbilityReady(Ability.DrainLife, timeShift);
	local _DemonArmor, _DemonArmor_RDY = ConROC:AbilityReady(Ability.DemonArmor, timeShift);
		local _DemonArmor_BUFF = ConROC:Aura(_DemonArmor, timeShift);
	local _HealthFunnel, _HealthFunnel_RDY = ConROC:AbilityReady(Ability.HealthFunnel, timeShift);
	local _SoulLink, _SoulLink_RDY = ConROC:AbilityReady(Ability.SoulLink, timeShift);
		local _SoulLink_BUFF = ConROC:Aura(_SoulLink, timeShift);

	local _FelArmor, _FelArmor_RDY = ConROC:AbilityReady(Runes.FelArmor, timeShift);
		local _FelArmor_BUFF = ConROC:Aura(_FelArmor, timeShift);
	local _InfernalArmor, _InfernalArmor_RDY = ConROC:AbilityReady(Runes.InfernalArmor, timeShift);

--Conditions
	local petPh = ConROC:PercentHealth('pet');
	local _Pet_summoned = ConROC:CallPet();

--Rotations	
	if ConROC:CheckBox(ConROC_SM_Armor_DemonArmor) and _DemonArmor_RDY and not _DemonArmor_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _DemonArmor);
	end

	if ConROC:CheckBox(ConROC_SM_Armor_FelArmor) and _FelArmor_RDY and not _FelArmor_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _FelArmor);
	end

	if _SoulLink_RDY and not _SoulLink_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _SoulLink);
	end

	if _DrainLife_RDY and _Player_Percent_Health <= 30 and not ConROC:CreatureType("Mechanical") then
		tinsert(ConROC.SuggestedDefSpells, _DrainLife);
	end

	if _HealthFunnel_RDY and petPh <= 25 and _Player_Percent_Health >= 50 and not ConROC:TarYou() then
		tinsert(ConROC.SuggestedDefSpells, _HealthFunnel);
	end
return nil;
end