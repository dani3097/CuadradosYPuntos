require 'matrix'
require "./lib/casilla"

class Tablero

    def inicializar()
        casillas = Array.new(5){Array.new(5){Casilla.new()}}
        casillas.each { |x| x.each{ |y| y.inicializar} }
        @tablero= Matrix[*casillas]
        @tamanio=4
    end

    def vacio()
        @tablero.each do |i|
            if(!i.esCasillaNula())
                return false
            end
        end
        return true
    end

    def lleno()
        @tablero.each do |i|
            if(i.color=="#ffffff")
                return false
            end
        end
        return true
    end
    def marcar(x, y, lado, color)
        x=x-1
        y=y-1

        case lado
            when "derecho"
                @tablero[y, x]. marcarDerecho()
                if(x!=@tamanio)
                    @tablero[y, x+1]. marcarIzquierdo()
                end
            when "izquierdo"
                @tablero[y, x]. marcarIzquierdo()            
                if(x!=0)
                    @tablero[ y,x-1]. marcarDerecho()
                end
            when "superior"
                @tablero[y, x]. marcarSuperior()
                if(y!=0)
                    @tablero[y-1, x]. marcarInferior()
                end
            when "inferior"
                @tablero[y,x]. marcarInferior()
                if(y!=@tamanio)
                    @tablero[ y+1,x]. marcarSuperior()
                end
        end
        
        pintarCasilla(x,y,color)
    end

    def ver(x, y, lado)
        x=x-1
        y=y-1

        case lado
            when "derecho"
                return @tablero[y, x]. derecho()
            when "izquierdo"
                return @tablero[y, x]. izquierdo()            
            when "superior"
                return @tablero[y, x]. superior()
            when "inferior"
                return @tablero[y, x]. inferior()
        end
    end
    
    def pintarCasilla(x, y, color)
        if(@tablero[ y,x].derecho() && @tablero[y,x].izquierdo() && @tablero[y,x].superior() && @tablero[y,x].inferior())
            @tablero[y,x].pintar(color)
        end
    end

    def contarCasillasJugador(color)   
        cantidad=0     
        @tablero.each do |i|
            if(i.color()==color)
                cantidad=cantidad+1
            end
        end
        return cantidad
    end

    def estaPintado(x,y)
        x=x-1
        y=y-1
        if(@tablero[y,x].color()== "#ffffff")
            return false
        end
        return true
    end

    def multiploTamanio(numero)
        if(numero % (@tamanio+1)==0)
            return true
        end
        return false
    end

    def generarHTMLTabla()
        bodyTabla = " <tbody> "
        casillaLineaHorizontal = " <td><img src='images/lineaHorizontal.jpg'/></td> "
        casillaLineaVertical = " <td><img src='images/lineaVertical.jpg'/></td> "
        casillaPunto = " <td><img src='images/punto.jpg'/></td> "
        casillaEnBlanco = " <td width='25px' height='25px' bgcolor='white'></td> "
        numeroCasilla = 1
        numeroFila = 1
        filaPuntos = "  <tr> "
        filaPintada = "  <tr> "
        ultimaFila = "  <tr> "

        @tablero.each do |i|
            filaPuntos = filaPuntos + casillaPunto
            if(i.superior())
                filaPuntos = filaPuntos + casillaLineaHorizontal
            end
            if(!i.superior())
                filaPuntos = filaPuntos + casillaEnBlanco
            end
            if(i.izquierdo())
                filaPintada = filaPintada + casillaLineaVertical
            end
            if(!i.izquierdo())
                filaPintada = filaPintada + casillaEnBlanco
            end
            filaPintada = filaPintada + i.generarHTML()
            if(numeroFila == @tamanio)
                ultimaFila = ultimaFila + casillaPunto
                if(i.inferior())
                    ultimaFila = ultimaFila + casillaLineaHorizontal
                end
                if(!i.inferior())
                    ultimaFila = ultimaFila + casillaEnBlanco
                end

            end
            if(multiploTamanio(numeroCasilla))
                if(i.derecho())
                    filaPintada = filaPintada + casillaLineaVertical
                end
                if(!i.derecho())
                    filaPintada = filaPintada + casillaEnBlanco
                end
                filaPuntos = filaPuntos + casillaPunto
                filaPuntos = filaPuntos + "  </tr> "
                filaPintada = filaPintada + "  </tr> "
                numeroFila = numeroFila + 1
                bodyTabla = bodyTabla + filaPuntos + filaPintada
                filaPuntos = "  <tr> "
                filaPintada = "  <tr> "
            end
           
            numeroCasilla = numeroCasilla+1

        end
        ultimaFila = ultimaFila + casillaPunto
        ultimaFila = ultimaFila + "  </tr> "
        bodyTabla = bodyTabla + ultimaFila + " </tbody> "
        return bodyTabla
    end

end