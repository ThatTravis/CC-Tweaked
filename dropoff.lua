-- dropoff items, call after blackspace is mined

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



