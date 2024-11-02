





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
                        for _, j in pairs(pi_objects) do
                            objects[j].attachInvisibleHider("hide", false)
                    
                        end

                        vanish(objects[pi_revelation_cards].takeObject())
                        vanish(objects[pi_revelation_cards].takeObject())
                        objects[pi_behaviour_deck].takeObject({
                            position = PI_card_location,
                            rotation = Vector(0, 0, 0)
                        })
 
                    else
                        for _, obj in pairs(pi_objects) do
                            vanish(objects[obj])
                        end
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
       [1] = player_ref_card_A,
       [2] = player_ref_card_B,
       [3] = player_ref_card_C,
       [4] = player_ref_card_D
   }) do
       if ref_card_player_map[card] ~= ' ' then
           starting_player = ref_card_player_map[card]
           break
       end
   end

   if starting_player ~= ' ' then
       Turns.turn_color = starting_player
   end
   print("starting player is " .. Turns.turn_color)
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

   for i = 1, 5 do
       for _, player in ipairs(players) do
           devotee_deck_obj.deal(1, player)
       end
   end

end
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


