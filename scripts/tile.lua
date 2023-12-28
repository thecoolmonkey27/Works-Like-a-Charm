Tile = Object.extend(Object)
colors = {
    {232/255, 78/255, 64/255},
    {43/255, 175/255, 43/255},
    {86/255, 119/255, 252/255},
    {255/255, 235/255, 59/255},
    {171/255, 71/255, 188/255},
}
function Tile.new(self)
    self.x = 0
    self.y = 0
    self.colorKey = math.random(1,#colors)
    self.ownership = true 
end

function Tile.update(self, Board, dt)

end 

function Tile.draw(self)
    
end
