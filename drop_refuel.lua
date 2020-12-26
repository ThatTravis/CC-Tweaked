-- dropoff items, call after blackspace is mined

-- place drop chest
turtle.select(15) -- syntax? turtle.select 15
turtle.place()

for i = 1,14 do
    turtle.select(i)
    turtle.drop()
end

-- get chest back
turtle.select(15)
turtle.dig()
turtle.select(1)

--place fuel chest, refuel, get chest back
turtle.select(16)
turtle.place()
turtle.suck()
turtle.refuel()
turtle.dig()
turtle.select(1)


