require 'rails_helper'

RSpec.describe "caronas/show", type: :view do
  before(:each) do
    @carona = assign(:carona, Carona.create!(
      driver_name: "Driver Name",
      departure: "Departure",
      destination: "Destination",
      passengers_number: 2,
      cost: "9.99",
      obs: "Obs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Driver Name/)
    expect(rendered).to match(/Departure/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Obs/)
  end
end
