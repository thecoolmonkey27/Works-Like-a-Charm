Hand = Object.extend(Object)

loadCards()

function Hand:new()
    self.Table = {}
    for i=1,4 do
        table.insert(self.Table, Cards[math.random(1, #Cards)])
    end
    self.selectedCard = self.Table[1]
end

function Hand:update(dt)

end 

function Hand:draw(b)
    for k,v in pairs(self.Table) do
        v.draw(v, 128 + 138*(k), love.graphics.getHeight()-150)
    end
end