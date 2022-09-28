require "../lib/class"

Rect = class()
    function Rect:init(x,y)
        self.x = x
        self.y = y
    end
    function Rect:draw()
        love.graphics.rectangle( "fill", self.x+10, self.y, 60, 30)
    end