require 'rails_helper'

RSpec.describe "monsters/index", type: :view do
  before(:each) do
    assign(:monsters, [
      Monster.create!(),
      Monster.create!()
    ])
  end

  it "renders a list of monsters" do
    render
  end
end
