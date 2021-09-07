require './test/test_helper'

class GameTest < Minitest::Test

  def setup
    data = {game_id:"2012030221",
            season:"20122013",
            type:"Postseason",
            date_time:"5/16/13",
            away_team_id:"3",
            home_team_id:"6",
            away_goals:"2",
            home_goals:"3",
            venue:"Toyota Stadium",
            venue_link:"/api/v1/venues/null"}
    @game = Game.new(data)
    @all_games = Game.all
  end

  def test_it_exists
    # skip
    assert_instance_of Game, @game
  end

  def test_it_has_attributes
    # skip
   # game_id,season,type,date_time,away_team_id,home_team_id,
   # away_goals,home_goals,venue,venue_link
   #
    assert @game.game_id
    assert @game.season
    assert @game.type
    assert @game.date_time
    assert @game.away_team_id
    assert @game.home_team_id
    assert @game.away_goals
    assert @game.home_goals
    assert @game.venue
    assert @game.venue_link
  end

  def test_find_all_games
    # skip
    assert_equal 7441, @all_games.count
    assert_instance_of Game, @all_games.first
  end

  def test_away_team_returns_a_team_object
    # skip
    assert_instance_of Team, @game.away_team
    assert_equal @game.away_team_id, @game.away_team.team_id
  end

  def test_home_team_returns_a_team_object
    # skip
    assert_instance_of Team, @game.home_team
    assert_equal @game.home_team_id, @game.home_team.team_id
  end

  def test_winner_returns_team_object
    assert_instance_of Team, @game.winner
  end
end
