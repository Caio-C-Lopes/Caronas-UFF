require 'rails_helper'

RSpec.describe "caronas/edit", type: :view do
  before(:each) do
    @carona = assign(:carona, Carona.create!(
      driver_name: "MyString",
      departure: "MyString",
      destination: "MyString",
      passengers_number: 1,
      cost: "9.99",
      obs: "MyString"
    ))
  end

  it "renders the edit carona form" do
    render

    assert_select "form[action=?][method=?]", carona_path(@carona), "post" do

      assert_select "input[name=?]", "carona[driver_name]"

      assert_select "input[name=?]", "carona[departure]"

      assert_select "input[name=?]", "carona[destination]"

      assert_select "input[name=?]", "carona[passengers_number]"

      assert_select "input[name=?]", "carona[cost]"

      assert_select "input[name=?]", "carona[obs]"
    end
  end
end
