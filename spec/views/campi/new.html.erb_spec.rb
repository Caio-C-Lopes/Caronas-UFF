require 'rails_helper'

RSpec.describe "campi/new", type: :view do
  before(:each) do
    assign(:campus, Campus.new(
      title: "MyString",
      address: "MyString",
      number: "MyString",
      neighborhood: "MyString",
      city: "MyString",
      CEP: "MyString"
    ))
  end

  it "renders new campus form" do
    render

    assert_select "form[action=?][method=?]", campi_path, "post" do

      assert_select "input[name=?]", "campus[title]"

      assert_select "input[name=?]", "campus[address]"

      assert_select "input[name=?]", "campus[number]"

      assert_select "input[name=?]", "campus[neighborhood]"

      assert_select "input[name=?]", "campus[city]"

      assert_select "input[name=?]", "campus[CEP]"
    end
  end
end
