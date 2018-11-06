Given("visito la pagina jugar") do
    visit('/juego') 
end

Then("deberia ver el tablero {string} del juego") do |tablero|
    expect(page.find_by_id('#' + tablero)).to have_field('name', with: tablero)
end