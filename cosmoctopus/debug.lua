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
    [purple_board_zone] = nil,
    [green_board_zone] = nil,
    [red_board_zone] = nil,
    [blue_board_zone] = nil,
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

    -- [purple_minus_ink] = nil,
    -- [purple_plus_ink] = nil,
    -- [purple_minus_coin] = nil,
    -- [purple_plus_coin] = nil,
    -- [purple_minus_whisper] = nil,
    -- [purple_plus_whisper] = nil,
    -- [purple_minus_star] = nil,
    -- [purple_plus_star] = nil,

    -- [green_minus_ink] = nil,
    -- [green_plus_ink] = nil,
    -- [green_minus_coin] = nil,
    -- [green_plus_coin] = nil,
    -- [green_minus_whisper] = nil,
    -- [green_plus_whisper] = nil,
    -- [green_minus_star] = nil,
    -- [green_plus_star] = nil,

    -- [red_minus_ink] = nil,
    -- [red_plus_ink] = nil,
    -- [red_minus_coin] = nil,
    -- [red_plus_coin] = nil,
    -- [red_minus_whisper] = nil,
    -- [red_plus_whisper] = nil,
    -- [red_minus_star] = nil,
    -- [red_plus_star] = nil,

    -- [blue_minus_ink] = nil,
    -- [blue_plus_ink] = nil,
    -- [blue_minus_coin] = nil,
    -- [blue_plus_coin] = nil,
    -- [blue_minus_whisper] = nil,
    -- [blue_plus_whisper] = nil,
    -- [blue_minus_star] = nil,
    -- [blue_plus_star] = nil,

    -- [purple_board_frame] = nil,
    -- [green_board_frame] = nil,
    -- [red_board_frame] = nil,
    -- [blue_board_frame] = nil,

    -- [purple_rule_book]          = nil,
    -- [green_rule_book]           = nil,
    -- [red_rule_book]             = nil,
    -- [blue_rule_book]            = nil,
   
    -- [purple_bowl_ink]            =nil,
    -- [purple_bowl_coin]           =nil,
    -- [purple_bowl_whisper]        =nil,
    -- [purple_bowl_star]           =nil,
     
    -- [green_bowl_ink]             =nil,
    -- [green_bowl_coin]            =nil,
    -- [green_bowl_whisper]         =nil,
    -- [green_bowl_star]            =nil,
     
    -- [red_bowl_ink]               =nil,
    -- [red_bowl_coin]              =nil,
    -- [red_bowl_whisper]           =nil,
    -- [red_bowl_star]              =nil,
     
    -- [blue_bowl_ink]              =nil,
    -- [blue_bowl_coin]             =nil,
    -- [blue_bowl_whisper]          =nil,
    -- [blue_bowl_star]             =nil


}
