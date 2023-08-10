function love.load()
    local set = love.window.setMode(600,600)
end

local quadx, quady = 50, 50
local speed = 0
local dotslines = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
local mode = 0

function love.update(dt)
    if speed < 1 then
        quadx = lerp(50, 525, speed)
        quady = lerp(50, 50, speed)
        if speed < 0.02 then
            if mode == 0 then
                dotslines[1] = 75
                dotslines[2] = 75
            else
                dotslines[1] = dotslines[3]
                dotslines[2] = dotslines[4]
            end
        end
        dotslines[3] = quadx + 25
        dotslines[4] = quady + 25
    elseif speed < 2 then
        quadx = lerp(525, 275, speed-1)
        quady = lerp(50, 275, speed-1)
        if speed < 1.02 then
            if mode == 0 then
                dotslines[5] = dotslines[3]
                dotslines[6] = dotslines[4]
            else
                dotslines[5] = dotslines[7]
                dotslines[6] = dotslines[8]
            end
        end
        dotslines[7] = quadx + 25
        dotslines[8] = quady + 25
    elseif speed < 3 then
        quadx = lerp(275, 525, speed-2)
        quady = lerp(275, 500, speed-2)
        if speed < 2.02 then
            if mode == 0 then
                dotslines[9] = dotslines[7]
                dotslines[10] = dotslines[8]
            else
                dotslines[9] = dotslines[11]
                dotslines[10] = dotslines[12]
            end
        end
        dotslines[11] = quadx + 25
        dotslines[12] = quady + 25
    elseif speed < 4 then
        quadx = lerp(525, 50, speed-3)
        quady = lerp(500, 500, speed-3)
        if speed < 3.02 then
            if mode == 0 then
                dotslines[13] = dotslines[11]
                dotslines[14] = dotslines[12]
            else
                dotslines[13] = dotslines[15]
                dotslines[14] = dotslines[16]
            end
        end
        dotslines[15] = quadx + 25
        dotslines[16] = quady + 25
    elseif speed < 5 then
        quadx = lerp(50, 275, speed-4)
        quady = lerp(500, 275, speed-4)
        if speed < 4.02 then
            if mode == 0 then
                dotslines[17] = dotslines[15]
                dotslines[18] = dotslines[16]
            else
                dotslines[17] = dotslines[19]
                dotslines[18] = dotslines[20]
            end
        end
        dotslines[19] = quadx + 25
        dotslines[20] = quady + 25
    else
        quadx = lerp(275, 50, speed-5)
        quady = lerp(275, 50, speed-5)
        if speed < 5.02 then
            if mode == 0 then
                dotslines[21] = dotslines[19]
                dotslines[22] = dotslines[20]
            else
                dotslines[21] = dotslines[23]
                dotslines[22] = dotslines[24]
            end
        end
        dotslines[23] = quadx + 25
        dotslines[24] = quady + 25
    end 

    if speed >= 6 then
        speed = 0
        mode = (mode + 1)%2
    else
        speed = speed + 0.02
    end
end

function lerp(a, b, t)
    return a + t * (b - a)
end

function love.draw()
    love.graphics.rectangle("fill", quadx, quady, 50, 50)
    love.graphics.line(dotslines[1], dotslines[2], dotslines[3], dotslines[4])
    love.graphics.line(dotslines[5], dotslines[6], dotslines[7], dotslines[8])
    love.graphics.line(dotslines[9], dotslines[10], dotslines[11], dotslines[12])
    love.graphics.line(dotslines[13], dotslines[14], dotslines[15], dotslines[16])
    love.graphics.line(dotslines[17], dotslines[18], dotslines[19], dotslines[20])
    love.graphics.line(dotslines[21], dotslines[22], dotslines[23], dotslines[24])
end