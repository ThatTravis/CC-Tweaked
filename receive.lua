modem = peripheral.wrap("top")
monitor = peripheral.wrap("back")

modem.open(0)
monitor.clear()

while(true) do

    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")

    monitor.setCursorPos(1,1)
    monitor.write("X: "..message.x)

    monitor.setCursorPos(1,2)
    monitor.write("Y: "..message.y)

    monitor.setCursorPos(1,3)
    monitor.write("Z: "..message.z)

end
