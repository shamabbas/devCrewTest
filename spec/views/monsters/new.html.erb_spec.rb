require 'rails_helper'

RSpec.describe "monsters/new", type: :view do
  before(:each) do
    assign(:monster, Monster.new())
  end

  it "renders new monster form" do
    render

    assert_select "form[action=?][method=?]", monsters_path, "post" do
    end
  end
end
