Feature: Ver tablero
    Como jugador
    quiero ver el tablero 
    para ver el estado de la partida y saber que jugadas puedo realizar

    Scenario: Mostrar tablero de juego.
        Given visito la pagina jugar
        Then deberia ver el tablero "tablero" del juego 
    
        