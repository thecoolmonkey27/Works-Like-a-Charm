Card = Object.extend(Object)

function Card.new(self, Move)
    self.Move = Move
    self.width = 128
    self.height = 128
    self.W = 20
end

function Card.update(self, dt)

end 

function Card.draw(self, x, y)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle('fill', x, y, self.width, self.height, 10, 10)
    love.graphics.setColor(0, 0, 1, 1)
    local rx, ry = 0, 0
    local cx, cy = x + self.width/2 - self.W/2, y+self.height/2-self.W/2
    love.graphics.rectangle('fill', cx, cy, self.W, self.W, 3, 3)
    for k,v in pairs(self.Move) do
        rx, ry = rx + v.x, ry + v.y
        love.graphics.rectangle('fill', cx + rx*self.W, cy+ry*self.W, self.W, self.W, 3, 3)
    end
end

function Card:drawPreview(p, b)
    local px = (b.x + (p.x-1)*b.pixelWidth)+b.pixelWidth/2
    local py = (b.y + (p.y-1)*b.pixelWidth)+b.pixelWidth/2
    direction = 'h'
    dx = mx-px
    dy = my-py
    local cx = 1
    local cy = 1
    if math.abs(dx) > math.abs(dy) then
        if dx > 0 then
            direction = 'right'
            cx = -1
            cy = 1
        else
            direction = 'left'
            cx = 1
            cy = -1
        end
    elseif math.abs(dy) > math.abs(dx) then
        if dy > 0 then
            direction = 'below'
            cx = -1
            cy = -1
        else
            direction = 'above'
            cx = 1
            cy = 1
        end
    else
        direction = 'above'
    end
    local x = p.x-1
    local y = p.y-1
    for k,v in pairs(self.Move) do
        
        if direction == 'above' or direction == 'below' then
            x = x + v.x*cx
            y = y + v.y*cy
        else
            x = x + v.y*cx
            y = y + v.x*cy
        end
        if x+1 > 0 and x < 14 and y+1 > 0 and y < 8 then
            love.graphics.setColor(129/255, 212/255, 250/255, 1)
            love.graphics.rectangle('line', b.x + b.pixelWidth * (x), b.y + b.pixelWidth * (y), b.pixelWidth, b.pixelWidth)
        end
    end
end

--[[{
    {x = 0, y = -1}
    {x = 0, y = -1}
    {x = 0, y = -1}
    {x = 1, y = 0}
}
--]]

function loadCards()
    Cards = {}
    table.insert(Cards, Card(
        {
            {x = 0, y = -1},
            {x = 0, y = -1},
            {x = 1, y = 0},
        }
    ))
    table.insert(Cards, Card(
        {
            {x = 1, y = -1},
            {x = -1, y = -1},
            {x = 1, y = -1},
        }
    ))
    table.insert(Cards, Card(
        {
            {x = 1, y = -1},
            {x = 0, y = -1},
            {x = -1, y = -1},
        }
    ))
    table.insert(Cards, Card(
        {
            {x = 0, y = -1},
            {x = -1, y = -1},
            {x = 0, y = -1},
        }
    ))
end