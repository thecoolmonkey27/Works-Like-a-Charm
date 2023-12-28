Board = Object.extend(Object)

function Board.new(self)
    direction = 'above'
    self.x = 220
    self.y = 50
    self.tileWidth = 14
    self.tileHeight = 8
    self.pixelWidth = 60
    self.Table = {}
    for h=1,self.tileHeight do
        table.insert(self.Table, {})
        for w=1,self.tileWidth do
            table.insert(self.Table[h], Tile(w, h))
        end
    end
end

function Board.update(self, dt)
   for int,val in ipairs(self.Table) do
        while #val < self.tileWidth do
            table.insert(val, Tile())
        end
    end
end

function Board.draw(self)
    for int,val in ipairs(self.Table) do
        for i,v in pairs(val) do
            if val[i].ownership == true then
            love.graphics.setColor(colors[v.colorKey])
            love.graphics.rectangle('fill', self.x + self.pixelWidth * (i-1), self.y + self.pixelWidth * (int-1), self.pixelWidth, self.pixelWidth)
            love.graphics.setLineWidth(4)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle('line', self.x + self.pixelWidth * (i-1), self.y + self.pixelWidth * (int-1), self.pixelWidth, self.pixelWidth)
            end
        end
    end
end

function Board.removeTiles(self, p, Card)
    local x = p.x-1
    local y = p.y-1
    
    if direction == 'right' then
        cx = -1
        cy = 1
        
    elseif direction == 'left' then
        cx = 1
        cy = -1
       
    elseif direction == 'below' then
        cx = -1
        cy = -1
        
    elseif direction == 'above' then
        cx = 1
        cy = 1
    end
        
    for k,v in pairs(Card.Move) do
        
        if direction == 'above' or direction == 'below' then
            x = x + v.x*cx
            y = y + v.y*cy
        else
            x = x + v.y*cx
            y = y + v.x*cy
        end
        if x+1 > 0 and x < 14 and y+1 > 0 and y < 8 then
            love.graphics.setColor(129/255, 212/255, 250/255, 1)
            table.remove(self.Table[y+1], x+1)
            p.x = x+1
            p.y = y+1
        end
    end
    print('Removed Tiles')
end
