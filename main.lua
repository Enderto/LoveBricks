require "lib/class"


function love.load()
    SIZE = 10;
    Dog = class()
    function Dog:bark()
        love.graphics.print "woof!"
    end
    function Dog:pbark()
        print("bark")
    end

    Rect = class()
    function Rect:init(x,y)
        self.x = x
        self.y = y
    end
    function Rect:draw()
        love.graphics.rectangle( "fill", self.x+10, self.y, 60, 30)
    end

    wall=  {
        {0,1,1,0,2,1,0,2,1,2},
        {1,0,0,2,0,2,0,2,2,1}
    };

    brickList = {{},{}}

	for i=1,2 do
        for j=1,SIZE do
            if(wall[i][j]>0)
            then
                if(wall[i][j]==1)
                then
                    table.insert(brickList[i],j,Rect((70*j),50*(i+1%10)))
                end
                if(wall[i][j]==2)
                then
                    table.insert(brickList[i],j,Rect((70*j),50*(i+1%10)))
                end
            end
        end
    end
    
    p={x=10,y=600}

    r = Rect(100 ,100)
    
end

function love.update()
    d = Dog()
    

    mx, my = love.mouse.getPosition( )
    p.x = mx-120
end

function love.draw()
    d:bark()
    love.graphics.print("bob",100)
    
    for k=1,2 do
        for l=1,10 do
            local b = brickList[k][l]
            --b:draw()
            if(b ~= nil) then
                b:draw()
            end

        end
    end

    love.graphics.rectangle( "fill", p.x, p.y, 240, 40)

end


