/mob/living/simple/bot/medical
	name = "medical bot"
	desc = "I NEED HEALING."
	desc_extended = "A medical bot programmed to heal those in need. It's not afraid to defend itself."

	loyalty_tag = "NanoTrasen"
	iff_tag = "NanoTrasen"

	icon = 'icons/mob/living/simple/medibot.dmi'
	icon_state = "preview"

	ai = /ai/bot/medical/

	var/healing_threshold = 10
	var/amount_to_inject = 10

	var/overlay_icon_state = "firstaid"
	var/overlay_icon = 'icons/obj/item/storage/kits.dmi'

	var/list/medicine = list(
		BRUTE = /reagent/medicine/bicaridine,
		BURN = /reagent/medicine/kelotane,
		TOX = /reagent/medicine/dylovene,
		OXY = /reagent/iron
	)

	damage_type = /damagetype/npc/medibot

	class = /class/medibot

	stun_angle = 180

/mob/living/simple/bot/medical/Finalize()
	. = ..()
	update_sprite()
	return .

/mob/living/simple/bot/medical/update_icon()

	. =..()

	if(is_busy(src))
		icon_state = "yellow"
	else if(ai && ai.objective_attack)
		icon_state = "red"
	else
		icon_state = "blue"

	return .

/mob/living/simple/bot/medical/update_overlays()

	. = ..()

	var/image/I = new(overlay_icon,overlay_icon_state)
	underlays += I

	return .

/mob/living/simple/bot/medical/proc/get_inject_amount(var/mob/living/target)

	. = list()

	for(var/DT in medicine)
		var/loss = target.health.get_loss(DT)
		if(loss < healing_threshold)
			continue
		var/reagent/R = REAGENT(medicine[DT])
		var/existing_reagent_amount = target.reagents.get_reagent_volume(medicine[DT])
		if(existing_reagent_amount)
			continue
		var/desired_amount = min(R.overdose_threshold,amount_to_inject)-existing_reagent_amount
		if(desired_amount > 0)
			.[medicine[DT]] = desired_amount

	return length(.) ? . : FALSE

/mob/living/simple/bot/medical/proc/treat(var/mob/living/target)

	var/inject_amount = get_inject_amount(target)

	if(inject_amount)
		for(var/k in inject_amount)
			var/v = inject_amount[k]
			target.reagents.add_reagent(k,v)

		target.to_chat(span("danger","\The [src.name] injects you with the hypospray."))

		switch(rand(1,2))
			if(1)
				play('sound/voice/medbot/feelbetter.ogg',get_turf(src))
				src.do_say("Feel better soon!")
			if(2)
				play('sound/voice/medbot/patchedup.ogg',get_turf(src))
				src.do_say("All patched up!")

		update_icon()

	return TRUE

/mob/living/simple/bot/medical/proc/can_treat(var/mob/living/target)

	if(!target || target.qdeleting)
		return FALSE

	if(target == src)
		return FALSE

	if(!target.reagents)
		return FALSE

	if(!target.health)
		return FALSE

	if(target.dead)
		return FALSE

	if(get_dist(src,target) > 1)
		return FALSE

	if(!get_inject_amount(target))
		return FALSE

	return TRUE

/mob/living/simple/bot/medical/proc/try_treat(var/mob/living/target)

	if(get_inject_amount(target))
		PROGRESS_BAR(src,src,SECONDS_TO_DECISECONDS(5),.proc/treat,target)
		PROGRESS_BAR_CONDITIONS(src,src,.proc/can_treat,target)
		target.to_chat(span("danger","\The [src.name] is trying to inject you!"))
		if(target.has_status_effect(CRIT))
			play('sound/voice/medbot/no.ogg',get_turf(src))
			src.do_say("No, stay with me!")
		update_icon()
		return TRUE

	return FALSE



/mob/living/simple/bot/medical/syndicate
	name = "Dr. Malpractice"
	overlay_icon_state = "tactical"
	loyalty_tag = "Syndicate"
	iff_tag = "Syndicate"

	health_base = 200


/mob/living/simple/bot/medical/rogue
	name = "rogue medical bot"
	iff_tag = "Robot"
	iff_tag = "Robot"

	health_base = 200

/mob/living/simple/bot/medical/rogue/Generate()
	var/desired_pack = pick("firstaid","brute","burn","toxin","rad","purple","oxy","tactical")
	var/desired_num = pick("","1","2","3","4")
	overlay_icon = "[desired_pack][desired_num]"
	return ..()

/mob/living/simple/bot/medical/rogue/Finalize()
	. = ..()
	update_sprite()
	return .