require 'rails_helper'

RSpec.describe "campi/index", type: :view do
  before(:each) do
    assign(:campi, [
      Campus.create!(
        title: "Title",
        address: "Address",
        number: "Number",
        neighborhood: "Neighborhood",
        city: "City",
        CEP: "Cep"
      ),
      Campus.create!(
        title: "Title",
        address: "Address",
        number: "Number",
        neighborhood: "Neighborhood",
        city: "City",
        CEP: "Cep"
      )
    ])
  end

  it "renders a list of campi" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Neighborhood".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Cep".to_s, count: 2
  end
end
