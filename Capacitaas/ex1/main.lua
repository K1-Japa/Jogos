function love.load()
    local set = love.window.setMode(600,600)
end

local mode = 0
local vertices = {50, 50, 100, 50, 100, 100, 50, 100}
local speed = 5

function love.update(dt)
    if mode == 0 then
        if vertices[3] >= 550 then
            mode = 1
        else
            for i = 1, 8, 2 do
                vertices[i] = vertices[i] + speed
            end
        end
    elseif mode == 1 then
        if vertices[5] <= 325 then
            mode = 2
        else
            for i = 1, 8 do
                if i%2 == 0 then
                    vertices[i] = vertices[i] + speed
                else
                    vertices[i] = vertices[i] - speed
                end
            end
        end
    else
        if vertices[1] <= 50 then
            mode = 0
        else
            for i = 1, 8 do
                if i%2 == 0 then
                    vertices[i] = vertices[i] - speed
                else
                    vertices[i] = vertices[i] - speed
                end
            end
        end
    end
end

function love.draw()
    love.graphics.polygon("fill", vertices)
end