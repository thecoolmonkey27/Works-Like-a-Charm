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
    board.update(board, dt)
    
end

function love.draw()
    board.draw(board)
    player.draw(player, board)
    hand.draw(hand)
    hand.selectedCard.drawPreview(hand.selectedCard, player, board)
end

function love.mousepressed(x, y, button, istouch, presses)
    board.removeTiles(board, player, hand.selectedCard)
end