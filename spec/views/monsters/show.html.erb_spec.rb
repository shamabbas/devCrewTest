require 'rails_helper'

RSpec.describe "monsters/show", type: :view do
  before(:each) do
    @monster = assign(:monster, Monster.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
