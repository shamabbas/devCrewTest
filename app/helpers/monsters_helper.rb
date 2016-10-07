module MonstersHelper
  def teams_for_select
    Team.where(user_id: current_user.id).collect { |m| [m.name, m.id] }
  end
end
