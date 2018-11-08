require "./lib/casilla"
describe Casilla do
    before (:each) do
        @casilla=Casilla.new()
        @casilla.inicializar()
    end

    it "deberia devolver 'true' cuando se crea la casilla " do
        expect(@casilla.nula())==true
    end

    it "deberia devolver  el color blanco '#ffffff' al crear una nueva casilla" do
        expect(@casilla.color()).to eq "#ffffff"
    end
    
    it "deberia devolver el  color azul '#0000ff' al crear una nueva casilla" do
        @casilla.pintar("#0000ff")
        expect(@casilla.color()).to eq "#0000ff"
    end

    it "deberia devolver 'true' en el lado izquierdo cuando se dibuje una linea en el lado izquierdo de la casilla " do
        @casilla.marcarIzquierdo()
        expect(@casilla.izquierdo()).to eq true
    end

    it "deberia devolver 'true' en el lado derecho cuando se dibuje una linea en el lado derecho de la casilla " do
        @casilla.marcarDerecho()
        expect(@casilla.derecho()).to eq true
    end

    it "deberia devolver 'true' en el lado superior cuando se dibuje una linea en el lado superior de la casilla " do
        @casilla.marcarSuperior()
        expect(@casilla.superior()).to eq true
    end

    it "deberia devolver 'true' en el lado inferior cuando se dibuje una linea en el lado inferior de la casilla " do
        @casilla.marcarInferior()
        expect(@casilla.inferior()).to eq true
    end

    it "deberia devolver 'true' cuando todos los lados de la casilla esten marcados " do
        @casilla.marcarInferior()
        @casilla.marcarSuperior()
        @casilla.marcarDerecho()
        @casilla.marcarIzquierdo()
        expect(@casilla.marcada())==true
    end



end