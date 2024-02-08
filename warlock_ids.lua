local ConROC_Warlock, ids = ...;
local optionMaxIds = ...;

--General
	ids.Racial = {
		Berserking = 26297,
		EscapeArtist = 20589,
	}
	ids.Spec = {
		Affliction = 1,
		Demonology = 2,
		Destruction = 3,
	}
	ids.Caster = {
		Shoot = 5019,
	}
--Affliction
	ids.Aff_Ability = {
		AmplifyCurse = 18288,
		CorruptionRank1 = 172,
		CorruptionRank2 = 6222,
		CorruptionRank3 = 6223,
		CorruptionRank4 = 7648,
		CorruptionRank5 = 11671,
		CorruptionRank6 = 11672,
		CorruptionRank7 = 25311,

		CurseofAgonyRank1 = 980,
		CurseofAgonyRank2 = 1014,
		CurseofAgonyRank3 = 6217,
		CurseofAgonyRank4 = 11711,
		CurseofAgonyRank5 = 11712,
		CurseofAgonyRank6 = 11713,

		CurseofDoom = 603,

		CurseofExhaustion = 18223,

		CurseofRecklessnessRank1 = 704,
		CurseofRecklessnessRank2 = 7658,
		CurseofRecklessnessRank3 = 7659,
		CurseofRecklessnessRank4 = 11717,

		CurseofShadowRank1 = 17862,
		CurseofShadowRank2 = 17937,

		CurseoftheElementsRank1 = 1490,
		CurseoftheElementsRank2 = 11721,
		CurseoftheElementsRank3 = 11722,

		CurseofTonguesRank1 = 1714,
		CurseofTonguesRank2 = 11719,

		CurseofWeaknessRank1 = 702,
		CurseofWeaknessRank2 = 1108,
		CurseofWeaknessRank3 = 6205,
		CurseofWeaknessRank4 = 7646,
		CurseofWeaknessRank5 = 11707,
		CurseofWeaknessRank6 = 11708,

		DarkPactRank1 = 18220,
		DarkPactRank2 = 18937,
		DarkPactRank3 = 18938,

		DeathCoilRank1 = 6789,
		DeathCoilRank2 = 17925,
		DeathCoilRank3 = 17926,

		DrainLifeRank1 = 689,
		DrainLifeRank2 = 699,
		DrainLifeRank3 = 709,
		DrainLifeRank4 = 7651,
		DrainLifeRank5 = 11699,
		DrainLifeRank6 = 11700,

		DrainManaRank1 = 5138,
		DrainManaRank2 = 6226,
		DrainManaRank3 = 11703,
		DrainManaRank4 = 11704,

		DrainSoulRank1 = 1120,
		DrainSoulRank2 = 8288,
		DrainSoulRank3 = 8289,
		DrainSoulRank4 = 11675,

		FearRank1 = 5782,
		FearRank2 = 6213,
		FearRank3 = 6215,

		HowlofTerrorRank1 = 5484,
		HowlofTerrorRank2 = 17928,

		LifeTapRank1 = 1454,
		LifeTapRank2 = 1455,
		LifeTapRank3 = 1456,
		LifeTapRank4 = 11687,
		LifeTapRank5 = 11688,
		LifeTapRank6 = 11689,

		SiphonLifeRank1 = 18265,
		SiphonLifeRank2 = 18879,
		SiphonLifeRank3 = 18880,
		SiphonLifeRank4 = 18881,
	}
	ids.Affliction_Talent = { 
		FelConcentration =  1, 
		Nightfall =  2, 
		ImprovedCorruption =  3, 
		ImprovedDrainLife =  4, 
		Suppression =  5, 
		ImprovedCurseofWeakness =  6, 
		ImprovedLifeTap =  7, 
		GrimReach =  8, 
		DarkPact =  9, 
		SiphonLife =  10, 
		ShadowMastery =  11, 
		AmplifyCurse =  12, 
		CurseofExhaustion =  13, 
		ImprovedCurseofExhaustion =  14, 
		ImprovedDrainSoul =  15, 
		ImprovedDrainMana =  16, 
		ImprovedCurseofAgony =  17, 
	}
--Demonology
	ids.Demo_Ability = {
		BanishRank1 = 710,
		BanishRank2 = 18647,

		CreateFirestoneRank1 = 6366,		--CreateFirestoneLesser
		CreateFirestoneRank2 = 17951,		--CreateFirestone
		CreateFirestoneRank3 = 17952,		--CreateFirestoneGreater
		CreateFirestoneRank4 = 17953,		--CreateFirestoneMajor

		CreateHealthstoneRank1 = 6201,
		CreateHealthstoneRank2 = 6202,
		CreateHealthstoneRank3 = 5699,
		CreateHealthstoneRank4 = 11729,
		CreateHealthstoneRank5 = 11730,

		CreateSoulstoneRank1 = 693,
		CreateSoulstoneRank2 = 20752,
		CreateSoulstoneRank3 = 20755,
		CreateSoulstoneRank4 = 20756,
		CreateSoulstoneRank5 = 20757,

		CreateSpellstoneRank1 = 2362,
		CreateSpellstoneRank2 = 17727,
		CreateSpellstoneRank3 = 17728,

		DemonSkinRank1 = 687, --Just Demon Armor earlier ranks.
		DemonSkinRank2 = 696,
		DemonArmorRank1 = 706,
		DemonArmorRank2 = 1086,
		DemonArmorRank3 = 11733,
		DemonArmorRank4 = 11734,
		DemonArmorRank5 = 11735,
		
		DemonicSacrifice = 18788,
		
		DetectInvisibilityRank1 = 132,
		DetectInvisibilityRank2 = 2970,
		DetectInvisibilityRank3 = 11743,

		EnslaveDemonRank1 = 1098,
		EnslaveDemonRank2 = 11725,
		EnslaveDemonRank3 = 11726,
		
		EyeofKilrogg = 126,
		
		FelDomination = 18708,
		
		HealthFunnelRank1 = 755,
		HealthFunnelRank2 = 3698,
		HealthFunnelRank3 = 3699,
		HealthFunnelRank4 = 3700,
		HealthFunnelRank5 = 11693,
		HealthFunnelRank6 = 11684,
		HealthFunnelRank7 = 11685,

		Inferno = 1122,
		
		RitualofDoom = 18540,
		
		RitualofSummoning = 698,
		
		ShadowWardRank1 = 6229,
		ShadowWardRank2 = 11739,
		ShadowWardRank3 = 11740,
		ShadowWardRank4 = 28610,

		SenseDemons = 5500,
		
		SoulLink = 19028,
		
		SummonFelhunter = 691,
		SummonImp = 688,
		SummonSuccubus = 712,
		SummonIncubus = 713,
		SummonVoidwalker = 697,
		
		UnendingBreath = 5697,
	}
	ids.Demonology_Talent = { 
		ImprovedHealthstone =  1, 
		ImprovedImp =  2, 
		DemonicEmbrace =  3, 
		ImprovedHealthFunnel =  4, 
		ImprovedVoidwalker =  5, 
		FelDomination =  6, 
		MasterSummoner =  7, 
		FelStamina =  8, 
		FelIntellect =  9, 
		ImprovedSayaad =  10, 
		MasterDemonologist =  11, 
		ImprovedFirestone =  12, 
		UnholyPower =  13, 
		ImprovedSpellstone =  14, 
		DemonicSacrifice =  15, 
		SoulLink =  16, 
		ImprovedSubjugateDemon =  17, 
	}
--Destruction
	ids.Dest_Ability = {
		ConflagrateRank1 = 17962,
		ConflagrateRank2 = 18930,
		ConflagrateRank3 = 18931,
		ConflagrateRank4 = 18932,

		HellfireRank1 = 1949,
		HellfireRank2 = 11683,
		HellfireRank3 = 11684,
		
		ImmolateRank1 = 348,
		ImmolateRank2 = 707,
		ImmolateRank3 = 1094,
		ImmolateRank4 = 2941,
		ImmolateRank5 = 11665,
		ImmolateRank6 = 11667,
		ImmolateRank7 = 11668,
		ImmolateRank8 = 25309,
		
		RainofFireRank1 = 5740,
		RainofFireRank2 = 6219,
		RainofFireRank3 = 11677,
		RainofFireRank4 = 11678,
		
		SearingPainRank1 = 5676,
		SearingPainRank2 = 17919,
		SearingPainRank3 = 17920,
		SearingPainRank4 = 17921,
		SearingPainRank5 = 17922,
		SearingPainRank6 = 17923,
		
		ShadowBoltRank1 = 686,
		ShadowBoltRank2 = 695,
		ShadowBoltRank3 = 705,
		ShadowBoltRank4 = 1088,
		ShadowBoltRank5 = 1106,
		ShadowBoltRank6 = 7641,
		ShadowBoltRank7 = 11659,
		ShadowBoltRank8 = 11660,
		ShadowBoltRank9 = 11661,
		ShadowBoltRank10 = 25307,
		
		ShadowburnRank1 = 17877,
		ShadowburnRank2 = 18867,
		ShadowburnRank3 = 18868,
		ShadowburnRank4 = 18869,
		ShadowburnRank5 = 18870,
		ShadowburnRank6 = 18871,
		
		SoulFireRank1 = 6353,
		SoulFireRank2 = 17924,
	}
	ids.Destruction_Talent = { 
		Cataclysm =  1, 
		Bane =  2, 
		ImprovedShadowBolt =  3, 
		ImprovedImmolate =  4, 
		Shadowburn =  5, 
		DestructiveReach =  6, 
		ImprovedSearingPain =  7, 
		Emberstorm =  8, 
		Ruin =  9, 
		Conflagrate =  10, 
		Devastation =  11, 
		Aftermath =  12, 
		ImprovedFirebolt =  13, 
		ImprovedLashofPain =  14, 
		Intensity =  15, 
		Pyroclasm =  16, 
	}
	ids.Runes = {
		Haunt = 403501, -- also player buff ID
		LakeofFire = 403666,
		Metamorphosis = 403789, -- also player buff ID
		ChaosBolt = 403629, 
		DemonicGrace = 425463, -- also player buff ID
		Incinerate = 412758, -- also player buff ID
		MasterChanneler = 403668,
		SoulSiphon = 403685, -- also player buff ID
		Invocation = 426243, --Phase 2 -passive -Refreshing Corruption, Immolate, Curse of Agony, or Siphon Life when it has less than 6 seconds duration remaining will cause you to deal instant damage to the target equal to the spell's remaining periodic damage.
		DanceoftheWicked = 412798, --Phase 2 -passive -You and your demon pet gain dodge chance equal to your spell critical strike chance each time you deal a critical strike to an enemy, and also both regain 2% of maximum mana.
	}
--Pet
	ids.Pet = {
		SpellLockRank1 = 19244,
		SpellLockRank2 = 19647,
	}
-- Auras
	ids.Player_Buff = {
		BurningWish = 18789,
		FelEnergy = 18792,
		FelStamina = 18790,
		ShadowTrance = 17941,
		TouchofShadow = 18791,
		--[[
		LifeTap = 63321,
		SpiritsoftheDamned = 61082,
		IllustrationoftheDragonSoul = 60486,
		MoltenCore = 71165,
		DecimationRank1 = 163165,
		DecimationRank2 = 163167,
		--]]
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
		LakeofFire = 403650,
	
	}
	ids.optionMaxIds = {
		
	}
