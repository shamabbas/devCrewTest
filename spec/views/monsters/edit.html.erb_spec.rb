require 'rails_helper'

RSpec.describe "monsters/edit", type: :view do
  before(:each) do
    @monster = assign(:monster, Monster.create!())
  end

  it "renders the edit monster form" do
    render

    assert_select "form[action=?][method=?]", monster_path(@monster), "post" do
    end
  end
end
