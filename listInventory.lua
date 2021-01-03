chest = peripheral.wrap("left")
term.clear()
print("Slots: "..chest.size())
print()
sleep(1)
 
for i = 1,chest.size() do
    if chest.getItemDetail(i) ~= nil then
        local slot = chest.getItemDetail(i)
        name = slot.name
        for w in string.gmatch(name, "(:[^:]*)") do 
            w = string.gsub(w,":","")
            w = string.gsub(w,"_"," ")
            print(slot.count.." "..w) 
 
                    
        end        
    end
end