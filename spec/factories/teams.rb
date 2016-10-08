# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  name           :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  monsters_count :integer
#  monsters_limit :integer
#

FactoryGirl.define do
  factory :team do
    user nil
  end

end
