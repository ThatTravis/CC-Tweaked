-- transmit data from turtle data(x, y, z, fuel)

modem = peripheral.wrap("left")

data = {}
data.x, data.y, data.z = gps.locate()
data.fuel = turtle.getFuelLevel()

modem.transmit(0,1,data)

