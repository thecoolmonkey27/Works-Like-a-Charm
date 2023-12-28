Player = Object.extend(Object)

function Player:new(b)
    self.x = math.random(1, b.tileWidth)
    self.y = math.random(1, b.tileHeight)
end

function Player:update(dt)

end 

function Player:draw()
    print('Drew Player')
    love.graphics.setLineWidth(6)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle('line', board.x + board.pixelWidth * (self.x-1), board.y + board.pixelWidth * (self.y-1), board.pixelWidth, board.pixelWidth)
end