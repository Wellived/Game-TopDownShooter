PlayerClass = Class()

currentTime = 0

function PlayerClass:init(screen_w, screen_h)
    motion = SearchAnimation()

    self.x = screen_w/2 - motion.idle[1].getWidth(motion.idle[1])
    self.y = screen_h/2- motion.idle[1].getHeight(motion.idle[1])
    self.sprite = motion.idle[1]
    

    gun = {
        image = love.graphics.newImage('guns/r1.png'),
        x = self.x+(self.sprite.getWidth(self.sprite)/2),
        y = self.y+(self.sprite:getHeight())*1.05,
        
        rotate = 0
    }

    gun.w , gun.h = gun.image:getDimensions()
end

function PlayerClass:update(dt)
    self:Animation(motion, dt)
    rotateGun()
end

function PlayerClass:draw()
    self.w, self.h = self.sprite:getDimensions()
    

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(self.sprite, self.x, self.y, 0, 1.5, 1.5, self.w/2, self.h/2)
    love.graphics.setColor(0,1,0,1)
    love.graphics.draw(gun.image, gun.x, gun.y, gun.rotate, 0.8, 1, gun.w/2, gun.h/2)
end

function rotateGun()
    local mx,my = love.mouse.getPosition()
    gun.rotate = math.atan2(
        my - gun.y,
        mx - gun.x
    )
end

function PlayerClass:Animation(motion, dt)
    if love.keyboard.isDown( "w" ) or love.keyboard.isDown( "a" ) or love.keyboard.isDown( "s" ) or love.keyboard.isDown( "d" )then
        currentTime = currentTime + dt
        if currentTime >= motion.walkDuration then
            currentTime = currentTime - motion.walkDuration
            motion.walkFrame = motion.walkFrame+1
            if(motion.walkFrame > #motion.idle)then
                motion.walkFrame = 1
            end
            self.sprite = motion.walk[motion.walkFrame]
        end
    else
        currentTime = currentTime + dt
        if currentTime >= motion.idleDuration then
            currentTime = currentTime - motion.idleDuration
            motion.idleFrame = motion.idleFrame+1
            if(motion.idleFrame > #motion.idle)then
                motion.idleFrame = 1
            end
            self.sprite = motion.idle[motion.idleFrame]
        end
    end
end

--//////////////////////////////////////Animation

function SearchAnimation()
    local animation = {
        idle = IdleAnimation(),
        idleDuration = 0.1,
        idleFrame = 0,
        walk = WalkAnimation(),
        walkDuration = 0.08,
        walkFrame = 0,
    }

    return animation
end

function IdleAnimation()
    local animation = {
        love.graphics.newImage('char1/idle_0.png'),
        love.graphics.newImage('char1/idle_1.png'),
        love.graphics.newImage('char1/idle_2.png'),
        love.graphics.newImage('char1/idle_3.png'),
        love.graphics.newImage('char1/idle_4.png'),
        love.graphics.newImage('char1/idle_5.png')
    }
    return animation
end

function WalkAnimation()
    local animation = {
        love.graphics.newImage('char1/walk_0.png'),
        love.graphics.newImage('char1/walk_1.png'),
        love.graphics.newImage('char1/walk_2.png'),
        love.graphics.newImage('char1/walk_3.png'),
        love.graphics.newImage('char1/walk_4.png'),
        love.graphics.newImage('char1/walk_5.png'),
        love.graphics.newImage('char1/walk_6.png'),
        love.graphics.newImage('char1/walk_7.png')
    }
    return animation
end
