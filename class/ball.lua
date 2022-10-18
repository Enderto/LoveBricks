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
    function Ball:colision(tablecol) --colision with bricks
        --the colision is cut in 3 part to better manage bounce
        for i=1,2 do
            for j=1,SIZE do
                --colision left
                if(not(tablecol[i][j] == nil)) then
                    if(((self.x+self.vspeed.x)+self.r>=tablecol[i][j].x and (self.x+self.vspeed.x)+self.r<=(tablecol[i][j].x)) and
                     ((self.y+self.vspeed.y)+self.r>=tablecol[i][j].y-1 and ((self.y+self.vspeed.y)+self.r<=(tablecol[i][j].y)+31)))then
                        self:bounce(1)
                        tablecol[i][j]=nil
                    end
                end
                --colision right
                if(not(tablecol[i][j] == nil)) then
                    if(((self.x+self.vspeed.x)+self.r>=tablecol[i][j].x+50 and (self.x+self.vspeed.x)+self.r<=(tablecol[i][j].x)+60) and
                     ((self.y+self.vspeed.y)+self.r>=tablecol[i][j].y-1 and ((self.y+self.vspeed.y)+self.r<=(tablecol[i][j].y)+31)))then
                        self:bounce(1)
                        tablecol[i][j]=nil
                    end
                end
                --colision center
                if(not(tablecol[i][j] == nil)) then
                    if(((self.x+self.vspeed.x)+self.r>=tablecol[i][j].x and (self.x+self.vspeed.x)+self.r<=(tablecol[i][j].x)+60) and
                     ((self.y+self.vspeed.y)+self.r>=tablecol[i][j].y-1 and ((self.y+self.vspeed.y)+self.r<=(tablecol[i][j].y)+31)))then
                        self:bounce(2)
                        tablecol[i][j]=nil
                    end
                end
            end
        end
    end

    function Ball:colisionBody(body,maxX,maxY) --colision with a rectangle other thant brick (for exemple the player)
        --the colision is cut in 3 part to better manage bounce
        if(((self.x+self.vspeed.x)+self.r>=body.x and (self.x+self.vspeed.x)+self.r<=(body.x)+1) and
            ((self.y+self.vspeed.y)+self.r>=body.y and (self.y+self.vspeed.y)+self.r<=(body.y)+maxY))then
            self:bounce(1)
        end
    --colision right
        if(((self.x+self.vspeed.x)+self.r>=body.x+maxX-10 and (self.x+self.vspeed.x)+self.r<=(body.x)+maxX+1) and
            ((self.y+self.vspeed.y)+self.r>=body.y and ((self.y+self.vspeed.y)+self.r<=(body.y)+maxY)))then
            self:bounce(1)
        end
    --colision center
        if(((self.x+self.vspeed.x)+self.r>=body.x and (self.x+self.vspeed.x)+self.r<=(body.x)+maxX+1) and
            ((self.y+self.vspeed.y)+self.r>=body.y and ((self.y+self.vspeed.y)+self.r<=(body.y)+maxY)))then
            self:bounce(2)
        end
    end