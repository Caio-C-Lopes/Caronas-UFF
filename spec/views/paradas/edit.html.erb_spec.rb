require 'rails_helper'

RSpec.describe "paradas/edit", type: :view do
  before(:each) do
    @parada = assign(:parada, Parada.create!(
      title: "MyString"
    ))
  end

  it "renders the edit parada form" do
    render

    assert_select "form[action=?][method=?]", parada_path(@parada), "post" do

      assert_select "input[name=?]", "parada[title]"
    end
  end
end
