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

function mine()
-- mining Script for Turtle
-- saves starting location and takes x,y,z coordinates
-- mines a cube from starting pos to x,y,z as furthest corner

    modem = peripheral.wrap("left")

    start = {}
    start.x, start.x, start.z = gps.loacate()

    destination = {}
    print("Please enter your destination. X: ")
    destination.x = read()
    print("Please enter your destination. Y: ")
    destination.y = read()
    print("Please enter your destination. Z: ")
    destination.z = read()

    -- calc blocks to mine
    totalBlocks = (destination.x-start.x+1)*(destination.y-start.y+1)*(destination.z-start.z+1)

end
