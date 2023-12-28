Player = Object.extend(Object)

function Player.new(self, b)
    self.x = math.random(1, b.tileWidth)
    self.y = math.random(1, b.tileHeight)
end

function Player.update(self, dt)

end 

function Player.draw(self, b)
    love.graphics.setLineWidth(6)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle('line', b.x + b.pixelWidth * (self.x-1), b.y + b.pixelWidth * (self.y-1), b.pixelWidth, b.pixelWidth)
end