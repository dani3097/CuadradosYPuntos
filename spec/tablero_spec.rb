require "./lib/tablero"

describe Tablero do
    before (:each) do
        @tablero = Tablero.new(5)
    end

    it "Deberia el tablero estar vacio cuando se crea" do
        expect(@tablero.esVacio()).to eq true
     end

     it "Deberia tablero no estar lleno cuando se lo cree" do
        expect(@tablero.esLleno()).to eq false
    end
    
    it "Deberia marcarse la coordenada '1,3' en direccion 'derecho'" do
        @tablero.marcar(1,3,"derecho","0000ff")
        expect(@tablero.verLadoDeLaCasilla(1,3,"derecho")).to eq true
    end
     it "Deberia marcarse la coordenada '1,3' en direccion 'izquierdo'" do
        @tablero.marcar(1,3,"izquierdo","0000ff")
        expect(@tablero.verLadoDeLaCasilla(1,3,"izquierdo")).to eq true
     end

     it "Deberia marcarse la coordenada '1,3' en direccion 'superior'" do
        @tablero.marcar(1, 3, "superior","0000ff")
        expect(@tablero.verLadoDeLaCasilla(1,3,"superior")).to eq true
     end

     it "Deberia marcarse la coordenada '1,3' en direccion 'inferior'" do
        @tablero.marcar(1, 3, "inferior","0000ff")
        expect(@tablero.verLadoDeLaCasilla(1,3,"inferior")).to eq true
     end

     it "Deberia marcar la coordenada 2,3 lado derecho y su coordenada adyacente 3,3 lado izquierdo" do
        @tablero.marcar(2, 3, "derecho","0000ff")
        expect(@tablero.verLadoDeLaCasilla(2,3,"derecho")).to eq true 
        expect(@tablero.verLadoDeLaCasilla(3,3,"izquierdo")).to eq true 
     end
   
     it "Deberia marcar la posicion 2,3 lado izquierdo y su coordenada adyacente 1,3 lado derecho" do
        @tablero.marcar(2, 3, "izquierdo","0000ff")
        expect(@tablero.verLadoDeLaCasilla(2, 3, "izquierdo")).to eq true 
        expect(@tablero.verLadoDeLaCasilla(1, 3, "derecho")).to eq true 
     end

     it "Deberia marcar la posicion 2,3 lado superior y su coordenada adyacente 2,2 lado inferior" do
        @tablero.marcar(2,3,"superior","0000ff")
        expect(@tablero.verLadoDeLaCasilla(2,3,"superior")).to eq true 
        expect(@tablero.verLadoDeLaCasilla(2,2,"inferior")).to eq true 
     end

     it "Deberia marcar la posicion 2,3 lado inferior y su coordenada adyacente 2,4 lado superior" do
        @tablero.marcar(2,3,"inferior","0000ff")
        expect(@tablero.verLadoDeLaCasilla(2,3,"inferior")).to eq true 
        expect(@tablero.verLadoDeLaCasilla(2,4,"superior")).to eq true 
     end
     it "Deberia darle el color '0000ff' a la casilla en la posicion 2,3 si su lado superior, inferior, derecho e izquierdo estan marcados" do
        @tablero.marcar(2, 3, "inferior", "0000ff")
        @tablero.marcar(2, 3, "superior", "0000ff")
        @tablero.marcar(2, 3, "izquierdo", "0000ff")
        @tablero.marcar(2, 3, "derecho", "0000ff")
        expect(@tablero.estaPintadaLaCasilla(2,3)).to eq true 
     end

     it "Deberia tablero de 5x5 estar lleno cuando todas sus casillas esten pintadas" do
        for i in 1..5 do
            for j in 1..5 do
                @tablero.marcar(i, j, "izquierdo", "0000ff")
                @tablero.marcar(i, j, "derecho", "0000ff")
                @tablero.marcar(i, j, "superior", "0000ff")
                @tablero.marcar(i, j, "inferior", "0000ff")
            end
        end
        expect(@tablero.esLleno()).to eq true 
     end

     it "Deberia el tablero estar vacio cuando se lo reinicie" do
        @tablero.reiniciarTablero()
        expect(@tablero.esVacio()).to eq true
     end
     
    it "Deberia devolver '1' cuando el jugador haya pintado una casilla" do
        @tablero.marcar(1, 1, "superior", "0000ff") 
        @tablero.marcar(1, 1, "inferior", "0000ff")
        @tablero.marcar(1, 1, "derecho", "0000ff") 
        @tablero.marcar(1, 1, "izquierdo", "0000ff")
        expect(@tablero.contarCasillasJugador("0000ff")).to eq 1
    end

    it "Deberia generar un tablero de 2x2 vacio" do
        @tablero.ingresarTamano(2)
        expect(@tablero.generarHTMLTabla()).to eq " <tbody>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td> <td><img src='images/punto.jpg'/></td>  </tr>  </tbody> "
    end

    it "Deberia generar un tablero de 2x2 con una jugada" do
        @tablero.ingresarTamano(2)
        @tablero.marcar(1, 1, "izquierdo", "0000ff")
        expect(@tablero.generarHTMLTabla()).to eq " <tbody>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td> <td><img src='images/punto.jpg'/></td>  </tr>  </tbody> "
    end

    it "Deberia generar un tablero de 2x2 con una casilla pintada de color '0000ff'" do
        @tablero.ingresarTamano(2)
        @tablero.marcar(1, 1, "inferior", "0000ff")
        @tablero.marcar(1, 1, "superior", "0000ff")
        @tablero.marcar(1, 1, "izquierdo", "0000ff")
        @tablero.marcar(1, 1, "derecho", "0000ff")
        expect(@tablero.generarHTMLTabla()).to eq " <tbody>   <tr>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='0000ff'></td>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td width='25px' height='25px' bgcolor='white'></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td>  <td><img src='images/punto.jpg'/></td>  <td width='25px' height='25px' bgcolor='white'></td> <td><img src='images/punto.jpg'/></td>  </tr>  </tbody> "
    end

    it "Deberia generar un tablero de 2x2 lleno" do
        @tablero.ingresarTamano(2)
        for i in 1..2 do
            for j in 1..2 do
                @tablero.marcar(i, j, "izquierdo", "0000ff")
                @tablero.marcar(i, j, "derecho", "0000ff")
                @tablero.marcar(i, j, "superior", "0000ff")
                @tablero.marcar(i, j, "inferior", "0000ff")
            end
        end
        expect(@tablero.generarHTMLTabla()).to eq " <tbody>   <tr>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='0000ff'></td>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='0000ff'></td>  <td><img src='images/lineaVertical.jpg'/></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>   </tr>   <tr>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='0000ff'></td>  <td><img src='images/lineaVertical.jpg'/></td>  <td width='25px' height='25px' bgcolor='0000ff'></td>  <td><img src='images/lineaVertical.jpg'/></td>   </tr>   <tr>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td>  <td><img src='images/punto.jpg'/></td>  <td><img src='images/lineaHorizontal.jpg'/></td> <td><img src='images/punto.jpg'/></td>  </tr>  </tbody> "
    end
end