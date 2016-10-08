# class Api::Api::TeamsController < Api::Api::BaseController
#
#   # create devcrew /api/dev_crew/monsters { monsters: {team_id: 1, name: 'Mon1', user_id: 1},
#   # {team_id:1, user_id: 1, name: 'Mon2'} }
#   def index
#     if (user)
#       respond_with user.teams
#     else
#       respond_with "", json: {error: "User id is required!"}
#     end
#   end
#
#   # create devcrew /api/dev_crew/create_monster { devcrew: {team_id: 1, name: 'Mon1', user_id: 1}}
#   def create_team
#     team = Team.create(team_params)
#     respond_with team
#   end
#
#   # delete devcrew /api/dev_crew/delete_monster {devcrew: {id: 1 }}
#   def delete_team
#     unless team.blank?
#       team.destroy
#       respond_with "", json: {error: "Successfully deleted!"}
#     else
#       respond_with "", json: {error: "id is invalid!"}
#     end
#   end
#
#   # update devcrew /api/dev_crew/delete_monster {devcrew: {id: 1, name: 'Mon3', power: '1', team_id: 2} }
#   def update_team
#     team.update_attributes(team_params)
#     respond_with team
#   end
#
#   private
#   # get user info
#   def user
#     User.find(params["team"]["user_id"]) if params["team"]["user_id"]
#   end
#
#   # Never trust parameters from the scary internet, only allow the white list through.
#   def team_params
#     params.require(:team).permit(:name, :user_id)
#   end
#   # FInd team by team_id
#   def team
#     Team.find(params["team"]["id"]) if params["team"]["id"]
#   end
# end
