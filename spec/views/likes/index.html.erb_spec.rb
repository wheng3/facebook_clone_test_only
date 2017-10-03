require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(
        :create => "Create",
        :destroy => "Destroy"
      ),
      Like.create!(
        :create => "Create",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of likes" do
    render
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
