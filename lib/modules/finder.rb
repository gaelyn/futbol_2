module Finder
  def find(id)
    self.all.find {|obj| obj.id == id }
  end

  def all
    @all ||= load_data
  end

  def find_by_game_id(id)
    all.find_all do |game_team|
      game_team.game_id == id
    end
  end

  def find_by_team_id(id)
    all.find_all do |game_team|
      game_team.team_id == id
    end
  end
end
