require 'csv'

class Team
  @@filename = './data/teams.csv'
  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link,
              :all
  def initialize(data)
    @team_id = data[0].to_i
    @franchise_id = data[1]
    @team_name = data[2]
    @abbreviation = data[3]
    @stadium = data[4]
    @link = data[5]
    # @team_id = data[:team_id].to_i
    # @franchise_id = data[:franchiseid]
    # @team_name = data[:teamname]
    # @abbreviation = data[:abbreviation]
    # @stadium = data[:stadium]
    # @link = data[:link]
  end

  def self.all
    @all ||= load_teams_data
  end

  def self.find(id)
    all.find {|team| team.team_id == id }
  end

  private

  def self.load_teams_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      Team.new(row)
    end
  end
end
