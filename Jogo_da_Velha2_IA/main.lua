local function start()
   local tabela = {}
   local aux = 1
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
    local restricao = {"livre", 0}
    local jogador = "X"

    return tabela, estado, restricao, jogador
end

local function imprime_jogo(tabela)
    for i = 1, 7, 3 do
        for m = 0, 2 do
            print()
            for j = i, i+2 do
                for k = 1+(m*3), 3+(m*3) do
                    io.write(tabela[j][k] .. " ")
                end
                if j ~= i+2 then
                    io.write("| ")
                end
            end
        end
        if i ~= 7 then
            io.write("\n---------------------")
        end
    end
    print()
end

local function verifica_ponto(tabela, estado, restricao)
    for i = 1, 9 do
        if estado[i] == 0 then
            for j = 1, 7, 3 do
                if tabela[i][j] ~= "+" then
                    if (tabela[i][j] == tabela[i][j+1] and tabela[i][j] == tabela[i][j+2]) then
                        estado[i] = tabela[i][j]
                        return estado, {"livre", 0}
                    end
                end
            end
            for k = 1, 3 do
                if tabela[i][k] ~= "+" then
                    if (tabela[i][k] == tabela[i][k+3] and tabela[i][k] == tabela[i][k+6]) then
                        estado[i] = tabela[i][k]
                        return estado, {"livre", 0}
                    end
                end
            end
            if tabela[i][1] ~= "+" then
                if (tabela[i][1] == tabela[i][5] and tabela[i][1] == tabela[i][9]) then
                    estado[i] = tabela[i][1]
                    return estado, {"livre", 0}
                end
            end
            if tabela[i][3] ~= "+" then
                if (tabela[i][3] == tabela[i][5] and tabela[i][3] == tabela[i][7]) then
                    estado[i] = tabela[i][3]
                    return estado, {"livre", 0}
                end
            end
        end
    end
    return estado, restricao
end

local function movimento(tabela, restricao, jogador)
    local maior = io.read("n")
    local menor = io.read("n")

    if maior > 9 or maior < 1 or menor > 9 or menor < 1 then
        print("\nJogada Invalida!")
    elseif tabela[maior][menor] == "+" then
        if maior ~= restricao[2] and restricao[1] ~= "livre" then
            print("\nJogada invalida! Voce soh pode realizar jogadas no jogo " .. restricao[2])
        else
            tabela[maior][menor] = jogador
            if jogador == "X" then
                jogador = "O"
            else
                jogador = "X"
            end
        end
    else
        print("\nJa foi feita uma jogada nesse espaco!")
    end

    return tabela, jogador, {"restrito", menor}
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
        jogo.tabela, jogo.jogador, jogo.restricao = movimento(jogo.tabela, jogo.restricao, jogo.jogador)
        jogo.estado, jogo.restricao = verifica_ponto(jogo.tabela, jogo.estado, jogo.restricao)
    end
end

local teste ={
    {"+", "+", "+", "+", "+", "+", "+", "+", "+"}, {"O", "O", "O", "+", "+", "+", "+", "+", "+"}, {"+", "+", "+", "+", "+", "+", "+", "+", "+"},
    {"+", "+", "+", "+", "+", "+", "+", "+", "+"}, {"+", "+", "+", "+", "+", "+", "+", "+", "+"}, {"+", "+", "+", "+", "+", "+", "+", "+", "+"},
    {"+", "+", "+", "+", "+", "+", "+", "+", "+"}, {"+", "+", "+", "+", "+", "+", "+", "+", "+"}, {"+", "+", "+", "+", "+", "+", "+", "+", "+"}
}

local teste1 ={
    0,0,0,0,0,0,0,0,0
}

local resultado = verifica_ponto(teste, teste1, {"restrito", 1})

for j = 1, 9, 3 do
    print()
    io.write(resultado[j])
    io.write(resultado[j+1])
    io.write(resultado[j+1])
end

-- Falta verificar se alguem ganhou e testar se verifica_ponto + restricao esta fucionando corretamente