require 'rails_helper'

RSpec.describe "carona_paradas/show", type: :view do
  before(:each) do
    @carona_parada = assign(:carona_parada, CaronaParada.create!(
      carona: nil,
      parada: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
