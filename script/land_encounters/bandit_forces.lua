-- this table defines the various army compositions that are possible with this mod.
-- mandatory units always show up (two apiece) in every bandit army
-- weighted units are added to a pool that is rolled against their weight, ie. a 2-weight and 1-weight unit being put in a pool, there's a 67% chance (2/3) of the 2-weight being selected.

-- written this way to hopefully be easily accessible and editable.

-- TODO more varied weights and some further options with mandatories having chances between options

return {
    [1] = {
        ["lord"] = "emp_lord",
        ["mandatory_units"] = {
            "wh_main_emp_inf_halberdiers", "wh_main_emp_inf_handgunners"
        },
        ["single_weight"] = {
            "wh_main_emp_art_helstorm_rocket_battery",
            "wh_main_emp_cav_empire_knights",
            "wh_main_emp_cav_outriders_0",
            "wh2_dlc13_emp_inf_huntsmen_0",
            "wh_main_emp_art_mortar",
        },
        ["double_weight"] = {
            "wh_main_emp_inf_crossbowmen",
            "wh_main_emp_inf_greatswords",
            "wh_main_emp_inf_spearmen_1",
        },
    },
    [2] = {
        ["lord"] = "nor_marauder_chieftain",
        ["mandatory_units"] = {
            "wh_dlc08_nor_inf_marauder_champions_0",
            "wh_dlc08_nor_inf_marauder_hunters_0",
        },
        ["single_weight"] = {
            "wh_dlc08_nor_feral_manticore",
            "wh_dlc08_nor_mon_norscan_giant_0",
            "wh_dlc08_nor_mon_fimir_1",
            "wh_dlc08_nor_mon_war_mammoth_0",
        },
        ["double_weight"] = {
            "wh_dlc08_nor_mon_skinwolves_1",
            "wh_dlc08_nor_inf_marauder_berserkers_0",
            "wh_main_nor_mon_chaos_warhounds_1",
        },
    },
    [3] = {
        ["lord"] = "grn_orc_warboss",
        ["mandatory_units"] = {
            "wh_main_grn_inf_black_orcs",
            "wh_main_grn_inf_night_goblin_archers",
        },
        ["single_weight"] = {
            "wh_main_grn_mon_giant",
            "wh_main_grn_mon_trolls",
            "wh_dlc06_grn_inf_nasty_skulkers_0",
        },
        ["double_weight"] = {
            "wh_main_grn_inf_black_orcs",
            "wh_main_grn_cav_orc_boar_boyz",
            "wh_dlc06_grn_inf_nasty_skulkers_0",
            "wh_main_grn_inf_goblin_spearmen",
            "wh_main_grn_inf_savage_orcs",
        },
    },
    [4] = {
        ["lord"] = "wh2_main_def_dreadlord",
        ["mandatory_units"] = {
            "wh2_main_def_inf_darkshards_1",
            "wh2_main_def_inf_black_guard_0",
        },
        ["single_weight"] = {
            "wh2_main_def_inf_harpies",
            "wh2_main_def_mon_war_hydra_0",
            "wh2_main_def_mon_black_dragon",
            "wh2_main_def_art_reaper_bolt_thrower",
        },
        ["double_weight"] = {
            "wh2_main_def_inf_shades_0",
            "wh2_main_def_inf_bleakswords_0",
            "wh2_main_def_cav_cold_one_knights_1",
            "wh2_main_def_inf_shades_1",
            "wh2_dlc10_def_inf_sisters_of_slaughter",
        },
    },
    [5] = {
        ["lord"] = "wh2_main_skv_warlord",
        ["mandatory_units"] = {
            "wh2_main_skv_inf_clanrat_spearmen_1",
            "wh2_dlc14_skv_inf_eshin_triads_0",
        },
        ["single_weight"] = {
            "wh2_main_skv_mon_hell_pit_abomination",
            "wh2_dlc12_skv_inf_warplock_jezzails_0",
            "wh2_main_skv_veh_doomwheel",
            "wh2_dlc14_skv_inf_poison_wind_mortar_0",
            "wh2_main_skv_inf_night_runners_1",
        },
        ["double_weight"] = {
            "wh2_main_skv_inf_plague_monks",
            "wh2_main_skv_mon_rat_ogres",
            "wh2_main_skv_inf_stormvermin_1",
            "wh2_main_skv_inf_skavenslave_slingers_0",
            "wh2_main_skv_inf_gutter_runners_1",
            --"wh2_dlc14_skv_inf_eshin_triads_0", -- removed because they're already mandatory
        },
    },
    [6] = {
        ["lord"] = "dlc05_wef_glade_lord",
        ["mandatory_units"] = {
            "wh_dlc05_wef_inf_deepwood_scouts_0",
            "wh_dlc05_wef_inf_glade_guard_0",
        },
        ["single_weight"] = {
            "wh_dlc05_wef_inf_eternal_guard_0",
            "wh_dlc05_wef_cha_ancient_treeman_0",
            "wh_dlc05_wef_mon_treekin_0",
            "wh_dlc05_wef_forest_dragon_0",
            "wh_dlc05_wef_inf_deepwood_scouts_1",
            "wh_dlc05_wef_cav_wild_riders_1",
        },
        ["double_weight"] = {
            "wh_dlc05_wef_inf_dryads_0",
            "wh_dlc05_wef_inf_waywatchers_0",
            "wh_dlc05_wef_inf_wardancers_0",
            "wh_dlc05_wef_cav_wild_riders_0",
            "wh_dlc05_wef_inf_deepwood_scouts_0",
        },
    },
}