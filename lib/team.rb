require './lib/modules/finder'
require './lib/modules/data_loader'

class Team
  extend Finder
  extend DataLoader
  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link,
              :all

  def initialize(data)
    @team_id = data[:team_id].to_i
    @franchise_id = data[:franchiseid]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @stadium = data[:stadium]
    @link = data[:link]
  end

  alias_method :id, :team_id
end
