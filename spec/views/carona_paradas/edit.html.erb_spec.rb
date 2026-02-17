require 'rails_helper'

RSpec.describe "carona_paradas/edit", type: :view do
  before(:each) do
    @carona_parada = assign(:carona_parada, CaronaParada.create!(
      carona: nil,
      parada: nil
    ))
  end

  it "renders the edit carona_parada form" do
    render

    assert_select "form[action=?][method=?]", carona_parada_path(@carona_parada), "post" do

      assert_select "input[name=?]", "carona_parada[carona_id]"

      assert_select "input[name=?]", "carona_parada[parada_id]"
    end
  end
end
