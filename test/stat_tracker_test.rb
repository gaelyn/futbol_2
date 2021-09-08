require './test/test_helper'

class StatTrackerTest < Minitest::Test

  def setup
    @stat_tracker = StatTracker.new
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  # GAME STATISTICS

  def test_highest_total_score_returns_highest_sum_of_both_teams_scores
    assert_equal 11, @stat_tracker.highest_total_score
  end

  def test_lowest_total_score_returns_lowest_sum_of_both_teams_scores
    assert_equal 0, @stat_tracker.lowest_total_score
  end
end
