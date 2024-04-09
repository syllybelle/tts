--[[ TTS documentation: https://api.tabletopsimulator.com/ ]]
--todo: add reset button
--todo: add proper turns management

-- tags
card_zone_tag   = "card_holder"
is_bin_tag = "is_bin"
binnable_tag = "binnable"
card_row_tag = "card_row"
devotee_deck_card_tag = "devotee_deck_card"

purple  = "Purple"
green   = "Green"
red     = "Red"
blue    = "Blue"
brown   = "Brown"

---- game objects
-- where a var refers to an instantialised game obj, the var name should include suffex -_obj, and
-- where a var refers specifically to a game obj guid, the var name should include the suffex -_id
-- an unspecified var will refer to the local indexer

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

ink_bag="ink_bag"
coin_bag="coin_bag"
whisper_bag="whisper_bag"
star_bag="star_bag"

generic_resource_token_1 = "generic_resource_token_1"
generic_resource_token_2 = "generic_resource_token_2"
generic_resource_token_3 = "generic_resource_token_3"

magnifying_glass_1 = "magnifying_glass_1"
magnifying_glass_2 = "magnifying_glass_2"
pi_behaviour_deck = "pi_behaviour_deck"
pi_revelation_cards = "pi_revelation_cards"
pi_tentacle = "pi_tentacle"
pi_tentacle_tracker_card = "pi_tentacle_tracker_card"
pi_ink_placehol = "pi_ink_placehol"
pi_coins_placehol = "pi_coins_placehol"
pi_whispers_placehol = "pi_whispers_placehol"
pi_stars_placehol = "pi_stars_placehol"
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

purple_bin_zone = "purple_bin_zone"
green_bin_zone = "green_bin_zone"
red_bin_zone = "red_bin_zone"
blue_bin_zone = "blue_bin_zone"

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

object_ids = {
    [global_bin]                = "7a25d1",
    [devotee_deck]           = "f3b1e5",
    [devotee_ref_deck]          = "3b4887",
    [inky_realm_tile_bag]       = "a6a84e",
    [special_inky_realm_tile_bag]  = "d263b7",
    [starting_tile]             = "c056fb",
    [cosmoctopus]               = "e91dbb",
    [cosmic_bridge_token_1]     = "ce79c7",
    [cosmic_bridge_token_2]     = "bfba39",
    [generic_resource_token_1]  = "f8a672",
    [generic_resource_token_2]  = "c4a262",
    [generic_resource_token_3]  = "f440bd",
    [ink_bag]                   ='cc7a6c',
    [coin_bag]                  ='430818',
    [whisper_bag]               ='2d830e',
    [star_bag]                  ='98a771',
    [card_row_zone_1]           = "4ac1d2",
    [card_row_zone_2]           = "9fcd46",
    [card_row_zone_3]           = "ea72c7",
    [discard_deck_zone]         = "bbe128",
    [magnifying_glass_1]        = "d32ede",
    [magnifying_glass_2]        = "70bed2",
    [pi_behaviour_deck]         = "adec51",
    [pi_revelation_cards]       = "9ac431",
    [pi_tentacle]               = "9fd2a1",
    [pi_tentacle_tracker_card]  = "5058b2",
    [pi_ink_placehol]           = "8abf8e",
    [pi_coins_placehol]         = "5dea2a",
    [pi_whispers_placehol]      = "89c917",
    [pi_stars_placehol]         = "e4f8ec",
    [pi_hand]                   = "b87a8c",
    [starting_deck_A]           = "330bdb",
    [starting_deck_B]           = "7c6a12",
    [starting_deck_C]           = "56c5ac",
    [starting_deck_D]           = "6d73b1",
    [player_ref_card_A]         = "cc617f",
    [player_ref_card_B]         = "d77ad0",
    [player_ref_card_C]         = "9165a4",
    [player_ref_card_D]         = "b4ae61",
    [purple_board_zone]         = "ac850a",
    [green_board_zone]          = "567f8a",
    [red_board_zone]            = "c6e45a",
    [blue_board_zone]           = "06e6aa",
    [purple_board]              = "124683",
    [green_board]               = "2f4b10",
    [red_board]                 = "ba7bc1",
    [blue_board]                = "74eaa0",
    [purple_bin_zone]           = "b6aa41",
    [green_bin_zone]            = "1af419",
    [red_bin_zone]              = "fba26d",
    [blue_bin_zone]             = "6be4a5",
    [purple_hand]               = "0bc026",
    [green_hand]                = "3517cc",
    [red_hand]                  = "3132d3",
    [blue_hand]                 = "1f0d36",
    [deal_sugg_hand_light]      = "d60cb0",
    [deal_rand_hand_light]      = "156f48",
    [use_std_layout_light]      = "d02278",
    [use_custom_layout_light]   = "dbbba1",
    [no_pi_light]               = "939847",
    [with_pi_light]             = "091dda",
    [select_hand_button]        = "7a6d6e",
    [custom_layout_button]      = "c13cf2",
    [with_pi_button]            = "74bd44",
    [play_button]               = "bd1b92"

}

--not strictly necessary, but helpful for my ide
objects = {
    [global_bin]                = nil,
    [devotee_deck]           = nil,
    [devotee_ref_deck]          = nil,
    [inky_realm_tile_bag]       = nil,
    [special_inky_realm_tile_bag]= nil,
    [starting_tile]             = nil,
    [cosmoctopus]               = nil,
    [cosmic_bridge_token_1]     = nil,
    [cosmic_bridge_token_2]     = nil,
    [card_row_zone_1]           = nil,
    [card_row_zone_2]           = nil,
    [card_row_zone_3]           = nil,
    [discard_deck_zone]         = nil,
    [magnifying_glass_1]        = nil,
    [magnifying_glass_2]        = nil,
    [pi_behaviour_deck]         = nil,
    [pi_revelation_cards]       = nil,
    [pi_tentacle]               = nil,
    [pi_tentacle_tracker_card]  = nil,
    [pi_ink_placehol]           = nil,
    [pi_coins_placehol]         = nil,
    [pi_whispers_placehol]      = nil,
    [pi_stars_placehol]         = nil,
    [pi_hand]                   = nil,
    [starting_deck_A]           = nil,
    [starting_deck_B]           = nil,
    [starting_deck_C]           = nil,
    [starting_deck_D]           = nil,
    [player_ref_card_A]         = nil,
    [player_ref_card_B]         = nil,
    [player_ref_card_C]         = nil,
    [player_ref_card_D]         = nil,
    [purple_board_zone]         = nil,
    [green_board_zone]          = nil,
    [red_board_zone]            = nil,
    [blue_board_zone]           = nil,
    [purple_board]              = nil,
    [green_board]               = nil,
    [red_board]                 = nil,
    [blue_board]                = nil,
    [purple_bin_zone]           = nil,
    [green_bin_zone]            = nil,
    [red_bin_zone]              = nil,
    [blue_bin_zone]             = nil,
    [purple_hand]               = nil,
    [green_hand]                = nil,
    [red_hand]                  = nil,
    [blue_hand]                 = nil,
    [deal_sugg_hand_light]      = nil,
    [deal_rand_hand_light]      = nil,
    [use_std_layout_light]      = nil,
    [use_custom_layout_light]   = nil,
    [no_pi_light]               = nil,
    [with_pi_light]             = nil,
    [select_hand_button]        = nil,
    [custom_layout_button]      = nil,
    [with_pi_button]            = nil,
    [play_button]               = nil,
}
--
--for var, val in pairs(object_ids) do
--    objects[var] = nil
--end


ref_card_locations = {
    [purple]  = Vector(18.07,   2,   -2.05  ),
    [green]   = Vector(3.66,    2,   -17.87 ),
    [red]     = Vector(-15.98,  2,   -9.11  ),
    [blue]    = Vector(-13.38,  2,   12.26  )
}

ref_card_rotations = {
    [purple]  = Vector(0.00,    72,  0      ),
    [green]   = Vector(0.00,    144, 0      ),
    [red]     = Vector(0.00,    216, 0      ),
    [blue]    = Vector(0.00,    288, 0      )
}


PI_card_location = Vector(-4.93,   0.97, 22.00 )



card_row_zones = {card_row_zone_1,card_row_zone_2,card_row_zone_3}


face_down_card_rotation = Vector(0, 180, 180)
face_up_card_rotation   = Vector(0, 180, 0)
discard_pile_loc        = Vector(9.50, 2.87, 5.00)

ink_loc = {
    [purple]  = Vector(16.35, 2.5, 0.46),
    [green]   = Vector(5.53, 2.5, -15.47),
    [red]     = Vector(-13.10, 2.5, -10.16),
    [blue]    =  Vector(-13.50, 2.5, 9.21)
}

coins_loc = {
    [purple]  =Vector(15.62, 2.5, 2.80),
    [green]   =Vector(7.51, 2.5, -14.03),
    [red]     =Vector(-11.13, 2.5, -11.58),
    [blue]    =Vector(-14.25, 2.5, 6.91)
}

whispers_loc = {
    [purple]  =Vector(14.86, 2.5, 5.03),
    [green]   =Vector(9.42, 2.5, -12.63),
    [red]     =Vector(-9.21,  2.5, -12.96),
    [blue]    =Vector(-14.96, 2.5, 4.64)
}

stars_loc = {
    [purple]  =Vector(14.12, 2.5, 7.38),
    [green]   =Vector(11.41,2.5, -11.21),
    [red]     =Vector(-7.24,  2.5, -14.42),
    [blue]    =Vector(-15.75, 2.5, 2.33)
}

inky_realm_rotation = Vector(0 , 180   , 180    )
inky_realm_locs = {
    Vector(-3.5, 1, 0),
    Vector(0, 1, 0),
    Vector(3.5, 1, 0),
    Vector(-3.5, 1, -3.5),
    Vector(0, 1, -3.5),
    Vector(3.5, 1, -3.5),
    Vector(-3.5, 1, -7.5),
    Vector(0, 1, -7.5),
    Vector(3.5, 1, -7.5),
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



board_names = {
    [purple]  = purple_board,
    [green]   = green_board,
    [red]     = red_board,
    [blue]    = blue_board
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

board_zones = {
    [purple]  = purple_board_zone,
    [green]   = green_board_zone,
    [red]     = red_board_zone,
    [blue]    = blue_board_zone
}

function dealRefCardsGetNPlayers(players)
    n_players = 0

    for _, color in pairs(players) do
        if color ~= ' ' then
            board_names[color] = ' '
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
    for colour, board_name in pairs(board_names) do
            if board_name ~= ' ' then
                board_zone_object = objects[board_zones[colour]]
                board_zone_object.removeTag(card_zone_tag)
                board_object = objects[board_name]
                vanish(board_object)
                end
        end

    --get rid of the remaining ref deck cards
    if getObjectFromGUID(object_ids[devotee_ref_deck]) ~= nil then
        vanish(objects[devotee_ref_deck])
    end

    -- what happens if there is one card left ?

    return n_players
end

function determineStaringPlayer()
  -- determine the starting player by the player who received the lowest reference card
    starting_player = ' '
    for _, card in pairs({
        [1]=player_ref_card_A,
        [2]=player_ref_card_B,
        [3]=player_ref_card_C,
        [4]=player_ref_card_D
    }) do
        if  ref_card_player_map[card] ~= ' ' then
            starting_player = ref_card_player_map[card]
            break
        end
    end

    if starting_player ~= ' ' then
        Turns.turn_color = starting_player
    end
    print("starting player is "..Turns.turn_color)
end



starting_deck_map = {
    [player_ref_card_A] = starting_deck_A,
    [player_ref_card_B] = starting_deck_B,
    [player_ref_card_C] = starting_deck_C,
    [player_ref_card_D] = starting_deck_D
}


function deal_ref_hand()
    devotee_deck_obj = objects[devotee_deck]
    for ref_card, player in pairs(ref_card_player_map) do
        starting_deck = starting_deck_map[ref_card]
        deck_object = objects[starting_deck]

        if player ~= ' ' then

            deck_object.deal(3, player)
        else
            devotee_deck_obj.putObject(deck_object)
        end
    end
    devotee_deck_obj.shuffle()

end


function deal_rand_hand(players)
    devotee_deck_obj = objects[devotee_deck]
    for _, starting_deck in pairs(starting_deck_map) do
        starting_deck_object = objects[starting_deck]
        devotee_deck_obj.putObject(starting_deck_object)
    end
    devotee_deck_obj.shuffle()

    for i=1, 5 do
        for _, player in ipairs(players) do
            devotee_deck_obj.deal(1, player)
        end
    end

end

function removePiObjects()
    for  _, pi_obj in pairs{
                pi_revelation_cards,
                pi_behaviour_deck,
                pi_tentacle_tracker_card,
                pi_tentacle,
                magnifying_glass_1,
                magnifying_glass_2,
                pi_ink_placehol,
                pi_coins_placehol,
                pi_whispers_placehol,
                pi_stars_placehol,
            } do
                vanish(objects[pi_obj])
            end
end

function layTilesOut()
    special_tile_bag_obj=objects[special_inky_realm_tile_bag]
    tile_bag_obj =objects[inky_realm_tile_bag]
    special_tile_obj = special_tile_bag_obj.takeObject()
    tile_bag_obj.putObject(special_tile_obj)
    tile_bag_obj.shuffle()
    for _, loc in pairs(inky_realm_locs) do
        tile_obj = tile_bag_obj.takeObject()
        if tile_obj ~= nil then
            tile_obj.setRotation(inky_realm_rotation)
            tile_obj.setPositionSmooth(loc)
            tile_obj.locked = true

        end
    end

    vanish(special_tile_bag_obj)
    vanish(tile_bag_obj)
    for _, cosmic_bridge in pairs({cosmic_bridge_token_1, cosmic_bridge_token_2}) do
        cosmic_bridge_obj = objects[cosmic_bridge]
        vanish(cosmic_bridge_obj)
    end
    Wait.frames(function()
        cosmoctopus_obj = objects[cosmoctopus]

        starting_tile_loc = getObjectFromGUID(object_ids[starting_tile]).getPosition():add(Vector(0, .5, 0))
        cosmoctopus_obj.setPositionSmooth(starting_tile_loc)
    end , 25)

end

function dealPlayerTokens(player_color)

    for i=1, 2 do

        objects[whisper_bag].takeObject({
            position = whispers_loc[player_color],
            rotation = ref_card_rotations[player_color]
        })
        objects[coin_bag].takeObject({
            position = coins_loc[player_color],
            rotation = ref_card_rotations[player_color]
        })
        objects[ink_bag].takeObject({
            position = ink_loc[player_color],
            rotation = ref_card_rotations[player_color]
        })
        objects[star_bag].takeObject({
            position = stars_loc[player_color],
            rotation = ref_card_rotations[player_color]
        })

    end
end

function dealStartingResources(n_players)
    plus_1_obj = objects[generic_resource_token_1]
    plus_2_obj = objects[generic_resource_token_2]
    plus_3_obj = objects[generic_resource_token_3]
    dealPlayerTokens(Turns.turn_color)
    if n_players > 1 then
        second_player = Turns.getNextTurnColor()
        Turns.turn_color = second_player

        plus_1_obj.setPositionSmooth(ref_card_locations[second_player])
        dealPlayerTokens(second_player)

        if n_players > 2 then
            third_player = Turns.getNextTurnColor()
            Turns.turn_color = third_player
            plus_2_obj.setPositionSmooth(ref_card_locations[third_player])
            dealPlayerTokens(third_player)
            if n_players > 3 then
                fourth = Turns.getNextTurnColor()
                Turns.turn_color = fourth
                plus_3_obj.setPositionSmooth(ref_card_locations[fourth])
                dealPlayerTokens(fourth)
            else
                vanish(plus_1_obj)
            end
        else
            vanish(plus_2_obj)
            vanish(plus_3_obj)
        end
    else
        vanish(plus_1_obj)
        vanish(plus_2_obj)
        vanish(plus_3_obj)
    end

end

function beginPlay()
    if game_started then
        print("game is already in progress")
    else
        -- get table of all player colours
        players = getSeatedPlayers()
        n_players = 0
        player_order = {}

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

        --deal out the reference cards
        Wait.frames(
                function()
                    n_players = dealRefCardsGetNPlayers(players)
                    end,
                5)



        -- determine the starting player by the player who received the lowest reference card
        determineStaringPlayer()

        --deal resources
          Wait.frames(
                function()
                    dealStartingResources(n_players)
                    end,
                10)

        -- deal hands
        Wait.frames(
            function()
                    if ref_hand then
                        deal_ref_hand()
                    else
                        deal_rand_hand(players)
                    end
                end,
            15)

        -- resolve PI objects
        Wait.frames(
            function()
                if with_PI then
                    vanish(objects[pi_revelation_cards].takeObject())
                    vanish(objects[pi_revelation_cards].takeObject())
                    objects[pi_behaviour_deck].takeObject({
                        position = PI_card_location,
                        rotation = Vector(0,0,0)
                    })

                else
                    removePiObjects()
                end

                end,
            20)


        if ref_layout then
            layTilesOut()

        end
    Wait.frames(refillCardRow, 25)
    game_started = true
    end

end

function throw_away(object, is_devotee_deck_card)
    if is_devotee_deck_card then
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

function checkZoneEmpty(zone_obj)
    is_empty = true
        for _, occupyingObject in ipairs(zone_obj.getObjects(true)) do
            if occupyingObject.hasTag(card_zone_tag) then
                is_empty = false
            end

        end
    return is_empty
end

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


--  event functions

function onLoad()

    --todo: make a "start_game" button when everyone is in

    Turns.enable = true
    Turns.type = 2
    Turns.order = {"Purple", "Green", "Red", "Blue", "Brown"}

    ref_hand = true
    ref_layout = true
    with_PI = false

    game_started = false


    for ref, guid in pairs(object_ids) do
        key = ref
        objects[key] = getObjectFromGUID(guid)  -- returns nil if no bobject
    end

    toggleLights(objects[deal_rand_hand_light], objects[deal_sugg_hand_light])
    toggleLights(objects[use_custom_layout_light], objects[use_std_layout_light])
    toggleLights(objects[with_pi_light], objects[no_pi_light])

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
        function_owner = nil,  position={0,0.45,0}, height=730, width=730, color = {0,0,0,0}
    })
    end

end

function onPlayerTurn(player,  previous_player)
    if Turns.turn_color == brown then
        if not with_PI then
            Turns.turn_color = Turns.getNextTurnColor()
        else print("Resolve PI actions")
        end
    end
end

function onObjectDrop(player_color,  object)
    if game_started then
        -- handle devotee deck cards
        if object.hasTag(devotee_deck_card_tag) then

            -- return to location if not dropped in a valid card zone
            in_card_zone = false  -- will determine if gets sent to origin or not
            pos = object.pick_up_position
            rot = object.pick_up_rotation
            zone_objs = object.getZones()

            -- check if the card has been dropped into any valid card zone
            for _, zone_obj in pairs(zone_objs) do
                -- if the card zone is a bin, drop it and send to the discard pile
                if zone_obj.hasTag(is_bin_tag) then
                    in_card_zone = true  -- do not send back to original location
                    throw_away(object, true)
                    break

                --if the card zone is part of the card row, do not drop if the spot is already occupied
                elseif zone_obj.hasTag(card_row_tag) then
                    if not checkZoneEmpty(zone_obj) then
                        in_card_zone = false  -- send back to original location
                        break
                    end

                -- handle normal card zones
                elseif zone_obj.hasTag(card_zone_tag) then
                    in_card_zone = true  --do not send back to original location
                    break
                end


            end

            if not in_card_zone then
                object.setRotation(rot)
                object.setPositionSmooth(pos)
            end

            -- if any devotee card has moved, check to see if the card row needs refilling
            Wait.frames(refillCardRow, 25)

        -- hand movement of non devotee-deck objects
        elseif object.hasTag(binnable_tag) then
            zone_objs = object.getZones()
            for _, zone_obj in pairs(zone_objs) do
                if zone_obj.hasTag(is_bin_tag) then
                    throw_away(object, false)
                end
            end
        end

    end

end
