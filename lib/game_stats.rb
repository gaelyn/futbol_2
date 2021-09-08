class GameStats
  def self.highest_total_score
    high_scoring_game = Game.all.max_by do |game|
      game.away_goals + game.home_goals
    end
    high_scoring_game.away_goals + high_scoring_game.home_goals
  end
end
