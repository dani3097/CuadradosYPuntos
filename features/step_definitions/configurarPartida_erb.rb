Given("visito la pagina configurar") do
    visit('/configurarPartida') 
end
  
Then("deberia ver una ventana con opciones para elegir la cantidad de jugadores llamada {string}") do |nombre|
    expect(page).to have_select(nombre)
end

#Then("deberia ver la ventana {string} con las opciones {string}, {string}, {string}") do |string, string2, string3, string4|
 #   expect(page).to have_select(string, with_options: [string2, string3, string4])  
#end
Given("visito la pagina configurar y selecciono la opcion {string} jugadores de la ventana {string}") do |string, string2|    
    visit('/configurarPartida') 
    expect(page).to have_select(string2,selected:[string])
end
  

Then("deberia mostrar un mensaje {string}") do |mensaje|
    expect(page).to have_content(mensaje,visible:false)
end
  

