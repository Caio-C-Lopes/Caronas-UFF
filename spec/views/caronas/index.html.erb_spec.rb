require 'rails_helper'

RSpec.describe "caronas/index", type: :view do
  before(:each) do
    assign(:caronas, [
      Carona.create!(
        driver_name: "Driver Name",
        departure: "Departure",
        destination: "Destination",
        passengers_number: 2,
        cost: "9.99",
        obs: "Obs"
      ),
      Carona.create!(
        driver_name: "Driver Name",
        departure: "Departure",
        destination: "Destination",
        passengers_number: 2,
        cost: "9.99",
        obs: "Obs"
      )
    ])
  end

  it "renders a list of caronas" do
    render
    assert_select "tr>td", text: "Driver Name".to_s, count: 2
    assert_select "tr>td", text: "Departure".to_s, count: 2
    assert_select "tr>td", text: "Destination".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
  end
end
