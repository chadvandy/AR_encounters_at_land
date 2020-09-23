local encounter_land_location_set = require("script/campaign/land_encounters/mortal_coords")
local vortex_encounter_land_location_set = require("script/campaign/land_encounters/vortex_coords")

local bandit_names = require("script/campaign/land_encounters/bandit_names")

local land_encounter_starting_faction = "";

local land_encounter_events = {
	["treasure"] = {
		"wh2_main_incident_encounter_at_land_1",
		"wh2_main_incident_encounter_at_land_2",
		"wh2_main_incident_encounter_at_land_3",
		"wh2_main_incident_encounter_at_land_4"
	},
	
	["marker"] = {
		"wh2_main_dilemma_encounter_at_land_1",
		"wh2_main_dilemma_encounter_at_land_2",
		"wh2_main_dilemma_encounter_at_land_3",
		"wh2_main_dilemma_encounter_at_land_4"
	}
};

--neo counters, corresponding info, including reward, chance of battle, enemy size, treausre map chance(only cst), extra loot event
local treausre_map_drop_rate = {30 , 50};

local land_neo_counters = {
	["wh2_main_incident_encounter_at_land_1_a"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_1_a", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_1_a"},
	["wh2_main_incident_encounter_at_land_1_b"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_1_b", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_1_b"},
	["wh2_main_incident_encounter_at_land_1_c"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_1_c", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_1_c"},
	["wh2_main_incident_encounter_at_land_2_a"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_2_a", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_2_a"},
	["wh2_main_incident_encounter_at_land_2_b"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_2_b", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_2_b"},
	["wh2_main_incident_encounter_at_land_2_c"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_2_c", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_2_c"},
	["wh2_main_incident_encounter_at_land_3_a"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_3_a", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_3_a"},
	["wh2_main_incident_encounter_at_land_3_b"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_3_b", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_3_b"},
	["wh2_main_incident_encounter_at_land_3_c"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_3_c", 100, 10, treausre_map_drop_rate[1],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_3_c"},
	["wh2_main_incident_encounter_at_land_4_a"] = {"wh2_dlc11_dilemma_neo_encounter_at_land_4_a", 100, 16, treausre_map_drop_rate[2],"wh2_dlc11_neo_counter_extra_loot", "wh2_dlc11_incident_neo_encounter_at_land_4_a"}
};

local land_neo_counters_list = {
	"wh2_dlc11_dilemma_neo_encounter_at_land_1_a", 
	"wh2_dlc11_dilemma_neo_encounter_at_land_1_b",
	"wh2_dlc11_dilemma_neo_encounter_at_land_1_c",
	"wh2_dlc11_dilemma_neo_encounter_at_land_2_a",
	"wh2_dlc11_dilemma_neo_encounter_at_land_2_b",
	"wh2_dlc11_dilemma_neo_encounter_at_land_2_c",
	"wh2_dlc11_dilemma_neo_encounter_at_land_3_a",
	"wh2_dlc11_dilemma_neo_encounter_at_land_3_b",
	"wh2_dlc11_dilemma_neo_encounter_at_land_3_c",
	"wh2_dlc11_dilemma_neo_encounter_at_land_4_a"
};

local land_encounter_events_details = {
	["wh2_main_incident_encounter_at_land_1"] = {
		["weight"] = 10,
		["variation"] = {"_a", "_b", "_c"},
		["model"] = {34, 35, 36, 37},
		["payloads"] = {}
	},
	
	["wh2_main_incident_encounter_at_land_2"] = {
		["weight"] = 10,
		["variation"] = {"_a", "_b", "_c"},
		["model"] = {38, 39, 40, 41, 42},
		["payloads"] = {}
	},
	
	["wh2_main_incident_encounter_at_land_3"] = {
		["weight"] = 10,
		["variation"] = {"_a", "_b", "_c"},
		["model"] = {43, 44, 45},
		["payloads"] = {}
	},
	
	["wh2_main_incident_encounter_at_land_4"] = {
		["weight"] = 10,
		["variation"] = {"_a"},
		["model"] = {46},
		["payloads"] = {}
	},
	
	["wh2_main_dilemma_encounter_at_land_1"] = {
		["weight"] = 10,
		["variation"] = {"", "_a"},
		["model"] = {47, 48, 49},
		["payloads"] = {
			{"wh2_main_encounter_at_land_combat_1", "wh2_main_encounter_at_land_combat_2"},
			{"wh2_main_encounter_at_land_campaign_2", "wh2_main_encounter_at_land_campaign_3"}
		}
	},
	
	["wh2_main_dilemma_encounter_at_land_2"] = {
		["weight"] = 10,
		["variation"] = {"", "_a"},
		["model"] = {50, 51},
		["payloads"] = {
			{"wh2_main_encounter_at_land_combat_3", "wh2_main_encounter_at_land_combat_4"},
			{"wh2_main_encounter_at_land_campaign_1", "wh2_main_encounter_at_land_campaign_2"}
		}
	},
	
	["wh2_main_dilemma_encounter_at_land_3"] = {
		["weight"] = 10,
		["variation"] = {"", "_a"},
		["model"] = {52, 53, 54},
		["payloads"] = {
			{"wh2_main_encounter_at_land_combat_4", "wh2_main_encounter_at_land_combat_5"},
			{"wh2_main_encounter_at_land_campaign_1", "wh2_main_encounter_at_land_campaign_4"}
		}
	},
	
	["wh2_main_dilemma_encounter_at_land_4"] = {
		["weight"] = 10,
		["variation"] = {"", "_a"},
		["model"] = {55, 56, 57, 58, 59},
		["payloads"] = {
			{"wh2_main_encounter_at_land_combat_1", "wh2_main_encounter_at_land_combat_2"},
			{"wh2_main_encounter_at_land_campaign_3", "wh2_main_encounter_at_land_campaign_2"}
		}
	}
};

local encounter_pirate_faction = "wh2_main_rogue_gerhardts_mercenaries_qb1";

local alternative_encounter_pirate_faction = "wh2_main_def_dark_elves_qb1";

local land_encounter_listener_info = {false, false, false, "", "", "", ""};

local land_encounter_listener_info_default = {false, false, false, "", "", "", ""};

local encounter_land_spots = {};

local land_encounter_turn_recorder = 0;

local encounter_number_per_turn = 0.03;

local encounter_number_start = 0.17;

local encounter_number_treasure = 0.3;

local encounter_spot_base_cd = 8;

local encounter_effect_length = 5; 

local encounter_spawn_interval = 5;

local encounter_target = 0;

local temp_char = nil; 

local temp_loc = nil;

local temp_event = nil;

local land_encounter_effect_keys = {
	["combat"] = {
		"wh2_main_encounter_at_land_combat_1",
		"wh2_main_encounter_at_land_combat_2",
		"wh2_main_encounter_at_land_combat_3",
		"wh2_main_encounter_at_land_combat_4",
		"wh2_main_encounter_at_land_combat_5"
	},
	
	["campaign"] = {
		"wh2_main_encounter_at_land_campaign_1",
		"wh2_main_encounter_at_land_campaign_2",
		"wh2_main_encounter_at_land_campaign_3",
		"wh2_main_encounter_at_land_campaign_4"
	}
};

function renew_effect_bundle(char_cqi, effect_bundle)
	cm:remove_effect_bundle_from_force(effect_bundle, char_cqi);
	cm:apply_effect_bundle_to_force(effect_bundle, char_cqi, encounter_effect_length);
end;

function land_get_available_encounter_spots()
out("getting available spots");
	local land_available_spots = {};
out("ecounter_land_spots are");
out(#encounter_land_spots);
	if #encounter_land_spots > 0 then
out("encounter_land_spots are over 0, proceeding!");
		for i = 1,#encounter_land_spots do
			if encounter_land_spots[i]["cd"] == 0 and encounter_land_spots[i]["occupied"] == "not" then
				table.insert(land_available_spots, encounter_land_spots[i]["index"]);
out("inserted a record from encounter land to available spots!");
			end;
		end;
		return land_available_spots;
	else
		return false;
	end;
end;

function populate_land_spots(category, land_number_of_spots)
	local land_available_spots = land_get_available_encounter_spots();
out("land_number_of_spots is")
out(land_number_of_spots)
	if land_number_of_spots > 0 and #land_available_spots >= land_number_of_spots then
out("number_of_posts is over 0 and land_available_spots are higher than them!");
		for i = 1,land_number_of_spots do
			local index = cm:random_number(#land_available_spots);
out("index is");
out(index);
			local land_event_key = land_encounter_events[category][cm:random_number(#land_encounter_events[category])];
out("event key is");
out(land_event_key);
			local model_index = land_encounter_events_details[land_event_key]["model"][cm:random_number(#land_encounter_events_details[land_event_key]["model"])];
out("model index is");
out(model_index);
			
			encounter_land_spots[land_available_spots[index]]["occupied"] = category;

			local display_marker_x, display_marker_y = campaign_manager:log_to_dis(encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2])
			
			--vortex markers
			if cm:model():campaign_name("wh2_main_great_vortex") then
				--southlands markers
				if encounter_land_spots[land_available_spots[index]]["location"][1] > 374 and encounter_land_spots[land_available_spots[index]]["location"][2] < 370 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "southlands_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--lustria markers
				elseif encounter_land_spots[land_available_spots[index]]["location"][1] < 374 and encounter_land_spots[land_available_spots[index]]["location"][2] < 425 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "lustria_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--ulthuan markers
				elseif encounter_land_spots[land_available_spots[index]]["location"][1] > 380 and encounter_land_spots[land_available_spots[index]]["location"][1] < 690 and encounter_land_spots[land_available_spots[index]]["location"][2] > 385 and encounter_land_spots[land_available_spots[index]]["location"][2] < 645 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "ulthuan_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--naggaroth markers
				elseif encounter_land_spots[land_available_spots[index]]["location"][1] < 377 and encounter_land_spots[land_available_spots[index]]["location"][2] > 425 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "naggaroth_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				else
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "norsca_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				end
				
			end;
			--mortal empires markers
			if cm:model():campaign_name("main_warhammer") then
				--southlands markers
				if encounter_land_spots[land_available_spots[index]]["location"][1] > 320 and encounter_land_spots[land_available_spots[index]]["location"][2] < 150 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "southlands_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--badlands markers
				elseif (encounter_land_spots[land_available_spots[index]]["location"][1] > 517 and encounter_land_spots[land_available_spots[index]]["location"][2] < 206 and encounter_land_spots[land_available_spots[index]]["location"][2] > 150) or 
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 542 and encounter_land_spots[land_available_spots[index]]["location"][2] < 236 and encounter_land_spots[land_available_spots[index]]["location"][2] > 206) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 565 and encounter_land_spots[land_available_spots[index]]["location"][2] < 283 and encounter_land_spots[land_available_spots[index]]["location"][2] > 236) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 590 and encounter_land_spots[land_available_spots[index]]["location"][2] < 337 and encounter_land_spots[land_available_spots[index]]["location"][2] > 283) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 780 and encounter_land_spots[land_available_spots[index]]["location"][2] < 524 and encounter_land_spots[land_available_spots[index]]["location"][2] > 337) then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "badlands_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--lustria markers
				elseif (encounter_land_spots[land_available_spots[index]]["location"][1] < 320 and encounter_land_spots[land_available_spots[index]]["location"][2] < 250) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] < 125 and encounter_land_spots[land_available_spots[index]]["location"][2] < 350) then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "lustria_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--naggaroth markers
				elseif (encounter_land_spots[land_available_spots[index]]["location"][1] < 125 and encounter_land_spots[land_available_spots[index]]["location"][2] > 250 and encounter_land_spots[land_available_spots[index]]["location"][2] < 670) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] < 290 and encounter_land_spots[land_available_spots[index]]["location"][2] > 460 and encounter_land_spots[land_available_spots[index]]["location"][2] < 670) then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "naggaroth_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--ulthuan markers
				elseif encounter_land_spots[land_available_spots[index]]["location"][1] > 125 and encounter_land_spots[land_available_spots[index]]["location"][1] < 320 and encounter_land_spots[land_available_spots[index]]["location"][2] > 250 and encounter_land_spots[land_available_spots[index]]["location"][2] < 460 then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "ulthuan_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--norsca markers
				elseif (encounter_land_spots[land_available_spots[index]]["location"][1] > 1 and encounter_land_spots[land_available_spots[index]]["location"][2] > 670) or 
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 290 and encounter_land_spots[land_available_spots[index]]["location"][1] < 415 and encounter_land_spots[land_available_spots[index]]["location"][2] > 520) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 415 and encounter_land_spots[land_available_spots[index]]["location"][2] > 574) then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "norsca_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				--dwarf markers
				elseif (encounter_land_spots[land_available_spots[index]]["location"][1] > 569 and encounter_land_spots[land_available_spots[index]]["location"][1] < 618 and encounter_land_spots[land_available_spots[index]]["location"][2] > 344 and encounter_land_spots[land_available_spots[index]]["location"][2] < 364) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 641 and encounter_land_spots[land_available_spots[index]]["location"][1] < 780 and encounter_land_spots[land_available_spots[index]]["location"][2] > 338 and encounter_land_spots[land_available_spots[index]]["location"][2] < 387) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 700 and encounter_land_spots[land_available_spots[index]]["location"][1] < 779 and encounter_land_spots[land_available_spots[index]]["location"][2] > 387 and encounter_land_spots[land_available_spots[index]]["location"][2] < 508) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 463 and encounter_land_spots[land_available_spots[index]]["location"][1] < 506 and encounter_land_spots[land_available_spots[index]]["location"][2] > 393 and encounter_land_spots[land_available_spots[index]]["location"][2] < 404) or
				(encounter_land_spots[land_available_spots[index]]["location"][1] > 508 and encounter_land_spots[land_available_spots[index]]["location"][1] < 581 and encounter_land_spots[land_available_spots[index]]["location"][2] > 340 and encounter_land_spots[land_available_spots[index]]["location"][2] < 378) then
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "dwarf_encounter_marker", encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
				else
				cm:add_interactable_campaign_marker("land_test_marker_" .. encounter_land_spots[land_available_spots[index]]["index"], "encounter_marker_" .. tostring(model_index), encounter_land_spots[land_available_spots[index]]["location"][1], encounter_land_spots[land_available_spots[index]]["location"][2], 4, "", "");
			end;
			end
			
			
out("marker set!")	
			encounter_land_spots[land_available_spots[index]]["model"] = model_index;
			
			if #land_encounter_events_details[land_event_key]["variation"] == 0 then
				encounter_land_spots[land_available_spots[index]]["event"] = land_event_key;
			else
				encounter_land_spots[land_available_spots[index]]["event"] = land_event_key .. land_encounter_events_details[land_event_key]["variation"][cm:random_number(#land_encounter_events_details[land_event_key]["variation"])];
			end;
			
			table.remove(land_available_spots, index);
		end;
	end;
end;

function land_get_number_of_occupied_spots_with_category(category)
	local counter = 0;
	
	for i = 1, #encounter_land_spots do
		if encounter_land_spots[i]["occupied"] == category then
			counter = counter + 1;
		end;
	end;
	
	return counter;
end;


core:add_listener(
	"faction_turn_start_populate_land_spots",
	"FactionTurnEnd",
	true,
	function(context)
		local turn_number = cm:model():turn_number();
		if land_encounter_turn_recorder == 0 then
			local campaign_key = "";
			
			if cm:model():campaign_name("main_warhammer") then
				chosen_coordinate_set = encounter_land_location_set;
			elseif cm:model():campaign_name("wh2_main_great_vortex") then
				chosen_coordinate_set = vortex_encounter_land_location_set;
			else
				script_error("ERROR: Trying to set encounters at land, but could not find the campaign name!");
				return;
			end;
out("encounter_land_location_set are");
out(#encounter_land_location_set);
			for i = 1, #chosen_coordinate_set do
				local spot = {
					["index"] = i,
					["location"] = chosen_coordinate_set[i],
					["occupied"] = "not",
					["cd"] = 0
				};			
				table.insert(encounter_land_spots, spot);
out("inserted a record from encounter_land_location_set to encounter_land_spots!");
			end;
			
			populate_land_spots("treasure", math.floor(encounter_number_start * #encounter_land_spots));
out("marker set!1")
			populate_land_spots("marker", math.floor(encounter_number_start * #encounter_land_spots));
out("marker set!2")			
			land_encounter_starting_faction = context:faction():name();
		elseif turn_number ~= land_encounter_turn_recorder and turn_number % encounter_spawn_interval ==0 then
			for i = 1, #encounter_land_spots do
				if encounter_land_spots[i]["cd"] > 0 then
					encounter_land_spots[i]["cd"] = encounter_land_spots[i]["cd"] - 1;
				end;
			end;
			
			if land_get_number_of_occupied_spots_with_category("treasure") < math.floor(encounter_number_treasure * #encounter_land_spots) then
				populate_land_spots("treasure",  math.floor(encounter_number_per_turn * #encounter_land_spots));
out("marker set!3")
			end;
			
			populate_land_spots("marker", math.floor(encounter_number_per_turn * #encounter_land_spots));
out("marker set!4")
		end;
		
		land_encounter_turn_recorder = turn_number;
	end,
	true
);


function land_TriggerEncounterIncident(faction, incident)
	out("triggered encounter incident");
	if faction:subculture() == "wh2_dlc09_sc_tmb_tomb_kings" then
		cm:trigger_incident(faction:name(), incident.."_tmb", true);
	elseif faction:subculture() == "wh_main_sc_nor_norsca" then
		cm:trigger_incident(faction:name(), incident.."_nor", true);
	else
		cm:trigger_incident(faction:name(), incident, true);
	end
	
	--check aranessa skill
	if land_neo_counters[incident] ~= nil then
		local skill_found = false;
		if faction:character_list():num_items() >= 1 then
			for i = 1, faction:character_list():num_items() do
				if faction:character_list():item_at(i-1):character_subtype_key() == "wh2_dlc11_cst_aranessa" and faction:character_list():item_at(i-1):has_skill("wh2_dlc11_skill_cst_aranessa_unique_5") then
					--trigger extra loot event
					if land_neo_counters[incident][5] ~= nil then
						out(land_neo_counters[incident][5]);
						cm:callback(function()
							cm:trigger_incident(faction:name(), land_neo_counters[incident][5], true);
						end, 0.5);
					end
				end
			end
		end
		
		--check treasure map drops
		if faction:subculture() == "wh2_dlc11_sc_cst_vampire_coast" then
				if land_neo_counters[incident][4] ~= nil then
					TriggerTreasureMapMission(faction:name(), land_neo_counters[incident][4])
				end
		end
	end
end


core:add_listener(
	"dilemma_choice_made_event_trigger_counter_at_land_incident",
	"DilemmaChoiceMadeEvent",
	true,
	function(context)
		local choice = context:choice();
		local dilemma = context:dilemma();
		local whose_turn_is_it_name = cm:model():world():whose_turn_is_it():name();
		local whose_turn_is_it = cm:model():world():whose_turn_is_it();
		
		out("encounter_target is"..encounter_target);
		--for old timie dilemmas
		for i = 1, #land_encounter_events["marker"] do
			if #land_encounter_events_details[land_encounter_events["marker"][i]]["variation"] == 0 then
				if dilemma == land_encounter_events["marker"][i] then
					local land_event_key = land_encounter_events["marker"][i];
					local payload_index = choice + 1;
					
					if #land_encounter_events_details[land_event_key]["payloads"][payload_index] > 0 then
						local rand_number = cm:random_number(#land_encounter_events_details[land_event_key]["payloads"][payload_index]);
						
						renew_effect_bundle(encounter_target, land_encounter_events_details[land_event_key]["payloads"][payload_index][rand_number]);
						cm:trigger_incident(whose_turn_is_it_name, land_encounter_events_details[land_event_key]["payloads"][payload_index][rand_number], true);
					end;
				end;
			else
				for j = 1, #land_encounter_events_details[land_encounter_events["marker"][i]]["variation"] do
					if dilemma == land_encounter_events["marker"][i]..land_encounter_events_details[land_encounter_events["marker"][i]]["variation"][j] then
						local land_event_key = land_encounter_events["marker"][i];
						local payload_index = choice + 1;
						
						if #land_encounter_events_details[land_event_key]["payloads"][payload_index] > 0 then
							local rand_number = cm:random_number(#land_encounter_events_details[land_event_key]["payloads"][payload_index]);
							
							renew_effect_bundle(encounter_target, land_encounter_events_details[land_event_key]["payloads"][payload_index][rand_number]);
							land_TriggerEncounterIncident(cm:model():world():whose_turn_is_it(), land_encounter_events_details[land_event_key]["payloads"][payload_index][rand_number]);
						end;
					end;
				end;
			end;
		end;
		
		--for neo dilemmas
		for i = 1, #land_neo_counters_list do
			if dilemma == land_neo_counters_list[i] then
				if choice == 0 then
					if land_neo_counters[land_encounter_listener_info[7]][2] >= cm:random_number(100) then					
						local x, y = cm:find_valid_spawn_location_for_character_from_position(cm:model():world():whose_turn_is_it():name(), temp_loc[1], temp_loc[2], false);
						
						land_GenerateEncounterPirate(temp_char, {x, y}, land_neo_counters[land_encounter_listener_info[7]][3]);
						land_SetupEncounterPostbattle(land_encounter_listener_info[7], whose_turn_is_it);
					else
						land_TriggerEncounterIncident(whose_turn_is_it, land_encounter_listener_info[7]);
						land_encounter_listener_info[3] = false;
						land_encounter_listener_info[6] = "";
						land_encounter_listener_info[7] = "";
					end
				else
					land_TriggerEncounterIncident(whose_turn_is_it, land_neo_counters[land_encounter_listener_info[7]][6]);
					land_encounter_listener_info[3] = false;
					land_encounter_listener_info[6] = "";
					land_encounter_listener_info[7] = "";
				end
			end
		end
	end,
	true
);

function land_Remodulate(vector, desired_mag)
	local mag = math.sqrt(vector[1] * vector[1] + vector[2] * vector[2]);
	local result_vector = {0,0};
	local scale = desired_mag/mag; 
	if vector[1] == 0 and vector[2] == 0 then
		vector[1] = 1;
		vector[2] = 1;
	end
	result_vector[1] = math.ceil(vector[1] * scale);
	result_vector[2] = math.ceil(vector[2] * scale);
	return result_vector; 
end

core:add_listener(
	"incident_event_encounter_at_land_add_agent_experience",
	"IncidentEvent",
	true,
	function(context)
		local incident = context:dilemma();
		
		if incident == "wh2_main_incident_encounter_at_land_1_b" or incident == "wh2_main_incident_encounter_at_land_2_b" or incident == "wh2_main_incident_encounter_at_land_3_b" then
			cm:add_agent_experience(cm:char_lookup_str(encounter_target), 1500);
		end;
	end,
	true
);

core:add_listener(
	"incident_occurred_event_encounter_at_land_remove_effect_bundle",
	"IncidentOccuredEvent",
	true,
	function(context)
		local incident = context:dilemma();
		local whose_turn_is_it_name = cm:model():world():whose_turn_is_it():name();
		
		cm:callback(function()
			for i = 1, #land_encounter_effect_keys["combat"] do
				if incident == land_encounter_effect_keys["combat"][i] then
					cm:remove_effect_bundle(incident .. "_dummy", whose_turn_is_it_name);
				end;
			end;	
			for i = 1, #land_encounter_effect_keys["campaign"] do
				if incident == land_encounter_effect_keys["campaign"][i] then
					cm:remove_effect_bundle(incident .. "_dummy", whose_turn_is_it_name);
				end;
			end;
		end, 0.5);
	end,
	true
);
out("test2")

core:add_listener(
	"area_entered_trigger_encounter_at_land",
	"AreaEntered",
	true,
	function(context)
		local index = tonumber(string.sub(context:area_key(), 18));
		local area_key = context:area_key()
		local character = context:character();
		local faction = character:faction();
		local faction_name = faction:name();
		if cm:char_is_general_with_army(character) and string.find(area_key, "land") then
			land_declare_armies()
			land_TriggerEncounter(index, context);
		end;
	end,
	true
);

core:add_listener(
	"pending_battle_trigger_encounter_at_land_ui_lock",
	"PendingBattle",
	true,
	function(context)
out("pending battle listener triggered!")
		local found_encounter_faction = false; 
		
		if cm:pending_battle_cache_num_attackers() >= 1 then
			for i = 1, cm:pending_battle_cache_num_attackers() do
				local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_attacker(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
				end
			end
		end		
		if cm:pending_battle_cache_num_defenders() >= 1 then
			for i = 1, cm:pending_battle_cache_num_defenders() do
				local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_defender(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
				end
			end
		end
		
		if found_encounter_faction == true then
out("its the bandits, locking the UI!")
			local uim = cm:get_campaign_ui_manager();
			uim:override("retreat"):lock();
			cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
			cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
		elseif found_encounter_faction ~= true and land_encounter_listener_info[3] then
			local uim = cm:get_campaign_ui_manager();
			uim:override("retreat"):unlock();
			land_encounter_listener_info[3] = false;
			land_encounter_listener_info[6] = "";
			land_encounter_listener_info[7] = "";
		end
out("pending battle listener ending")
	end,
	true
);

function land_TriggerEncounter(index, context)
	local character = context:character();
	local faction = character:faction();
	local faction_name = faction:name();
	encounter_target = character:command_queue_index();
	local dont_remove_encounter = false;
	if faction:is_human() and cm:model():world():whose_turn_is_it():is_human() then
		if encounter_land_spots[index]["occupied"] == "treasure" then
			local incident = encounter_land_spots[index]["event"];
			out("this is "..incident);
			--out("checking for"..land_neo_counters[incident][1]);
			
			if land_neo_counters[incident][1] ~= "" and land_neo_counters[incident][1] ~= nil then
				--check if the army is in proper stance
				if character:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_DEFAULT" then
				--if true then
					cm:trigger_dilemma(faction_name, land_neo_counters[incident][1]);
					temp_char = character;
					temp_loc = encounter_land_spots[index]["location"];
					--land_SetupEncounterPostbattle(incident, faction);
					land_encounter_listener_info[3] = true;
					land_encounter_listener_info[6] = faction_name;
					land_encounter_listener_info[7] = incident;
				else
					dont_remove_encounter = true;
					--trigger eventfeed
						cm:show_message_event_located(
						faction_name,
						"event_feed_strings_text_wh2_dlc11_event_feed_string_scripted_event_passing_by_land_encounter_title",
						"event_feed_strings_text_wh2_dlc11_event_feed_string_scripted_event_passing_by_land_encounter_primary_details",
						"event_feed_strings_text_wh2_dlc11_event_feed_string_scripted_event_passing_by_land_encounter_secondary_details",
						encounter_land_spots[index]["location"][1],
						encounter_land_spots[index]["location"][2],
						false,
						1017
						);	
				end
			else
				land_TriggerEncounterIncident(faction, incident);
		
				if (incident == "wh2_main_incident_encounter_at_land_1_b" or incident == "wh2_main_incident_encounter_at_land_2_b" or incident == "wh2_main_incident_encounter_at_land_3_b") then
					cm:add_agent_experience(cm:char_lookup_str(encounter_target), 1500);
				end;
			end;
					
		elseif encounter_land_spots[index]["occupied"] == "marker" then
			local dilemma = encounter_land_spots[index]["event"];
			out("marker discovered!");
			encounter_target = character:military_force():command_queue_index();		
			cm:trigger_dilemma(faction_name, dilemma);	
		end;
	end;
	
	if dont_remove_encounter == false then
		land_ClearSpot(context, index);
	end
	
	
end

function land_ClearSpot(context, index)
	cm:remove_interactable_campaign_marker(context:area_key());
	cm:remove_interactable_campaign_marker("vfx_"..context:area_key());
	encounter_land_spots[index]["occupied"] = "not";
	encounter_land_spots[index]["cd"] = encounter_spot_base_cd;
	encounter_land_spots[index]["model"] = 0;
end

function land_SetupEncounterPostbattle(incident, faction)
	core:add_listener(
	"Land_EncounterPostbattle",
	"BattleCompleted", 
	true,
	function(context)
out("starting PostBattle Listener!")
		local found_encounter_faction = false; 
		local loot = false;
		local im = invasion_manager;
		local evasion = im:get_invasion("land_encounter_invasion");
		if cm:pending_battle_cache_num_attackers() >= 1 then
			for i = 1, cm:pending_battle_cache_num_attackers() do
				local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_attacker(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
					if cm:model():character_for_command_queue_index(this_char_cqi):is_null_interface()==true or (cm:model():character_for_command_queue_index(this_char_cqi):is_null_interface() == false and cm:model():character_for_command_queue_index(this_char_cqi):won_battle() == false) then
						loot = true; 
					end
					if evasion ~= nil then
out("killing invasion on land_SetupEncounterPostbattle1")
						cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
						cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
						evasion:kill();
						cm:callback(function() cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") end, 1);
						cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);
					end;
				end
			end
		end		
		if cm:pending_battle_cache_num_defenders() >= 1 then
			for i = 1, cm:pending_battle_cache_num_defenders() do
				local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_defender(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
					if cm:model():character_for_command_queue_index(this_char_cqi):is_null_interface()==true or (cm:model():character_for_command_queue_index(this_char_cqi):is_null_interface() == false and cm:model():character_for_command_queue_index(this_char_cqi):won_battle() == false) then
						loot = true; 
					end
					if evasion ~= nil then
out("killing invasion on land_SetupEncounterPostbattle1")
						cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
						cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
						evasion:kill();
						cm:callback(function() cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") end, 1);
						cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);
					end;

				end
			end
		end
		out("checking if post loot option is needed");
		out(found_encounter_faction);
		out(land_encounter_listener_info[3]);
		out(loot);
		cm:callback(function() cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") end, 1);
		cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);
		if found_encounter_faction == true and land_encounter_listener_info[3] then
			local uim = cm:get_campaign_ui_manager();
			uim:override("retreat"):unlock();
			land_encounter_listener_info[3] = false;
			land_encounter_listener_info[6] = "";
			land_encounter_listener_info[7] = "";
			if loot then
				out("triggering loot event");
				local faction_name = faction:name();
				land_TriggerEncounterIncident(faction, incident);
			end
		end
out("ending PostBattle Listener!")
	end,
	false
	);

end

function land_ReconstructListeners()
	local lokhir_listener = land_encounter_listener_info[1];
	local pirate_listener = land_encounter_listener_info[2];
	local encounter_post_battle_listener = land_encounter_listener_info[3];
	local mission_key = land_encounter_listener_info[4];
	local next_mission_key = land_encounter_listener_info[5];
	local faction_key = land_encounter_listener_info[6];
	local incident = land_encounter_listener_info[7];
	
	if lokhir_listener == true then
		--lokir listener
		core:add_listener(
		"Lokhir_mission_listener",
		"AreaEntered", 
		function(context)
			out.design("checking lokhir mission existing or not");
			return true;
		end,
		function(context)
			local index = tonumber(string.sub(context:area_key(), 13));
			if not index then
				out("not an encounter!");
			else
				out("an encounter!");
				local character = context:character();
				local faction = character:faction();
				local faction_name = faction:name();
				out("acessing lokhir check");
				out(faction_name);
				if lokhir_faction == faction_name then
					out("it is lokhir");
					cm:complete_scripted_mission_objective(mission_key, "joys_mission", true);
					cm:trigger_mission(lokhir_faction, next_mission_key, true);
					land_encounter_listener_info[1] = false;
					land_encounter_listener_info[4] = "";
					land_encounter_listener_info[5] = "";
				end;
			end;
		end,
		false
		);
	end
	
	if pirate_listener == true then
		--remove pirate encounter force
		land_SetupEncounterForceRemoval();
	end
	
	cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed");
	cm:disable_event_feed_events(false, "wh_event_category_character", "", "");	
	
	if encounter_post_battle_listener == true then
		--postbattle loot listerner
		out("reconstructing postbattle listeners");
		local faction = cm:model():world():faction_by_key(faction_key);
		land_SetupEncounterPostbattle(incident, faction);
		cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
		cm:disable_event_feed_events(true, "wh_event_category_character", "", "");	
		local uim = cm:get_campaign_ui_manager();
		uim:override("retreat"):lock();
	end
end

--bandit armies
function land_declare_armies()
random_army_manager:remove_force("encounter_force_bandits")
cm:callback(function() 
local bandit_army_roll = cm:random_number(6)
out("Next army will be "..bandit_army_roll)
if bandit_army_roll == 1 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_main_emp_inf_halberdiers", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_main_emp_inf_handgunners", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_inf_greatswords", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_inf_greatswords", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_inf_spearmen_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_art_helstorm_rocket_battery", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_cav_empire_knights", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_cav_outriders_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_dlc13_emp_inf_huntsmen_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_art_mortar", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_emp_inf_crossbowmen", 2);
		army_land_encounters_leader = "emp_lord"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;
if bandit_army_roll == 2 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_dlc08_nor_inf_marauder_champions_0", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_dlc08_nor_inf_marauder_hunters_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_feral_manticore", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_mon_norscan_giant_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_mon_fimir_1", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_mon_skinwolves_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_inf_marauder_berserkers_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_nor_mon_chaos_warhounds_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc08_nor_mon_war_mammoth_0", 1);
		army_land_encounters_leader = "nor_marauder_chieftain"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;
if bandit_army_roll == 3 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_main_grn_inf_black_orcs", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_main_grn_inf_night_goblin_archers", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_mon_giant", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_mon_trolls", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_inf_black_orcs", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_cav_orc_boar_boyz", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc06_grn_inf_nasty_skulkers_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_inf_goblin_spearmen", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_main_grn_inf_savage_orcs", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc06_grn_inf_nasty_skulkers_0", 1);
		army_land_encounters_leader = "grn_orc_warboss"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;
if bandit_army_roll == 4 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh2_main_def_inf_darkshards_1", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh2_main_def_inf_black_guard_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_art_reaper_bolt_thrower", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_mon_black_dragon", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_inf_shades_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_inf_bleakswords_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_cav_cold_one_knights_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_inf_shades_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_mon_war_hydra_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_dlc10_def_inf_sisters_of_slaughter", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_def_inf_harpies", 1);
		army_land_encounters_leader = "wh2_main_def_dreadlord"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;
if bandit_army_roll == 5 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh2_main_skv_inf_clanrat_spearmen_1", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh2_dlc14_skv_inf_eshin_triads_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_mon_hell_pit_abomination", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_dlc12_skv_inf_warplock_jezzails_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_inf_plague_monks", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_mon_rat_ogres", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_inf_stormvermin_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_inf_skavenslave_slingers_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_inf_gutter_runners_1", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_inf_night_runners_1", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_dlc14_skv_inf_eshin_triads_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_main_skv_veh_doomwheel", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh2_dlc14_skv_inf_poison_wind_mortar_0", 1);
		army_land_encounters_leader = "wh2_main_skv_warlord"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;	
if bandit_army_roll == 6 then
		random_army_manager:new_force("encounter_force_bandits");
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_dlc05_wef_inf_deepwood_scouts_0", 2);
		random_army_manager:add_mandatory_unit("encounter_force_bandits", "wh_dlc05_wef_inf_glade_guard_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_eternal_guard_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_cha_ancient_treeman_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_mon_treekin_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_dryads_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_waywatchers_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_wardancers_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_cav_wild_riders_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_cav_wild_riders_1", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_deepwood_scouts_0", 2);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_forest_dragon_0", 1);
		random_army_manager:add_unit("encounter_force_bandits", "wh_dlc05_wef_inf_deepwood_scouts_1", 1);
		army_land_encounters_leader = "dlc05_wef_glade_lord"
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
end;	
end, 0.1)
end

function levels_for_land_encounters(force_leader)
local char_str_enc = cm:char_lookup_str(force_leader:command_queue_index());
local turn = cm:model():turn_number()
		if turn <= 25 then
		elseif turn > 25 and turn <= 50 then 
		cm:add_agent_experience(char_str_enc, math.random(3000, 5000))
		elseif turn > 50 and turn <= 75 then
		cm:add_agent_experience(char_str_enc, math.random(5000, 7000))
		elseif turn > 75 and turn <= 100 then
		cm:add_agent_experience(char_str_enc, math.random(7000, 9000))
		elseif turn > 100 and turn <= 125 then
		cm:add_agent_experience(char_str_enc, math.random(9000, 11000))
		elseif turn > 125 and turn <= 150 then
		cm:add_agent_experience(char_str_enc, math.random(11000, 13000))
		elseif turn > 150 and turn <= 175 then
		cm:add_agent_experience(char_str_enc, math.random(13000, 15000))
		elseif turn > 175 then
		cm:add_agent_experience(char_str_enc, math.random(15000, 17000))
		end;
end

function skills_for_land_encounters(force_leader)
local char_str_enc = cm:char_lookup_str(force_leader:command_queue_index());
local char_rank_landenc = force_leader:rank()
out("rank is")
out(char_rank_landenc)
--norsca
if army_land_encounters_leader == "nor_marauder_chieftain" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_chs_lord_battle_dominating_presence")
	cm:force_add_skill(char_str_enc, "wh_dlc08_skill_nor_lord_self_drinker_of_blood")
end
--empire
if army_land_encounters_leader == "emp_lord" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_inspiring_presence")
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_all_self_hard_to_hit_starter")
end
if army_land_encounters_leader == "wh2_main_skv_warlord" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_inspiring_presence")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_combat_tail_weapon")
end
if army_land_encounters_leader == "dlc05_wef_glade_lord" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_inspiring_presence")
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_all_self_foe-seeker")
end
if army_land_encounters_leader == "wh2_main_def_dreadlord" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_inspiring_presence")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_combat_sea_dragon_cloak")
end
if army_land_encounters_leader == "grn_orc_warboss" then
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_inspiring_presence")
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_all_self_blade_master_starter")
end
end

function skills_for_land_encounters_second_tier(force_leader)
local char_str_enc = cm:char_lookup_str(force_leader:command_queue_index());
local char_rank_landenc = force_leader:rank()
--norsca
if army_land_encounters_leader == "nor_marauder_chieftain" then
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_fearsome_warriors")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_beast_slayers")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_unnatural_selection")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_frostbitten")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_hail_of_teeth")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_monsters_of_the_north")
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_lord_battle_rally")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_champions_of_the_north")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_hardened_hunters")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_icy_wrath")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_hulks_of_death")
	cm:force_add_skill(char_str_enc, "wh_dlc08_skill_nor_lord_self_chrons_wrath")
	cm:force_add_skill(char_str_enc, "wh_dlc08_skill_nor_lord_self_fury_of_the_hound")
	cm:force_add_skill(char_str_enc, "wh_dlc08_skill_nor_lord_self_carrier_of_death")
	cm:force_add_skill(char_str_enc, "wh_dlc08_skill_nor_lord_self_putrefying_ooze")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_fearsome_warriors")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_nor_army_buff_beast_slayers")
end
if army_land_encounters_leader == "emp_lord" then
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_emperors_finest")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_speed_of_horse")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_pistolkorps")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_honest_steel")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_mighty_forge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_imperial_gunnery")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_devastating_charge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_full_plate_armour")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_scarred_veteran")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_deadly_blade")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_emperors_finest")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_speed_of_horse")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_pistolkorps")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_honest_steel")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_mighty_forge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_imperial_gunnery")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_emperors_finest")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_speed_of_horse")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_pistolkorps")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_honest_steel")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_mighty_forge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_emp_army_buff_imperial_gunnery")
end
if army_land_encounters_leader == "wh2_main_skv_warlord" then
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_clanrats")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_runners")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_weaponteams")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_eliteinf")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_monsters")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_artillery")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_combat_ruin_and_decay")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_thick-skinned")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_blade_master")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_self_indomitable")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_clanrats")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_runners")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_weaponteams")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_eliteinf")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_monsters")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_army_buff_artillery")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_skv_combat_ruin_and_decay")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_thick-skinned")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_blade_master")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_self_indomitable")
end
if army_land_encounters_leader == "dlc05_wef_glade_lord" then
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_piercing_thorns")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_bolts_of_the_forest")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_striking_branches")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_swinging_boughs")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_ancient_bark")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_wings_of_the_forest")
	cm:force_add_skill(char_str_enc, "wh_main_skill_all_all_self_foe-seeker")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_lord_self_endurance_of_the_oak")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_lord_self_impenetrable_bark")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_lord_self_tempered_rigour")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_lord_self_violent_delights")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_piercing_thorns")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_bolts_of_the_forest")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_striking_branches")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_swinging_boughs")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_ancient_bark")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_wef_army_buff_wings_of_the_forest")
end
if army_land_encounters_leader == "wh2_main_def_dreadlord" then
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_basic_infantry")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_missile")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_shades_riders")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_beasts")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_coldones")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_elites")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_devastating_charge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_deadeye")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_blade_master")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_self_indomitable")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_basic_infantry")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_missile")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_shades_riders")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_beasts")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_coldones")
	cm:force_add_skill(char_str_enc, "wh2_main_skill_def_army_buff_elites")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_devastating_charge")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_deadeye")
end
if army_land_encounters_leader == "grn_orc_warboss" then
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_gobbos")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_riderz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_boyz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_ard_as_nailz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_big_ladz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_deff_from_abuv")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_devastating_charge")
	cm:force_add_skill(char_str_enc, "wh_main_skill_grn_lord_self_choppas")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_scarred_veteran")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_deadly_blade")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_gobbos")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_riderz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_boyz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_ard_as_nailz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_da_big_ladz")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_grn_army_buff_deff_from_abuv")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_devastating_charge")
	cm:force_add_skill(char_str_enc, "wh_main_skill_grn_lord_self_choppas")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_scarred_veteran")
	cm:force_add_skill(char_str_enc, "wh2_dlc11_skill_all_lord_self_deadly_blade")
end
end

--generate encounter pirates
function land_GenerateEncounterPirate(character, loc, unit)
out("starting land_GenerateEncounterPirate!")
	local faction = character:faction();
	local faction_name = faction:name();
	local cqi = character:command_queue_index();
	local force_cqi = character:military_force():command_queue_index();
	local variable_units = cm:random_number(5)
	force = random_army_manager:generate_force("encounter_force_bandits", unit, false);
	local invasion_5 = invasion_manager:new_invasion("land_encounter_invasion", encounter_pirate_faction, force, loc);
	invasion_5:set_target("CHARACTER", cqi, faction_name);
	invasion_5:apply_effect("wh_main_bundle_military_upkeep_free_force", -1);
	local turn = cm:model():turn_number()
		if turn <= 25 then
		unit_exp_gain_turn_landenc = 1
		char_exp_gain_turn_landenc = 1
		elseif turn > 25 and turn <= 50 then 
		char_exp_gain_turn_landenc = 3
		unit_exp_gain_turn_landenc = 3
		elseif turn > 50 and turn <= 75 then
		char_exp_gain_turn_landenc = 5
		unit_exp_gain_turn_landenc = 4
		elseif turn > 75 and turn <= 100 then
		char_exp_gain_turn_landenc = 7
		unit_exp_gain_turn_landenc = 5
		elseif turn > 100 and turn <= 125 then
		char_exp_gain_turn_landenc = 9
		unit_exp_gain_turn_landenc = 6
		elseif turn > 125 and turn <= 150 then
		char_exp_gain_turn_landenc = 11
		unit_exp_gain_turn_landenc = 7
		elseif turn > 150 and turn <= 175 then
		char_exp_gain_turn_landenc = 13
		unit_exp_gain_turn_landenc = 8
		elseif turn > 175 then
		char_exp_gain_turn_landenc = 15
		unit_exp_gain_turn_landenc = 9
		end;
	invasion_5:add_unit_experience(unit_exp_gain_turn_landenc)
	invasion_5:create_general(false, army_land_encounters_leader, bandit_name_land_encounters, "", "", "")
	invasion_5:start_invasion(
		function(self)
			local force_leader = self:get_general();
			levels_for_land_encounters(force_leader)
			cm:callback(function() skills_for_land_encounters(force_leader) end, 0.1)
			cm:callback(function() skills_for_land_encounters_second_tier(force_leader) end, 0.2)
			
			cm:scroll_camera_from_current(false, 6, {force_leader:display_position_x(), force_leader:display_position_y(), 14.768, 0.0, 12.0});
			
			core:add_listener(
				"Pirate_encounter_engage_land",
				"FactionLeaderDeclaresWar",
				true,
				function(context)
					local faction = context:character():faction():name();
out("declared war - land encounters!")
					out(faction);
					out(land_encounter_listener_info[6]);
out("forcing")
out(force_leader:military_force():command_queue_index())
out("to attack")
out(force_cqi)
					if faction == encounter_pirate_faction then
out("faction is the bandits, doing it!")
					cm:force_attack_of_opportunity(force_cqi, force_leader:military_force():command_queue_index(), false);
					end
				end,
				false
			);
			cm:callback(function() cm:force_declare_war(encounter_pirate_faction, faction_name,  false, false, false); end, 0.4)
			
		end,
		false,
		false,
		false
	);
		
	land_encounter_listener_info[2] = true;
		
	land_SetupEncounterForceRemoval();
out("ending land_GenerateEncounterPirate!")
out("Listeners are:")
out(land_encounter_listener_info[1])
out(land_encounter_listener_info[2])
out(land_encounter_listener_info[3])
out(land_encounter_listener_info[4])
out(land_encounter_listener_info[5])
out(land_encounter_listener_info[6])
out(land_encounter_listener_info[7])
end

function land_SetupEncounterForceRemoval()
	core:add_listener(
	"Pirate_encounter_removal_land",
	"FactionTurnStart", 
	true,
	function(context)
out("starting land_SetupEncounterForceRemoval!")
		local im = invasion_manager;
		local evasion = im:get_invasion("land_encounter_invasion");
		if evasion ~= nil then
out("evasion is nil so killing it at encounter removal!")
			cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
			cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
			evasion:kill();
			cm:callback(function() cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") end, 1);
			cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);
		end;
		land_encounter_listener_info[2] = false;
	end,
	false
	);
out("ending land_SetupEncounterForceRemoval!")
end

function land_initialize_encounter_listeners()
	land_ReconstructListeners();
out("listeners have been reset!")
end

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("land_encounter_starting_faction", land_encounter_starting_faction, context);
		cm:save_named_value("encounter_land_spots", encounter_land_spots, context);
		cm:save_named_value("land_encounter_turn_recorder", land_encounter_turn_recorder, context);
		cm:save_named_value("land_encounter_listener_info", land_encounter_listener_info, context);
	end
);
cm:add_loading_game_callback(
	function(context)
		land_encounter_turn_recorder = cm:load_named_value("land_encounter_turn_recorder", 0, context);
		land_encounter_starting_faction = cm:load_named_value("land_encounter_starting_faction", "none", context);
		encounter_land_spots = cm:load_named_value("encounter_land_spots", {}, context);
		land_encounter_listener_info = cm:load_named_value("land_encounter_listener_info", land_encounter_listener_info_default, context);
out("testing1")
out(land_encounter_listener_info[1])
out(land_encounter_listener_info[2])
out(land_encounter_listener_info[3])
out(land_encounter_listener_info[4])
out(land_encounter_listener_info[5])
out(land_encounter_listener_info[6])
out(land_encounter_listener_info[7])
	end
);

cm:add_first_tick_callback(
function()
land_initialize_encounter_listeners()
land_declare_armies()
out("reinitialised listeners")
end
);

core:add_listener(
	"faction_turn_start_declare_varied_land_enc",
	"FactionTurnStart",
	function(context) return context:faction():is_human() == true; end,
	function()
	land_declare_armies()
	end,
	true
);

core:add_listener(
	"remove_enc_select_land",
	"CharacterSelected",
	function(context)
	return true
	end,
	function(context)
		random_army_manager:remove_force("encounter_force_bandits")
	end,
	true
);