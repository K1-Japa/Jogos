from verifying import pawn

class piece:
    def __init__(self):
        """
        Construtor inicial
        
        :Parametros - self: O próprio objeto
        """
        self.id = None
        self.num = None
        self.type = None
        self.ingame = None
        self.team = None
        self.promote = None
        self.position = None
        self.possibleMovements = None

    def create_Piece(id, type, team, num):
        """
        Cria uma peça colocando seu id, tipo de peça e seu time.
        Também coloca a peça em jogo, seu respectivo time e 
        coloca na forma não promovida

        :Parametros - id: String contendo a primeira letra do tipo de peça
                      type: String contendo o nome da peça
                      team: Número que representa o time ao qual a peça vai pertencer

        :Retorno - self: Retorna o objeto do tipo piece criado
        """
        self = piece()
        self.id = id
        self.num = num
        self.type = type
        self.ingame = True
        self.team = team
        self.promote = False

        return self
    
    def set_InitialPosition(self, board, posY, posX, id, count, ally):
        """
        Recebe uma peça e coloca na posição recebida (inicial)
        
        :Parametros - self: O próprio objeto
                      board: "matriz" do tabuleiro
                      posY: Coordenada no eixo Y do tabuleiro
                      posX: Coordenada no eixo X do tabuleiro
                      id: String contendo a primeira letra do tipo de peça
                      count: contador para avançar no vetor de peças de um time

        :Retorno - board: "matriz" do tabuleiro após colocar a peça em seu lugar inicial
                   count: contador para avanaçar no vetor incrementado em um  
        """
        self.position = posX, posY
        ally.append(self.position)
        board[posX][posY] = id
        count = count + 1
        return board, count, ally
    
    def set_InitialPossibleMovements(self, ally, enemies, possibleally):
        if self.id == "pawn":
            move = 1
            if self.team == 2:
                move = - 1
                if pawn(self, ally):
                    possibleally[self.num] = (self.position[0] + move), self.position[1]
            elif self.team == 1:
                if pawn(self. ally):
                    possibleally[self.num] = (self.position[0] - move), self.position[1]

        return possibleally
