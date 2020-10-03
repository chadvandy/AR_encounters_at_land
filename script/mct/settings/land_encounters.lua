local mct = get_mct()

local mct_mod = mct:register_mod("land_encounters")

local encounter_start = mct_mod:add_new_option("encounter_start", "slider")
encounter_start:set_text("Encounter Number Start Percentile")
encounter_start:set_tooltip_text("This is the number multiplied to the total number of encounter-spots available, when creating the Land Encounters on a new campaign. If there are 200 available spots, and this number is set to 0.05, there will be 10 encounters to start off spread throughout the map.")

encounter_start:slider_set_precision(2)
encounter_start:slider_set_step_size(0.01, 2)
encounter_start:slider_set_min_max(0.00, 0.25)
encounter_start:set_default_value(0.05)