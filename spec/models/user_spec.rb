require 'rails_helper'

describe User, type: :model do
  it { should have_many(:monsters) }

  before :all do
    @user = create(:user)
  end

end
