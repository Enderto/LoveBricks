require "lib/class"
require "class/brick"
require "class/ball"

function love.load()
    --mouse
    cursor = love.graphics.newImage("img/cursor.png") 
    love.mouse.setVisible(false)

    --table with brick organisation
    wall=  {
        {1,1,1,0,2,1,0,2,1,2,1,1,1,1,1},
        {1,0,0,2,0,2,0,2,2,1,0,1,1,1,1}
    };
    --size of the line
    SIZE = #wall[1];
    brickList = {{},{}}

    ballList = {}
--marche pas pour y agandisement car insert fait pour 2 y
	for i=1,2 do
        for j=1,SIZE do
            if(wall[i][j]>0)
            then
                if(wall[i][j]==1)
                then
                    table.insert(brickList[i],j,Rect((70*j),50*(i+1%5)))
                end
                if(wall[i][j]==2)
                then
                    table.insert(brickList[i],j,Rect((70*j),50*(i+1%5)))
                end
            end
        end
    end
    
    p={x=10,y=600} -- pad player

    r = Rect(100 ,100)
    b = Ball(100,100,10)
    test = 0

    for u=1,2 do
        table.insert(ballList,Ball(100,100*(u+1%5),10))
    end
end

function love.update()
    
    mx, my = love.mouse.getPosition( )
    p.x = mx-120
    b:update()
    
    b:colision(brickList)

    b:colisionBody(p,240,40)

    
    
    for k,v in pairs(ballList) do
        v:update()
        v:colision(brickList)
        v:colisionBody(p,240,40)
    end

    --debug = brickList[1][1].x
end
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
    if key == "a" then
        brickList[1][1] = nil
    end
     
 end

function love.draw()
    love.graphics.print(test,0)
    
    for k=1,2 do
        for l=1,SIZE do
            local b = brickList[k][l]
            --b:draw()
            if(b ~= nil) then
                b:draw()
            end
        end
    end
    b:draw()
    for k,v in pairs(ballList) do
        v:draw()
    end
    love.graphics.rectangle( "fill", p.x, p.y, 240, 40)
    love.graphics.draw(cursor, mx, my,0, 0.05, 0.05)

    
end


