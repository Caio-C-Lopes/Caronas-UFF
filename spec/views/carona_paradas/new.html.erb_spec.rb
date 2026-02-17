require 'rails_helper'

RSpec.describe "carona_paradas/new", type: :view do
  before(:each) do
    assign(:carona_parada, CaronaParada.new(
      carona: nil,
      parada: nil
    ))
  end

  it "renders new carona_parada form" do
    render

    assert_select "form[action=?][method=?]", carona_paradas_path, "post" do

      assert_select "input[name=?]", "carona_parada[carona_id]"

      assert_select "input[name=?]", "carona_parada[parada_id]"
    end
  end
end
