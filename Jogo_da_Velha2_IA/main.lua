local function start()
   local tabela = {}
   for i = 1, 9 do
    tabela[i] = {}

    for j = 1, 9 do
        tabela[i][j] = "+"
    end
   end

   local estado = {
   0,0,0,
   0,0,0,
   0,0,0
}

    local position = {5,5}
    local restricao = "livre"
    local jogador = "X"

    return tabela, estado, restricao, jogador
end

local function imprime_jogo(tabela)
    print()
    for i = 1, 9 do
     print()
     if i == 4 or i == 7 then
        print("-----------------------")
    end
     for j = 1, 9 do
        if j == 4 or j == 7 then
            io.write(" | ")
        end
         io.write(tabela[i][j] .. " ")
     end
    end
    print()
end

local function movimento(tabela, restricao, jogador)
    local maior = io.read("n")
    local menor = io.read("n")

    if maior > 9 or maior < 1 or menor > 9 or menor < 1 then
        print("\nJogada Invalida!")
    elseif tabela[maior][menor] == "+" then
        tabela[maior][menor] = jogador
        if jogador == "X" then
            jogador = "O"
        else
            jogador = "X"
        end
    else
        print("\nJa foi feita uma jogada nesse espaco!")
    end

    return tabela, jogador
end

local function main()

    local jogo = {
        tabela = nil,
        estado = nil,
        restricao = nil,
        jogador = nil
    }
    
    jogo.tabela, jogo.estado, jogo.restricao, jogo.jogador = start()
    
    local fim = true
    while fim do
        imprime_jogo(jogo.tabela)
        jogo.tabela, jogo.jogador = movimento(jogo.tabela, jogo.restricao, jogo.jogador)
    end
end

main()