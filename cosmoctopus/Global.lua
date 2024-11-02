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

---- game objects
-- where a var refers to an instantialised game obj, the var name should include suffex -_obj, and
-- where a var refers specifically to a game obj guid, the var name should include the suffex -_id
-- an unspecified var will refer to the local indexer
-- objects that are not in play (e.g. cards in a deck, objects in a bag) will return nill when initialised with GetObjectFromGUID

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

purple_board_zone = "purple_board_zone"
green_board_zone = "green_board_zone"
red_board_zone = "red_board_zone"
blue_board_zone = "blue_board_zone"

purple_board = "purple_board"
green_board = "green_board"
red_board = "red_board"
blue_board = "blue_board"

purple_bin = "purple_bin"
green_bin = "green_bin"
red_bin = "red_bin"
blue_bin = "blue_bin"

purple_hand = "purple_hand"
green_hand = "green_hand"
red_hand = "red_hand"
blue_hand = "blue_hand"

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

--not strictly necessary, but helpful for my ide
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


}

object_ids = {
    [global_bin] = "7a25d1",
    [devotee_deck] = "4c430e",
    [devotee_ref_deck] = "064f8d",
    [inky_realm_tile_bag] = "b3fcc4",
    [special_inky_realm_tile_bag] = "7864bc",
    [starting_tile] = "c056fb",
    [cosmoctopus] = "e91dbb",
    [cosmic_bridge_token_1] = "ce79c7",
    [cosmic_bridge_token_2] = "bfba39",
    [generic_resource_token_1] = "f8a672",
    [generic_resource_token_2] = "c4a262",
    [generic_resource_token_3] = "f440bd",
    [ink_bag] = 'cc7a6c',
    [coin_bag] = '430818',
    [whisper_bag] = '2d830e',
    [star_bag] = '98a771',
    [tentacle_bag]="a364f6",
    [card_row_zone_1] = "4ac1d2",
    [card_row_zone_2] = "9fcd46",
    [card_row_zone_3] = "ea72c7",
    [discard_deck_zone] = "bbe128",
    [magnifying_glass_1] = "09acd5",
    [magnifying_glass_2] = "b0bf54",
    [pi_behaviour_deck] = "adec51",
    [pi_revelation_cards] = "93bcae",
    [pi_tentacle] = "9fd2a1",
    [pi_tentacle_tracker_card] = "5058b2",
    [pi_ink_placeholder] = "643529",
    [pi_coins_placeholder] = "2edf2a",
    [pi_whispers_placeholder] = "0df88a",
    [pi_stars_placeholder] = "c2d006",
    [pi_hand] = "b87a8c",
    [starting_deck_A] = "5a4628",
    [starting_deck_B] = "fd88d2",
    [starting_deck_C] = "a73859",
    [starting_deck_D] = "b30593",
    [player_ref_card_A] = "36083a",
    [player_ref_card_B] = "db7a54",
    [player_ref_card_C] = "f4c27a",
    [player_ref_card_D] = "e1a47a",
    
    [deal_rand_hand_light] = "156f48",
    [deal_sugg_hand_light] = "6e1300",
    [use_std_layout_light] = "d02278",
    [use_custom_layout_light] = "dbbba1",
    [no_pi_light] = "939847",
    [with_pi_light] = "091dda",
    [select_hand_button] = "7a6d6e",
    [custom_layout_button] = "c13cf2",
    [with_pi_button] = "74bd44",
    [play_button] = "bd1b92",

    [forbidden_knowledge_ink]="dd0bbb",
    [forbidden_knowledge_coins]="37e815",
    [forbidden_knowledge_whispers]="4d169a",
    [forbidden_knowledge_stars]="656564",
    [first_contact_card_ink]="7c9785",
    [first_contact_card_coins]="2fefa0",
    [first_contact_card_whispers]="2ea49b",
    [first_contact_card_stars]="3d71d7",

    [purple_board] = "0bc026",
    [green_board] = "cfd4c1",
    [red_board] = "f90dcf",
    [blue_board] = "5b3641",

    [purple_bin] = "9002cd",
    [green_bin] = "c6671b",
    [red_bin] = "8fd239",
    [blue_bin] = "d00873", 

    [purple_hand] = "0bc026",
    [green_hand] = "3517cc",
    [red_hand] = "3132d3",
    [blue_hand] = "1f0d36",

    [purple_minus_ink]      = "1aa2f9",
    [purple_plus_ink]       = "2fe0e4",
    [purple_minus_coin]     = "01f214",
    [purple_plus_coin]      = "cacc6b",
    [purple_minus_whisper]  = "ac9a71",
    [purple_plus_whisper]   = "66ba6c",
    [purple_minus_star]     = "03f036",
    [purple_plus_star]      = "59f317"

    [green_minus_ink]       = "4c4fe9",
    [green_plus_ink]        = "859db6",
    [green_minus_coin]      = "c6034a",
    [green_plus_coin]       = "801021",
    [green_minus_whisper]   = "463879",
    [green_plus_whisper]    = "455794",
    [green_minus_star]      = "03351a",
    [green_plus_star]       = "c0700e"

    [red_minus_ink]         = "fead69",
    [red_plus_ink]          = "9c9c0c",
    [red_minus_coin]        = "9210b6",
    [red_plus_coin]         = "263dd9",
    [red_minus_whisper]     = "f90dcf",
    [red_plus_whisper]      = "e61a92",
    [red_minus_star]        = "cf1c18",
    [red_plus_star]         = "f90dcf"

    [blue_minus_ink]        = "e5e471",
    [blue_plus_ink]         = "b7b7f1",
    [blue_minus_coin]       = "032556",
    [blue_plus_coin]        = "44c405",
    [blue_minus_whisper]    = "21c7f9",
    [blue_plus_whisper]     = "e5a5a9",
    [blue_minus_star]       = "d0af18",
    [blue_plus_star]        = "5b3641",

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
    pi_tentacle_tracker_card
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


board_names = {
    [purple] = purple_board,
    [green] = green_board,
    [red] = red_board,
    [blue] = blue_board
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

boards = {
    [purple] = purple_board,
    [green] = green_board,
    [red] = red_board,
    [blue] = blue_board
}


function vanish(obj)
    bin_obj = objects[global_bin]
    bin_obj.putObject(obj)
end

function toggleLights(obj_to_off, obj_to_on)
    obj_to_off.AssetBundle.playLoopingEffect(0)
    obj_to_on.AssetBundle.playLoopingEffect(1)
end

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

--function checkZoneEmpty(zone_obj)
--    is_empty = true
--    for _, occupyingObject in ipairs(zone_obj.getObjects(true)) do
--        if occupyingObject.hasTag(card_zone_tag) then
--            is_empty = false
--        end
--
--    end
--    return is_empty
--end
--
function refillCardRow()
    for _, zone in pairs({ card_row_zone_1,
                           card_row_zone_2,
                           card_row_zone_3 }) do
        zone_obj = objects[zone]
        is_empty = checkZoneEmpty(zone_obj)

        if is_empty then
            devotee_deck_obj = objects[devotee_deck]
            card_obj = devotee_deck_obj.takeObject()
            card_obj.setRotation(Vector(0, 180, 0))
            card_obj.setPositionSmooth(zone_obj.getPosition())
        end
    end
end


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

    --TODO: pluss/minus resource buttons.



end


-- function beginPlay()
--     if game_started then
--         print("game is already in progress")
--     else
--         -- get table of all player colours
--         players = getSeatedPlayers()
--         n_players = 0
--         player_order = {}

 
--         for _, j in pairs(hidden_objects) do
--             objects[j].attachInvisibleHider("hide", false)
 
--         end
 
--         -- shuffle everything
--         for _, shuffle_thing in pairs({
--             devotee_deck, -- todo put these in relevant places
--             devotee_ref_deck,
--             inky_realm_tile_bag,
--             special_inky_realm_tile_bag,
--             pi_behaviour_deck,
--             pi_revelation_cards
--         }) do
--             objects[shuffle_thing].shuffle()
--         end
 
--         --deal out the reference cards
--         Wait.frames(
--                 function()
--                     n_players = dealRefCardsGetNPlayers(players)
--                 end,
--                 5)
 
 
 
--         -- determine the starting player by the player who received the lowest reference card
--         determineStaringPlayer()
 
--         --deal resources
--         Wait.frames(
--                 function()
--                     dealStartingResources(n_players)
--                 end,
--                 10)
 
--         -- deal hands
--         Wait.frames(
--                 function()
--                     if ref_hand then
--                         deal_ref_hand()
--                     else
--                         deal_rand_hand(players)
--                     end
--                 end,
--                 15)
 
--         -- resolve PI objects
--         Wait.frames(
--                 function()
--                     if with_PI then
--                         for _, j in pairs(pi_objects) do
--                             objects[j].attachInvisibleHider("hide", false)
                    
--                         end

--                         vanish(objects[pi_revelation_cards].takeObject())
--                         vanish(objects[pi_revelation_cards].takeObject())
--                         objects[pi_behaviour_deck].takeObject({
--                             position = PI_card_location,
--                             rotation = Vector(0, 0, 0)
--                         })
 
--                     else
--                         for _, obj in pairs(pi_objects) do
--                             vanish(objects[obj])
--                         end
--                     end
 
--                 end,
--                 20)
 
--         if ref_layout then
--             layTilesOut()

 
--         end
        
--         Wait.frames(refillCardRow, 25)
--         game_started = true
    
--     end
 
--  end


-- function onObjectEnterContainer(container, object)
--     if container.hasTag(is_bin_tag) then
--         throw_away(object)
--     end

-- end
--
--function onPlayerTurn(player, previous_player)
--    if Turns.turn_color == brown then
--        if not with_PI then
--            Turns.turn_color = Turns.getNextTurnColor()
--        else
--            print("Resolve PI actions")
--        end
--    end
--end
from_card_row_tag = "from_card_row"
--function onObjectLeaveZone( zone,  object)
--    if zone.hasTag(card_row_tag) then
--        object.addTag(from_card_row_tag)
--    end
--end


--function onObjectDrop(player_color, object)
--    if game_started then
--        -- handle devotee deck cards
--        if object.hasTag(devotee_deck_card_tag) then
--            if object.hasTag(from_card_row_tag)
--        end
----
--            -- return to location if not dropped in a valid card zone
--            in_card_zone = false  -- will determine if gets sent to origin or not
--            pos = object.pick_up_position
--            rot = object.pick_up_rotation
--            zone_objs = object.getZones()
--
--            -- check if the card has been dropped into any valid card zone
--            for _, zone_obj in pairs(zone_objs) do
--                -- if the card zone is a bin, drop it and send to the discard pile
--                if zone_obj.hasTag(is_bin_tag) then
--                    in_card_zone = true  -- do not send back to original location
--                    throw_away(object, true)
--                    break
--
--                    --if the card zone is part of the card row, do not drop if the spot is already occupied
--                elseif zone_obj.hasTag(card_row_tag) then
--                    if not checkZoneEmpty(zone_obj) then
--                        in_card_zone = false  -- send back to original location
--                        break
--                    end
--
--                    -- handle normal card zones
--                elseif zone_obj.hasTag(card_zone_tag) then
--                    in_card_zone = true  --do not send back to original location
--                    break
--                end
--
--
--            end
--
--            if not in_card_zone then
--                object.setRotation(rot)
--                object.setPositionSmooth(pos)
--            end
--
--            -- if any devotee card has moved, check to see if the card row needs refilling
--            Wait.frames(refillCardRow, 25)
--
--            -- hand movement of non devotee-deck objects
--        elseif object.hasTag(binnable_tag) then
--            zone_objs = object.getZones()
--            for _, zone_obj in pairs(zone_objs) do
--                if zone_obj.hasTag(is_bin_tag) then
--                    throw_away(object, false)
--                end
--            end
--        end
--
--    end
--
--end



--function dealRefCardsGetNPlayers(players)
--    n_players = 0
--
--    for _, color in pairs(players) do
--        if color ~= ' ' then
--            board_names[color] = ' '
--            devotee_ref_deck_obj = objects[devotee_ref_deck]
--
--            ref_card_object = devotee_ref_deck_obj.takeObject({
--                position = ref_card_locations[color],
--                rotation = ref_card_rotations[color]
--            })
--            -- create a record of which reference card each player received
--            ref_card_player_map[card_id_to_var_ref[ref_card_object.guid]] = color
--            n_players = n_players + 1
--        end
--
--    end
--
--    -- get rid of boards
--    for colour, board_name in pairs(board_names) do
--        if board_name ~= ' ' then
--            board_object = objects[board_name]
--            vanish(board_object)
--        end
--    end
--
--    --get rid of the remaining ref deck cards
--    if getObjectFromGUID(object_ids[devotee_ref_deck]) ~= nil then
--        vanish(objects[devotee_ref_deck])
--    end
--
--    -- what happens if there is one card left ?
--
--    return n_players
--end
--
--function determineStaringPlayer()
--    -- determine the starting player by the player who received the lowest reference card
--    starting_player = ' '
--    for _, card in pairs({
--        [1] = player_ref_card_A,
--        [2] = player_ref_card_B,
--        [3] = player_ref_card_C,
--        [4] = player_ref_card_D
--    }) do
--        if ref_card_player_map[card] ~= ' ' then
--            starting_player = ref_card_player_map[card]
--            break
--        end
--    end
--
--    if starting_player ~= ' ' then
--        Turns.turn_color = starting_player
--    end
--    print("starting player is " .. Turns.turn_color)
--end
--
--starting_deck_map = {
--    [player_ref_card_A] = starting_deck_A,
--    [player_ref_card_B] = starting_deck_B,
--    [player_ref_card_C] = starting_deck_C,
--    [player_ref_card_D] = starting_deck_D
--}
--
--function deal_ref_hand()
--    devotee_deck_obj = objects[devotee_deck]
--    for ref_card, player in pairs(ref_card_player_map) do
--        starting_deck = starting_deck_map[ref_card]
--        deck_object = objects[starting_deck]
--
--        if player ~= ' ' then
--
--            deck_object.deal(3, player)
--        else
--            devotee_deck_obj.putObject(deck_object)
--        end
--    end
--    devotee_deck_obj.shuffle()
--
--end
--
--function deal_rand_hand(players)
--    devotee_deck_obj = objects[devotee_deck]
--    for _, starting_deck in pairs(starting_deck_map) do
--        starting_deck_object = objects[starting_deck]
--        devotee_deck_obj.putObject(starting_deck_object)
--    end
--    devotee_deck_obj.shuffle()
--
--    for i = 1, 5 do
--        for _, player in ipairs(players) do
--            devotee_deck_obj.deal(1, player)
--        end
--    end
--
--end
--
--function removePiObjects()
--    for _, pi_obj in pairs {
--        pi_revelation_cards,
--        pi_behaviour_deck,
--        pi_tentacle_tracker_card,
--        pi_tentacle,
--        magnifying_glass_1,
--        magnifying_glass_2,
--        pi_ink_placeholder,
--        pi_coins_placeholder,
--        pi_whispers_placeholder,
--        pi_stars_placeholder,
--    } do
--        vanish(objects[pi_obj])
--    end
--end
--
-- function layTilesOut()
--    special_tile_bag_obj = objects[special_inky_realm_tile_bag]
--    tile_bag_obj = objects[inky_realm_tile_bag]
--    special_tile_obj = special_tile_bag_obj.takeObject()
--    tile_bag_obj.putObject(special_tile_obj)
--    tile_bag_obj.shuffle()
--    for _, loc in pairs(inky_realm_locs) do
--        tile_obj = tile_bag_obj.takeObject()
--        if tile_obj ~= nil then
--            tile_obj.setRotation(inky_realm_rotation)
--            tile_obj.setPositionSmooth(loc)
--            tile_obj.locked = true

--        end
--    end
--
--    vanish(special_tile_bag_obj)
--    vanish(tile_bag_obj)
--    for _, cosmic_bridge in pairs({ cosmic_bridge_token_1, cosmic_bridge_token_2 }) do
--        cosmic_bridge_obj = objects[cosmic_bridge]
--        vanish(cosmic_bridge_obj)
--    end
--    Wait.frames(function()
--        cosmoctopus_obj = objects[cosmoctopus]
--
--        starting_tile_loc = getObjectFromGUID(object_ids[starting_tile]).getPosition():add(Vector(0, .5, 0))
--        cosmoctopus_obj.setPositionSmooth(starting_tile_loc)
--    end, 25)
--
--end
--
--function dealPlayerTokens(player_color)
--
--    for i = 1, 2 do
--
--        objects[whisper_bag].takeObject({
--            position = whispers_loc[player_color],
--            rotation = ref_card_rotations[player_color]
--        })
--        objects[coin_bag].takeObject({
--            position = coins_loc[player_color],
--            rotation = ref_card_rotations[player_color]
--        })
--        objects[ink_bag].takeObject({
--            position = ink_loc[player_color],
--            rotation = ref_card_rotations[player_color]
--        })
--        objects[star_bag].takeObject({
--            position = stars_loc[player_color],
--            rotation = ref_card_rotations[player_color]
--        })
--
--    end
--end
--
--function dealStartingResources(n_players)
--    plus_1_obj = objects[generic_resource_token_1]
--    plus_2_obj = objects[generic_resource_token_2]
--    plus_3_obj = objects[generic_resource_token_3]
--    dealPlayerTokens(Turns.turn_color)
--    if n_players > 1 then
--        second_player = Turns.getNextTurnColor()
--        Turns.turn_color = second_player
--
--        plus_1_obj.setPositionSmooth(ref_card_locations[second_player])
--        dealPlayerTokens(second_player)
--
--        if n_players > 2 then
--            third_player = Turns.getNextTurnColor()
--            Turns.turn_color = third_player
--            plus_2_obj.setPositionSmooth(ref_card_locations[third_player])
--            dealPlayerTokens(third_player)
--            if n_players > 3 then
--                fourth = Turns.getNextTurnColor()
--                Turns.turn_color = fourth
--                plus_3_obj.setPositionSmooth(ref_card_locations[fourth])
--                dealPlayerTokens(fourth)
--            else
--                vanish(plus_1_obj)
--            end
--        else
--            vanish(plus_2_obj)
--            vanish(plus_3_obj)
--        end
--    else
--        vanish(plus_1_obj)
--        vanish(plus_2_obj)
--        vanish(plus_3_obj)
--    end
--
--end
--


