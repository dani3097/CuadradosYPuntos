require 'sinatra'
require "./lib/jugador"
class App < Sinatra::Base
    @jugadores=Array.new(4)
    @colores=Array.new(4)
    get '/' do
        erb:inicio
    end

    get '/configurarPartida' do
        erb:configurarPartida
    end

    
    post '/juego' do
        @cantidadJugadores=params[:Cantidadjugadores].to_i
        erb:juego
    end 
end