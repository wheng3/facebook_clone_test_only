require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :create => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input#like_create[name=?]", "like[create]"

      assert_select "input#like_destroy[name=?]", "like[destroy]"
    end
  end
end
