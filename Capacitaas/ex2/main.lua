function love.load()
    local set = love.window.setMode(600,600)
end

local face = {300, 300, 100}
local eye1 = {260, 260, 25, 255, 274, 10}
local eye2 = {340, 260, 25, 335, 274, 10}
local mouth = {250, 325, 350, 325, 350, 350, 250, 350, 250, 337, 350, 337}

function love.draw()
    love.graphics.setColor(255,255,255)

    love.graphics.circle("line", face[1], face[2], face[3])

    
    love.graphics.circle("line", eye1[1], eye1[2], eye1[3])
    love.graphics.circle("fill", eye1[4], eye1[5], eye1[6])


    love.graphics.circle("line", eye2[1], eye2[2], eye2[3])
    love.graphics.circle("fill", eye2[4], eye2[5], eye2[6])

    love.graphics.polygon("fill", mouth[1], mouth[2], mouth[3], mouth[4], mouth[5], mouth[6], mouth[7], mouth[8])
    love.graphics.setColor(0,0,0)
    love.graphics.line(mouth[9], mouth[10], mouth[11], mouth[12])
end