require_relative './helper'

class GameStats
  def self.highest_total_score
    high_scoring_game = Game.all.max_by do |game|
      game.away_goals + game.home_goals
    end
    high_scoring_game.away_goals + high_scoring_game.home_goals
  end

  # def self.lowest_total_score
  #   low_scoring_game = Game.all.min_by do |game|
  #     game.away_goals + game.home_goals
  #   end
  #   low_scoring_game.away_goals + low_scoring_game.home_goals
  # end
  #
  # def self.percent_home_wins
  #   home_wins = GameTeam.where(hoa: "home", result: "WIN")
  #   home_wins / Game.all.count
  # end
end
