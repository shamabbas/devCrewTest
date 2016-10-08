# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  name                   :string
#  uid                    :string
#  provider               :string
#  oauth_token            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  monsters_count         :integer          default(0)
#  teams_count            :integer          default(0)
#

require 'rails_helper'

describe User, type: :model do
  it { should have_many(:monsters) }

  before :all do
    @user = create(:user)
  end

end
