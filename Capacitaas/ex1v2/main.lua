function love.load()
    local set = love.window.setMode(600,600)
end

local verticesquad = {50,50,100,50,100,100,50,100}
local speed = 0.1

function love.update(dt)
    if speed < 1 then
        verticesquad[1] = lerp(verticesquad[1], 500, speed)
        verticesquad[3] = lerp(verticesquad[3], 550, speed)
        verticesquad[5] = lerp(verticesquad[5], 550, speed)
        verticesquad[7] = lerp(verticesquad[7], 500, speed)
        speed = speed + 0.1
    elseif speed < 2 then
        verticesquad[1] = lerp(verticesquad[1], 275, speed)
        verticesquad[2] = lerp(verticesquad[2], 275, speed)
        verticesquad[3] = lerp(verticesquad[3], 325, speed)
        verticesquad[4] = lerp(verticesquad[4], 275, speed)
        verticesquad[5] = lerp(verticesquad[5], 325, speed)
        verticesquad[6] = lerp(verticesquad[6], 325, speed)
        verticesquad[7] = lerp(verticesquad[7], 275, speed)
        verticesquad[8] = lerp(verticesquad[8], 325, speed)
        speed = speed + 0.1
    elseif speed < 3 then
        verticesquad[1] = lerp(verticesquad[1], 50, speed)
        verticesquad[2] = lerp(verticesquad[2], 50, speed)
        verticesquad[3] = lerp(verticesquad[3], 100, speed)
        verticesquad[4] = lerp(verticesquad[4], 50, speed)
        verticesquad[5] = lerp(verticesquad[5], 100, speed)
        verticesquad[6] = lerp(verticesquad[6], 100, speed)
        verticesquad[7] = lerp(verticesquad[7], 50, speed)
        verticesquad[8] = lerp(verticesquad[8], 100, speed)
        speed = speed + 0.1
    else
        speed = 0
    end 
end

function lerp(a, b, t)
    return a + (b-a) * 0.5 * t
end

function love.draw()
    love.graphics.polygon("fill", verticesquad)
end