class StatTracker
  def self.from_csv(locations)
    @game_manager = GameManager.new(locations[:games])
    @team_manager = TeamManager.new(locations[:teams])
    @game_team_manager = GameTeamManager.new(locations[:game_teams])
  end
end
