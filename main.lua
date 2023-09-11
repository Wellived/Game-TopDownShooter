--Top Down Shooter

Class = require 'class'
require 'player'

function love.load()
    width, height = love.window.getMode()
    love.graphics.setDefaultFilter('nearest','nearest')
    p = PlayerClass(width, height)
end

function love.update()
    p:update()
end

function love.draw()
    p:draw()
end
