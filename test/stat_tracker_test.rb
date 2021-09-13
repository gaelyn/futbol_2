require './test/test_helper'
# require_relative './test/test_helper'

class StatTrackerTest < Minitest::Test

  def setup
    @stat_tracker = StatTracker.new
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  ###################
  # GAME STATISTICS #
  ###################

  def test_highest_total_score
    # skip
    assert_equal 11, @stat_tracker.highest_total_score
  end

  def test_lowest_total_score
    skip
    # Lowest sum of the winning and losing teams’ scores
    # => Integer
    assert_equal 0, @stat_tracker.lowest_total_score
  end

  def test_percentage_home_wins
    skip
    # Percentage of games that a home team has won (rounded to the nearest 100th)
    # => Float
    assert_equal 0, @stat_tracker.percent_home_wins
  end

  def test_percentage_visitor_wins
    # Percentage of games that a visitor has won (rounded to the nearest 100th)
    # => Float

  end

  def test_percentage_ties
    # Percentage of games that has resulted in a tie (rounded to the nearest 100th)
    # => Float

  end

  def test_count_of_games_by_season
    # A hash with season names (e.g. 20122013) as keys and counts of games as values
    # => Hash

  end

  def test_average_goals_per_game
    # Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th)
    # => Float

  end

  def test_average_goals_by_season
    # Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th)
    # => Hash

  end

  #####################
  # LEAGUE STATISTICS #
  #####################

  def test_count_of_teams
    # Total number of teams in the data.
    # => Integer
  end

  def test_best_offense
    #Name of the team with the highest average number of goals scored per game across all seasons.
    # => String
  end

  def test_worst_offense
    # Name of the team with the lowest average number of goals scored per game across all seasons.
    # => String
  end

  def test_highest_scoring_visitor
    #  Name of the team with the highest average score per game across all seasons when they are away.
    # => String
  end

  def test_highest_scoring_home_team
    # Name of the team with the highest average score per game across all seasons when they are home.
    # => String
  end

  def test_lowest_scoring_visitor
    # Name of the team with the lowest average score per game across all seasons when they are a visitor.
    # => String
  end

  def test_lowest_scoring_home_team
    # Name of the team with the lowest average score per game across all seasons when they are at home.
    # => String
  end

  #####################
  # SEASON STATISTICS #
  #####################

  def test_winningest_coach
    #Name of the Coach with the best win percentage for the season
    # => String
  end

  def test_worst_coach
    # Name of the Coach with the worst win percentage for the season
    # => String
  end

  def test_most_accurate_team
    #Name of the Team with the best ratio of shots to goals for the season
    # => String
  end

  def test_least_accurate_team
    #Name of the Team with the worst ratio of shots to goals for the season
    # => String
  end

  def test_most_tackles
    # Name of the Team with the most tackles in the season
    # => String
  end

  def test_fewest_tackles
    # Name of the Team with the fewest tackles in the season
    # => String
  end

  ###################
  # TEAM STATISTICS #
  ###################

  def test_team_info
    #A hash with key/value pairs for the following attributes: team_id, franchise_id, team_name, abbreviation, and link
    # => Hash
  end

  def test_best_season
    # Season with the highest win percentage for a team.
    # => String
  end

  def test_worst_season
    # Season with the lowest win percentage for a team.
    # => String
  end

  def test_average_win_percentage
    # Average win percentage of all games for a team.
    # => Float
  end

  def test_most_goals_scored
    # Highest number of goals a particular team has scored in a single game.
    # => Integer
  end

  def test_fewest_goals_scored
    # Lowest numer of goals a particular team has scored in a single game.
    # => Integer
  end

  def test_favorite_opponent
    # Name of the opponent that has the lowest win percentage against the given team.
    # => String
  end

  def test_rival
    # Name of the opponent that has the highest win percentage against the given team.
    # => String
  end
end
