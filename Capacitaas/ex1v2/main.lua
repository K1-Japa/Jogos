function love.load()
    local set = love.window.setMode(600,600)
end

local quadx, quady = 50, 50
local speed = 0

function love.update(dt)
    if speed < 1 then
        quadx = lerp(50, 525, speed)
        quady = lerp(50, 50, speed)
    elseif speed < 2 then
        quadx = lerp(525, 275, speed-1)
        quady = lerp(50, 275, speed-1)
    else
        quadx = lerp(275, 50, speed-2)
        quady = lerp(275, 50, speed-2)
    end 
    speed = (speed + dt)%3
end

function lerp(a, b, t)
    return a + t * (b - a)
end

function love.draw()
    love.graphics.rectangle("fill", quadx, quady, 50, 50)
end