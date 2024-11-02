--[[ TTS documentation: https://api.tabletopsimulator.com/ ]]

-- automisation goals:
    -- automated PI: 
        -- gets resources from cosmoctopus movements
        -- has a dedicated turn to resolve actions
        -- resolve PI card actions automatically (end goal)
    -- automated layout and setup
    -- automated resource management
        -- player dedicated +/- buttons
        -- autoresolve tile resoruces
        -- autoresolve cards (end goal)
        -- personalised waste management
    -- automated card row

---- game objects
-- error: table index is nil; - make sure passing a string as a table indexer and not a var with no string attached.
-- where a var refers to an instantialised game obj, the var name should include suffex -_obj, and
-- where a var refers specifically to a game obj guid, the var name should include the suffex -_id
-- an unspecified var will refer to the local indexer
-- objects that are not in play (e.g. cards in a deck, objects in a bag) will return nill when initialised with GetObjectFromGUID

--todo: add reset button
--todo: add proper turns management

-- tags
card_zone_tag = "card_holder"
is_bin_tag = "is_bin"
binnable_tag = "binnable"
card_row_tag = "card_row"
devotee_deck_card_tag = "devotee_deck_card"

purple = "Purple"
green = "Green"
red = "Red"
blue = "Blue"
brown = "Brown"


global_bin = "global_bin"
devotee_deck = "devotee_deck"
devotee_ref_deck = "devotee_ref_deck"
inky_realm_tile_bag = "inky_realm_tile_bag"
special_inky_realm_tile_bag = "special_inky_realm_tile_bags"
starting_tile = "starting_tile"
cosmoctopus = "cosmoctopus"
cosmic_bridge_token_1 = "cosmic_bridge_token_1"
cosmic_bridge_token_2 = "cosmic_bridge_token_2"
card_row_zone_1 = "card_row_zone_1"
card_row_zone_2 = "card_row_zone_2"
card_row_zone_3 = "card_row_zone_3"
discard_deck_zone = "discard_deck_zone"

ink_bag = "ink_bag"
coin_bag = "coin_bag"
whisper_bag = "whisper_bag"
star_bag = "star_bag"
tentacle_bag = "tentacle_bag"

generic_resource_token_1 = "generic_resource_token_1"
generic_resource_token_2 = "generic_resource_token_2"
generic_resource_token_3 = "generic_resource_token_3"

magnifying_glass_1 = "magnifying_glass_1"
magnifying_glass_2 = "magnifying_glass_2"
pi_behaviour_deck = "pi_behaviour_deck"
pi_revelation_cards = "pi_revelation_cards"
pi_tentacle = "pi_tentacle"
pi_tentacle_tracker_card = "pi_tentacle_tracker_card"
pi_ink_placeholder = "pi_ink_placeholder"
pi_coins_placeholder = "pi_coins_placeholder"
pi_whispers_placeholder = "pi_whispers_placeholder"
pi_stars_placeholder = "pi_stars_placeholder"
pi_hand = "pi_hand"

starting_deck_A = "starting_deck_A"
starting_deck_B = "starting_deck_B"
starting_deck_C = "starting_deck_C"
starting_deck_D = "starting_deck_D"
player_ref_card_A = "player_ref_card_A"
player_ref_card_B = "player_ref_card_B"
player_ref_card_C = "player_ref_card_C"
player_ref_card_D = "player_ref_card_D"

purple_board = "purple_board"
green_board = "green_board"
red_board = "red_board"
blue_board = "blue_board"

purple_board_frame = "purple_board_frame"
green_board_frame = "green_board_frame"
red_board_frame = "red_board_frame"
blue_board_frame = "blue_board_frame"

purple_bin = "purple_bin"
green_bin = "green_bin"
red_bin = "red_bin"
blue_bin = "blue_bin"

purple_hand = "purple_hand"
green_hand = "green_hand"
red_hand = "red_hand"
blue_hand = "blue_hand"

purple_rule_book="purple_rule_book"
green_rule_book = "green_rule_book"
red_rule_book = "red_rule_book"
blue_rule_book = "blue_rule_book"

purple_bowl_ink="purple_bowl_ink"
purple_bowl_coin="purple_bowl_coin"
purple_bowl_whisper="purple_bowl_whisper"
purple_bowl_star="purple_bowl_star"

green_bowl_ink="green_bowl_ink"
green_bowl_coin="green_bowl_coin"
green_bowl_whisper="green_bowl_whisper"
green_bowl_star="green_bowl_star"

red_bowl_ink = "red_bowl_ink"
red_bowl_coin = "red_bowl_coin"
red_bowl_whisper = "red_bowl_whisper"
red_bowl_star = "red_bowl_star"

blue_bowl_ink = "blue_bowl_ink"
blue_bowl_coin = "blue_bowl_coin"
blue_bowl_whisper = "blue_bowl_whisper"
blue_bowl_star = "blue_bowl_star"

purple_minus_ink="purple_minus_ink"
purple_plus_ink="purple_plus_ink"
purple_minus_coin="purple_minus_coin"
purple_plus_coin="purple_plus_coin"
purple_minus_whisper="purple_minus_whisper"
purple_plus_whisper="purple_plus_whisper"
purple_minus_star="purple_minus_star"
purple_plus_star="purple_plus_star"

green_minus_ink="green_minus_ink"
green_plus_ink="green_plus_ink"
green_minus_coin="green_minus_coin"
green_plus_coin="green_plus_coin"
green_minus_whisper="green_minus_whisper"
green_plus_whisper="green_plus_whisper"
green_minus_star="green_minus_star"
green_plus_star="green_plus_star"

red_minus_ink="red_minus_ink"
red_plus_ink="red_plus_ink"
red_minus_coin="red_minus_coin"
red_plus_coin="red_plus_coin"
red_minus_whisper="red_minus_whisper"
red_plus_whisper="red_plus_whisper"
red_minus_star="red_minus_star"
red_plus_star="red_plus_star"

blue_minus_ink="blue_minus_ink"
blue_plus_ink="blue_plus_ink"
blue_minus_coin="blue_minus_coin"
blue_plus_coin="blue_plus_coin"
blue_minus_whisper="blue_minus_whisper"
blue_plus_whisper="blue_plus_whisper"
blue_minus_star="blue_minus_star"
blue_plus_star="blue_plus_star"


deal_sugg_hand_light = "deal_sugg_hand_light"
deal_rand_hand_light = "deal_rand_hand_light"
use_std_layout_light = "use_std_layout_light"
use_custom_layout_light = "use_custom_layout_light"
no_pi_light = "no_pi_light"
with_pi_light = "with_pi_light"

select_hand_button = "select_hand_button"
custom_layout_button = "custom_layout_button"
with_pi_button = "with_pi_button"
play_button = "play_button"

forbidden_knowledge_ink= "forbidden_knowledge_ink"
forbidden_knowledge_coins= "forbidden_knowledge_coins"
forbidden_knowledge_whispers= "forbidden_knowledge_whispers"
forbidden_knowledge_stars= "forbidden_knowledge_stars"
first_contact_card_ink= "first_contact_card_ink"
first_contact_card_coins= "first_contact_card_coins"
first_contact_card_whispers= "first_contact_card_whispers"
first_contact_card_stars= "first_contact_card_stars"

-- not strictly necessary, but helpful for my ide
objects = {
    [global_bin] = nil,
    [devotee_deck] = nil,
    [devotee_ref_deck] = nil,
    [inky_realm_tile_bag] = nil,
    [special_inky_realm_tile_bag] = nil,
    [tentacle_bag]=nil,
    [starting_tile] = nil,
    [cosmoctopus] = nil,
    [cosmic_bridge_token_1] = nil,
    [cosmic_bridge_token_2] = nil,
    [card_row_zone_1] = nil,
    [card_row_zone_2] = nil,
    [card_row_zone_3] = nil,
    [discard_deck_zone] = nil,
    [magnifying_glass_1] = nil,
    [magnifying_glass_2] = nil,
    [pi_behaviour_deck] = nil,
    [pi_revelation_cards] = nil,
    [pi_tentacle] = nil,
    [pi_tentacle_tracker_card] = nil,
    [pi_ink_placeholder] = nil,
    [pi_coins_placeholder] = nil,
    [pi_whispers_placeholder] = nil,
    [pi_stars_placeholder] = nil,
    [pi_hand] = nil,
    [starting_deck_A] = nil,
    [starting_deck_B] = nil,
    [starting_deck_C] = nil,
    [starting_deck_D] = nil,
    [player_ref_card_A] = nil,
    [player_ref_card_B] = nil,
    [player_ref_card_C] = nil,
    [player_ref_card_D] = nil,
    [purple_board] = nil,
    [green_board] = nil,
    [red_board] = nil,
    [blue_board] = nil,
    [purple_bin] = nil,
    [green_bin] = nil,
    [red_bin] = nil,
    [blue_bin] = nil,
    [purple_hand] = nil,
    [green_hand] = nil,
    [red_hand] = nil,
    [blue_hand] = nil,
    [deal_sugg_hand_light] = nil,
    [deal_rand_hand_light] = nil,
    [use_std_layout_light] = nil,
    [use_custom_layout_light] = nil,
    [no_pi_light] = nil,
    [with_pi_light] = nil,
    [select_hand_button] = nil,
    [custom_layout_button] = nil,
    [with_pi_button] = nil,
    [play_button] = nil,
    [forbidden_knowledge_ink]=nil,
    [forbidden_knowledge_coins]=nil,
    [forbidden_knowledge_whispers]=nil,
    [forbidden_knowledge_stars]=nil,
    [first_contact_card_ink]=nil,
    [first_contact_card_coins]=nil,
    [first_contact_card_whispers]=nil,
    [first_contact_card_stars]=nil,

    [purple_minus_ink] = nil,
    [purple_plus_ink] = nil,
    [purple_minus_coin] = nil,
    [purple_plus_coin] = nil,
    [purple_minus_whisper] = nil,
    [purple_plus_whisper] = nil,
    [purple_minus_star] = nil,
    [purple_plus_star] = nil,

    [green_minus_ink] = nil,
    [green_plus_ink] = nil,
    [green_minus_coin] = nil,
    [green_plus_coin] = nil,
    [green_minus_whisper] = nil,
    [green_plus_whisper] = nil,
    [green_minus_star] = nil,
    [green_plus_star] = nil,

    [red_minus_ink] = nil,
    [red_plus_ink] = nil,
    [red_minus_coin] = nil,
    [red_plus_coin] = nil,
    [red_minus_whisper] = nil,
    [red_plus_whisper] = nil,
    [red_minus_star] = nil,
    [red_plus_star] = nil,

    [blue_minus_ink] = nil,
    [blue_plus_ink] = nil,
    [blue_minus_coin] = nil,
    [blue_plus_coin] = nil,
    [blue_minus_whisper] = nil,
    [blue_plus_whisper] = nil,
    [blue_minus_star] = nil,
    [blue_plus_star] = nil,

    [purple_board_frame] = nil,
    [green_board_frame] = nil,
    [red_board_frame] = nil,
    [blue_board_frame] = nil,

    [purple_rule_book]          = nil,
    [green_rule_book]           = nil,
    [red_rule_book]             = nil,
    [blue_rule_book]            = nil,
   
    [purple_bowl_ink]            =nil,
    [purple_bowl_coin]           =nil,
    [purple_bowl_whisper]        =nil,
    [purple_bowl_star]           =nil,
     
    [green_bowl_ink]             =nil,
    [green_bowl_coin]            =nil,
    [green_bowl_whisper]         =nil,
    [green_bowl_star]            =nil,
     
    [red_bowl_ink]               =nil,
    [red_bowl_coin]              =nil,
    [red_bowl_whisper]           =nil,
    [red_bowl_star]              =nil,
     
    [blue_bowl_ink]              =nil,
    [blue_bowl_coin]             =nil,
    [blue_bowl_whisper]          =nil,
    [blue_bowl_star]             =nil


}

object_ids = {
    [global_bin]                = "7a25d1",
    [devotee_deck]              = "4c430e",
    [devotee_ref_deck]          = "064f8d",
    [inky_realm_tile_bag]       = "b3fcc4",
    [special_inky_realm_tile_bag]="7864bc",
    [starting_tile]             = "c056fb",
    [cosmoctopus]               = "e91dbb",
    [cosmic_bridge_token_1]     = "ce79c7",
    [cosmic_bridge_token_2]     = "bfba39",
    [generic_resource_token_1]  = "f8a672",
    [generic_resource_token_2]  = "c4a262",
    [generic_resource_token_3]  = "f440bd",
    [ink_bag]                   = 'cc7a6c',
    [coin_bag]                  = '430818',
    [whisper_bag]               = '2d830e',
    [star_bag]                  = '98a771',
    [tentacle_bag]              = "a364f6",
    [card_row_zone_1]           = "4ac1d2",
    [card_row_zone_2]           = "9fcd46",
    [card_row_zone_3]           = "ea72c7",
    [discard_deck_zone]         = "bbe128",
    [magnifying_glass_1]        = "09acd5",
    [magnifying_glass_2]        = "b0bf54",
    [pi_behaviour_deck]         = "adec51",
    [pi_revelation_cards]       = "93bcae",
    [pi_tentacle]               = "9fd2a1",
    [pi_tentacle_tracker_card]  = "5058b2",
    [pi_ink_placeholder]        = "643529",
    [pi_coins_placeholder]      = "2edf2a",
    [pi_whispers_placeholder]   = "0df88a",
    [pi_stars_placeholder]      = "c2d006",
    [pi_hand]                   = "b87a8c",
    [starting_deck_A]           = "5a4628",
    [starting_deck_B]           = "fd88d2",
    [starting_deck_C]           = "a73859",
    [starting_deck_D]           = "b30593",
    [player_ref_card_A]         = "36083a",
    [player_ref_card_B]         = "db7a54",
    [player_ref_card_C]         = "f4c27a",
    [player_ref_card_D]         = "e1a47a",
    
    [deal_rand_hand_light]      = "156f48",
    [deal_sugg_hand_light]      = "6e1300",
    [use_std_layout_light]      = "d02278",
    [use_custom_layout_light]   = "dbbba1",
    [no_pi_light]               = "939847",
    [with_pi_light]             = "091dda",
    [select_hand_button]        = "7a6d6e",
    [custom_layout_button]      = "c13cf2",
    [with_pi_button]            = "74bd44",
    [play_button]               = "bd1b92",

    [forbidden_knowledge_ink]   = "dd0bbb",
    [forbidden_knowledge_coins] = "37e815",
    [forbidden_knowledge_whispers] = "4d169a",
    [forbidden_knowledge_stars] = "656564",

    [first_contact_card_ink]    = "7c9785",
    [first_contact_card_coins]  = "2fefa0",
    [first_contact_card_whispers] = "2ea49b",
    [first_contact_card_stars]  = "3d71d7",

    [purple_board]              = "1aa2f9",
    [green_board]               = "cfd4c1",
    [red_board]                 = "f90dcf",
    [blue_board]                = "5b3641",

    [purple_board_frame]        = "ddbb28",
    [green_board_frame]         = "c06350",
    [red_board_frame]           = "e59391",
    [blue_board_frame]          = "b571e7",

    [purple_bin]                = "9002cd",
    [green_bin]                 = "c6671b",
    [red_bin]                   = "8fd239",
    [blue_bin]                  = "d00873", 

    [purple_hand]               = "0bc026",
    [green_hand]                = "3517cc",
    [red_hand]                  = "3132d3",
    [blue_hand]                 = "1f0d36",

    [purple_rule_book]          = "36ced8",
    [green_rule_book]           = "75c78f",
    [red_rule_book]             = "b56737",
    [blue_rule_book]            = "c80fae",
   
    [purple_bowl_ink]            ="bd0df4",
    [purple_bowl_coin]          ="c563c8",
    [purple_bowl_whisper]       ="9a86c1",
    [purple_bowl_star]          ="e20db5",
    
    [green_bowl_ink]            ="a5ef0f",
    [green_bowl_coin]           ="4886fa",
    [green_bowl_whisper]        ="6ef512",
    [green_bowl_star]           ="26dd14",
    
    [red_bowl_ink]              ="3502a0",
    [red_bowl_coin]             ="6411b9",
    [red_bowl_whisper]          ="2ca3e9",
    [red_bowl_star]             ="cfffe6",
    
    [blue_bowl_ink]             ="731ad7",
    [blue_bowl_coin]            ="506637",
    [blue_bowl_whisper]         ="217ae3",
    [blue_bowl_star]            ="3fb1bd",

    [purple_minus_ink]      = "7b36cc",
    [purple_plus_ink]       = "2fe0e4",
    [purple_minus_coin]     = "01f214",
    [purple_plus_coin]      = "cacc6b",
    [purple_minus_whisper]  = "ac9a71",
    [purple_plus_whisper]   = "66ba6c",
    [purple_minus_star]     = "03f036",
    [purple_plus_star]      = "59f317",

    [green_minus_ink]       = "4c4fe9",
    [green_plus_ink]        = "859db6",
    [green_minus_coin]      = "c6034a",
    [green_plus_coin]       = "801021",
    [green_minus_whisper]   = "463879",
    [green_plus_whisper]    = "455794",
    [green_minus_star]      = "03351a",
    [green_plus_star]       = "c0700e",

    [red_minus_ink]         = "fead69",
    [red_plus_ink]          = "9c9c0c",
    [red_minus_coin]        = "9210b6",
    [red_plus_coin]         = "263dd9",
    [red_minus_whisper]     = "95d6f6",
    [red_plus_whisper]      = "e61a92",
    [red_minus_star]        = "cf1c18",
    [red_plus_star]         = "58ec82",

    [blue_minus_ink]        = "e5e471",
    [blue_plus_ink]         = "b7b7f1",
    [blue_minus_coin]       = "032556",
    [blue_plus_coin]        = "44c405",
    [blue_minus_whisper]    = "21c7f9",
    [blue_plus_whisper]     = "e5a5a9",
    [blue_minus_star]       = "d0af18",
    [blue_plus_star]        = "a51db7"

}

hidden_objects = {
    devotee_deck,
    devotee_ref_deck,
    inky_realm_tile_bag,
    special_inky_realm_tile_bag,
    cosmoctopus,
    cosmic_bridge_token_1,
    cosmic_bridge_token_2,
    generic_resource_token_1,
    generic_resource_token_2,
    generic_resource_token_3,
    ink_bag,
    coin_bag,
    whisper_bag,
    star_bag,
    tentacle_bag,
    starting_deck_A,
    starting_deck_B,
    starting_deck_C,
    starting_deck_D,
    forbidden_knowledge_ink,
    forbidden_knowledge_coins,
    forbidden_knowledge_whispers,
    forbidden_knowledge_stars,
    first_contact_card_ink,
    first_contact_card_coins,
    first_contact_card_whispers,
    first_contact_card_stars

}

pi_objects = {
    magnifying_glass_1,
    magnifying_glass_2,
    pi_behaviour_deck,
    pi_revelation_cards,
    pi_tentacle,
    pi_tentacle_tracker_card,
    pi_ink_placeholder,
    pi_coins_placeholder,
    pi_whispers_placeholder,
    pi_stars_placeholder,
    pi_hand
}

purple_objects = {
    purple_board,
    purple_board_frame,
    purple_bin,
    purple_rule_book,
    purple_bowl_ink,
    purple_bowl_coin,
    purple_bowl_whisper,
    purple_bowl_star,
    purple_minus_ink,
    purple_plus_ink,
    purple_minus_coin,
    purple_plus_coin,
    purple_minus_whisper,
    purple_plus_whisper,
    purple_minus_star,
    purple_plus_star,
}

green_objects = {
    green_board,
    green_board_frame,
    green_bin,
    green_rule_book,
    green_bowl_ink,
    green_bowl_coin,
    green_bowl_whisper,
    green_bowl_star,
    green_minus_ink,
    green_plus_ink,
    green_minus_coin,
    green_plus_coin,
    green_minus_whisper,
    green_plus_whisper,
    green_minus_star,
    green_plus_star,
}


red_objects = {
    red_board,
    red_board_frame,
    red_bin,
    red_rule_book,
    red_bowl_ink,
    red_bowl_coin,
    red_bowl_whisper,
    red_bowl_star,
    red_minus_ink,
    red_plus_ink,
    red_minus_coin,
    red_plus_coin,
    red_minus_whisper,
    red_plus_whisper,
    red_minus_star,
    red_plus_star,
}

blue_objects = {
    blue_board,
    blue_board_frame,
    blue_bin,
    blue_rule_book,
    blue_bowl_ink,
    blue_bowl_coin,
    blue_bowl_whisper,
    blue_bowl_star,
    blue_minus_ink,
    blue_plus_ink,
    blue_minus_coin,
    blue_plus_coin,
    blue_minus_whisper,
    blue_plus_whisper,
    blue_minus_star,
    blue_plus_star,
}

--
--for var, val in pairs(object_ids) do
--    objects[var] = nil
--end


ref_card_locations = {
    [purple] = Vector(26.25, 2, -5.28),
    [green] = Vector(5.76, 2, -25.72),
    [red] = Vector(-21.43, 2, -15.67),
    [blue] = Vector(-23.30, 2, 12.89)
}

ref_card_rotations = {
    [purple] = Vector(0.00, 82.5, 0),
    [green] = Vector(0.00, 147.5, 0),
    [red] = Vector(0.00, 216, 0),
    [blue] = Vector(0.00, 277.50, 0.00)
}

PI_card_location = Vector(-4.93, 0.97, 22.00)

card_row_zones = { card_row_zone_1, card_row_zone_2, card_row_zone_3 }

face_down_card_rotation = Vector(0, 180, 180)
face_up_card_rotation = Vector(0, 180, 0)
discard_pile_loc = Vector(8.00, 2.87, 6.50)

ink_loc = {
    [purple] = Vector(15.74, 2.5, 0.60),
    [green] = Vector(6.62,  2.5, -13.60),
    [red] = Vector(-10.06,2.5, -11.32),
    [blue] = Vector(-15.07,2.5, 4.73)
}

coins_loc = {
    [purple] = Vector(15.37,2.5, 3.61),
    [green] = Vector(9.17,  2.5, -11.98),
    [red] = Vector(-7.54,   2.5,-12.91 ),
    [blue] = Vector(-15.48, 2.5,1.80 )
}

whispers_loc = {
    [purple] = Vector(14.98,2.5, 6.54),
    [green] = Vector(11.67, 2.5,-10.38),
    [red] = Vector(-5.02,   2.5,-14.51),
    [blue] = Vector(-15.85, 2.5,-1.17)
}

stars_loc = {
    [purple] = Vector(14.57,2.5,  9.56),
    [green] = Vector(14.21, 2.5, -8.75),
    [red] = Vector(-2.49,   2.5, -16.12),
    [blue] = Vector(-16.25, 2.5, -4.15)
}

inky_realm_rotation = Vector(0, 180, 180)
inky_realm_locs = {
    Vector(-5.33, 1, 1.7),
    Vector( 0.00, 1, 1.7),
    Vector( 5.33, 1, 1.7),
    Vector(-5.33, 1, -2.85),
    Vector( 0.00, 1, -2.85),
    Vector( 5.33, 1, -2.85),
    Vector(-5.33, 1, -7.4),
    Vector( 0.00, 1, -7.4),
    Vector( 5.33, 1, -7.4),
}


board_exists = {
    [purple] = false,
    [green] = false,
    [red] = false,
    [blue] = false
}


board_objects = {
    [purple] = purple_objects,
    [green] = green_objects,
    [red] = red_objects,
    [blue] = blue_objects
}

card_id_to_var_ref = {
    [object_ids[player_ref_card_A]] = player_ref_card_A,
    [object_ids[player_ref_card_B]] = player_ref_card_B,
    [object_ids[player_ref_card_C]] = player_ref_card_C,
    [object_ids[player_ref_card_D]] = player_ref_card_D
}

ref_card_player_map = {
    [player_ref_card_A] = ' ',
    [player_ref_card_B] = ' ',
    [player_ref_card_C] = ' ',
    [player_ref_card_D] = ' '
}

starting_deck_map = {
    [player_ref_card_A] = starting_deck_A,
    [player_ref_card_B] = starting_deck_B,
    [player_ref_card_C] = starting_deck_C,
    [player_ref_card_D] = starting_deck_D
 }



function onLoad()
    
    -- instatiate all objects in code
    
    for key, guid in pairs(object_ids) do
        objects[key] = getObjectFromGUID(guid)
        -- returns nil if no object
        if objects[key] == nil then
            print("object " .. key .. " with guid " .. guid .. "not found.")
        end
         
    end
    
    -- hide game objects before game start
    for _, j in pairs(hidden_objects) do
        objects[j].attachInvisibleHider("hide", true)

    end

    for _, j in pairs(pi_objects) do
        objects[j].attachInvisibleHider("hide", true)

    end


    --FIXME: attempt to set turn order and have a dummy PI player
    Turns.enable = false
    Turns.type = 2
    Turns.order = { "Purple", "Green", "Red", "Blue", "Brown" }
    Turns.enable = true

    game_started = false


    --set default game settings
    ref_hand = true
    toggleLights(objects[deal_rand_hand_light], objects[deal_sugg_hand_light])
    
    ref_layout = true
    toggleLights(objects[use_custom_layout_light], objects[use_std_layout_light])
    
    with_PI = false
    toggleLights(objects[with_pi_light], objects[no_pi_light])


    --instantiate buttons
    buttons = {
        ["select_hand"] = {
            ["obj"] = objects[select_hand_button],
            ["button_func_name"] = "toggleStartingHand"
        },
        ["custom_layout"] = {
            ["obj"] = objects[custom_layout_button],
            ["button_func_name"] = "toggleLayout"
        },
        ["with_pi"] = {
            ["obj"] = objects[with_pi_button],
            ["button_func_name"] = "togglePI"
        },
        ["play"] = {
            ["obj"] = objects[play_button],
            ["button_func_name"] = "beginPlay"
        }
    }

    for button, button_params in pairs(buttons) do
        button_params.obj.createButton({
            click_function = button_params.button_func_name,
            function_owner = nil, position = { 0, 0.45, 0 }, height = 730, width = 730, color = { 0, 0, 0, 0 }
        })
    end

    -- TODO: pluss/minus resource buttons.

end


function beginPlay()
    if game_started then
        print("game is already in progress")
    else
        -- get table of all player colours
        players = getSeatedPlayers()
        n_players = 0
        player_order = {}

 
        for _, j in pairs(hidden_objects) do
            objects[j].attachInvisibleHider("hide", false)
 
        end
 
        -- shuffle everything
        for _, shuffle_thing in pairs({
            devotee_deck, -- todo put these in relevant places
            devotee_ref_deck,
            inky_realm_tile_bag,
            special_inky_realm_tile_bag,
            pi_behaviour_deck,
            pi_revelation_cards
        }) do
            objects[shuffle_thing].shuffle()
        end
 
        -- deal out the reference cards
        Wait.frames(
                function()
                    n_players = dealRefCardsGetNPlayers(players)
                end,
                5)
 
 
 
        -- -- determine the starting player by the player who received the lowest reference card
        -- determineStaringPlayer()
 
        -- --deal resources
        -- Wait.frames(
        --         function()
        --             dealStartingResources(n_players)
        --         end,
        --         10)
 
        -- -- deal hands
        -- Wait.frames(
        --         function()
        --             if ref_hand then
        --                 deal_ref_hand()
        --             else
        --                 deal_rand_hand(players)
        --             end
        --         end,
        --         15)
 
        -- -- resolve PI objects
        -- Wait.frames(
        --         function()
        --             if with_PI then
        --                 for _, j in pairs(pi_objects) do
        --                     objects[j].attachInvisibleHider("hide", false)
                    
        --                 end

        --                 vanish(objects[pi_revelation_cards].takeObject())
        --                 vanish(objects[pi_revelation_cards].takeObject())
        --                 objects[pi_behaviour_deck].takeObject({
        --                     position = PI_card_location,
        --                     rotation = Vector(0, 0, 0)
        --                 })
 
        --             else
        --                 for _, obj in pairs(pi_objects) do
        --                     vanish(objects[obj])
        --                 end
        --             end
 
        --         end,
        --         20)
 
        -- if ref_layout then
        --     layTilesOut()

 
        -- end
        
        -- Wait.frames(refillCardRow, 25)
        -- game_started = true
    
    end
 
 end


function toggleLights(obj_to_off, obj_to_on)
    obj_to_off.AssetBundle.playLoopingEffect(0)
    obj_to_on.AssetBundle.playLoopingEffect(1)
end




function vanish(obj)
    bin_obj = objects[global_bin]
    bin_obj.putObject(obj)
end


function throw_away(object)
    if object.hasTag(devotee_deck_card_tag) then
        print("discarding card")
        object.setRotation(face_down_card_rotation)
        object.setPositionSmooth(discard_pile_loc)

    elseif object.hasTag("binnable") then
        print("vanishing object")
        vanish(object)
    else
        print("you cannot discard this object")

    end

end
-- button functions

function toggleStartingHand()
    if not game_started then
        if ref_hand then
            ref_hand = false
            toggleLights(objects[deal_sugg_hand_light], objects[deal_rand_hand_light])
        else
            ref_hand = true
            toggleLights(objects[deal_rand_hand_light], objects[deal_sugg_hand_light])
        end
    else
        print("cannot change game settings after game is begun")
    end

end


function toggleLayout()
    if not game_started then

        if ref_layout then
            ref_layout = false
            toggleLights(objects.use_std_layout_light, objects.use_custom_layout_light)
        else
            ref_layout = true
            toggleLights(objects.use_custom_layout_light, objects.use_std_layout_light)

        end

    else
        print("cannot change game settings after game is begun")
    end
end


function togglePI()
    if not game_started then
        if with_PI then
            with_PI = false
            toggleLights(objects[with_pi_light], objects[no_pi_light])

        else
            with_PI = true
            toggleLights(objects[no_pi_light], objects[with_pi_light])
        end
    else
        print("cannot change game settings after game has begun")
    end
end


function dealRefCardsGetNPlayers(players)
    n_players = 0
 
    for _, color in pairs(players) do
        if color ~= ' ' then
            print(color)
            board_exists[color] = true
            devotee_ref_deck_obj = objects[devotee_ref_deck]
 
            ref_card_object = devotee_ref_deck_obj.takeObject({
                position = ref_card_locations[color],
                rotation = ref_card_rotations[color]
            })
            -- create a record of which reference card each player received
            ref_card_player_map[card_id_to_var_ref[ref_card_object.guid]] = color
            n_players = n_players + 1
        end
 
    end
 
    -- get rid of boards
    for color, exists in pairs(board_exists) do

        
        if exists == false then
            for _, obj in pairs(board_objects[color]) do
                print(obj)
                vanish(objects[obj])
            end
        end
    end
 
    --get rid of the remaining ref deck cards
    if getObjectFromGUID(object_ids[devotee_ref_deck]) ~= nil then
        vanish(objects[devotee_ref_deck])
    end
 
    -- what happens if there is one card left ?
 
    return n_players
 end
 
--  function determineStaringPlayer()
--     -- determine the starting player by the player who received the lowest reference card
--     starting_player = ' '
--     for _, card in pairs({
--         [1] = player_ref_card_A,
--         [2] = player_ref_card_B,
--         [3] = player_ref_card_C,
--         [4] = player_ref_card_D
--     }) do
--         if ref_card_player_map[card] ~= ' ' then
--             starting_player = ref_card_player_map[card]
--             break
--         end
--     end
 
--     if starting_player ~= ' ' then
--         Turns.turn_color = starting_player
--     end
--     print("starting player is " .. Turns.turn_color)
--  end
 

 
--  function deal_ref_hand()
--     devotee_deck_obj = objects[devotee_deck]
--     for ref_card, player in pairs(ref_card_player_map) do
--         starting_deck = starting_deck_map[ref_card]
--         deck_object = objects[starting_deck]
 
--         if player ~= ' ' then
 
--             deck_object.deal(3, player)
--         else
--             devotee_deck_obj.putObject(deck_object)
--         end
--     end
--     devotee_deck_obj.shuffle()
 
--  end
 
--  function deal_rand_hand(players)
--     devotee_deck_obj = objects[devotee_deck]
--     for _, starting_deck in pairs(starting_deck_map) do
--         starting_deck_object = objects[starting_deck]
--         devotee_deck_obj.putObject(starting_deck_object)
--     end
--     devotee_deck_obj.shuffle()
 
--     for i = 1, 5 do
--         for _, player in ipairs(players) do
--             devotee_deck_obj.deal(1, player)
--         end
--     end
 
--  end
