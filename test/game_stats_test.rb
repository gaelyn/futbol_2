require './test/test_helper'

class GameStatsTest < Minitest::Test
  def test_highest_total_score_returns_highest_sum_of_both_teams_scores
    assert_equal 11, GameStats.highest_total_score
  end
end
