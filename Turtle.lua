-- Script running on the wireless mining turtle

function dropAndRefuel ()
-- dropoff items and refuel turtle
-- requires ender chest in slot 15 for dumping and slot 16 for refueling

    -- dump items 
    turtle.select(15) -- syntax? turtle.select 15
    turtle.place()

    for i = 1,14 do
        turtle.select(i)
        turtle.drop()
    end

    turtle.select(15)
    turtle.dig()
    turtle.select(1)

    --refuel
    turtle.select(16)
    turtle.place()
    turtle.suck()
    turtle.refuel()
    turtle.dig()

    turtle.select(1)
end

function transmitData()
-- transmit data from turtle data(x, y, z, fuel)
    modem = peripheral.wrap("left")

    data = {}
    data.x, data.y, data.z = gps.locate()
    data.fuel = turtle.getFuelLevel()

    modem.transmit(0,1,data)
end

function mine(mode)
-- mining Script for Turtle
-- saves starting location and takes x,y,z coordinates
-- mines a cube from starting pos to x,y,z as furthest corner

    -- get position
    start = {}
    start.x, start.y, start.z = gps.loacate()

    -- get direction turtle is facing (must be air)
    local success, blockData = turtle.inspect()
    if not success then
        turtle.dig()
    end

    turtle.forward()
    pos.x, pos.y, pos.z = gps.locate()
    if dir.x-start.x ==  1 then direction = "west" end  -- +X
    if dir.x-start.x == -1 then direction = "east" end  -- -X
    if dir.z-start.z ==  1 then direction = "south" end -- +Z
    if dir.z-start.z == -1 then direction = "north" end -- -Z

    do
        mode = {
        1 = mineExcavate()
        2 = mineArea()
    }
    
end

function mineExcavate()
-- Excavate mode for mine function

    print("Please enter the size of the excavation area: ")
    size = read()
    print("1 = left, 2 = right ")
    mode = read()
    if mode == 1 then turn = "left" end
    if mode == 2 then turn = "right" end
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()

    while pos.y > 3 do

        for i = 1,size do -- mine a layer

            for j = 1,size-1 do -- mine a strip
                turtle.digUp()
                turtle.dig()
                turtle.digDown()
                
                -- if inventory full or fuel below 25% then dump and refuel
                if turtle.getItemDetail(12) ~= nil or turtle.getFuelLevel/turtle.getFuelLimit < 0.25 then
                    dropAndRefuel()
                end

                turtle.forward()
            end
            
            if i < size then
                -- turn the turtle for a new strip
                if turn == "left" then 
                    turtle.turnLeft()
                    turtle.dig()
                    turtle.digUp()
                    turtle.digDown()
                    turtle.forward()
                    turtle.turnLeft()
                    turtle.digUp()
                    turtle.digDown()
                end
                if turn == "right" then 
                    turtle.turnRight()
                    turtle.dig()
                    turtle.digUp()
                    turtle.digDown()
                    turtle.forward()
                    turtle.turnRight()
                    turtle.digUp()
                    turtle.digDown()
                end
                switchTurn()
            elseif i == size then

            end
            -- go back to start x,z
        end

            -- TODO!!! transition between layers
            -- go down 2 if possible else 1

    end






end

function mineArea()
-- mine a specific area
end

function switchTurn()
    if turn == "left" then turn = "right" end
    if turn == "right" then turn = "left" end
end


