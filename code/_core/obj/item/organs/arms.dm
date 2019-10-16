/obj/item/organ/arm
	name = "right arm"
	id = BODY_ARM_RIGHT
	desc = "A right arm."
	icon_state = BODY_ARM_RIGHT
	worn_layer = LAYER_MOB_ARMS
	break_threshold = 25
	//health_max = 50
	attach_flag = BODY_TORSO

	enable_wounds = TRUE

	hud_id = "body_arm_right"

	can_be_targeted = TRUE

	target_bounds_x_min = 8
	target_bounds_x_max = 11

	target_bounds_y_min = 9
	target_bounds_y_max = 22

	base_miss_chance = 10

/obj/item/organ/arm/left
	name = "left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT
	desc = "A left arm."

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 9
	target_bounds_y_max = 22

//Reptile Feral
/obj/item/organ/arm/reptile
	name = "reptile right arm"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

/obj/item/organ/arm/reptile/left
	name = "reptile left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 9
	target_bounds_y_max = 22

//Reptile Advanced
/obj/item/organ/arm/reptile_advanced
	name = "reptile advanced right arm"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'

/obj/item/organ/arm/reptile_advanced/left
	name = "reptile advanced left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 9
	target_bounds_y_max = 22

//Diona
/obj/item/organ/arm/diona
	name = "diona right arm"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	enable_glow = TRUE
	enable_detail = TRUE

/obj/item/organ/arm/diona/left
	name = "diona left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 9
	target_bounds_y_max = 22

//Cyborg
/obj/item/organ/arm/cyborg
	name = "cyborg right arm"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

/obj/item/organ/arm/cyborg/left
	name = "cyborg left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 9
	target_bounds_y_max = 22