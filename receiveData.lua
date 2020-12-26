modem = peripheral.wrap("top")
monitor = peripheral.wrap("back")

modem.open(0)
monitor.clear()

while(true) do

    event, modemSide, senderChannel, replyChannel, data, senderDistance = os.pullEvent("modem_message")

    x, y, z, fuel = data


    monitor.setCursorPos(1,1)
    monitor.write("X: "..x)

    monitor.setCursorPos(1,2)
    monitor.write("Y: "..y)

    monitor.setCursorPos(1,3)
    monitor.write("Z: "..z)

end
