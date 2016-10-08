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

require 'rails_helper'

describe Monster, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:team) }
  it { should validate_presence_of(:name) }
  before :all do
    @user = create(:user)
    @team =  create(:team, name: 'Jason', user_id: @user.id)
  end

  describe '#aviable_monsters' do
    it 'validate monsters count per user' do
      4.times do |v|
        @team.monsters.create name: "monster_#{v}", power: '124', monster_type: 'earth', user_id: @user.id
      end
      expect(@team.monsters.count).to eq 3
    end
  end

  describe '#delete_monster' do
    let(:monster) { create(:monster, name: 'daniel', power: '123', monster_type: 'earth',user_id: @user.id, team_id: @team.id) }
    it 'destroy monster' do
      monster.delete
      expect(Monster.count).to eq 0
    end
  end

end
