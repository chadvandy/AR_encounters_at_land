local encounter_land_location_set = require("script/land_encounters/mortal_coords")
local vortex_encounter_land_location_set = require("script/land_encounters/vortex_coords")
local bandit_names = require("script/land_encounters/bandit_names")
local bandit_forces = require("script/land_encounters/bandit_forces")
local bandit_lord_skills = require("script/land_encounters/bandit_lord_skills")


local army_land_encounters_leader = ""
local bandit_name_land_encounters = ""

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

local land_encounter_listener_info = {false, false, false, "", "", "", ""};

local encounter_land_spots = {};

local land_encounter_turn_recorder = 0;

-- this is multiplied by the total number of spot locations, to determine how many land encounters are created every 5 turns
local encounter_number_per_turn = 0.03;

-- this is multiplied by the total number of spot locations, to determine how many land encounters are defined on a new campaign
local encounter_number_start = 0.05; -- OG is 0.17 -- TODO make MCT-able

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

-- declare the bandit army in the random army manager
local function land_declare_armies()
	local force_key = "encounter_force_bandits"
	random_army_manager:remove_force(force_key)

	cm:callback(function() 
		local bandit_army_roll = cm:random_number(6)
		--out("Next army will be "..bandit_army_roll)

		local bandit_force = bandit_forces[bandit_army_roll]

		local lord_key = bandit_force.lord
		local mandatory_units_table = bandit_force.mandatory_units
		local single_weight_table = bandit_force.single_weight
		local double_weight_table = bandit_force.double_weight

		random_army_manager:new_force(force_key);

		for i = 1, #mandatory_units_table do
			local key = mandatory_units_table[i]

			random_army_manager:add_mandatory_unit(force_key, key, 2)
		end

		for i = 1, #single_weight_table do
			local key = single_weight_table[i]

			random_army_manager:add_unit(force_key, key, 1)
		end

		for i = 1, #double_weight_table do
			local key = double_weight_table[i]

			random_army_manager:add_unit(force_key, key, 2)
		end

		army_land_encounters_leader = lord_key
		local name_value = math.random(1,#bandit_names)
		bandit_name_land_encounters = bandit_names[name_value]
	end, 0.1)
end

-- kills the encounter army post-battle; triggers next FactionTurnStart
local function land_SetupEncounterForceRemoval()
	core:add_listener(
	"Pirate_encounter_removal_land",
	"FactionTurnStart",
	true, -- TODO better way to do this?
	function(context)
		local im = invasion_manager;
		local evasion = im:get_invasion("land_encounter_invasion");
		if evasion ~= nil then

			-- disable the events (for "Faction Destroyed" and stuff)
			cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
			cm:disable_event_feed_events(true, "wh_event_category_character", "", "");

			-- kill the army & faction
			evasion:kill();

			-- reenable the events
			cm:callback(function() 
				cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") 
				cm:disable_event_feed_events(false, "wh_event_category_character", "", "") 
			end, 1);
		end;

		land_encounter_listener_info[2] = false;
	end,
	false
	);
end

local function renew_effect_bundle(char_cqi, effect_bundle)
	cm:remove_effect_bundle_from_force(effect_bundle, char_cqi);
	cm:apply_effect_bundle_to_force(effect_bundle, char_cqi, encounter_effect_length);
end;

local function land_get_available_encounter_spots()
	local land_available_spots = {};

	if #encounter_land_spots > 0 then
		-- out("encounter_land_spots are over 0, proceeding!");
		for i = 1,#encounter_land_spots do
			-- add any non-occupied land spots to the land_available_spots table
			if encounter_land_spots[i]["cd"] == 0 and encounter_land_spots[i]["occupied"] == "not" then
				table.insert(land_available_spots, encounter_land_spots[i]["index"]);
				--out("inserted a record from encounter land to available spots!");
			end;
		end;
	--else
	--	return false;
	end;

	-- always return the table (it'll be empty if there are no available)
	return land_available_spots
end;

local function land_get_number_of_occupied_spots_with_category(category)
	local counter = 0;
	
	for i = 1, #encounter_land_spots do
		if encounter_land_spots[i]["occupied"] == category then
			counter = counter + 1;
		end;
	end;
	
	return counter;
end;

local function land_ClearSpot(context, index)
	cm:remove_interactable_campaign_marker(context:area_key());
	cm:remove_interactable_campaign_marker("vfx_"..context:area_key());
	encounter_land_spots[index]["occupied"] = "not";
	encounter_land_spots[index]["cd"] = encounter_spot_base_cd;
	encounter_land_spots[index]["model"] = 0;
end

local function populate_land_spots(category, land_number_of_spots)
	local land_available_spots = land_get_available_encounter_spots();

	if land_number_of_spots > 0 and #land_available_spots >= land_number_of_spots then
		--out("number_of_posts is over 0 and land_available_spots are higher than them!");
		for i = 1,land_number_of_spots do
			local index = cm:random_number(#land_available_spots);

			local land_spot = encounter_land_spots[land_available_spots[index]]
			local spot_x,spot_y = land_spot["location"][1], land_spot["location"][2]
			land_spot["occupied"] = category

			local land_spot_index = land_spot["index"]

			local land_event_key = land_encounter_events[category][cm:random_number(#land_encounter_events[category])];
			local model_index = land_encounter_events_details[land_event_key]["model"][cm:random_number(#land_encounter_events_details[land_event_key]["model"])];

			local marker_key = ""

			land_spot["model"] = model_index;

			if #land_encounter_events_details[land_event_key]["variation"] == 0 then
				land_spot["event"] = land_event_key;
			else
				land_spot["event"] = land_event_key .. land_encounter_events_details[land_event_key]["variation"][cm:random_number(#land_encounter_events_details[land_event_key]["variation"])];
			end;
			
			--vortex markers
			if cm:model():campaign_name("wh2_main_great_vortex") then
				--southlands markers
				if spot_x > 374 and spot_y < 370 then
					marker_key = "southlands_encounter_marker"
				--lustria markers
				elseif spot_x < 374 and spot_y < 425 then
					marker_key = "lustria_encounter_marker"
				--ulthuan markers
				elseif spot_x > 380 and spot_x < 690 and spot_y > 385 and spot_y < 645 then
					marker_key = "ulthuan_encounter_marker"
				--naggaroth markers
				elseif spot_x < 377 and spot_y > 425 then
					marker_key = "naggaroth_encounter_marker"
				else -- default to Norsca (?) -- TODO should I?
					marker_key = "norsca_encounter_marker"
				end
			end;
			--mortal empires markers
			if cm:model():campaign_name("main_warhammer") then

				--- Southlands ---
				if spot_x > 320 and spot_y < 150 then
					marker_key = "southlands_encounter_marker"

				--- Badlands ---
				elseif 
					(spot_x > 517 and spot_y < 206 and spot_y > 150) or 
					(spot_x > 542 and spot_y < 236 and spot_y > 206) or
					(spot_x > 565 and spot_y < 283 and spot_y > 236) or
					(spot_x > 590 and spot_y < 337 and spot_y > 283) or
					(spot_x > 780 and spot_y < 524 and spot_y > 337) 
				then
					marker_key = "badlands_encounter_marker"

				--- Lustria ---
				elseif 
					(spot_x < 320 and spot_y < 250) or
					(spot_x < 125 and spot_y < 350) 
				then
					marker_key = "lustria_encounter_marker"

				--- Naggaroth ---
				elseif 
					(spot_x < 125 and spot_y > 250 and spot_y < 670) or
					(spot_x < 290 and spot_y > 460 and spot_y < 670) 
				then
					marker_key = "naggaroth_encounter_marker"

				--- Ulthuan ---
				elseif spot_x > 125 and spot_x < 320 and spot_y > 250 and spot_y < 460 then
					marker_key = "ulthuan_encounter_marker"

				--- Norsca ---
				elseif 
					(spot_x > 1 and spot_y > 670) or 
					(spot_x > 290 and spot_x < 415 and spot_y > 520) or
					(spot_x > 415 and spot_y > 574)
				then
					marker_key = "norsca_encounter_marker"

				--- Dwarfs ---
				elseif 
					(spot_x > 569 and spot_x < 618 and spot_y > 344 and spot_y < 364) or
					(spot_x > 641 and spot_x < 780 and spot_y > 338 and spot_y < 387) or
					(spot_x > 700 and spot_x < 779 and spot_y > 387 and spot_y < 508) or
					(spot_x > 463 and spot_x < 506 and spot_y > 393 and spot_y < 404) or
					(spot_x > 508 and spot_x < 581 and spot_y > 340 and spot_y < 378) 
				then
					marker_key = "dwarf_encounter_marker"

				--- Default ---
				else
					marker_key = "encounter_marker_"..tostring(model_index)
				end;
			end

			if marker_key == "" then
				-- issue!
				return
			end

			cm:add_interactable_campaign_marker("land_test_marker_" .. land_spot_index, marker_key, spot_x, spot_y, 4, "", "");
		
			
			table.remove(land_available_spots, index);
		end; -- end loop
	end;
end;

local function land_TriggerEncounterIncident(faction, incident)
	--out("triggered encounter incident");
	local incident_key = incident
	if faction:subculture() == "wh2_dlc09_sc_tmb_tomb_kings" then
		incident_key = incident_key .. "_tmb"
	elseif faction:subculture() == "wh_main_sc_nor_norsca" then
		incident_key = incident_key .. "_nor"
	end
	
	cm:trigger_incident(faction:name(), incident_key, true);

	-- getting rid of VCoast hold-overs for now, decide later -- TODO
	
	--check aranessa skill
	--[[if land_neo_counters[incident] ~= nil then
		local skill_found = false;
		local char_list = faction:character_list()
		for i = 0, char_list:num_items() -1 do
			local char = char_list:item_at(i)
			if char:character_subtype_key() == "wh2_dlc11_cst_aranessa" and char:has_skill("wh2_dlc11_skill_cst_aranessa_unique_5") then
				--trigger extra loot event
				if land_neo_counters[incident][5] ~= nil then
					--out(land_neo_counters[incident][5]);
					cm:callback(function()
						cm:trigger_incident(faction:name(), land_neo_counters[incident][5], true);
					end, 0.5);
				end
			end
		end
		
		--check treasure map drops
		if faction:subculture() == "wh2_dlc11_sc_cst_vampire_coast" then
			if land_neo_counters[incident][4] ~= nil then
				TriggerTreasureMapMission(faction:name(), land_neo_counters[incident][4])
			end
		end
	end]]
end

-- unused
--[[local function land_Remodulate(vector, desired_mag)
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
end]]


local function land_TriggerEncounter(index, context)
	local character = context:character();
	local faction = character:faction();
	local faction_name = faction:name();
	encounter_target = character:command_queue_index();
	local dont_remove_encounter = false;

	if faction:is_human() and cm:model():world():whose_turn_is_it():is_human() then
		local land_spot = encounter_land_spots[index]
		if land_spot["occupied"] == "treasure" then
			local incident = land_spot["event"];

			--out("this is "..incident);
			--out("checking for"..land_neo_counters[incident][1]);
			
			if land_neo_counters[incident][1] ~= "" and land_neo_counters[incident][1] ~= nil then

				--check if the army is in proper stance
				if character:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_DEFAULT" then
					cm:trigger_dilemma(faction_name, land_neo_counters[incident][1]);
					temp_char = character;
					temp_loc = land_spot["location"];
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
						land_spot["location"][1],
						land_spot["location"][2],
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
					
		elseif land_spot["occupied"] == "marker" then
			local dilemma = land_spot["event"];
			out("marker discovered!");

			encounter_target = character:military_force():command_queue_index();
			cm:trigger_dilemma(faction_name, dilemma);
		end;
	end;
	
	if dont_remove_encounter == false then
		land_ClearSpot(context, index);
	end
end

local function land_SetupEncounterPostbattle(incident, faction)

	core:add_listener(
		"Land_EncounterPostbattle",
		"BattleCompleted", 
		true,
		function(context)
			--out("starting PostBattle Listener!")
			local found_encounter_faction = false; 
			local loot = false;

			local im = invasion_manager;
			local evasion = im:get_invasion("land_encounter_invasion");

			local encounter_general_cqi = 0

			for i = 1, cm:pending_battle_cache_num_attackers() do
				local char_cqi, _, faction_name = cm:pending_battle_cache_get_attacker(i)

				if faction_name == encounter_pirate_faction then
					found_encounter_faction = true
					encounter_general_cqi = char_cqi
				end
			end

			for i = 1, cm:pending_battle_cache_num_defenders() do
				local char_cqi, _, faction_name = cm:pending_battle_cache_get_defender(i)

				if faction_name == encounter_pirate_faction then
					found_encounter_faction = true
					encounter_general_cqi = char_cqi
				end
			end

			if encounter_general_cqi == 0 then
				-- not found, bye
				return
			end

			local char = cm:model():character_for_command_queue_index(encounter_general_cqi)

			if char:is_null_interface() or not char:won_battle() then
				loot = true
			end

			if evasion then
				cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
				cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
				evasion:kill();

				cm:callback(function() 
					cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") 
					cm:disable_event_feed_events(false, "wh_event_category_character", "", "") 
				end, 1);
			end

			--out("checking if post loot option is needed");
			--out(found_encounter_faction);
			--out(land_encounter_listener_info[3]);
			--out(loot);
			
			--cm:callback(function() cm:disable_event_feed_events(false, "","","diplomacy_faction_destroyed") end, 1);
			--cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);

			if found_encounter_faction and land_encounter_listener_info[3] then
				local uim = cm:get_campaign_ui_manager();
				uim:override("retreat"):unlock();

				-- removing listener info stuff
				land_encounter_listener_info[3] = false;
				land_encounter_listener_info[6] = "";
				land_encounter_listener_info[7] = "";

				if loot then
					--out("triggering loot event");
					--local faction_name = faction:name();
					land_TriggerEncounterIncident(faction, incident);
				end
			end
			--out("ending PostBattle Listener!")
		end,
		false
	);

end

local function land_ReconstructListeners()
	local pirate_listener = land_encounter_listener_info[2];
	local encounter_post_battle_listener = land_encounter_listener_info[3];
	local faction_key = land_encounter_listener_info[6];
	local incident = land_encounter_listener_info[7];
	
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

local function levels_for_land_encounters(force_leader)
	local char_str_enc = cm:char_lookup_str(force_leader:command_queue_index());
	local turn = cm:model():turn_number()

	if turn <= 25 then
		-- do naught
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
	end
end

-- add in the skills for the bandit faction leaders
-- TODO decide if there should be some chance to these?
local function skills_for_land_encounters(force_leader)
	local char_str_enc = cm:char_lookup_str(force_leader:command_queue_index());
	--local char_rank_landenc = force_leader:rank()
	local char_skills = bandit_lord_skills[force_leader:character_subtype_key()]
	if char_skills then
		for i = 1, #char_skills do
			local skill_key = char_skills[i]

			cm:force_add_skill(char_str_enc, skill_key)
		end
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

---- The Listener Zone ----

-- TODO make the conditional betterer
core:add_listener(
	"dilemma_choice_made_event_trigger_counter_at_land_incident",
	"DilemmaChoiceMadeEvent",
	function(context)
		return string.find(context:dilemma(), "encounter_at_land") and encounter_target ~= 0
	end,
	function(context)
		local choice = context:choice();
		local dilemma = context:dilemma();
		local whose_turn_is_it = cm:model():world():whose_turn_is_it();
		local whose_turn_is_it_name = whose_turn_is_it:name()
		
		--out("encounter_target is"..encounter_target);


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

core:add_listener(
	"pending_battle_trigger_encounter_at_land_ui_lock",
	"PendingBattle",
	function(context)
		local found_encounter_faction = false; 
		
		if cm:pending_battle_cache_num_attackers() >= 1 then
			for i = 1, cm:pending_battle_cache_num_attackers() do
				local _, _, current_faction_name = cm:pending_battle_cache_get_attacker(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
				end
			end
		end		
		if cm:pending_battle_cache_num_defenders() >= 1 then
			for i = 1, cm:pending_battle_cache_num_defenders() do
				local _, _, current_faction_name = cm:pending_battle_cache_get_defender(i);
				if current_faction_name == encounter_pirate_faction then
					found_encounter_faction = true;
				end
			end
		end

		return found_encounter_faction
	end,
	function(context)
		local uim = cm:get_campaign_ui_manager();
		uim:override("retreat"):lock();
		cm:disable_event_feed_events(true, "","","diplomacy_faction_destroyed");
		cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
		
		--[[
		elseif found_encounter_faction ~= true and land_encounter_listener_info[3] then
			local uim = cm:get_campaign_ui_manager();
			uim:override("retreat"):unlock();
			land_encounter_listener_info[3] = false;
			land_encounter_listener_info[6] = "";
			land_encounter_listener_info[7] = "";
		end
		out("pending battle listener ending")]]
	end,
	true
);

core:add_listener(
	"incident_event_encounter_at_land_add_agent_experience",
	"IncidentEvent",
	function(context)
		local str = context:dilemma()
		return str == "wh2_main_incident_encounter_at_land_1_b" or str == "wh2_main_incident_encounter_at_land_2_b" or str == "wh2_main_incident_encounter_at_land_3_b"
	end,
	function()
		if encounter_target then
			cm:add_agent_experience(cm:char_lookup_str(encounter_target), 1500);
		end
	end,
	true
);

core:add_listener(
	"incident_occurred_event_encounter_at_land_remove_effect_bundle",
	"IncidentOccuredEvent",
	function(context)
		local str = context:dilemma()
		return (string.find(str, "wh2_main_encounter_at_land_campaign") or string.find(str, "wh2_main_encounter_at_land_combat")) and not string.find(str, "nor") and not string.find(str, "tmb")
	end,
	function(context)
		local incident = context:dilemma();
		local whose_turn_is_it_name = cm:model():world():whose_turn_is_it():name();

		cm:callback(function()
			cm:remove_effect_bundle(incident .. "_dummy", whose_turn_is_it_name)
		end, 0.5)
		
		--[[cm:callback(function()
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
		end, 0.5);]]
	end,
	true
);

core:add_listener(
	"area_entered_trigger_encounter_at_land",
	"AreaEntered",
	function(context)
		return string.find(context:area_key(), "land")
	end,
	function(context)
		local index = tonumber(string.sub(context:area_key(), 18));
		local character = context:character();

		if cm:char_is_general_with_army(character) then
			land_declare_armies()
			land_TriggerEncounter(index, context);
		end;
	end,
	true
);

core:add_listener(
	"faction_turn_start_populate_land_spots",
	"FactionTurnStart",
	true, -- TODO make this better and less performative?
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

			-- loop through all of the coords and create encounter_land_spot tables for each to save
			for i = 1, #chosen_coordinate_set do
				local spot = {
					["index"] = i,
					["location"] = chosen_coordinate_set[i],
					["occupied"] = "not", -- TODO change this to true/false?
					["cd"] = 0
				};

				table.insert(encounter_land_spots, spot);
			end;


			-- populate the direct land spots on the map for the start of a campaign
			populate_land_spots("treasure", math.floor(encounter_number_start * #encounter_land_spots));
			populate_land_spots("marker", math.floor(encounter_number_start * #encounter_land_spots));
	
		elseif turn_number ~= land_encounter_turn_recorder and turn_number % encounter_spawn_interval ==0 then
			for i = 1, #encounter_land_spots do
				if encounter_land_spots[i]["cd"] > 0 then
					encounter_land_spots[i]["cd"] = encounter_land_spots[i]["cd"] - 1;
				end;
			end;
			
			if land_get_number_of_occupied_spots_with_category("treasure") < math.floor(encounter_number_treasure * #encounter_land_spots) then
				populate_land_spots("treasure",  math.floor(encounter_number_per_turn * #encounter_land_spots));
			end;
			
			populate_land_spots("marker", math.floor(encounter_number_per_turn * #encounter_land_spots));
		end;

		land_encounter_turn_recorder = turn_number;
	end,
	true
);


---- Saving + Init ----

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("encounter_land_spots", encounter_land_spots, context);
		cm:save_named_value("land_encounter_turn_recorder", land_encounter_turn_recorder, context);
		cm:save_named_value("land_encounter_listener_info", land_encounter_listener_info, context);
	end
);
cm:add_loading_game_callback(
	function(context)
		land_encounter_turn_recorder = cm:load_named_value("land_encounter_turn_recorder", 0, context);
		encounter_land_spots = cm:load_named_value("encounter_land_spots", {}, context);
		land_encounter_listener_info = cm:load_named_value("land_encounter_listener_info", {}, context);
	end
);

cm:add_first_tick_callback(
	function()
		land_ReconstructListeners()
		land_declare_armies()
		--out("reinitialised listeners")
	end
);

--[[core:add_listener(
	"faction_turn_start_declare_varied_land_enc",
	"FactionTurnStart",
	function(context) 
		return context:faction():is_human() == true
	end,
	function()
		land_declare_armies()
	end,
	true
);]]

--[[core:add_listener(
	"remove_enc_select_land",
	"CharacterSelected",
	true,
	function(context)
		random_army_manager:remove_force("encounter_force_bandits")
	end,
	true
);]]