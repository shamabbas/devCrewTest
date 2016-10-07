class Team < ActiveRecord::Base
  belongs_to :user
  has_many :monsters, dependent: :destroy, inverse_of: :team

  validates :name, presence: true, uniqueness: true, length: { in: 2..150 }
  validates :user_id, presence: true
  validate :available_teams, on: [:create, :update]

  def total_mosnters_count
    self.monsters.count < 3
  end

  private
  # Method to check teams limit
  def available_teams
    unless user.total_team_member
      errors.add(:base, 'Team limit has been reached!')
    end
  end
end
