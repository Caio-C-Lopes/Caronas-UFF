require 'rails_helper'

RSpec.describe "campi/show", type: :view do
  before(:each) do
    @campus = assign(:campus, Campus.create!(
      title: "Title",
      address: "Address",
      number: "Number",
      neighborhood: "Neighborhood",
      city: "City",
      CEP: "Cep"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Cep/)
  end
end
