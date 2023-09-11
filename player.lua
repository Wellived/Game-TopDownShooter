PlayerClass = Class()

function PlayerClass:init(screen_w, screen_h)
    playerAnimated = PlayerAnimation()
    --playerSprite = playerAnimated.idle[1]
    playerSprite = love.graphics.newImage('Pixel/FullBody/Char1/WithoutHands/idle_0.png')

    quad = love.graphics.newQuad( 750, 1100, (750+560), (1100+720), playerSprite )


    self.x = screen_w/2
    self.y = screen_h/2
    self.sprite = quad
end

function PlayerClass:update()

end

function PlayerClass:draw()
    love.graphics.setBackgroundColor( 1, 1, 1, 1)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.draw(self.sprite, 0, 0, 0, 0.1)
end

function IdleAnimation()
--    local animation = {}
--    animation.new('Pixel/FullBody/Char1/WithoutHands/idle_0.png')
    local animation = {
        love.graphics.newImage('Pixel/FullBody/Char1/WithoutHands/idle_0.png')
    }
    return animation
end

function PlayerAnimation()
    local animation = {
        idle = IdleAnimation()
    }
    return animation
end