require "lib/class"
require "class/brick"

function love.load()
    cursor = love.graphics.newImage("img/cursor.png") 

    love.mouse.setVisible(false)
    wall=  {
        {0,1,1,0,2,1,0,2,1,2,1},
        {1,0,0,2,0,2,0,2,2,1,0}
    };
    SIZE = table.maxn(wall[1]);
    brickList = {{},{}}
--marche pas pour y agandisement car insert fait pour 2 y
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
    

    mx, my = love.mouse.getPosition( )
    p.x = mx-120
end

function love.draw()
    love.graphics.print("bob",100)
    
    for k=1,2 do
        for l=1,SIZE do
            local b = brickList[k][l]
            --b:draw()
            if(b ~= nil) then
                b:draw()
            end

        end
    end

    love.graphics.rectangle( "fill", p.x, p.y, 240, 40)
    love.graphics.draw(cursor, mx, my,0, 0.05, 0.05)
end


