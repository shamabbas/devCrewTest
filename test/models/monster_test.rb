# == Schema Information
#
# Table name: monsters
#
#  id           :integer          not null, primary key
#  name         :string(150)
#  power        :string(150)
#  monster_type :string(20)
#  user_id      :integer
#  team_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
