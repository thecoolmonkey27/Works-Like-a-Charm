function love.load()
    -- Libraries
    require 'math'
    Object = require 'libraries/classic'

    -- Scripts
    require 'scripts/tile'
    require 'scripts/board'
    require 'scripts/player'
    require 'scripts/card'
    require 'scripts/hand'

    board = Board()
    player = Player(board)
    hand = Hand()

    player.x = player.x - 11
    player.y = player.y - 5
end

function love.update(dt)
    math.randomseed(love.timer.getTime())
    mx, my = love.mouse.getPosition()
    board:update(dt)
    player:update(dt)
    hand:update(dt)
end

function love.draw()
    
    board:draw()
    print('Drew Player')
    love.graphics.setLineWidth(6)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle('line', board.x + board.pixelWidth * (player.x-1), board.y + board.pixelWidth * (player.y-1), board.pixelWidth, board.pixelWidth)
    hand:draw()
    hand.selectedCard:drawPreview(player, board)
    love.graphics.print(tostring(mx)..'   '..tostring(my))
    love.graphics.print(tostring(love.mouse.isDown(1)), 0, 50)
end

function love.mousepressed(x, y, button, istouch, presses)
    print('Removed Tiles')
    board.removeTiles(board, player, hand.selectedCard)
end

function love.keypressed(key, scancode, isrepeat)

end