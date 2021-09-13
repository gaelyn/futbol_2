require './test/test_helper'

class GameStatsTest < Minitest::Test
  def test_highest_total_score_returns_highest_sum_of_both_teams_scores
    # skip
    assert_equal 11, GameStats.highest_total_score
  end

  def test_lowest_total_score_returns_lowest_sum_of_both_teams_scores
    skip
    assert_equal 0, GameStats.lowest_total_score
  end

  def test_percentage_home_wins_returns_percent_home_games_won
    skip
    assert_equal 0, GameStats.percent_home_wins
  end
end
