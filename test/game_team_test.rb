require './test/test_helper'

class GameTeamTest < Minitest::Test

  def setup
    data = {game_id:"2012030221",
            team_id:"3",
            hoa:"away",
            result:"WIN",
            settled_in:"OT",
            head_coach:"John Tortorella",
            goals:"2",
            shots:"8",
            tackles:"44",
            pim:"8",
            powerplayopportunities:"3",
            powerplaygoals:"0",
            faceoffwinpercentage:"44.8",
            giveaways:"17",
            takeaways:"7"}
    @game_team = GameTeam.new(data)
    @all_game_teams = GameTeam.all
  end

  def test_it_exists
    # skip
    assert_instance_of GameTeam, @game_team
  end

  def test_it_has_attributes
    # skip
    assert @game_team.game_id
    assert @game_team.team_id
    assert @game_team.hoa
    assert @game_team.result
    assert @game_team.settled_in
    assert @game_team.head_coach
    assert @game_team.goals
    assert @game_team.shots
    assert @game_team.tackles
    assert @game_team.pim
    assert @game_team.power_play_opps
    assert @game_team.face_off_win_percentage
    assert @game_team.giveaways
    assert @game_team.takeaways
  end

  def test_find_all_game_teams
    # skip
    assert_equal 14882, @all_game_teams.count
    assert_instance_of GameTeam, @all_game_teams.first
  end

  def test_winner_of_game_returns_winning_team
    # skip
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
    game = Game.new(data)
    assert_instance_of Team, GameTeam.winner_of_game(game.game_id)
  end

  def test_winner_of_game_returns_nil_if_tie
    # skip
    # Found the first game id in csv where result == "TIE"
    assert_nil GameTeam.winner_of_game(2012030121)
  end

  def test_find_method_can_find_game_team_by_game_id
    # skip
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
    game = Game.new(data)
    gt = GameTeam.find_by_game_id(game.id)
    assert_equal 2, gt.count
    assert_instance_of GameTeam, gt.first
    assert_equal game.id, gt.first.game_id
  end

  def test_find_method_can_find_game_team_by_team_id
    # skip
    data = {team_id:"3",
            franchiseid:"23",
            teamname:"Atlanta United",
            abbreviation:"ATL",
            stadium:"Mercedes-Benz Stadium",
            link:"/api/v1/teams/1"}
    team = Team.new(data)
    gt = GameTeam.find_by_team_id(team.id)
    assert_equal 531, gt.count
    assert_instance_of GameTeam, gt.first
    assert_equal team.id, gt.first.team_id
  end
end
