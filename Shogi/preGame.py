from classes import piece

def create_Game():
    """
    Cria o tabuleiro e as peças
    """
    board = [["--"] * 9 for _ in range(9)] 
    
    team1 = []
    team1 = create_Pieces(1, 0)
    
    team2 = []
    team2 = create_Pieces(2, team1[1])

    all_pieces = initialPosition(board, team1[0], team2[0], 0)

    print_Board(board)

    team1[1] = []
    team2[1] = []
    for i in all_pieces:
        all_pieces[i].set_InitialPossibleMovements(team1[1], team2[1], ) 

    return board, all_pieces


def create_Pieces(team, num):
    """
    Cria as peças de ambos os times
    
    :Parametros - team: Número que representa o time do qual serão criadas as peças

    :Retorno - vect: Vetor contendo todos os objetos do tipo piece de um time
    """
    vect = []

    created_pieces =  create_Pawns(team, num)

    vect = vect + created_pieces[0]
    num = created_pieces[1]

    created_pieces = create_TwoPieces((str(team)+"l"), "lancet", team, num)
    vect = vect + created_pieces[0]
    num = created_pieces[1]

    created_pieces = create_TwoPieces((str(team)+"h"), "horse", team, num)
    vect = vect + created_pieces[0]
    num = created_pieces[1]

    created_pieces = create_TwoPieces((str(team)+"g"), "goldG", team, num)
    vect = vect + created_pieces[0]
    num = created_pieces[1]

    created_pieces = create_TwoPieces((str(team)+"s"), "silverG", team, num)
    vect = vect + created_pieces[0]
    num = created_pieces[1]

    vect.append(piece.create_Piece((str(team)+"k"), "king", team, num))
    num = num + 1
    vect.append(piece.create_Piece((str(team)+"r"), "rook", team, num))
    num = num +1
    vect.append(piece.create_Piece((str(team)+"b"), "bishop", team, num))

    return vect, num

def create_TwoPieces(id, type, team, num):
    """
    Cria duas peças para um time
    
    :Parametros - id: String contendo a primeira letra do tipo de peça
                  type: String contendo o nome da peça
                  team: Número que representa o time ao qual a peça vai pertencer

    :Retorno - vector: Vetor contendo as duas peças idênticas criadas para aquele time
    """
    vector = []
    vector.append(piece.create_Piece(id, type, team, num))
    num = num + 1
    vector.append(piece.create_Piece(id, type, team, num))
    num = num + 1

    return vector, num

def create_Pawns(team, num):
    """
    Cria todos os peões de um time

    :Parametros - team: Número que representa o time ao qual a peça vai pertencer

    :Retorno - vector: Vetor contendo as peças do tipo "pawn" criadas para aquele time
    """
    vector = []
    for _ in range(0, 9):
        vector.append(piece.create_Piece((str(team)+"p"), "pawn", team, num))
        num = num + 1
    
    return vector, num

def initialPosition(board, team1, team2, count):
    """
    Coloca todas as peças de ambos os times nas posições iniciais
    
    :Parametros - board: "matriz" do tabuleiro
                  team1: Número que representa o time 1
                  team2: Número que representa o time 2
                  count: Contador para avançar no vetor de peças de um time
    """
    for i in range(0,9):
        board, count = team1[count].set_InitialPosition(board, 2, i, team1[count].id, count)

    for i in range(0,4):
        board, count = team1[count].set_InitialPosition(board, 0, i, team1[count].id, count)
        board,count = team1[count].set_InitialPosition(board, 0, 8-i, team1[count].id, count)
    
    board, count = team1[count].set_InitialPosition(board, 0, 4, team1[count].id, count)
    board, count = team1[count].set_InitialPosition(board, 1, 1, team1[count].id, count)
    board, count = team1[count].set_InitialPosition(board, 1, 7, team1[count].id, count)

    count = 0
    for i in range(0,9):
        board, count = team2[i].set_InitialPosition(board, 6, i, team2[i].id, count) 
    
    for i in range(0,4):
        board, count = team2[count].set_InitialPosition(board, 8, i, team2[count].id, count)
        board, count = team2[count].set_InitialPosition(board, 8, 8-i, team2[count].id, count)  

    board, count = team2[count].set_InitialPosition(board, 8, 4, team2[count].id, count)
    board, count = team2[count].set_InitialPosition(board, 7, 7, team2[count].id, count)
    board, count = team2[count].set_InitialPosition(board, 7, 1, team2[count].id, count)

    vector = team1 + team2
    return vector

def print_Board(board):
    """Imprime o tabuleiro"""
    for i in range(0, len(board)):
        print("")
        for j in range(0, len(board)):
            print(" " + str(board[j][i]) + " ", end="")
        print("")

    print("")