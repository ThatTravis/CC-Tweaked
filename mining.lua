-- mining Script for Turtle
-- saves starting location and takes x,y,z coordinates
-- mines a cube from starting pos to x,y,z as furthest corner

modem = peripheral.wrap("left")

startX, startY, startZ = gps.loacate()
