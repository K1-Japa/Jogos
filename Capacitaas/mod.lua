local funcs ={}

funcs.fat = function(n)
    if n <= 1 then
        return 1
    else
        return n * funcs.fat(n-1)
    end
end

return funcs