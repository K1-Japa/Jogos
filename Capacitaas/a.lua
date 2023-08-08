function fibonacci(n)
    local x1 = 0
    local x2 = 1
    for i = 3, n do
        local xn = x1 + x2
        x1 = x2
        x2 = xn
    end
end

print(fibonacci(8))

function recursive_fibonacci(n)
    if n == 1 then
        return 0
    elseif n == 2 then
        return 1
    else
        local fib = recursive_fibonacci(n-1) + recursive_fibonacci(n-2)
        return fib
    end
end

print(recursive_fibonacci(7))

function binomio(n, k)
    if n == 0 or k > n then
        return 0
    elseif k == 0 or n == k then
        return 1
    else
        local bin = binomio(n-1, k) + binomio(n-1, k-1)
        return bin
    end
end

print(binomio(10,2))

local mod = require("mod")

function somatorio(k)
    local soma = 0
    for n = 0, k do
        soma = soma + 1/mod.fat(n)
    end
    return soma
end

print(somatorio(50))