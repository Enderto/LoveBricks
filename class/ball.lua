require "../lib/class"

Ball = class()
    function Ball:init(x,y,r)
        self.x = x
        self.y = y
        self.r = r --radius
        self.centerx = x
        self.centery = y
        self.vspeed = {x=5,y=5}
    end
    function Ball:draw()
        love.graphics.circle("fill", self.x, self.y, self.r)
    end

    function Ball:update()
        print(self.vspeed.y)
        self.x = self.x + self.vspeed.x
        self.y = self.y + self.vspeed.y

        if(self.vspeed.x > 6)then
            self.vspeed.x = 6
        end
        if(self.vspeed.y > 6)then
            self.vspeed.y = 6
        end
        
        self:bounce()
    end

    function Ball:bounce()
        if ((self.x >= (1200 - self.r)) or (self.x <= self.r)) then self.vspeed.x = -(self.vspeed.x) end
        if ((self.y >= (720 - self.r)) or (self.y <= self.r)) then self.vspeed.y = -(self.vspeed.y) end

    end