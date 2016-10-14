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

class User < ActiveRecord::Base

  TOTAL_MONSTERS = 20 # Setting constant variable for total monsters
  TOTAL_TEAMS = 3 # Setting constant variable for total teams

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :teams, dependent: :destroy
  has_many :monsters, dependent: :destroy

  # check teams for current user
  def team_member_count
    self.teams.count < TOTAL_TEAMS
  end
  # check monsters for current user
  def user_mosnters_count
    self.monsters.count < TOTAL_MONSTERS
  end

  # omniauth function
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
