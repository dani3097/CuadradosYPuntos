When("introuduzco las coordenadas {string} , {string} y  la {string}") do |string, string2, string3|
    find_field(string).value 
    fill_in(string, with: 1)

    find_field(strin2).value 
    fill_in(string2, with: 1)
    find_field(string3).value 
    fill_in(string3, with: "Derecha")
end
  
Then("es turno del siguiente jugador") do
end
  
Then("deberia poder realizar jugadas") do
end