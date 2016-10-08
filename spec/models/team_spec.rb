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

require 'rails_helper'

describe Team, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:monsters) }
  it { should validate_uniqueness_of(:name) }

  it "should require a username" do
    FactoryGirl.build(:team, :name=> "", user_id: @user.id).should_not be_valid
  end

  before :each do
    @user =  create(:user)
  end

  describe 'team belongs_to user' do
    let(:team) { create(:team, name: 'daniel',user_id: @user.id) }
    it 'team should belongs_to user' do
      expect(team.user).to eq @user
    end
  end

  describe '#available_teams' do
    it 'validate teams count per user' do
      4.times do |v|
        Team.create name: "team_#{v}", user_id: @user.id
      end
      expect(@user.teams.count).to eq 3
    end
  end

  describe '#delete_team' do
    let(:team) { create(:team, name: 'daniel',user_id: @user.id) }
    it 'destroy team' do
      team.delete
      expect(Team.count).to eq 1
    end
  end
end
