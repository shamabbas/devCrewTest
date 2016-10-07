class Monster < ActiveRecord::Base
  MONSTER_CATEGORIES = %w(fire water earth electric wind)
  belongs_to :user, inverse_of: :monsters
  belongs_to :team, inverse_of: :monsters, counter_cache: true

  validates :name, presence: true, length: { maximum: 150 }
  validates :power, presence: true
  validates :user_id, :team_id, presence: true, allow_nil: true

  validates :monster_type, presence: true, inclusion: {in: MONSTER_CATEGORIES}
  before_validation :available_monsters,  on: [:create, :update]
  before_validation :available_user_monsters,  on: [:create, :update]

  # Method to check monsters limit
  def available_monsters
    if team
      unless team.total_mosnters_count
        errors.add(:base, 'Reached the number of monsters for a team')
      end
    end
  end
  def available_user_monsters
    if user
      unless user.total_user_mosnters_count
        errors.add(:base, 'Reached the number of monsters')
      end
    end
  end
end
