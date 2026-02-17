require 'rails_helper'

RSpec.describe "carona_paradas/index", type: :view do
  before(:each) do
    assign(:carona_paradas, [
      CaronaParada.create!(
        carona: nil,
        parada: nil
      ),
      CaronaParada.create!(
        carona: nil,
        parada: nil
      )
    ])
  end

  it "renders a list of carona_paradas" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
