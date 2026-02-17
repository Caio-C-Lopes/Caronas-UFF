require 'rails_helper'

RSpec.describe "paradas/new", type: :view do
  before(:each) do
    assign(:parada, Parada.new(
      title: "MyString"
    ))
  end

  it "renders new parada form" do
    render

    assert_select "form[action=?][method=?]", paradas_path, "post" do

      assert_select "input[name=?]", "parada[title]"
    end
  end
end
