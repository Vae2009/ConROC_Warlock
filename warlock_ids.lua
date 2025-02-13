local ConROC_Warlock, ids = ...;

--General
ids.Racial = {
	Berserking = 26297,
	EscapeArtist = 20589,
	Perception = 20600,
}
ids.Spec = {
	Affliction = 1,
	Demonology = 2,
	Destruction = 3,
}
ids.Caster = {
	Shoot = 5019,
}
ids.Ability = {
--Affliction
	AmplifyCurse = 18288,
	Corruption = 172,
	CurseofAgony = 980,
	CurseofDoom = 603,
	CurseofExhaustion = 18223,
	CurseofRecklessness = 704,
	CurseofShadow = 17862,
	CurseoftheElements = 1490,
	CurseofTongues = 1714,
	CurseofWeakness = 702,
	DarkPact = 18220,
	DeathCoil = 6789,
	DrainLife = 689,
	DrainMana = 5138,
	DrainSoul = 1120,
	Fear = 5782,
	HowlofTerror = 5484,
	LifeTap = 1454,
	SiphonLife = 18265,
--Demonology
	Banish = 710,
	CreateFirestone = 6366,
	CreateHealthstone = 6201,
	CreateSoulstone = 693,
	CreateSpellstone = 2362,
	DemonArmor = 687,
	DemonicSacrifice = 18788,
	DetectInvisibility = 132,
	EnslaveDemon = 1098,
	EyeofKilrogg = 126,
	FelDomination = 18708,
	HealthFunnel = 755,
	Inferno = 1122,
	RitualofDoom = 18540,
	RitualofSummoning = 698,
	ShadowWard = 6229,
	SenseDemons = 5500,
	SoulLink = 19028,
	SummonFelhunter = 691,
	SummonImp = 688,
	SummonSuccubus = 712,
	SummonIncubus = 713,
	SummonVoidwalker = 697,
	UnendingBreath = 5697,
--Destruction
	Conflagrate = 17962,
	Hellfire = 1949,
	Immolate = 348,
	RainofFire = 5740,
	SearingPain = 5676,
	ShadowBolt = 686,
	Shadowburn = 17877,
	SoulFire = 6353,
}
ids.Rank = {
--Affliction
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
	DrainLifeSoDRank1 = 403677,
	DrainLifeSoDRank2 = 403685,
	DrainLifeSoDRank3 = 403686,
	DrainLifeSoDRank4 = 403687,
	DrainLifeSoDRank5 = 403688,
	DrainLifeSoDRank6 = 403689,
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
	MenaceRank1 = 403828,
	MenaceRank2 = 442226,
	MenaceRank3 = 442233,
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
--Demonology
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
	DetectInvisibilityRank1 = 132,
	DetectInvisibilityRank2 = 2970,
	DetectInvisibilityRank3 = 11743,
	EnslaveDemonRank1 = 1098,
	EnslaveDemonRank2 = 11725,
	EnslaveDemonRank3 = 11726,
	HealthFunnelRank1 = 755,
	HealthFunnelRank2 = 3698,
	HealthFunnelRank3 = 3699,
	HealthFunnelRank4 = 3700,
	HealthFunnelRank5 = 11693,
	HealthFunnelRank6 = 11684,
	HealthFunnelRank7 = 11685,
	ShadowWardRank1 = 6229,
	ShadowWardRank2 = 11739,
	ShadowWardRank3 = 11740,
	ShadowWardRank4 = 28610,
--Destruction
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
	RainofFireSoDRank1 = 460692,
	RainofFireSoDRank2 = 460698,
	RainofFireSoDRank3 = 460699,
	RainofFireSoDRank4 = 460700,
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
	ShadowCleaveRank1 = 403835,
	ShadowCleaveRank2 = 403839,
	ShadowCleaveRank3 = 403840,
	ShadowCleaveRank4 = 403841,
	ShadowCleaveRank5 = 403842,
	ShadowCleaveRank6 = 403843,
	ShadowCleaveRank7 = 403844,
	ShadowCleaveRank8 = 403848,
	ShadowCleaveRank9 = 403851,
	ShadowCleaveRank10 = 403852,
	ShadowburnRank1 = 17877,
	ShadowburnRank2 = 18867,
	ShadowburnRank3 = 18868,
	ShadowburnRank4 = 18869,
	ShadowburnRank5 = 18870,
	ShadowburnRank6 = 18871,
	SoulFireRank1 = 6353,
	SoulFireRank2 = 17924,
}
ids.Affliction_Talent = {
	FelConcentration = 1,
	Nightfall = 2,
	ImprovedCorruption = 3,
	ImprovedDrainLife = 4,
	Suppression = 5,
	ImprovedCurseofWeakness = 6,
	ImprovedLifeTap = 7,
	GrimReach = 8,
	DarkPact = 9,
	SiphonLife = 10,
	ShadowMastery = 11,
	AmplifyCurse = 12,
	CurseofExhaustion = 13,
	ImprovedCurseofExhaustion = 14,
	ImprovedDrainSoul = 15,
	ImprovedDrainMana = 16,
	ImprovedCurseofAgony = 17,
}
ids.Demonology_Talent = {
	ImprovedHealthstone = 1,
	ImprovedImp = 2,
	DemonicEmbrace = 3,
	ImprovedHealthFunnel = 4,
	ImprovedVoidwalker = 5,
	FelDomination = 6,
	MasterSummoner = 7,
	FelStamina = 8,
	FelIntellect = 9,
	ImprovedSayaad = 10,
	MasterDemonologist = 11,
	ImprovedFirestone = 12,
	UnholyPower = 13,
	ImprovedSpellstone = 14,
	DemonicSacrifice = 15,
	SoulLink = 16,
	ImprovedSubjugateDemon = 17,
}
ids.Destruction_Talent = {
	Cataclysm = 1,
	Bane = 2,
	ImprovedShadowBolt = 3,
	ImprovedImmolate = 4,
	Shadowburn = 5,
	DestructiveReach = 6,
	ImprovedSearingPain = 7,
	Emberstorm = 8,
	Ruin = 9,
	Conflagrate = 10,
	Devastation = 11,
	Aftermath = 12,
	ImprovedFirebolt = 13,
	ImprovedLashofPain = 14,
	Intensity = 15,
	Pyroclasm = 16,
}
ids.Engrave = {
	--Head--
	Backdraft = 7115,
	--Chest--
	LakeofFire = 6815,
	MasterChanneler = 6811,
	--Waist--
	Invocation = 7053,
	--Feet--
	DanceoftheWicked = 6957,
	Decimation = 7643,
	--Hands--
	Metamorphosis = 6816,
	ShadowBoltVolley = 6814,
	--Back--
	SoulSiphon = 7590,
}
ids.Runes = {
	ChaosBolt = 403629,
	DemonicGrace = 425463,
	FelArmor = 403619,
	Haunt = 403501,
	ImmolationAura = 427726,
	Incinerate = 412758,
	InfernalArmor = 440882,
	Metamorphosis = 403789,
		DemonCharge = 412788,
		DemonicHowl = 412789,
		Menace = 403828,
		ShadowCleave = 403835,
	Shadowflame = 426320,
	SummonFelguard = 427733,
	UnstableAffliction = 427717,
}
--Pet
ids.Pet = {
	SpellLock = 19244,
	SpellLockRank1 = 19244,
	SpellLockRank2 = 19647,
}
-- Auras
ids.Buff = {
	Backdraft = 427714,
	BurningWish = 18789,
	Decimation = 440873,
	FelEnergy = 18792,
	FelStamina = 18790,
	ShadowTrance = 17941,
	TouchofShadow = 18791,
}
ids.Debuff = {

}

function ConROC:UpdateSpellID()
--Ranks
--Affliction
	if IsSpellKnown(ids.Rank.CorruptionRank7) then ids.Ability.Corruption = ids.Rank.CorruptionRank7;
	elseif IsSpellKnown(ids.Rank.CorruptionRank6) then ids.Ability.Corruption = ids.Rank.CorruptionRank6;
	elseif IsSpellKnown(ids.Rank.CorruptionRank5) then ids.Ability.Corruption = ids.Rank.CorruptionRank5;
	elseif IsSpellKnown(ids.Rank.CorruptionRank4) then ids.Ability.Corruption = ids.Rank.CorruptionRank4;
	elseif IsSpellKnown(ids.Rank.CorruptionRank3) then ids.Ability.Corruption = ids.Rank.CorruptionRank3;
	elseif IsSpellKnown(ids.Rank.CorruptionRank2) then ids.Ability.Corruption = ids.Rank.CorruptionRank2; end

	if IsSpellKnown(ids.Rank.CurseofAgonyRank6) then ids.Ability.CurseofAgony = ids.Rank.CurseofAgonyRank6;
	elseif IsSpellKnown(ids.Rank.CurseofAgonyRank5) then ids.Ability.CurseofAgony = ids.Rank.CurseofAgonyRank5;
	elseif IsSpellKnown(ids.Rank.CurseofAgonyRank4) then ids.Ability.CurseofAgony = ids.Rank.CurseofAgonyRank4;
	elseif IsSpellKnown(ids.Rank.CurseofAgonyRank3) then ids.Ability.CurseofAgony = ids.Rank.CurseofAgonyRank3;
	elseif IsSpellKnown(ids.Rank.CurseofAgonyRank2) then ids.Ability.CurseofAgony = ids.Rank.CurseofAgonyRank2; end

	if IsSpellKnown(ids.Rank.CurseofRecklessnessRank4) then ids.Ability.CurseofRecklessness = ids.Rank.CurseofRecklessnessRank4;
	elseif IsSpellKnown(ids.Rank.CurseofRecklessnessRank3) then ids.Ability.CurseofRecklessness = ids.Rank.CurseofRecklessnessRank3;
	elseif IsSpellKnown(ids.Rank.CurseofRecklessnessRank2) then ids.Ability.CurseofRecklessness = ids.Rank.CurseofRecklessnessRank2; end

	if IsSpellKnown(ids.Rank.CurseofShadowRank2) then ids.Ability.CurseofShadow = ids.Rank.CurseofShadowRank2; end

	if IsSpellKnown(ids.Rank.CurseofTonguesRank2) then ids.Ability.CurseofTongues = ids.Rank.CurseofTonguesRank2; end

	if IsSpellKnown(ids.Rank.CurseoftheElementsRank3) then ids.Ability.CurseoftheElements = ids.Rank.CurseoftheElementsRank3;
	elseif IsSpellKnown(ids.Rank.CurseoftheElementsRank2) then ids.Ability.CurseoftheElements = ids.Rank.CurseoftheElementsRank2; end

	if IsSpellKnown(ids.Rank.CurseofWeaknessRank6) then ids.Ability.CurseofWeakness = ids.Rank.CurseofWeaknessRank6;
	elseif IsSpellKnown(ids.Rank.CurseofWeaknessRank5) then ids.Ability.CurseofWeakness = ids.Rank.CurseofWeaknessRank5;
	elseif IsSpellKnown(ids.Rank.CurseofWeaknessRank4) then ids.Ability.CurseofWeakness = ids.Rank.CurseofWeaknessRank4;
	elseif IsSpellKnown(ids.Rank.CurseofWeaknessRank3) then ids.Ability.CurseofWeakness = ids.Rank.CurseofWeaknessRank3;
	elseif IsSpellKnown(ids.Rank.CurseofWeaknessRank2) then ids.Ability.CurseofWeakness = ids.Rank.CurseofWeaknessRank2; end

	if IsSpellKnown(ids.Rank.DarkPactRank3) then ids.Ability.DarkPact = ids.Rank.DarkPactRank3;
	elseif IsSpellKnown(ids.Rank.DarkPactRank2) then ids.Ability.DarkPact = ids.Rank.DarkPactRank2; end

	if IsSpellKnown(ids.Rank.DeathCoilRank3) then ids.Ability.DeathCoil = ids.Rank.DeathCoilRank3;
	elseif IsSpellKnown(ids.Rank.DeathCoilRank2) then ids.Ability.DeathCoil = ids.Rank.DeathCoilRank2; end

	if ConROC.Seasons.IsSoD and ConROC:RuneEquipped(ids.Engrave.MasterChanneler, "chest") then
		if IsSpellKnown(ids.Rank.DrainLifeRank6) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank6;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank5) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank5;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank4) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank4;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank3) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank3;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank2) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank2;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank1) then ids.Ability.DrainLife = ids.Rank.DrainLifeSoDRank1; end
	else
		if IsSpellKnown(ids.Rank.DrainLifeRank6) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank6;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank5) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank5;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank4) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank4;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank3) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank3;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank2) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank2;
		elseif IsSpellKnown(ids.Rank.DrainLifeRank1) then ids.Ability.DrainLife = ids.Rank.DrainLifeRank1; end
	end

	if IsSpellKnown(ids.Rank.DrainManaRank4) then ids.Ability.DrainMana = ids.Rank.DrainManaRank4;
	elseif IsSpellKnown(ids.Rank.DrainManaRank3) then ids.Ability.DrainMana = ids.Rank.DrainManaRank3;
	elseif IsSpellKnown(ids.Rank.DrainManaRank2) then ids.Ability.DrainMana = ids.Rank.DrainManaRank2; end

	if IsSpellKnown(ids.Rank.DrainSoulRank4) then ids.Ability.DrainSoul = ids.Rank.DrainSoulRank4;
	elseif IsSpellKnown(ids.Rank.DrainSoulRank3) then ids.Ability.DrainSoul = ids.Rank.DrainSoulRank3;
	elseif IsSpellKnown(ids.Rank.DrainSoulRank2) then ids.Ability.DrainSoul = ids.Rank.DrainSoulRank2; end

	if IsSpellKnown(ids.Rank.FearRank3) then ids.Ability.Fear = ids.Rank.FearRank3; ids.Runes.Menace = ids.Rank.MenaceRank2;
	elseif IsSpellKnown(ids.Rank.FearRank2) then ids.Ability.Fear = ids.Rank.FearRank2; ids.Runes.Menace = ids.Rank.MenaceRank2; end

	if IsSpellKnown(ids.Rank.HowlofTerrorRank2) then ids.Ability.HowlofTerror = ids.Rank.HowlofTerrorRank2; end

	if IsSpellKnown(ids.Rank.LifeTapRank6) then ids.Ability.LifeTap = ids.Rank.LifeTapRank6;
	elseif IsSpellKnown(ids.Rank.LifeTapRank5) then ids.Ability.LifeTap = ids.Rank.LifeTapRank5;
	elseif IsSpellKnown(ids.Rank.LifeTapRank4) then ids.Ability.LifeTap = ids.Rank.LifeTapRank4;
	elseif IsSpellKnown(ids.Rank.LifeTapRank3) then ids.Ability.LifeTap = ids.Rank.LifeTapRank3;
	elseif IsSpellKnown(ids.Rank.LifeTapRank2) then ids.Ability.LifeTap = ids.Rank.LifeTapRank2; end

	if IsSpellKnown(ids.Rank.SiphonLifeRank4) then ids.Ability.SiphonLife = ids.Rank.SiphonLifeRank4;
	elseif IsSpellKnown(ids.Rank.SiphonLifeRank3) then ids.Ability.SiphonLife = ids.Rank.SiphonLifeRank3;
	elseif IsSpellKnown(ids.Rank.SiphonLifeRank2) then ids.Ability.SiphonLife = ids.Rank.SiphonLifeRank2; end

--Demonology
	if IsSpellKnown(ids.Rank.BanishRank2) then ids.Ability.Banish = ids.Rank.BanishRank2; end

	if IsSpellKnown(ids.Rank.CreateFirestoneRank4) then ids.Ability.CreateFirestone = ids.Rank.CreateFirestoneRank4;
	elseif IsSpellKnown(ids.Rank.CreateFirestoneRank3) then ids.Ability.CreateFirestone = ids.Rank.CreateFirestoneRank3;
	elseif IsSpellKnown(ids.Rank.CreateFirestoneRank2) then ids.Ability.CreateFirestone = ids.Rank.CreateFirestoneRank2; end

	if IsSpellKnown(ids.Rank.CreateHealthstoneRank5) then ids.Ability.CreateHealthstone = ids.Rank.CreateHealthstoneRank5;
	elseif IsSpellKnown(ids.Rank.CreateHealthstoneRank4) then ids.Ability.CreateHealthstone = ids.Rank.CreateHealthstoneRank4;
	elseif IsSpellKnown(ids.Rank.CreateHealthstoneRank3) then ids.Ability.CreateHealthstone = ids.Rank.CreateHealthstoneRank3;
	elseif IsSpellKnown(ids.Rank.CreateHealthstoneRank2) then ids.Ability.CreateHealthstone = ids.Rank.CreateHealthstoneRank2; end

	if IsSpellKnown(ids.Rank.CreateSoulstoneRank5) then ids.Ability.CreateSoulstone = ids.Rank.CreateSoulstoneRank5;
	elseif IsSpellKnown(ids.Rank.CreateSoulstoneRank4) then ids.Ability.CreateSoulstone = ids.Rank.CreateSoulstoneRank4;
	elseif IsSpellKnown(ids.Rank.CreateSoulstoneRank3) then ids.Ability.CreateSoulstone = ids.Rank.CreateSoulstoneRank3;
	elseif IsSpellKnown(ids.Rank.CreateSoulstoneRank2) then ids.Ability.CreateSoulstone = ids.Rank.CreateSoulstoneRank2; end

	if IsSpellKnown(ids.Rank.CreateSpellstoneRank3) then ids.Ability.CreateSpellstone = ids.Rank.CreateSpellstoneRank3;
	elseif IsSpellKnown(ids.Rank.CreateSpellstoneRank2) then ids.Ability.CreateSpellstone = ids.Rank.CreateSpellstoneRank2; end

	if IsSpellKnown(ids.Rank.DemonArmorRank5) then ids.Ability.DemonArmor = ids.Rank.DemonArmorRank5;
	elseif IsSpellKnown(ids.Rank.DemonArmorRank4) then ids.Ability.DemonArmor = ids.Rank.DemonArmorRank4;
	elseif IsSpellKnown(ids.Rank.DemonArmorRank3) then ids.Ability.DemonArmor = ids.Rank.DemonArmorRank3;
	elseif IsSpellKnown(ids.Rank.DemonArmorRank2) then ids.Ability.DemonArmor = ids.Rank.DemonArmorRank2;
	elseif IsSpellKnown(ids.Rank.DemonArmorRank1) then ids.Ability.DemonArmor = ids.Rank.DemonArmorRank1;
	elseif IsSpellKnown(ids.Rank.DemonSkinRank2) then ids.Ability.DemonArmor = ids.Rank.DemonSkinRank2; end

	if IsSpellKnown(ids.Rank.DetectInvisibilityRank3) then ids.Ability.DetectInvisibility = ids.Rank.DetectInvisibilityRank3;
	elseif IsSpellKnown(ids.Rank.DetectInvisibilityRank2) then ids.Ability.DetectInvisibility = ids.Rank.DetectInvisibilityRank2; end

	if IsSpellKnown(ids.Rank.EnslaveDemonRank3) then ids.Ability.EnslaveDemon = ids.Rank.EnslaveDemonRank3;
	elseif IsSpellKnown(ids.Rank.EnslaveDemonRank2) then ids.Ability.EnslaveDemon = ids.Rank.EnslaveDemonRank2; end

	if IsSpellKnown(ids.Rank.HealthFunnelRank7) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank7;
	elseif IsSpellKnown(ids.Rank.HealthFunnelRank6) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank6;
	elseif IsSpellKnown(ids.Rank.HealthFunnelRank5) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank5;
	elseif IsSpellKnown(ids.Rank.HealthFunnelRank4) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank4;
	elseif IsSpellKnown(ids.Rank.HealthFunnelRank3) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank3;
	elseif IsSpellKnown(ids.Rank.HealthFunnelRank2) then ids.Ability.HealthFunnel = ids.Rank.HealthFunnelRank2; end

	if IsSpellKnown(ids.Rank.ShadowWardRank4) then ids.Ability.ShadowWard = ids.Rank.ShadowWardRank4;
	elseif IsSpellKnown(ids.Rank.ShadowWardRank3) then ids.Ability.ShadowWard = ids.Rank.ShadowWardRank3;
	elseif IsSpellKnown(ids.Rank.ShadowWardRank2) then ids.Ability.ShadowWard = ids.Rank.ShadowWardRank2; end

--Destruction
	if IsSpellKnown(ids.Rank.ConflagrateRank4) then ids.Ability.Conflagrate = ids.Rank.ConflagrateRank4;
	elseif IsSpellKnown(ids.Rank.ConflagrateRank3) then ids.Ability.Conflagrate = ids.Rank.ConflagrateRank3;
	elseif IsSpellKnown(ids.Rank.ConflagrateRank2) then ids.Ability.Conflagrate = ids.Rank.ConflagrateRank2; end

	if IsSpellKnown(ids.Rank.HellfireRank3) then ids.Ability.Hellfire = ids.Rank.HellfireRank3;
	elseif IsSpellKnown(ids.Rank.HellfireRank2) then ids.Ability.Hellfire = ids.Rank.HellfireRank2; end

	if IsSpellKnown(ids.Rank.ImmolateRank8) then ids.Ability.Immolate = ids.Rank.ImmolateRank8;
	elseif IsSpellKnown(ids.Rank.ImmolateRank7) then ids.Ability.Immolate = ids.Rank.ImmolateRank7;
	elseif IsSpellKnown(ids.Rank.ImmolateRank6) then ids.Ability.Immolate = ids.Rank.ImmolateRank6;
	elseif IsSpellKnown(ids.Rank.ImmolateRank5) then ids.Ability.Immolate = ids.Rank.ImmolateRank5;
	elseif IsSpellKnown(ids.Rank.ImmolateRank4) then ids.Ability.Immolate = ids.Rank.ImmolateRank4;
	elseif IsSpellKnown(ids.Rank.ImmolateRank3) then ids.Ability.Immolate = ids.Rank.ImmolateRank3;
	elseif IsSpellKnown(ids.Rank.ImmolateRank2) then ids.Ability.Immolate = ids.Rank.ImmolateRank2; end

	if ConROC.Seasons.IsSoD and ConROC:RuneEquipped(ids.Engrave.LakeofFire, "chest") then
		if IsSpellKnown(ids.Rank.RainofFireRank4) then ids.Ability.RainofFire = ids.Rank.RainofFireSoDRank4;
		elseif IsSpellKnown(ids.Rank.RainofFireRank3) then ids.Ability.RainofFire = ids.Rank.RainofFireSoDRank3;
		elseif IsSpellKnown(ids.Rank.RainofFireRank2) then ids.Ability.RainofFire = ids.Rank.RainofFireSoDRank2;
		elseif IsSpellKnown(ids.Rank.RainofFireRank1) then ids.Ability.RainofFire = ids.Rank.RainofFireSoDRank1; end
	else
		if IsSpellKnown(ids.Rank.RainofFireRank4) then ids.Ability.RainofFire = ids.Rank.RainofFireRank4;
		elseif IsSpellKnown(ids.Rank.RainofFireRank3) then ids.Ability.RainofFire = ids.Rank.RainofFireRank3;
		elseif IsSpellKnown(ids.Rank.RainofFireRank2) then ids.Ability.RainofFire = ids.Rank.RainofFireRank2;
		elseif IsSpellKnown(ids.Rank.RainofFireRank1) then ids.Ability.RainofFire = ids.Rank.RainofFireRank1; end
	end

	if IsSpellKnown(ids.Rank.SearingPainRank6) then ids.Ability.SearingPain = ids.Rank.SearingPainRank6;
	elseif IsSpellKnown(ids.Rank.SearingPainRank5) then ids.Ability.SearingPain = ids.Rank.SearingPainRank5;
	elseif IsSpellKnown(ids.Rank.SearingPainRank4) then ids.Ability.SearingPain = ids.Rank.SearingPainRank4;
	elseif IsSpellKnown(ids.Rank.SearingPainRank3) then ids.Ability.SearingPain = ids.Rank.SearingPainRank3;
	elseif IsSpellKnown(ids.Rank.SearingPainRank2) then ids.Ability.SearingPain = ids.Rank.SearingPainRank2; end

	if IsSpellKnown(ids.Rank.ShadowBoltRank10) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank10; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank10;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank9) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank9; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank9;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank8) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank8; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank8;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank7) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank7; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank7;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank6) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank6; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank6;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank5) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank5; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank5;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank4) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank4; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank4;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank3) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank3; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank3;
	elseif IsSpellKnown(ids.Rank.ShadowBoltRank2) then ids.Ability.ShadowBolt = ids.Rank.ShadowBoltRank2; ids.Runes.ShadowCleave = ids.Rank.ShadowCleaveRank2; end

	if IsSpellKnown(ids.Rank.ShadowburnRank6) then ids.Ability.Shadowburn = ids.Rank.ShadowburnRank6;
	elseif IsSpellKnown(ids.Rank.ShadowburnRank5) then ids.Ability.Shadowburn = ids.Rank.ShadowburnRank5;
	elseif IsSpellKnown(ids.Rank.ShadowburnRank4) then ids.Ability.Shadowburn = ids.Rank.ShadowburnRank4;
	elseif IsSpellKnown(ids.Rank.ShadowburnRank3) then ids.Ability.Shadowburn = ids.Rank.ShadowburnRank3;
	elseif IsSpellKnown(ids.Rank.ShadowburnRank2) then ids.Ability.Shadowburn = ids.Rank.ShadowburnRank2; end

	if IsSpellKnown(ids.Rank.SoulFireRank2) then ids.Ability.SoulFire = ids.Rank.SoulFireRank2; end

	--Pet
	if IsSpellKnown(ids.Pet.SpellLockRank2) then ids.Pet.SpellLock = ids.Pet.SpellLockRank2; end
end