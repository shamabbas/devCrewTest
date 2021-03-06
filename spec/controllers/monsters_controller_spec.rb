require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe MonstersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Monster. As you add validations to Monster, be sure to
  # adjust the attributes here as well.
  before :all do
    @user = create(:user)
    @team =  create(:team, name: 'Jason', user_id: @user.id)
  end
  let(:valid_attributes) { {name: "monster_1", power: '124', monster_type: 'earth', user_id: @user.id, team_id: @team.id} }
  let(:invalid_attributes) { {name: "", power: '', monster_type: '', user_id: @user, team_id: ''} }



  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MonstersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all monsters as @monsters" do
      monster = @team.monsters.create valid_attributes
      get :index, params: {}, session: valid_session
      expect(@team.monsters.first).to eq monster
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested monster as @monster" do
  #     monster = @team.monsters.create valid_attributes
  #     get :show, params: {id: monster.id}
  #     expect(assigns(:monster)).to eq(monster)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested monster as @monster" do
  #     monster = Monster.create! valid_attributes
  #     get :edit, params: {id: monster.to_param}, session: valid_session
  #     expect(assigns(:monster)).to eq(monster)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new monster" do
  #       expect {
  #         post :create, { name: "monster_1", power: '124', monster_type: 'earth', user_id: @user.id, team_id: @team.id, monster: valid_attributes, format: :json  }
  #       }.to change(Monster, :count).by(1)
  #     end
  #
  #     it "assigns a newly created item as @item" do
  #       post :create, { list_id: list.id, item: valid_item_attributes, format: :json  }
  #
  #       expect(assigns(:item)).to be_a(Item)
  #       expect(assigns(:item)).to be_persisted
  #     end
  #   end # "with valid params"
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved monster as @monster" do
  #       post :create, { name: "", power: '', monster_type: '', user_id: @user, team_id: '', item: invalid_attributes, format: :json  }
  #
  #       expect(assigns(:monster)).to be_a_new(Monster)
  #     end
  #
  #     it "returns unprocessable_entity status" do
  #       put :create, { name: "", power: '', monster_type: '', user_id: @user, team_id: '', monster: invalid_attributes, format: :json }
  #
  #       expect(response.status).to eq(401)
  #     end
  #   end # "with invalid params"
  # end # "POST #create"

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested monster" do
  #       monster = Monster.create! valid_attributes
  #       put :update, params: {id: monster.to_param, monster: new_attributes}, session: valid_session
  #       monster.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested monster as @monster" do
  #       monster = Monster.create! valid_attributes
  #       put :update, params: {id: monster.to_param, monster: valid_attributes}, session: valid_session
  #       expect(assigns(:monster)).to eq(monster)
  #     end
  #
  #     it "redirects to the monster" do
  #       monster = Monster.create! valid_attributes
  #       put :update, params: {id: monster.to_param, monster: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(monster)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the monster as @monster" do
  #       monster = Monster.create! valid_attributes
  #       put :update, params: {id: monster.to_param, monster: invalid_attributes}, session: valid_session
  #       expect(assigns(:monster)).to eq(monster)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       monster = Monster.create! valid_attributes
  #       put :update, params: {id: monster.to_param, monster: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested monster" do
  #     monster = Monster.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: monster.to_param}, session: valid_session
  #     }.to change(Monster, :count).by(-1)
  #   end
  #
  #   it "redirects to the monsters list" do
  #     monster = Monster.create! valid_attributes
  #     delete :destroy, params: {id: monster.to_param}, session: valid_session
  #     expect(response).to redirect_to(monsters_url)
  #   end
  # end

end
