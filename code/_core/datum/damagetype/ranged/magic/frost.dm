/damagetype/ranged/magic/frost
	attack_damage_base = list(
		COLD = 45*0.4,
		ARCANE = 45*0.1
	)

	attribute_stats = list(
		ATTRIBUTE_INTELLIGENCE = 45*0.2
	)

	attribute_damage = list(
		ATTRIBUTE_INTELLIGENCE = list(COLD,ARCANE)
	)

	skill_stats = list(
		SKILL_MAGIC = 45*0.3,
	)

	skill_damage = list(
		SKILL_MAGIC = ARCANE
	)

	bonus_experience_skill = list(
		SKILL_MAGIC = 75 //75%
	)