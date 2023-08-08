def checkmate():
    pass

def pawn(pawn, ally):
    if not checkmate():
        move = 1
        if pawn.team == 2:
            move = - 1
        for i in ally:
            if i == ((pawn.position[0] + move), pawn.position[1]):
                return False