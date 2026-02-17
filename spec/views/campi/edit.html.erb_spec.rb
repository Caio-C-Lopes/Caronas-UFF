require 'rails_helper'

RSpec.describe "campi/edit", type: :view do
  before(:each) do
    @campus = assign(:campus, Campus.create!(
      title: "MyString",
      address: "MyString",
      number: "MyString",
      neighborhood: "MyString",
      city: "MyString",
      CEP: "MyString"
    ))
  end

  it "renders the edit campus form" do
    render

    assert_select "form[action=?][method=?]", campus_path(@campus), "post" do

      assert_select "input[name=?]", "campus[title]"

      assert_select "input[name=?]", "campus[address]"

      assert_select "input[name=?]", "campus[number]"

      assert_select "input[name=?]", "campus[neighborhood]"

      assert_select "input[name=?]", "campus[city]"

      assert_select "input[name=?]", "campus[CEP]"
    end
  end
end
