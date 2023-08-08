function love.load()
    x = 100
end

local y = 0
function love.draw()
    love.graphics.print("Olá Mundo", x, y)
end

function love.update(dt)
    y = (y+1)%500
end