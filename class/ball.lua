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
        self.x = self.x + self.vspeed.x
        self.y = self.y + self.vspeed.y

        if(self.vspeed.x > 6)then
            self.vspeed.x = 6
        end
        if(self.vspeed.y > 6)then
            self.vspeed.y = 6
        end
        
        self:bouncewall()
    end

    function Ball:bouncewall()
        if ((self.x >= (1200 - self.r)) or (self.x <= self.r)) then self.vspeed.x = -(self.vspeed.x) end
        if ((self.y >= (720 - self.r)) or (self.y <= self.r)) then self.vspeed.y = -(self.vspeed.y) end

    end
    function Ball:bounce(side)
        if(side == 2) then--up and down
            self.vspeed.y = -(self.vspeed.y)
        end
        if(side == 1)then --right and left
            self.vspeed.x = -(self.vspeed.x)
        end
    end
    function Ball:colision(tablecol)
        for i=1,2 do
            for j=1,SIZE do
                if(not(tablecol[i][j] == nil)) then
                    if((self.x+self.r>tablecol[i][j].x and self.x+self.r<(tablecol[i][j].x)+60) and (self.y+self.r>tablecol[i][j].y and self.y+self.r<(tablecol[i][j].y)+30))then
                        self:bounce(1)
                        tablecol[i][j]=nil
                    end
                end
                if(not(tablecol[i][j] == nil)) then
                    if((self.x+self.r>tablecol[i][j].x+10 and self.x+self.r<(tablecol[i][j].x)+40) and (self.y+self.r>tablecol[i][j].y and self.y+self.r<(tablecol[i][j].y)+30))then
                        self:bounce(2)
                        tablecol[i][j]=nil
                    end
                end
            end
        end
    end