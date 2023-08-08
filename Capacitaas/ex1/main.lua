function love.load()
    local set = love.window.setMode(600,600)
end

local mode = 0
local verticeslines = {75, 75, 75, 75, 525, 75, 525, 75, 300, 300, 300, 300}
-- local verticeslines = {75, 75, 525, 75, 300, 300}
local verticesquad = {50, 50, 100, 50, 100, 100, 50, 100}
local speed = 5

function love.update(dt)
    if mode == 0 then
        if verticesquad[3] >= 550 then
            mode = 1
        else
            for i = 1, 8, 2 do
                verticesquad[i] = verticesquad[i] + speed
            end

            if verticeslines[3] < 525 then
                verticeslines[3] = verticeslines[3] + speed
            elseif verticeslines[1] == verticeslines[3] then
                verticeslines[1] = 75
                verticeslines[3] = 75 + speed
            else
                verticeslines[1] = verticeslines[1] + speed
            end
        end
    elseif mode == 1 then
        if verticesquad[5] <= 325 then
            mode = 2
        else
            for i = 1, 8 do
                if i%2 == 0 then
                    verticesquad[i] = verticesquad[i] + speed
                else
                    verticesquad[i] = verticesquad[i] - speed
                end
            end

            if verticeslines[7] > 300 then
                verticeslines[7] = verticeslines[7] - speed
                verticeslines[8] = verticeslines[8] + speed
            elseif verticeslines[5] == verticeslines[7] then
                verticeslines[5] = 525
                verticeslines[6] = 75
                verticeslines[7] = 525 - speed
                verticeslines[8] = 75 + speed
            else
                verticeslines[5] = verticeslines[5] - speed
                verticeslines[6] = verticeslines[6] + speed
            end
        end
    else
        if verticesquad[1] <= 50 then
            mode = 0
        else
            for i = 1, 8 do
                if i%2 == 0 then
                    verticesquad[i] = verticesquad[i] - speed
                else
                    verticesquad[i] = verticesquad[i] - speed
                end
            end

            if verticeslines[11] > 75 then
                verticeslines[11] = verticeslines[11] - speed
                verticeslines[12] = verticeslines[12] - speed
            elseif verticeslines[9] == verticeslines[11] then
                verticeslines[9] = 300
                verticeslines[10] = 300
                verticeslines[11] = 300 - speed
                verticeslines[12] = 300 - speed
            else
                verticeslines[9] = verticeslines[9] - speed
                verticeslines[10] = verticeslines[10] - speed
            end
        end
    end
end

function love.draw()
    love.graphics.polygon("fill", verticesquad)
    
    love.graphics.line(verticeslines[1], verticeslines[2], verticeslines[3], verticeslines[4])
    love.graphics.line(verticeslines[5], verticeslines[6], verticeslines[7], verticeslines[8])
    love.graphics.line(verticeslines[9], verticeslines[10], verticeslines[11], verticeslines[12])
end