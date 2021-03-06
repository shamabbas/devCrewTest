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

class Team < ActiveRecord::Base
  belongs_to :user
  has_many :monsters, dependent: :destroy, inverse_of: :team

  # Validatons applied
  validates :name, presence: true, uniqueness: true, length: { in: 2..150 }
  validates :user_id, presence: true
  validate :number_of_teams, on: [:create, :update]

  def total_mosnters_count
    self.monsters.count < 3
  end

  private
  # Method to check teams limit
  def number_of_teams
    unless user.team_member_count
      errors.add(:base, 'Team limit has been reached!')
    end
  end
end
