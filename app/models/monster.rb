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

class Monster < ActiveRecord::Base
  MONSTER_CATEGORIES = %w(fire water earth electric wind)
  belongs_to :team, inverse_of: :monsters, counter_cache: true
  belongs_to :user, inverse_of: :monsters

  # Validatons applied
  validates :name, presence: true, length: { maximum: 150 }
  validates :power, presence: true
  validates :user_id, :team_id, presence: true, allow_nil: true
  validates :monster_type, presence: true, inclusion: {in: MONSTER_CATEGORIES}

  # callbacks before creating or updating
  before_validation :number_of_monsters,  on: [:create, :update]
  before_validation :number_of_user_monsters,  on: [:create, :update]

  # Method to check monsters limit
  def number_of_monsters
    if team
      unless team.total_mosnters_count
        errors.add(:base, 'Reached the number of monsters for a team')
      end
    end
  end
  def number_of_user_monsters
    if user
      unless user.user_mosnters_count
        errors.add(:base, 'Reached the number of monsters')
      end
    end
  end
end
