require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new(
      :create => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input#like_create[name=?]", "like[create]"

      assert_select "input#like_destroy[name=?]", "like[destroy]"
    end
  end
end
