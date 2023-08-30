--[[MARCIN:
powerup class]]

Powerup = Class{}

function Powerup:init(kind)
    self.width = 16
    self.height = 16
    self.x = math.random(10, VIRTUAL_WIDTH-10)
    self.y = -20
    self.kind = kind
end

function Powerup:update(dt)
    self.y = self.y + 40 * dt
end

function Powerup:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.kind], self.x, self.y)
end