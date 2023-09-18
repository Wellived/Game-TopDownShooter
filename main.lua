--Top Down Shooter

Class = require 'class'
require 'player'

function love.load()
    width, height = love.window.getMode()
    love.graphics.setDefaultFilter('nearest','nearest')

    p = PlayerClass(width, height)
end

function love.update(dt)
    p:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor( 1, 1, 1, 1)
    p:draw()
end