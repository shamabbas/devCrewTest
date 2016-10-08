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

FactoryGirl.define do
  factory :monster do
    team_id nil
    user_id nil
  end

end
