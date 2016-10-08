# class Api::Api::MonstersController < Api::Api::BaseController
#
#   # create devcrew /api/dev_crew/monsters { monsters: {team_id: 1, name: 'Mon1', user_id: 1},
#   # {team_id:1, user_id: 1, name: 'Mon2'} }
#   def index
#     if (user)
#       respond_with user.monsters
#     else
#       respond_with "", json: {error: "User id is required!"}
#     end
#   end
#
#   # create devcrew /api/dev_crew/create_monster { devcrew: {team_id: 1, name: 'Mon1', user_id: 1}}
#   def create_monster
#     monster = Monster.create(monster_params)
#     respond_with monster
#   end
#
#   # delete devcrew /api/dev_crew/delete_monster {devcrew: {id: 1 }}
#   def delete_monster
#     unless monster.blank?
#       monster.destroy
#       respond_with "", json: {error: "Successfully deleted!"}
#     else
#       respond_with "", json: {error: "id is invalid!"}
#     end
#   end
#
#   # update devcrew /api/dev_crew/delete_monster {devcrew: {id: 1, name: 'Mon3', power: '1', team_id: 2} }
#   def update_monster
#     monster.update_attributes(monster_params)
#     respond_with monster
#   end
#
#   private
#   # get user info
#   def user
#     User.find(params["devcrew"]["user_id"]) if params["devcrew"]["user_id"]
#   end
#
#   # get devcrew by id
#   def monster
#     Monster.find(params["devcrew"]["id"]) if params["devcrew"]["id"]
#   end
#
#   # Never trust parameters from the scary internet, only allow the white list through.
#   def monster_params
#     params.require(:devcrew).permit(:name, :power, :monster_type, :team_id, :user_id)
#   end
#   # FInd team by team_id
#   def team
#     Team.find(params["devcrew"]["team_id"]) if params["devcrew"]["team_id"]
#   end
# end
