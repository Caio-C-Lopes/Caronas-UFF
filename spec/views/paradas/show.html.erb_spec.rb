require 'rails_helper'

RSpec.describe "paradas/show", type: :view do
  before(:each) do
    @parada = assign(:parada, Parada.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
