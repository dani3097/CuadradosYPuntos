Feature: Jugada
    Como jugador
    quiero  realizar una jugada
    para tener más oportunidades de ganar la partida
    Scenario: Boton jugada
        Given visito la pagina jugar
        When introuduzco las coordenadas "x" , "y" y  la "direccion"
        And presiono el boton "Jugada"
        Then es turno del siguiente jugador
    Scenario:
       Given visito la pagina jugar
        Then deberia poder realizar jugadas
