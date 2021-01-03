-- Script running on the wireless mining turtle

modem = peripheral.wrap("left")
startX, startY, startZ = gps.locate()
direction = ""
size = 0
mode = 1
transCount = math.floor((startY-2)/3)



function switchTurn()
-- changes the turn direction alternately
    if turn == "left" then 
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
        turtle.digUp()
        turtle.digDown()

    elseif turn == "right" then 
        turtle.turnRight()
        turtle.dig()
        turtle.digUp()
        turtle.digDown()
        turtle.forward()
        turtle.turnRight()
        turtle.digUp()
        turtle.digDown()
    end

    if turn == "left" then turn = "right" else turn = "left" end
end

function dropAndRefuel ()
-- dropoff items and refuel turtle
-- requires ender chest in slot 15 for dumping and slot 16 for refueling

    -- dump items 
    turtle.back()
    turtle.select(15) -- syntax? turtle.select 15
    turtle.place()

    for i = 1,14 do
        turtle.select(i)
        turtle.drop()
    end

    turtle.select(15)
    turtle.dig()

    --refuel
    turtle.select(16)
    turtle.place()
    turtle.select(1)
    turtle.suck()
    turtle.refuel()
    turtle.select(16)
    turtle.dig()

    turtle.select(1)
    turtle.forward()
end

function layerTransition()
-- go to next layer

    for i = 1,3 do 
        turtle.down()
        turtle.digDown() 
    end
    if mode == 1 then turn = "left" end
    if mode == 2 then turn = "right" end
end

function partTransition(count)
-- go down last partial layer
    for i = 1,count do turtle.digDown() end
end

function getDirection()
-- returns direction of the turtle as string
    local success, blockData = turtle.inspect()
    if not success then
        turtle.dig()
    end

    turtle.forward()
    posX, posY, posZ = gps.locate()
    if posX-startX ==  1 then direction = "west" end  -- +X
    if posX-startX == -1 then direction = "east" end  -- -X
    if posZ-startZ ==  1 then direction = "south" end -- +Z
    if posZ-startZ == -1 then direction = "north" end -- -Z
    turtle.back()

    return direction
end

function returnOrigin()
--return to origin x,z at current layer
    
    if size % 2 == 0 then
        if mode == 1 then turtle.turnLeft() else turtle.turnRight() end
        i = 1
        while i < size do 
            turtle.forward()
            i = i + 1
        end
        if mode == 1 then turtle.turnLeft() else turtle.turnRight() end
    else
        if mode == 1 then turtle.turnRight() else turtle.turnLeft() end
        i = 1
        while i < size do 
            turtle.forward()
            i = i + 1
        end
        if mode == 1 then turtle.turnRight() else turtle.turnLeft() end
        i = 1
        while i < size do 
            turtle.forward()
            i = i + 1
        end
        turtle.turnRight()
        turtle.turnRight()
    end
end

function returnY()
    for i = 2,startY do
        turtle.Up()
    end
end


function excavate()
-- mining Script for Turtle
-- saves starting location and takes x,y,z coordinates
-- mines a cube from starting pos to x,y,z as furthest corner

    print("I am at "..startX.." "..startY.." "..startZ)

    --choose size and direction of area
    print("Please enter the size of the excavation area: ")
    size = tonumber(read())
    print("1 = left, 2 = right ")
    mode = tonumber(read())
    if mode == 1 then turn = "left" end
    if mode == 2 then turn = "right" end
    print(turn)

    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()

    print("Layers to mine: "..transCount)

    for i = 1,transCount do
        mineLayer()
        layerTransition()
    end
    
    if (startZ-(math.floor((startY-2)/3))*3) == 1 then
        partTransition(1)
        mineLayer()
        returnY()
    elseif (startZ-(math.floor((startY-2)/3))*3) == 2 then
        partTransition(2)
        mineLayer()
        returnY()
    end

end

function mine()
--single mining operation + drop check
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    
    -- if inventory full or fuel below 25% then dump and refuel
    if turtle.getItemDetail(12) ~= nil or turtle.getFuelLevel()/turtle.getFuelLimit() < 0.25 then
        dropAndRefuel()
    end
end

function mineStrip()
-- mines strip of size-1 blocks
    for i = 1,size-1 do
        mine()
    end
end

function mineLayer()
-- mines a square area
    for i = 1,size do
        mineStrip()
        if i < size then switchTurn() end
    end
    returnOrigin()
end









excavate()


--[[
function transmitData()
    -- transmit data from turtle data(x, y, z, fuel)
        data = {}
        data.x, data.y, data.z = gps.locate()
        data.fuel = turtle.getFuelLevel()
    
        modem.transmit(0,1,data)
    end
]]