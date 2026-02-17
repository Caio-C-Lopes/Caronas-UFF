require 'rails_helper'

RSpec.describe "paradas/index", type: :view do
  before(:each) do
    assign(:paradas, [
      Parada.create!(
        title: "Title"
      ),
      Parada.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of paradas" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
