require 'csv'

module DataLoader
  def path_to_data
    if self == Game
      './data/games.csv'
    elsif self == Team
      './data/teams.csv'
    else
      './data/game_teams.csv'
    end
  end

  def load_data
    rows = CSV.read(path_to_data, headers: true, header_converters: :symbol)

    rows.map do |row|
      self.new(row)
    end
  end
end
