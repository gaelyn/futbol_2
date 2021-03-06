require './test/test_helper'

class TeamTest < Minitest::Test

  def setup
    data = {team_id:"1",
            franchiseid:"23",
            teamname:"Atlanta United",
            abbreviation:"ATL",
            stadium:"Mercedes-Benz Stadium",
            link:"/api/v1/teams/1"}
    @team = Team.new(data)
    @all_teams = Team.all
  end

  def test_it_exists
    # skip
    assert_instance_of Team, @team
  end

  def test_it_has_attributes
    # skip
    # team_id,franchiseId,teamName,abbreviation,Stadium,link
    assert @team.team_id
    assert @team.franchise_id
    assert @team.team_name
    assert @team.abbreviation
    assert @team.stadium
    assert @team.link
  end

  def test_find_all_teams
    # skip
    # results = Team.all
    assert_equal 32, @all_teams.count
    assert_instance_of Team, @all_teams.first
  end

  def test_find_class_method_finds_team_by_id
    # skip
     result = Team.find(1)
	   assert_instance_of Team, result
     assert_equal 1, result.team_id
  end

  def test_alias_id_to_team_id
    # skip
    assert_equal @team.id, @team.team_id
  end

  def test_find_returns_team_by_id
    # skip
    team = Team.find(1)
    assert_equal team.id, @team.id
  end
end
